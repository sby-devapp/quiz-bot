import logging

from telegram import Update
from telegram.error import Forbidden, BadRequest
from telegram.ext import ContextTypes

from app.services.chat_service import ChatService
from app.services.user_service import UserService
from app.models.question import Question
from app.views.poll_view import PollView


class Controller:
    def __init__(self, application):
        self.application = application
        self.chatService = ChatService()
        self.userService = UserService()

    def setup(self):
        print("Setting up the controller")

    def get_chat(self, update: Update, context: ContextTypes.DEFAULT_TYPE):
        chat = update.effective_chat
        return self.chatService.save(chat)

    def get_user(self, update: Update, context: ContextTypes.DEFAULT_TYPE):
        user = update.effective_user
        return self.userService.save(user)

    def get_user_chat(self, update: Update, context: ContextTypes.DEFAULT_TYPE):
        return self.get_user(update, context), self.get_chat(update, context)

    async def _delete_last_question(self, chat, context: ContextTypes.DEFAULT_TYPE):
        if not chat.last_message_id:
            return
        try:
            poll = await context.bot.stop_poll(chat_id=chat.id, message_id=chat.last_message_id)
            if poll.total_voter_count == 0:
                try:
                    await context.bot.delete_message(chat_id=chat.id, message_id=chat.last_message_id)
                except BadRequest:
                    pass
        except BadRequest:
            pass

    async def send_question(self, chat, question: Question, context: ContextTypes.DEFAULT_TYPE):
        if question is None:
            logging.warning(f"No question available for chat {chat.id}, skipping.")
            return
        try:
            await self._delete_last_question(chat, context)

            prepared_poll = PollView(question).prepare()

            poll_message = await context.bot.send_poll(
                chat_id=chat.id,
                question=prepared_poll.question,
                options=prepared_poll.options,
                type="quiz",
                correct_option_id=0,
                explanation=prepared_poll.explanation,
                is_anonymous=False,
                description=prepared_poll.description,
                description_parse_mode=prepared_poll.description_parse_mode,
                media=prepared_poll.media,
                shuffle_options=True,
            )

            chat.last_message_id = poll_message.message_id
            chat.last_message_sent_at = poll_message.date
            chat.save()
            self.chatService.update_sent_question_logs(chat_id=chat.id, question_id=question.id)

        except Forbidden as e:
            logging.info(f"Bot blocked/kicked from chat {chat.id}, marking inactive. Error: {e}")
            self._deactivate_chat(chat)

        except BadRequest as e:
            err_msg = str(e).lower()
            dead_chat_keywords = ["chat not found", "group chat was upgraded", "supergroup"]
            if any(kw in err_msg for kw in dead_chat_keywords):
                logging.info(f"Marking chat {chat.id} as inactive due to: {e}")
                self._deactivate_chat(chat)
            else:
                logging.error(f"Non-fatal Telegram error for chat {chat.id}: {e}")

    def _deactivate_chat(self, chat):
        settings = chat.settings()
        settings.keep_receiving_questions = "no"
        settings.save()

    async def _is_admin_owner(self, update: Update, context: ContextTypes.DEFAULT_TYPE) -> bool:
        chat = update.effective_chat
        user = update.effective_user
        if chat.type not in ["group", "supergroup"]:
            return False
        member = await context.bot.get_chat_member(chat.id, user.id)
        return member.status in ["administrator", "creator"]

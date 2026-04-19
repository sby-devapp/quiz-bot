import logging

from telegram import Update
from telegram.error import Forbidden, BadRequest
from telegram.ext import ContextTypes, CommandHandler

from app.services.chat_service import ChatService
from app.services.user_service import UserService
from app.models.question import Question
import random

from app.views.poll_view import PollView

# Make sure to import or define ChatService and UserService
# from app.services.chat_service import ChatService
# from app.services.user_service import UserService


class Controller:
    def __init__(self, application):
        self.application = application
        self.chatService = ChatService()
        self.userService = UserService()

    def setup(self):
        print("Setting up the controller")

    def get_chat(self, update: Update, context: ContextTypes.DEFAULT_TYPE):
        """
        Returns the chat object from the update.
        """
        chat = update.effective_chat
        return self.chatService.save(chat)

    def get_user(self, update: Update, context: ContextTypes.DEFAULT_TYPE):
        """
        Returns the chat object from the update.
        """
        user = update.effective_user
        return self.userService.save(user)

    def get_user_chat(self, update: Update, context: ContextTypes.DEFAULT_TYPE):
        """
        Saves the user and chat information from the update.
        """
        return self.get_user(update, context), self.get_chat(update, context)

    async def send_question(self, chat, poll: Question, context: ContextTypes.DEFAULT_TYPE):
        try:
            if poll.media_url:
                await context.bot.send_animation(chat_id=chat.id, animation=poll.media_url)

            formated_poll = PollView(poll)
            p = formated_poll.get_formated_poll()

            await context.bot.send_message(
                chat_id=chat.id, text=poll.question, parse_mode="MarkdownV2"
            )
            poll_message = await context.bot.send_poll(
                chat_id=chat.id,
                question=p.question,
                options=p.options,
                type="quiz",
                correct_option_id=p.correct_anwser_id,
                explanation=p.explanation,
                is_anonymous=False,
            )
            chat.last_message_sent_at = (poll_message.date if hasattr(poll_message, "date") else None)
            chat.last_message_id = (poll_message.message_id if hasattr(poll_message, "message_id") else None)
            chat.save()
            self.chatService.update_sent_question_logs(chat_id=chat.id, question_id=poll.id)

        except Forbidden as e:
            logging.info(f"Bot was blocked/kicked from chat {chat.id}. Marking as inactive. Error: {e}")
            self._deactivate_chat(chat)

        except BadRequest as e:
            err_msg = str(e).lower()
            dead_chat_keywords = ["chat not found", "group chat was upgraded", "supergroup"]
            if any(kw in err_msg for kw in dead_chat_keywords):
                logging.info(f"Marking chat {chat.id} as inactive due to Telegram error.")
                self._deactivate_chat(chat)
            else:
                logging.error(f"Non-fatal Telegram error for chat {chat.id}: {e}")

    def _deactivate_chat(self, chat):
        settings = chat.settings()
        settings.keep_receiving_questions = "no"
        settings.save()



    async def _is_admin_owner(
        self, update: Update, context: ContextTypes.DEFAULT_TYPE
    ) -> bool:
        """
        Checks if the user is an admin or owner in the chat.
        Returns True if admin/owner, False otherwise.
        """
        chat = update.effective_chat
        user = update.effective_user
        if chat.type not in ["group", "supergroup"]:
            return False
        member = await context.bot.get_chat_member(chat.id, user.id)
        return member.status in ["administrator", "creator"]

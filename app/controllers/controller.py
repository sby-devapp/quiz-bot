from telegram import Update
from telegram.ext import ContextTypes, CommandHandler

from app.services.chat_service import ChatService
from app.services.user_service import UserService
from app.models.question import Question
import random

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

    async def send_question(
        self, chat, poll: Question, context: ContextTypes.DEFAULT_TYPE
    ):
        # Shuffle the options and keep track of the correct answer's index
        options = poll.options[:]
        random.shuffle(options)
        correct_answer = poll.options[0]
        correct_option_id = options.index(correct_answer)

        if poll.media_url:
            await context.bot.send_animation(chat_id=chat.id, animation=poll.media_url)

        poll_message = await context.bot.send_poll(
            chat_id=chat.id,
            question=poll.question,
            options=options,
            type="quiz",
            correct_option_id=correct_option_id,
            explanation=poll.explanation,
            is_anonymous=False,
        )
        chat.last_message_sent_at = (
            poll_message.date if hasattr(poll_message, "date") else None
        )
        chat.last_message_id = (
            poll_message.message_id if hasattr(poll_message, "message_id") else None
        )
        chat.save()

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

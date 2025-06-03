# File: app/controllers/chat_controller.py

from asyncio import sleep
from telegram import Update
from telegram.ext import ContextTypes, CommandHandler

from app.controllers.controller import Controller
from app.models.chat import Chat


class ChatController(Controller):

    def __init__(self, application=None):
        super().__init__(application)
        print("ChatController initialized")
        if application is not None:
            self.application = application
        self.tasks = set()

    def setup(self):
        self.application.add_handler(CommandHandler("start", self.start))
        self.application.add_handler(CommandHandler("stop", self.stop))
        self.application.add_handler(CommandHandler("question", self.random_question))
        self.application.add_handler(CommandHandler("set_schedule", self.set_schedule))
        self.application.add_handler(CommandHandler("test", self.test))
        # Add more handlers specific to chat functionality here

    async def start(self, update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
        if not await self._is_admin_owner(update, context):
            await update.message.reply_text(
                "You must be an admin or owner to use this command."
            )
            return
        # Add chat-specific setup here
        user, chat = self.get_user_chat(update, context)
        chat.settings().keep_receiving_questions = "yes"
        chat._settings.save()

        full_name = ""
        if user.first_name:
            full_name += user.first_name
        if user.last_name:
            if full_name:
                full_name += " "
            full_name += user.last_name
        print(
            f"[/start] User: {user.first_name} {user.last_name if user.last_name else ''} ({user.id})"
        )
        await update.message.reply_text(
            f"Hi {full_name}! \nWelcome to the Quiz Bot. "
            "you will start receiving qestions"
            "To get a random question, execute /question"
        )

    async def random_question(self, update: Update, context: ContextTypes.DEFAULT_TYPE):
        user, chat = self.get_user_chat(update, context)
        print(f"[/question] executed in chat= {chat.id} by the user {user.username}")
        question = self.chatService.get_random_question()
        await self.send_question(chat, question, context)

    async def stop(self, update: Update, context: ContextTypes.DEFAULT_TYPE):
        if not await self._is_admin_owner(update, context):
            await update.message.reply_text(
                "You must be an admin or owner to use this command."
            )
            return
        user, chat = self.get_user_chat(update, context)

        chat.settings().keep_sending_questions = "no"
        chat._settings.save()

        await update.message.reply_text(
            "You stopped the bot from sending random Questions"
        )

    async def job(self, context: ContextTypes.DEFAULT_TYPE):
        chats = Chat.get_active_chats()
        for chat in chats:
            question = self.chatService.get_random_question()
            await self.send_question(chat, question, context)
            print(f"[Automatic] Sending a question to ({chat.id}, {chat.username} ) .")
        print(f"Job function executed")

    def schedule_job(self, interval):
        # Schedule the job function to run every {interval} minutes using JobQueue
        job_queue = self.application.job_queue
        job_queue.run_repeating(self.job, interval=interval * 60, first=5)
        print(
            f"Schedule the job function to run every {interval} minutes using JobQueue."
        )

    async def set_schedule(self, update: Update, context: ContextTypes.DEFAULT_TYPE):
        """
        /set_schedule [time_min] set schedule in minutes min is 10 min
        """
        if not await self._is_admin_owner(update, context):
            await update.message.reply_text(
                "You must be an admin or owner to use this command."
            )
            return
        chat = self.get_chat(update, context)
        # Get the schedule value from the command arguments
        try:
            schedule = int(context.args[0])
        except (IndexError, ValueError):
            await update.message.reply_text(
                "Usage: /set_schedule [minutes]   minutes should be greater than 10."
            )
            return

        if schedule >= 10:
            chat.settings().schedule = schedule * 60
            chat._settings.save()
            await update.message.reply_text(
                f"Schedule is changed to {schedule} minutes."
            )
        else:
            await update.message.reply_text(
                "Usage: /set_schedule [minutes]   minutes should be greater than 10."
            )

    async def test(self, update: Update, context: ContextTypes.DEFAULT_TYPE):
        question = (
            f"line 1 <br>"
            f"line 2 <br>"
            f"line 3 <br>"
            f"line 4 <br>"
            f"line 5 <br>"
            f"line 6 <br>"
            f"line 7 <br>"
            f"line 8 <br>"
        )
        options = ["Option A", "Option B", "Option C", "Option D"]
        await update.message.reply_poll(
            question,
            options,
            type="quiz",
            correct_option_id=1,
            is_anonymous=False,
            parse_mode="HTML",
        )

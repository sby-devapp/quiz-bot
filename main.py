# File: main.py

from telegram.ext import ApplicationBuilder
from app.controllers.chat_controller import ChatController
from app.controllers.question_controller import QuestionController
from app.models.database.db_manager import DBManager
from bot_token import get_token

DBManager.connect()
# build the application with the bot token
app = ApplicationBuilder().token(get_token()).build()

# Initialize the chat controller and set it up
userController = ChatController(app)
userController.setup()

# Initialize the question controller and set it up
qController = QuestionController(app)
qController.setup()

userController.schedule_job(2)  # 30 min

if __name__ == "__main__":
    print("Starting the bot...")
    app.run_polling()

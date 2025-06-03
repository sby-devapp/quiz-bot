from telegram import Update
from telegram.ext import (
    ContextTypes,
    CommandHandler,
    MessageHandler,
    filters,
    PollHandler,
)

from app.controllers.controller import Controller


"""
Saving question with the following details:
Poll type: quiz
Poll ID: 5877609890708456166
Question: question_here?
Options:{
    0, 'option 1', 0 , '0%'
    1, 'option 2', 1 , '33.33%'
    2, 'option 3', 2 , '66.67%'
    3, 'option 4', 0 , '0%'
}
Correct Option (1, 'option 2', 1 , '33.33%')
explanation: explanation_here
Anonymous: False   
"""


def print_question(poll):
    print("-" * 40)
    print(f"Poll type: {poll.type}")
    print(f"Poll ID: {poll.id}")
    print(f"Question: {poll.question}")
    print("Options:")
    for idx, option in enumerate(poll.options):
        print(
            f"{idx}, '{option.text}', {option.voter_count}, '{option.voter_count / poll.total_voter_count * 100 if poll.total_voter_count > 0 else 0:.2f}%'"
        )
    print(
        f"Correct Option: {poll.correct_option_id}, '{poll.options[poll.correct_option_id].text}', {poll.options[poll.correct_option_id].voter_count}, '{poll.options[poll.correct_option_id].voter_count / poll.total_voter_count * 100 if poll.total_voter_count > 0 else 0:.2f}%'"
    )
    print(f"explanation: {poll.explanation if poll.explanation else 'None'}")
    print(f"Anonymous: {poll.is_anonymous}")
    print("-" * 40)
    print("\n")


class QuestionController(Controller):

    def __init__(self, application=None):
        print("AddingQuestion initialized")
        if application is not None:
            self.application = application

    def setup(self):
        self.application.add_handler(CommandHandler("quiz", self.quiz))
        self.application.add_handler(
            CommandHandler("add_question", self.adding_question)
        )
        self.application.add_handler(MessageHandler(filters.POLL, self.handle_poll))
        self.application.add_handler(
            CommandHandler("save_question", self.save_question)
        )
        self.application.add_handler(PollHandler(self.listning_questions))
        # Add more handlers specific to question functionality here

    async def adding_question(
        self, update: Update, context: ContextTypes.DEFAULT_TYPE
    ) -> None:
        await update.message.reply_text("Please send your question as a quiz poll.")

    async def handle_poll(
        self, update: Update, context: ContextTypes.DEFAULT_TYPE
    ) -> None:
        poll = update.poll
        if poll:
            question = poll.question
            options = poll.options
            print_question(poll)
            await update.message.reply_text(
                f"Question received: {question}\nOptions: {', '.join([option.text for option in options])}"
            )
        else:
            await update.message.reply_text("No valid poll received.")

    async def save_question(
        self, update: Update, context: ContextTypes.DEFAULT_TYPE
    ) -> None:
        # Placeholder for saving logic
        if update.message.reply_to_message and update.message.reply_to_message.poll:
            poll = update.message.reply_to_message.poll
            print_question(poll)

    async def quiz(self, update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
        # Placeholder for quiz logic
        await update.message.reply_poll(
            question="What is 2+2?",
            options=["3", "4", "5"],
            type="quiz",
            correct_option_id=1,
            explanation="2+2=4",
        )

    async def listning_questions(
        self, update: Update, context: ContextTypes.DEFAULT_TYPE
    ):
        poll = update.poll
        print("_" * 40)
        print(f"Listning on Poll {poll.id}... ")
        print_question(poll)

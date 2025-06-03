from app.models.question import Question
import random


class PollView:
    break_line = "-" * 40

    def __init__(self, poll):
        self.poll = poll
        self.formated_poll = Question()

    def clone(self):
        self.formated_poll.id = self.poll.id
        self.formated_poll.question = self.poll.question
        self.formated_poll.options = self.poll.options
        self.formated_poll.explanation = self.poll.explanation
        self.formated_poll.correct_anwser_id = self.poll.correct_anwser_id
        return self

    def shuffle_options(self):
        if self.formated_poll.options:
            correct_answer = self.formated_poll.options[
                self.formated_poll.correct_anwser_id
            ]
            options = self.formated_poll.options[:]
            random.shuffle(options)
            self.formated_poll.options = options
            # Update correct_anwser_id to new index
            self.formated_poll.correct_anwser_id = options.index(correct_answer)
        return self

    def format_poll(self):
        """
        Quiz: {self.poll.title}
        ________________________
        Question: ID={self.poll.id} .
        {poll.question}
        ________________________
        Published by: {self.poll.user().full_name()}
        """
        quiz = self.poll.quiz()
        user = quiz.user()
        self.formated_poll.question = (
            f"[Quiz: {quiz.title} ] [Q:ID= {self.poll.id} ]\n"
            f"{self.break_line}\n"
            f"{self.poll.question}\n\n"
            f"{self.break_line}\n\n"
            f"Added by: {user.full_name()}\n"
        )
        return self

    def get_formated_poll(self):
        return self.clone().format_poll().shuffle_options().formated_poll

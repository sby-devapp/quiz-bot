# File: app/models/quiz.py
from .database.model import Model


class Quiz(Model):
    table_name = "quizzes"

    def __init__(self, id=None, title=None, status=None, description=None):
        self.id = id
        self.title = title
        self.status = status
        self.description = description
        self.created_at = None
        self.updated_at = None

        self.user = None
        self.questions = []

    def _insert(self):
        query = f"""
        INSERT INTO {self.table_name} (title, description, created_at)
        VALUES (?, ?, ?)
        """
        params = (self.title, self.description, self.created_at)
        self.db.execute(query, params)
        self.id = self.db.get_last_insert_id()
        return self

    def _update(self):
        query = f"""
        UPDATE {self.table_name}
        SET title = ?, description = ?, created_at = ?
        WHERE id = ?
        """
        params = (self.title, self.description, self.created_at, self.id)
        self.db.execute(query, params)
        return self

    def user(self):
        if self.user_id:
            from app.models.user import User

            self.user = User(id=self.user_id).get()

        return self.user

    def questions(self):
        query = """
        SELECT id 
        FROM questions
        WHERE quiz_id = ?
        """
        self.questions = []
        rows = self.db.execute(query=query, params=(self.id,))
        for row in rows:
            from app.models.question import Question

            self.questions.append(Question(id=row["id"]).get())
        return self.questions

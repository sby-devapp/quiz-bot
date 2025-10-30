import random
from app.models.database.model import Model


class Question(Model):
    table_name = "questions"

    def __init__(
        self,
        id=None,
        quiz_id=None,
        media_url=None,
        question=None,
        options=None,
        explanation=None,
        status=None,
    ):
        self.id = id
        self.quiz_id = quiz_id
        self.media_url = media_url
        self.question = question
        self.options = options if options is not None else []
        self.status = status
        self.explanation = explanation
        self.correct_anwser_id = 0

        self.created_at = None
        self.updated_at = None

        self._quiz = None

    def _insert(self):
        query = """
        INSERT INTO questions (quiz_id, media_url, question, options, explanation, status, created_at, updated_at)
        VALUES (?, ?, ?, ?, ?, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
        """
        values = (
            self.quiz_id,
            self.media_url,
            self.question,
            ",".join(self.options) if isinstance(self.options, list) else self.options,
            self.explanation,
            self.status,
        )
        cursor = self.db.cursor()
        cursor.execute(query, values)
        self.db.commit()
        self.id = cursor.lastrowid
        cursor.close()
        return self

    def _update(self):
        query = """
        UPDATE questions
        SET quiz_id=?, media_url=?, question = ?, options = ?, explanation=?, status = ?, updated_at = CURRENT_TIMESTAMP
        WHERE id = ?
        """
        values = (
            self.quiz_id,
            self.media_url,
            self.question,
            ",".join(self.options) if isinstance(self.options, list) else self.options,
            self.status,
            self.explanation,
            self.id,
        )
        cursor = self.db.cursor()
        cursor.execute(query, values)
        self.db.commit()
        cursor.close()
        return self

    def load_object_from_row(self, row):
        if row:
            self.id = row[0]
            self.quiz_id = row[1]
            self.media_url = row[2]
            self.question = row[3]
            self.options = row[4].split("|") if row[4] else []
            self.status = row[5]
            self.explanation = row[6]
            self.created_at = row[7]
            self.updated_at = row[8]

    def quiz(self):
        from app.models.quiz import Quiz

        if self.quiz_id:
            self._quiz = Quiz(id=self.quiz_id).get()
            print(f"Quiz {self._quiz.title} is Loaded")
        return self._quiz
    


    @classmethod
    def get_random_question(cls, settings=None):
        if not settings or not hasattr(settings, 'chat_id'):
            raise ValueError("settings must have 'chat_id'")

        query = """
        SELECT q.id, COALESCE(sq.sent_count, 0) AS sent_count
        FROM questions q
        JOIN quizzes quiz ON q.quiz_id = quiz.id
        LEFT JOIN sent_questions_log sq ON q.id = sq.question_id AND sq.chat_id = ?
        WHERE q.status = 'published'
            AND quiz.status = 'published'
        ORDER BY COALESCE(sq.sent_count, 0) ASC, RANDOM()
        LIMIT 10;
        """ 
        try:
            result = cls.db_manager.execute(query, (settings.chat_id,))
            rows = result.fetchall()
            if not rows:
                return None

            selected = random.choice(rows)
            # Replace with your actual Question class import
            from app.models.question import Question  # 👈 adjust as needed
            return Question(id=selected["id"]).get()
        finally:
            print("")


   

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

        self.created_at = None
        self.updated_at = None

        self.quiz = None

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

    def load_from_row(self, row):
        if row:
            self.id = row[0]
            self.quiz_id = row[1]
            self.media_url = row[2]
            self.question = row[3]
            self.options = row[4].split(",") if row[4] else []
            self.status = row[5]
            self.explanation = row[6]
            self.created_at = row[7]
            self.updated_at = row[8]

    def get_quiz(self):
        from app.models.quiz import Quiz

        if self.quiz_id:
            self.quiz = Quiz(id=self.quiz_id).get()
        return self.quiz

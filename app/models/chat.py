# File: app/models/chat.py
from .database.model import Model
import sqlite3
from datetime import datetime
from app.models.question import Question
from app.models.chat_settings import ChatSettings


class Chat(Model):
    table_name = "chats"

    def __init__(
        self,
        id=None,
        username=None,
        type=None,
        last_message_id=None,
        last_message_sent_at=None,
    ):
        self.id = id
        self.username = username
        self.type = type
        self.last_message_id = last_message_id
        self.last_message_sent_at = last_message_sent_at
        self.user = None
        self._settings = None

    def _insert(self):
        query = f"""
        INSERT INTO {self.table_name} (id, username, last_message_id, last_message_sent_at)
        VALUES (?, ?, ?, ?, ?)
        """
        params = (
            self.id,
            self.username,
            self.last_message_id,
            self.last_message_sent_at,
        )
        cursor = self.db_manager.db.cursor()
        cursor.execute(query, params)
        self.id = cursor.lastrowid
        cursor.close()
        return self

    def _update(self):
        query = f"""
        UPDATE {self.table_name}
        SET username = ?,
            last_message_id = ?,
            last_message_sent_at = ?,
            updated_at = CURRENT_TIMESTAMP
        WHERE id = ?
        """
        params = (
            self.username,
            self.last_message_id,
            self.last_message_sent_at,
            self.id,
        )
        self.db_manager.execute(query, params)
        return self

    def get_by_id(self, id):
        self.id = id
        return self.get()

    def get_by_username(self, username):
        query = f"SELECT * FROM {self.table_name} WHERE username = ?"
        result = self.db_manager.execute(query, (username,))
        if result:
            self.id, self.username, self.last_message_id, self.last_message_sent_at = (
                result[0]
            )
            return self
        else:
            raise ValueError(f"Chat with username {username} not found")

    def get_all(self):
        query = f"SELECT * FROM {self.table_name}"
        results = self.db_manager.execute(query)
        chats = []
        for row in results:
            chat = Chat(
                id=row[0],
                username=row[1],
                last_message_id=row[2],
                last_message_sent_at=row[3],
            )
            chats.append(chat)
        return chats

    def delete(self):
        if self.id is None:
            raise ValueError("ID must be set to delete a record")
        query = f"DELETE FROM {self.table_name} WHERE id = ?"
        self.db_manager.execute(query, (self.id,))
        self.id = None
        return self

    def get_random_question(self):
        if self._settings is None:
            self.settings()
        question = Question.get_random_question(settings=self._settings)
        return question

    def settings(self):
        """
        Retrieve settings for this chat.
        Assumes there is a ChatSettings model with a get_by_chat_id method.
        """
        if self.id is None:
            raise ValueError("Chat ID must be set to get settings")
        self._settings = ChatSettings.get_by_chat(chat_id=self.id)
        if self._settings is None:
            self._settings = ChatSettings(chat_id=self.id).default_settings().save()
        return self._settings

    @classmethod
    def get_active_chats(cls):
        if not cls.db_manager.is_connected():
            cls.db_manager.connect()
        query = """
        SELECT c.id, c.username, c.last_message_id, c.last_message_sent_at
        FROM chats c
        INNER JOIN chat_settings cs ON c.id = cs.chat_id
        WHERE cs.keep_receiving_questions = 'yes'
        AND (
            c.last_message_sent_at IS NULL
            OR datetime(c.last_message_sent_at, '+' || cs.schedule || ' seconds') < datetime('now')
        )
        ORDER BY datetime(c.last_message_sent_at)
        LIMIT 1
        """
        results = cls.db_manager.execute(query)
        chats = []
        for row in results:
            chat = cls(
                id=row["id"],
                username=row["username"],
                last_message_id=row["last_message_id"],
                last_message_sent_at=row["last_message_sent_at"],
            )
            chats.append(chat)
        return chats

    def load_object_from_row(self, row):
        self.id = row["id"]
        self.username = row["username"]
        self.last_message_id = row["last_message_id"]
        self.last_message_sent_at = row["last_message_sent_at"]
        return self

    @classmethod
    def update_sent_question_logs(cls, chat_id, question_id):
        query = """
        INSERT INTO sent_questions_log (chat_id, question_id, sent_count, first_sent_at, last_sent_at)
        VALUES (?, ?, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
        ON CONFLICT(chat_id, question_id) DO UPDATE SET
        sent_count = sent_count + 1,
        last_sent_at = CURRENT_TIMESTAMP;
        """

        # Use DBManager's execute (handles connection/commit)
        cls.db_manager.execute(query, (chat_id, question_id))

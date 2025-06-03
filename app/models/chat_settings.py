from app.models.database.model import Model

"""
CREATE TABLE IF NOT EXISTS chat_settings (
    id INTEGER PRIMARY KEY,
    chat_id INTEGER NOT NULL,
    delete_last_message TEXT DEFAULT 'yes',
    schedule INTEGER DEFAULT 600,  -- in seconds
    keep_receiving_questions TEXT DEFAULT 'yes', -- receiving

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (chat_id) REFERENCES chats(id) ON DELETE CASCADE
);

"""


class ChatSettings(Model):
    table_name = "chat_settings"

    def __init__(
        self,
        id=None,
        chat_id=None,
        delete_last_message="yes",
        schedule=600,
        keep_receiving_questions="yes",
        created_at=None,
        updated_at=None,
    ):
        self.id = id
        self.chat_id = chat_id
        self.delete_last_message = delete_last_message
        self.schedule = schedule
        self.keep_receiving_questions = keep_receiving_questions

        self.created_at = created_at
        self.updated_at = updated_at

    def load_from_row(self, row):
        (
            self.id,
            self.chat_id,
            self.delete_last_message,
            self.schedule,
            self.keep_receiving_questions,
            self.created_at,
            self.updated_at,
        ) = row
        return self

    def _insert(self):
        query = f"""
            INSERT INTO {self.table_name} (
                chat_id, delete_last_message, schedule, keep_receiving_questions, created_at, updated_at
            ) VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
        """
        params = (
            self.chat_id,
            self.delete_last_message,
            self.schedule,
            self.keep_receiving_questions,
        )
        self.id = self.db_manager.execute(query, params)
        return self.id

    def _update(self):
        query = f"""
            UPDATE {self.table_name}
            SET delete_last_message = ?,
                schedule = ?,
                keep_receiving_questions = ?,
                updated_at = CURRENT_TIMESTAMP
            WHERE chat_id = ?
        """
        params = (
            self.delete_last_message,
            self.schedule,
            self.keep_receiving_questions,
            self.chat_id,
        )
        return self.db_manager.execute(query, params)

    def get(self):
        query = f"SELECT * FROM {self.table_name} WHERE id = ?"
        row = self.db_manager.fetchone(query, (self.id,))
        if row:
            self.load_from_row(row)
        return self

    @classmethod
    def get_by_chat(cls, chat_id) -> "ChatSettings":
        query = f"SELECT * FROM {ChatSettings.table_name} WHERE chat_id = ?"
        cursor = cls.db_manager.db.cursor()
        cursor.execute(query, (chat_id,))
        row = cursor.fetchone()
        cursor.close()

        if row:
            return ChatSettings().load_from_row(row)
        return None

    def default_settings(self):
        self.delete_last_message = "yes"
        self.schedule = 600
        self.keep_receiving_questions = "yes"

        return self

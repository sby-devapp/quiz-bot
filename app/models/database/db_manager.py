# File: app/models/database/db_manager.py

"""DBManager:
- db: SQLite3 database connection
+ connect()-> sqlite3.Connection
+ is_connected() -> bool
+ close() -> None
+ query(query: str, params: tuple = ()) -> query
+ execute()-> None
+ execute_sql_file(file_path: str) -> None


"""


class DBManager:
    db = None
    db_location = "database/db/"
    db_file_name = f"database"

    @classmethod
    def initialize(cls):
        cls.execute_sql_file("database/sql/schema.sql")

    @classmethod
    def connect(cls, db_file_name=None):
        import sqlite3

        if db_file_name:
            cls.db_file_name = db_file_name
        if cls.db is None:
            db_path = cls.db_location + cls.db_file_name + ".db"
            print(f"trying to connect to database at {db_path}")
            cls.db = sqlite3.connect(db_path)
            cls.db.row_factory = sqlite3.Row
            print(f"Connecting to database at {db_path}")
        return cls.db

    @classmethod
    def is_connected(cls):
        return cls.db is not None

    @classmethod
    def close(cls):
        if cls.db is not None:
            cls.db.close()
            cls.db = None

    @classmethod
    def execute(cls, query: str, params: tuple = ()):
        if cls.is_connected() is False:
            cls.connect()
        cursor = cls.db.cursor()
        cursor.execute(query, params)
        cls.db.commit()
        # cls.close()
        return cursor

    @classmethod
    def execute_sql_file(cls, file_path: str):
        if not cls.is_connected():
            cls.connect()
        with open(file_path, "r", encoding="utf-8") as file:
            sql_script = file.read()
        cursor = cls.db.cursor()
        cursor.executescript(sql_script)
        cls.db.commit()
        return cursor

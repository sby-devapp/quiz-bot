"""
Migrate questions: convert markdown code blocks to HTML in the database.
Run once: python migrate_markdown_to_html.py
"""
import re
import sqlite3

DB_PATH = "database/db/database.db"


def to_html(text: str) -> str:
    def replace_block(m):
        code = m.group(2).strip()
        code = code.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
        return f"<pre><code>{code}</code></pre>"

    text = re.sub(r"```(\w*)\n?(.*?)```", replace_block, text, flags=re.DOTALL)
    text = re.sub(r"`([^`]+)`", lambda m: f"<code>{m.group(1)}</code>", text)
    return text


db = sqlite3.connect(DB_PATH)
cursor = db.cursor()

cursor.execute("SELECT id, question FROM questions WHERE question LIKE '%```%'")
rows = cursor.fetchall()

for row_id, question in rows:
    updated = to_html(question)
    cursor.execute("UPDATE questions SET question = ? WHERE id = ?", (updated, row_id))

db.commit()
db.close()
print(f"Migrated {len(rows)} questions.")

"""
Clean SQL files: remove markdown symbols, extract code_block from question field.
Run once: python clean_sql_files.py
"""
import re

files = [
    "database/sql/javascript.codes.sql",
    "database/sql/php.codes.sql",
    "database/sql/python.codes.sql",
    "database/sql/questions.python.poo.sql",
]


def clean_sql(content):
    # Remove *bold* markdown
    content = re.sub(r'\*([^*]+)\*', r'\1', content)

    # Add code_block column to INSERT if not already present
    content = content.replace(
        'INSERT INTO questions(quiz_id, media_url, question, options, status, explanation)',
        'INSERT INTO questions(quiz_id, media_url, question, code_block, options, status, explanation)'
    )

    # Split <pre><code> out of question into code_block
    def split_question_code(m):
        val = m.group(1)
        code_match = re.search(r'\s*<pre><code>(.*?)</code></pre>\s*', val, re.DOTALL)
        if not code_match:
            return m.group(0)
        code = code_match.group(1).strip()
        # remove 4-space SQL indentation from each line
        code = re.sub(r'^ {4}', '', code, flags=re.MULTILINE)
        # unescape HTML entities
        code = code.replace('&lt;', '<').replace('&gt;', '>').replace('&amp;', '&')
        clean_q = re.sub(r'\s*<pre><code>.*?</code></pre>\s*', '', val, flags=re.DOTALL).strip()
        return f"'{clean_q}',\n    '{code}'"

    content = re.sub(
        r"'((?:[^'\\]|\\.)*<pre><code>.*?</code></pre>(?:[^'\\]|\\.)*)'",
        split_question_code,
        content,
        flags=re.DOTALL
    )

    return content


for path in files:
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()
    updated = clean_sql(content)
    with open(path, 'w', encoding='utf-8') as f:
        f.write(updated)
    print(f"Cleaned: {path}")

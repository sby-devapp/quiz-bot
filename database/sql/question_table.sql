-- 1. Rename the old table
ALTER TABLE questions RENAME TO questions_old;

-- 2. Create the new table with updated schema
CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    quiz_id INTEGER NOT NULL,
    media_url TEXT,
    question TEXT NOT NULL,
    code_snippet TEXT,
    code_language TEXT,
    options TEXT NOT NULL,
    status TEXT DEFAULT 'draft',
    explanation TEXT,
    used INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id) ON DELETE CASCADE
);

-- 3. Copy data from old table to new table
--    New columns (code_snippet, code_language, used) will be NULL/0 by default
INSERT INTO questions (
    id,
    quiz_id,
    media_url,
    question,
    options,
    status,
    explanation,
    created_at,
    updated_at
)
SELECT
    id,
    quiz_id,
    media_url,
    question,
    options,
    COALESCE(status, 'draft'),  -- in case some rows have NULL status
    explanation,
    created_at,
    updated_at
FROM questions_old;


-1002606281785

SELECT q.id as qid, sq.chat_id, COALESCE(sq.sent_count, 0) AS sent_count
FROM questions q
JOIN quizzes quiz ON q.quiz_id = quiz.id
LEFT JOIN sent_questions_log sq ON q.id = sq.question_id AND sq.chat_id = -1002606281785
WHERE q.status = 'published'
  AND quiz.status = 'published'
ORDER BY COALESCE(sq.sent_count, 0) DESC, RANDOM()
LIMIT 10;

INSERT INTO sent_questions_log (chat_id, question_id, sent_count, first_sent_at, last_sent_at)
        VALUES (-1002606281785, 403, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
        ON CONFLICT(chat_id, question_id) DO UPDATE SET
        sent_count = sent_count + 1,
        last_sent_at = CURRENT_TIMESTAMP;
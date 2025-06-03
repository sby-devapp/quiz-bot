-- SQLite Database Schema (UTF-8 by default)
-- drop all tables before 
DROP TABLE IF EXISTS session_settings;
DROP TABLE IF EXISTS sessions;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS quizzes;
DROP TABLE IF EXISTS chat_settings;
DROP TABLE IF EXISTS chats;
DROP TABLE IF EXISTS users;

PRAGMA encoding = "UTF-8";

CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS chats;
CREATE TABLE IF NOT EXISTS chats (
    id INTEGER PRIMARY KEY,
    username TEXT,
    type TEXT DEFAULT 'private',  -- e.g., 'private', 'group', 'channel'
    last_message_id INTEGER,
    last_message_sent_at TIMESTAMP, -- Time of the last message in the chat

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS chat_settings;
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

CREATE TABLE IF NOT EXISTS quizzes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    title TEXT NOT NULL,
    description TEXT,
    status TEXT DEFAULT 'pending',  -- e.g.,  'published', 'pending'
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);


DROP TABLE IF EXISTS questions;
CREATE TABLE IF NOT EXISTS questions (
    id INTEGER PRIMARY KEY,
    quiz_id INTEGER NOT NULL,
    media_url TEXT,  -- URL to media file (image, video, etc.) 
    question TEXT NOT NULL,
    options TEXT NOT NULL,  -- JSON array of options, first option is the correct one
    status TEXT DEFAULT 'draft', -- e.g. 'published', 'pending'
    explanation TEXT, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS sessions (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    chat_id INTEGER NOT NULL,
    quiz_id INTEGER NOT NULL,
    mode TEXT DEFAULT 'random_question', 
    status TEXT DEFAULT 'active',  -- e.g., 'active', 'completed', 'expired'
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (chat_id) REFERENCES chats(id) ON DELETE CASCADE,
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id) ON DELETE CASCADE,
    UNIQUE(user_id, chat_id, quiz_id)
);

CREATE TABLE IF NOT EXISTS session_settings (
    id INTEGER PRIMARY KEY,
    session_id INTEGER NOT NULL,
    delete_last_message BOOLEAN DEFAULT 0,
    schedule INTEGER DEFAULT 600,  -- in seconds
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (session_id) REFERENCES sessions(id) ON DELETE CASCADE
);




-- insert session and session_settings with chat_id = -1002606281785


-- 1. Rename the existing users table
ALTER TABLE users RENAME TO users_old;

-- 2. Create the new users table with the desired schema
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    username TEXT,
    first_name TEXT,
    last_name TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Copy data from users_old to users
INSERT INTO users (id, username, first_name, last_name, created_at, updated_at)
SELECT id, username, first_name, last_name, created_at, updated_at FROM users_old;

-- 4. Drop the old table
DROP TABLE users_old;
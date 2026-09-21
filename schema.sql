-- Notes Organizer System - Database Schema
-- MySQL Database creation and table definitions

CREATE DATABASE notes;
USE notes;

-- USERS TABLE
CREATE TABLE nb_users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    dept VARCHAR(50),
    joined_on DATE
);

-- NOTES TABLE
CREATE TABLE notes (
    note_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(200),
    subject VARCHAR(100),
    tag VARCHAR(50),
    content TEXT,
    views INT DEFAULT 0,
    is_shared BOOLEAN DEFAULT FALSE,
    created_on DATE,
    FOREIGN KEY (user_id) REFERENCES nb_users(user_id)
);

-- DOUBTS TABLE
CREATE TABLE doubts (
    doubt_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    subject VARCHAR(100),
    question TEXT,
    status ENUM('Pending','Answered') DEFAULT 'Pending',
    asked_on DATE,
    answered_on DATE,
    FOREIGN KEY (user_id) REFERENCES nb_users(user_id)
);

-- NOTE SHARING TABLE
CREATE TABLE note_shares (
    share_id INT AUTO_INCREMENT PRIMARY KEY,
    note_id INT,
    shared_by INT,
    shared_with INT,
    shared_on DATE,
    FOREIGN KEY (note_id) REFERENCES notes(note_id),
    FOREIGN KEY (shared_by) REFERENCES nb_users(user_id),
    FOREIGN KEY (shared_with) REFERENCES nb_users(user_id)
);

-- CATEGORIES TABLE
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100),
    description TEXT
);

-- NOTE CATEGORIES (bridge table for many-to-many relationship)
CREATE TABLE note_categories (
    note_id INT,
    category_id INT,
    PRIMARY KEY(note_id, category_id),
    FOREIGN KEY(note_id) REFERENCES notes(note_id),
    FOREIGN KEY(category_id) REFERENCES categories(category_id)
);

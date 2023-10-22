DROP DATABASE IF EXISTS silkreads_dev;
CREATE DATABASE silkreads_dev;

/c silkreads_dev;

DROP TABLE IF EXISTS genres;
CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30)
);

DROP TABLE IF EXISTS users;
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    age DATE NOT NULL,
    username VARCHAR(30) UNIQUE NOT NULL,
    email TEXT UNIQUE NOT NULL,
    pronouns TEXT,
    bio VARCHAR(200),
    profile_img TEXT,
    firebase_id TEXT
);

DROP TABLE IF EXISTS bookclubs;
CREATE TABLE bookclubs (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    summary TEXT NOT NULL,
    max_people INTEGER CHECK (max_people > 0), 
    age_restriction BOOLEAN,
    age_min INTEGER DEFAULT 18,
    CHECK(age_min <= age_max),
    meeting_method TEXT NOT NULL,
    meeting_location TEXT NOT NULL,
    meeting_day TEXT NOT NULL,
    meeting_information TEXT,
    start_time time,
    end_time time,
    CONSTRAINT check_end_after_start CHECK (end_time > start_time),
    club_image TEXT NOT NULL,
    creator INTEGER REFERENCES users(id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS bookclubs_meetings;
CREATE TABLE bookclubs_meetings (
    
)

DROP TABLE IF EXISTS users_genres;
CREATE TABLE users_genres (
    users_id INTEGER,
    genre_id INTEGER,
    added BOOLEAN NOT NULL,
    UNIQUE (users_id, genre_id)
);

DROP TABLE IF EXISTS bookclubs_genres;
CREATE TABLE bookclubs_genres (
    bookclub_id INTEGER REFERENCES bookclubs(id) ON DELETE CASCADE,
    genre_id INTEGER REFERENCES genres(id) ON DELETE CASCADE,
    PRIMARY KEY (bookclub_id, genre_id)
);

DROP TABLE IF EXISTS users_bookclubs;
CREATE TABLE users_bookclubs (
    users_id INTEGER,
    bookclubs_id INTEGER,
    title TEXT,
    meeting_method TEXT NOT NULL,
    meeting_day TEXT NOT NULL,  
    club_image TEXT NOT NULL,
    interested BOOLEAN DEFAULT FALSE,
    added Boolean NOT NULL,
     UNIQUE(users_id, event_id, added)
);

DROP TABLE IF EXISTS bookclubs_books;
CREATE TABLE bookclubs_books (

)
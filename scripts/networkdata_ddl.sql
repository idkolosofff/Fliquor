CREATE SCHEMA flq;

-- Create the User table --
CREATE TABLE flq.User (
  id SERIAL PRIMARY KEY,
  profile_photo_id INT REFERENCES flq.Photo(id),
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
  password VARCHAR(255) NOT NULL,
  bio TEXT,
  creation_date TIMESTAMP NOT NULL
);

-- Create the Photo table --
CREATE TABLE flq.Photo (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES flq.User(id),
  title VARCHAR(100) NOT NULL,
  description TEXT,
  image_url TEXT NOT NULL,
  upload_date TIMESTAMP NOT NULL
);

-- Create the Tag table --
CREATE TABLE flq.Tag (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

-- Create the Like table --
CREATE TABLE flq.Like (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES flq.User(id),
  photo_id INT NOT NULL REFERENCES flq.Photo(id)
);

-- Create the Comment table --
CREATE TABLE flq.Comment (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES flq.User(id),
  photo_id INT NOT NULL REFERENCES flq.Photo(id),
  comment TEXT NOT NULL,
  comment_date TIMESTAMP NOT NULL
);

-- Create the Album table --
CREATE TABLE flq.Album (
  id SERIAL PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  description TEXT,
  privacy VARCHAR(10) NOT NULL DEFAULT 'public' CHECK (privacy IN ('public', 'private')),
  creation_date TIMESTAMP NOT NULL
);

-- Create the Follower table --
CREATE TABLE flq.Follower (
  id SERIAL PRIMARY KEY,
  follower_id INT NOT NULL REFERENCES flq.User(id),
  following_id INT NOT NULL REFERENCES flq.User(id),
  follow_date TIMESTAMP NOT NULL
);

-- Create the Community table --
CREATE TABLE flq.Community (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  privacy VARCHAR(10) NOT NULL DEFAULT 'public' CHECK (privacy IN ('public', 'private')),
  creation_date TIMESTAMP NOT NULL
);

-- Create the Membership table --
CREATE TABLE flq.Membership (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES flq.User(id),
  community_id INT NOT NULL REFERENCES flq.Community(id),
  join_date TIMESTAMP NOT NULL,
  is_creator BOOLEAN NOT NULL DEFAULT FALSE
);

-- Create the TaggedPhoto table --
CREATE TABLE flq.TaggedPhoto (
  id SERIAL PRIMARY KEY,
  photo_id INT NOT NULL REFERENCES flq.Photo(id),
  tag_id INT NOT NULL REFERENCES flq.Tag(id)
);

-- Create the AlbumPhoto table --
CREATE TABLE flq.AlbumPhoto (
  id SERIAL PRIMARY KEY,
  photo_id INT NOT NULL REFERENCES flq.Photo(id),
  album_id INT NOT NULL REFERENCES flq.Album(id)
);

-- Create the UserHistory table --
CREATE TABLE flq.UserHistory (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES flq.User(id),
  name VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
  password VARCHAR(255) NOT NULL,
  start_date TIMESTAMP NOT NULL,
  end_date TIMESTAMP
);
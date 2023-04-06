CREATE SCHEMA flq;

-- Create the Users table --
CREATE TABLE flq.Users (
  ID SERIAL PRIMARY KEY,
  ProfilePhotoID INT REFERENCES flq.Photos(ID),
  Name VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Password VARCHAR(255) NOT NULL,
  Bio TEXT,
  DateCreated TIMESTAMP NOT NULL
);

-- Create the Photos table --
CREATE TABLE flq.Photos (
  ID SERIAL PRIMARY KEY,
  UserID INT NOT NULL REFERENCES flq.Users(ID),
  Title VARCHAR(100) NOT NULL,
  Description TEXT,
  ImageURL TEXT NOT NULL,
  DateUploaded TIMESTAMP NOT NULL
);

-- Create the Tags table --
CREATE TABLE flq.Tags (
  ID SERIAL PRIMARY KEY,
  Name VARCHAR(100) NOT NULL
);

-- Create the Likes table --
CREATE TABLE flq.Likes (
  ID SERIAL PRIMARY KEY,
  UserID INT NOT NULL REFERENCES flq.Users(ID),
  PhotoID INT NOT NULL REFERENCES flq.Photos(ID)
);

-- Create the Comments table --
CREATE TABLE flq.Comments (
  ID SERIAL PRIMARY KEY,
  UserID INT NOT NULL REFERENCES flq.Users(ID),
  PhotoID INT NOT NULL REFERENCES flq.Photos(ID),
  Comment TEXT NOT NULL,
  DateCommented TIMESTAMP NOT NULL
);

-- Create the Albums table --
CREATE TABLE flq.Albums (
  ID SERIAL PRIMARY KEY,
  Title VARCHAR(100) NOT NULL,
  Description TEXT,
  Privacy VARCHAR(10) NOT NULL DEFAULT 'public',
  DateCreated TIMESTAMP NOT NULL
);

-- Create the Followers table --
CREATE TABLE flq.Followers (
  ID SERIAL PRIMARY KEY,
  FollowerID INT NOT NULL REFERENCES flq.Users(ID),
  FollowingID INT NOT NULL REFERENCES flq.Users(ID),
  DateFollowed TIMESTAMP NOT NULL
);

-- Create the Communities table --
CREATE TABLE flq.Communities (
  ID SERIAL PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Description TEXT,
  Privacy VARCHAR(10) NOT NULL DEFAULT 'public',
  DateCreated TIMESTAMP NOT NULL
);

-- Create the Memberships table --
CREATE TABLE flq.Memberships (
  ID SERIAL PRIMARY KEY,
  UserID INT NOT NULL REFERENCES flq.Users(ID),
  CommunityID INT NOT NULL REFERENCES flq.Communities(ID),
  DateJoined TIMESTAMP NOT NULL,
  IsCreator BOOLEAN NOT NULL DEFAULT FALSE
);

-- Create the TaggedPhotos table --
CREATE TABLE flq.TaggedPhotos (
  ID SERIAL PRIMARY KEY,
  PhotoID INT NOT NULL REFERENCES flq.Photos(ID),
  TagID INT NOT NULL REFERENCES flq.Tags(ID)
);

-- Create the AlbumPhotos table --
CREATE TABLE flq.AlbumPhotos (
  ID SERIAL PRIMARY KEY,
  PhotoID INT NOT NULL REFERENCES flq.Photos(ID),
  AlbumID INT NOT NULL REFERENCES flq.Albums(ID)
);

-- Create the UserHistory table --
CREATE TABLE flq.UserHistory (
  ID SERIAL PRIMARY KEY,
  UserID INT NOT NULL REFERENCES flq.Users(ID),
  Name VARCHAR(100) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Password VARCHAR(255) NOT NULL,
  StartDate TIMESTAMP NOT NULL,
  EndDate TIMESTAMP
);
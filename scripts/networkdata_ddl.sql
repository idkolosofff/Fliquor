CREATE SCHEMA flq;

-- Create the Photos table --
CREATE TABLE Photos (
  ID SERIAL PRIMARY KEY,
  UserID INT NOT NULL REFERENCES Users(ID),
  Title VARCHAR(100) NOT NULL,
  Description TEXT,
  ImageURL TEXT NOT NULL,
  DateUploaded TIMESTAMP NOT NULL
);

-- Create the Users table --
CREATE TABLE Users (
  ID SERIAL PRIMARY KEY,
  ProfilePhotoID INT REFERENCES Photos(ID),
  Name VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Password VARCHAR(255) NOT NULL,
  Bio TEXT,
  DateCreated TIMESTAMP NOT NULL
);

-- Create the Tags table --
CREATE TABLE Tags (
  ID SERIAL PRIMARY KEY,
  Name VARCHAR(100) NOT NULL
);

-- Create the Likes table --
CREATE TABLE Likes (
  ID SERIAL PRIMARY KEY,
  UserID INT NOT NULL REFERENCES Users(ID),
  PhotoID INT NOT NULL REFERENCES Photos(ID),
);

-- Create the Comments table --
CREATE TABLE Comments (
  ID SERIAL PRIMARY KEY,
  UserID INT NOT NULL REFERENCES Users(ID),
  PhotoID INT NOT NULL REFERENCES Photos(ID),
  Comment TEXT NOT NULL,
  DateCommented TIMESTAMP NOT NULL
);

-- Create the Albums table --
CREATE TABLE Albums (
  ID SERIAL PRIMARY KEY,
  Title VARCHAR(100) NOT NULL,
  Description TEXT,
  Privacy VARCHAR(10) NOT NULL DEFAULT 'public',
  DateCreated TIMESTAMP NOT NULL
);

-- Create the Followers table --
CREATE TABLE Followers (
  ID SERIAL PRIMARY KEY,
  FollowerID INT NOT NULL REFERENCES Users(ID),
  FollowingID INT NOT NULL REFERENCES Users(ID),
  DateFollowed TIMESTAMP NOT NULL
);

-- Create the Communities table --
CREATE TABLE Communities (
  ID SERIAL PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Description TEXT,
  Privacy VARCHAR(10) NOT NULL DEFAULT 'public',
  DateCreated TIMESTAMP NOT NULL
);

-- Create the Memberships table --
CREATE TABLE Memberships (
  ID SERIAL PRIMARY KEY,
  UserID INT NOT NULL REFERENCES Users(ID),
  CommunityID INT NOT NULL REFERENCES Communities(ID),
  DateJoined TIMESTAMP NOT NULL,
  IsCreator BOOLEAN NOT NULL DEFAULT FALSE
);

-- Create the TaggedPhotos table --
CREATE TABLE TaggedPhotos (
  ID SERIAL PRIMARY KEY,
  PhotoID INT NOT NULL REFERENCES Photos(ID),
  TagID INT NOT NULL REFERENCES Tags(ID)
);

-- Create the AlbumPhotos table --
CREATE TABLE AlbumPhotos (
  ID SERIAL PRIMARY KEY,
  PhotoID INT NOT NULL REFERENCES Photos(ID)
  AlbumID INT NOT NULL REFERENCES Albums(ID),
);

-- Create the UserHistory table --
CREATE TABLE UserHistory (
  ID SERIAL PRIMARY KEY,
  UserID INT NOT NULL REFERENCES Users(ID),
  Name VARCHAR(100) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Password VARCHAR(255) NOT NULL,
  StartDate TIMESTAMP NOT NULL,
  EndDate TIMESTAMP
);

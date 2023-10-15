------------------ USERS ------------------
INSERT INTO flq.User (id, name, email, password, bio, creation_date)
VALUES
  (1, 'John Doe', 'john.doe@example.com', 'password123', 'A software engineer from California', '2022-01-01 00:00:00'),
  (2, 'Jane Smith', 'jane.smith@example.com', 'qwerty456', 'A marketing specialist from New York', '2022-01-02 00:00:00'),
  (3, 'Bob Johnson', 'bob.johnson@example.com', 'letmein789', 'A teacher from Texas', '2022-01-03 00:00:00'),
  (4, 'Alice Lee', 'alice.lee@example.com', 'p@ssw0rd', 'A nurse from Florida', '2022-01-04 00:00:00'),
  (5, 'David Brown', 'david.brown@example.com', 'changeme', 'A salesperson from Illinois', '2022-01-05 00:00:00'),
  (6, 'Karen Davis', 'karen.davis@example.com', 'password321', 'An accountant from Ohio', '2022-01-06 00:00:00'),
  (7, 'Mark Wilson', 'mark.wilson@example.com', 'abcd1234', 'A writer from Michigan', '2022-01-07 00:00:00'),
  (8, 'Jennifer Garcia', 'jennifer.garcia@example.com', '1qaz2wsx', 'A scientist from California', '2022-01-08 00:00:00'),
  (9, 'Michael Patel', 'michael.patel@example.com', 'letmein123', 'A doctor from New York', '2022-01-09 00:00:00'),
  (10, 'Jessica Taylor', 'jessica.taylor@example.com', 'password1234', 'A lawyer from Texas', '2022-01-10 00:00:00'),
  (11, 'Jane Doe', 'jane@example.com', 'password123', 'I love taking photos!', '2022-04-20 00:00:00'),
  (12, 'John Smith', 'john@example.com', '123456', 'Photography is my passion!', '2022-04-19 00:00:00'),
  (13, 'Sarah Johnson', 'sarah@example.com', 'qwerty', 'I enjoy capturing moments!', '2022-04-18 00:00:00'),
  (14, 'Tom Wilson', 'tom@example.com', 'password123', NULL, '2022-04-17 00:00:00'),
  (15, 'Emily Davis', 'emily@example.com', '123456', NULL, '2022-04-16 00:00:00');

INSERT INTO flq.UserHistory (user_id, name, email, password, start_date, end_date)
SELECT id, name, email, password, creation_date, null
FROM flq.User;

-- Updates:
UPDATE flq.User SET bio = 'Photography is my life!' WHERE name = 'John Doe';
UPDATE flq.User SET bio = 'I am a photographer.' WHERE name = 'Jessica Taylor';
UPDATE flq.User SET name = 'Karen Doe' WHERE name = 'Karen Davis';
UPDATE flq.User SET bio = 'I am a developer and a photographer!' WHERE name = 'John Doe';
UPDATE flq.User SET email = 'newemail@example.com' WHERE name = 'John Doe';

UPDATE flq.UserHistory SET end_date = NOW() WHERE user_id = 7 AND end_date IS NULL;
UPDATE flq.UserHistory SET end_date = NOW() WHERE user_id = 6 AND end_date IS NULL;

INSERT INTO flq.UserHistory (user_id, name, email, password, start_date)
VALUES 
  (7, 'Mark Wilson', 'new.wilson@example.com', 'password', NOW()),
  (6, 'Karen Doe', 'karen.davis@example.com', 'password321', NOW());


------------------ TAGS ------------------
INSERT INTO flq.Tag (id, name) VALUES (1, 'nature');
INSERT INTO flq.Tag (id, name) VALUES (2, 'travel');
INSERT INTO flq.Tag (id, name) VALUES (3, 'food');
INSERT INTO flq.Tag (id, name) VALUES (4, 'animals');
INSERT INTO flq.Tag (id, name) VALUES (5, 'fashion');
INSERT INTO flq.Tag (id, name) VALUES (6, 'art');
INSERT INTO flq.Tag (id, name) VALUES (7, 'architecture');
INSERT INTO flq.Tag (id, name) VALUES (8, 'music');
INSERT INTO flq.Tag (id, name) VALUES (9, 'sports');
INSERT INTO flq.Tag (id, name) VALUES (10, 'people');


------------------ FOLLOWERS ------------------
INSERT INTO flq.Follower (follower_id, following_id, follow_date)
VALUES
  (1, 2, '2022-01-01 12:34:56'),
  (2, 3, '2022-01-02 13:45:12'),
  (3, 4, '2022-01-03 14:56:34'),
  (4, 5, '2022-01-04 15:12:45'),
  (5, 6, '2022-01-05 16:23:01'),
  (6, 7, '2022-01-06 17:34:23'),
  (7, 8, '2022-01-07 18:45:12'),
  (8, 9, '2022-01-08 19:56:34'),
  (9, 10, '2022-01-09 20:12:45'),
  (10, 11, '2022-01-10 21:23:01');



------------------ ALBUMS ------------------
INSERT INTO flq.Album (id, title, description, privacy, creation_date)
VALUES 
  (1, 'My trip to Sochi', 'Photos from my vacation in Sochi', 'public', '2022-03-15 00:00:00'),
  (2, 'Family reunion', 'Pictures from our family gathering', 'public', '2022-02-20 00:00:00'),
  (3, 'My pet', 'Photos of my adorable pet', 'private', '2022-05-01 00:00:00'),
  (4, 'Graduation', 'Memories from my graduation day', 'public', '2022-05-15 00:00:00'),
  (5, 'Nightlife', 'Pictures from a night out with friends', 'public', '2022-04-02 00:00:00'),
  (6, 'Nature', 'Beautiful landscapes and outdoor shots', 'public', '2022-03-01 00:00:00'),
  (7, 'Cityscapes', 'Photos of urban environments and city life', 'public', '2022-01-10 00:00:00'),
  (8, 'Wedding', 'Pictures from a friend''s wedding', 'public', '2022-06-05 00:00:00'),
  (9, 'Beaches', 'Photos from various beach destinations', 'public', '2022-03-20 00:00:00'),
  (10, 'Camping', 'Pictures from a camping trip', 'public', '2022-04-25 00:00:00'),
  (11, 'Sports', 'Action shots from various sports events', 'public', '2022-02-15 00:00:00'),
  (12, 'Concerts', 'Photos from live music performances', 'public', '2022-05-20 00:00:00');

DELETE FROM flq.Album WHERE title = 'Nightlife';



------------------ PHOTOS ------------------
INSERT INTO flq.Photo (id, user_id, title, description, image_url, upload_date)
VALUES
  (1, 1, 'Sunset at the beach', 'A beautiful view of the sunset at the beach', 'https://example.com/sunset.jpg', '2022-01-01 00:00:00'),
  (2, 2, 'Mountains in winter', 'Snowy mountains on a winter day', 'https://example.com/mountains.jpg', '2022-01-02 00:00:00'),
  (3, 3, 'Happy family', 'A family photo with parents and two children', 'https://example.com/family.jpg', '2022-01-03 00:00:00'),
  (4, 4, 'Tropical paradise', 'A view of palm trees and a clear blue sky', 'https://example.com/tropical.jpg', '2022-01-04 00:00:00'),
  (5, 5, 'City skyline', 'A view of a city skyline at night', 'https://example.com/city.jpg', '2022-01-05 00:00:00'),
  (6, 6, 'Autumn colors', 'A view of trees with yellow and orange leaves', 'https://example.com/autumn.jpg', '2022-01-06 00:00:00'),
  (7, 7, 'Sunny day', 'A view of a field with flowers on a sunny day', 'https://example.com/sunny.jpg', '2022-01-07 00:00:00'),
  (8, 8, 'Wildlife', 'A photo of a deer in the forest', 'https://example.com/deer.jpg', '2022-01-08 00:00:00'),
  (9, 9, 'Road trip', 'A photo taken during a road trip', 'https://example.com/roadtrip.jpg', '2022-01-09 00:00:00'),
  (10, 10, 'Food art', 'A photo of an artistic food plate', 'https://example.com/food.jpg', '2022-01-10 00:00:00'),
  (11, 11, 'Sailboat', 'A photo of a sailboat on the sea', 'https://example.com/sailboat.jpg', '2022-04-20 00:00:00'),
  (12, 12, 'Camping trip', 'A photo taken during a camping trip in the mountains', 'https://example.com/camping.jpg', '2022-04-19 00:00:00'),
  (13, 13, 'Dog lover', 'A photo of a cute dog', 'https://example.com/dog.jpg', '2022-04-18 00:00:00'),
  (14, 14, 'Beach walk', 'A photo of a person walking on the beach', 'https://example.com/beachwalk.jpg', '2022-04-17 00:00:00'),
  (15, 13, 'Street art', 'A photo of a mural on a city wall', 'https://example.com/streetart.jpg', '2022-04-16 00:00:00'),
  (16, 13, 'Graffiti', 'A photo of graffiti on a wall', 'https://example.com/graffiti.jpg', '2022-04-15 00:00:00');




------------------ PHOTO TAGS ------------------
INSERT INTO flq.TaggedPhoto (photo_id, tag_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 1),
  (7, 2),
  (8, 3),
  (9, 4);


------------------ ALBUM PHOTOS ------------------
INSERT INTO flq.AlbumPhoto (photo_id, album_id)
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 2),
  (5, 2),
  (6, 2),
  (7, 3),
  (8, 3),
  (9, 3),
  (10, 4),
  (11, 4),
  (12, 4),
  (13, 7),
  (14, 7),
  (15, 8),
  (16, 6);




------------------ COMMUNITY ------------------
INSERT INTO flq.Community (id, name, description, privacy, creation_date)
VALUES 
  (1, 'Photography Lovers', 'A community for those who love photography', 'public', '2022-01-01 00:00:00'),
  (2, 'Nature Photography', 'A community for those who love nature photography', 'public', '2022-01-02 00:00:00'),
  (3, 'Travel Photography', 'A community for those who love travel photography', 'public', '2022-01-03 00:00:00'),
  (4, 'Portrait Photography', 'A community for those who love portrait photography', 'public', '2022-01-04 00:00:00'),
  (5, 'Film Photography', 'A community for those who love film photography', 'public', '2022-01-05 00:00:00'),
  (6, 'Black and White Photography', 'A community for those who love black and white photography', 'public', '2022-01-06 00:00:00'),
  (7, 'Street Photography', 'A community for those who love street photography', 'public', '2022-01-07 00:00:00'),
  (8, 'ROSCOSMOS Photography', 'A community for those who love space photography', 'private', '2022-01-08 00:00:00'),
  (9, 'Mobile Photography', 'A community for those who love mobile photography', 'public', '2022-01-09 00:00:00'),
  (10, 'Underwater Photography', 'A community for those who love underwater photography', 'public', '2022-01-10 00:00:00');



------------------ MEMBERSHIPS ------------------
INSERT INTO flq.Membership (user_id, community_id, join_date, is_creator)
VALUES 
  (1, 1, '2022-01-01 00:00:00', true),
  (2, 1, '2022-01-02 00:00:00', false),
  (3, 1, '2022-01-03 00:00:00', false),
  (4, 1, '2022-01-04 00:00:00', false),
  (5, 1, '2022-01-05 00:00:00', false),
  (6, 1, '2022-01-06 00:00:00', false),
  (7, 1, '2022-01-07 00:00:00', false),
  (8, 1, '2022-01-08 00:00:00', false),
  (9, 8, '2022-01-09 00:00:00', false),
  (10, 1, '2022-01-10 00:00:00', false);



------------------ COMMENTS ------------------
INSERT INTO flq.Comment (user_id, photo_id, comment, comment_date)
VALUES 
    (1, 1, 'Beautiful landscape!', '2022-04-20 12:30:00'),
    (2, 1, 'Love this photo!', '2022-04-20 13:45:00'),
    (3, 2, 'Wow, stunning portrait!', '2022-04-21 09:15:00'),
    (4, 3, 'Nice shot!', '2022-04-22 10:30:00'),
    (5, 4, 'Great photo!', '2022-04-23 11:45:00'),
    (6, 4, 'Love the colors!', '2022-04-23 12:00:00'),
    (7, 5, 'Amazing city!', '2022-04-24 18:30:00'),
    (8, 6, 'Awesome photo!', '2022-04-25 10:00:00'),
    (9, 7, 'Interesting perspective!', '2022-04-26 14:15:00'),
    (1, 8, 'Impressive landscape!', '2022-04-27 16:30:00'),
    (1, 9, 'Beautiful colors!', '2022-04-28 11:00:00'),
    (2, 10, 'Great capture!', '2022-04-29 13:45:00'),
    (1, 10, 'Love this photo!', '2022-04-29 14:00:00'),
    (3, 11, 'Awesome portrait!', '2022-04-30 10:30:00'),
    (7, 11, 'Stunning photo!', '2022-04-30 12:00:00');


------------------ LIKES ------------------
INSERT INTO flq.Like (user_id, photo_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 2),
    (5, 2),
    (6, 2),
    (7, 3),
    (8, 3),
    (9, 3),
    (1, 4),
    (1, 4),
    (2, 5),
    (3, 5),
    (4, 6),
    (5, 6),
    (1, 7),
    (2, 8),
    (3, 9),
    (4, 10),
    (5, 11);

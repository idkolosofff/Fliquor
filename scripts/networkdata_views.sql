CREATE VIEW flq.User_NoSensitiveInfo AS
SELECT id, name, CONCAT(REPLACE(SUBSTRING(email, 1, POSITION('@' IN email)), SUBSTRING(email, 1, POSITION('@' IN email)), '****'), SUBSTRING(email, POSITION('@' IN email), LENGTH(email))) AS email, bio
FROM flq.User;

CREATE VIEW flq.Photo_NoSensitiveInfo AS
SELECT u.name AS user_name, p.title, p.description, p.image_url
FROM flq.Photo p
JOIN flq.User u ON p.user_id = u.id;

--- Представление, показывающее статистику по активности на фотографиях в альбомах:
CREATE VIEW flq.Album_Photos_Stats_Count AS
SELECT a.id AS album_id, a.title, a.description, a.privacy, a.creation_date,
       COUNT(DISTINCT ap.photo_id) AS num_photos,
       COALESCE(SUM(CASE WHEN l.id IS NOT NULL THEN 1 ELSE 0 END), 0) AS num_likes,
       COALESCE(SUM(CASE WHEN c.id IS NOT NULL THEN 1 ELSE 0 END), 0) AS num_comments
FROM flq.Album AS a
LEFT JOIN flq.AlbumPhoto AS ap ON a.id = ap.album_id
LEFT JOIN flq.Photo AS p ON ap.photo_id = p.id
LEFT JOIN flq.Like AS l ON p.id = l.photo_id
LEFT JOIN flq.Comment c ON p.id = c.photo_id
GROUP BY a.id;

--- Представление, показывающее список фотографий, которые были загружены в альбомы:
CREATE VIEW flq.Album_Photo AS
SELECT p.image_url, u.name AS user_name, a.title AS album_title, p.title, p.description
FROM flq.Photo p
JOIN flq.AlbumPhoto ap ON p.id = ap.photo_id
JOIN flq.Album a ON ap.album_id = a.id
JOIN flq.User u ON p.user_id = u.id;

--- Представление, показывающее количество членств в сообществах для каждого пользователя:
CREATE VIEW flq.User_Community_Count AS
SELECT u.id, u.name, u.bio,
       COALESCE(COUNT(DISTINCT m.community_id), 0) AS num_communities
FROM flq.User AS u
LEFT JOIN flq.Membership AS m ON u.id = m.user_id
GROUP BY u.id, u.name, u.email, u.bio, u.creation_date;

--- Представление, показывающее список подписчиков и подписок для каждого пользователя:
CREATE VIEW flq.UserFollowers AS
SELECT u.id AS user_id, u.name AS user_name,
       COUNT(DISTINCT f1.id) AS num_followers,
       COUNT(DISTINCT f2.id) AS num_following
FROM flq.User AS u
LEFT JOIN flq.Follower f1 ON f1.following_id = u.id
LEFT JOIN flq.Follower f2 ON f2.follower_id = u.id
GROUP BY u.id;


DROP VIEW flq.photo_nosensitiveinfo
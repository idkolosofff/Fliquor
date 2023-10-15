--- Показать количество фотографий, загруженных каждым пользователем, и отобразить только тех пользователей, которые загрузили более 5 фотографий:
SELECT user_id, COUNT(*) AS photo_count
FROM flq.Photo
GROUP BY user_id
HAVING COUNT(*) > 5;

--- Показать количество лайков, поставленных каждой фотографии, и отобразить только те фотографии, которые получили более 2 лайков:
SELECT photo_id, COUNT(*) AS like_count
FROM flq.Like
GROUP BY photo_id
HAVING COUNT(*) > 2;

--- Отобразить все фотографии пользователя, отсортированные по дате загрузки (от более новых к более старым):
SELECT *
FROM flq.Photo
WHERE user_id = 3
ORDER BY upload_date DESC;

--- Список пользователей, количества их подписчиков, сообществ, фотографий:
SELECT 
  u.name, 
  COUNT(DISTINCT f1.follower_id) AS followers, 
  COUNT(DISTINCT m1.community_id) AS communities, 
  COUNT(DISTINCT p1.id) AS photos
FROM 
  flq.User u 
  LEFT JOIN flq.Follower f1 ON u.id = f1.following_id
  LEFT JOIN flq.Membership m1 ON u.id = m1.user_id
  LEFT JOIN flq.Photo p1 ON u.id = p1.user_id
GROUP BY u.name
ORDER BY u.name;


--- Среднее количество лайков и комментариев на одну фотографию для каждого пользователя:
SELECT
  p.user_id,
  AVG(COUNT(c.id)) OVER (PARTITION BY p.user_id) AS avg_comments,
  AVG(COUNT(l.id)) OVER (PARTITION BY p.user_id) AS avg_likes
FROM
  flq.Photo p
  LEFT JOIN flq.Comment c ON p.id = c.photo_id
  LEFT JOIN flq.Like l ON p.id = l.photo_id
GROUP BY p.user_id;


--- Список пользователей в порядке убывания числа их подписчиков:
SELECT 
  ROW_NUMBER() OVER(ORDER BY follower_count DESC) AS row_num, 
  name, 
  follower_count 
FROM 
  (SELECT 
    flq.User.name, 
    COUNT(*) AS follower_count 
  FROM 
    flq.User 
    INNER JOIN flq.Follower ON flq.User.id = flq.Follower.following_id 
  GROUP BY 
    flq.User.id) AS follower_counts;


--- Список фотографий и их даты загрузки, а также даты загрузки предыдущей и следующей фотографии в рамках альбома: 
SELECT 
  flq.Photo.id, 
  flq.Photo.title, 
  flq.Photo.upload_date, 
  LAG(flq.Photo.upload_date) OVER(PARTITION BY flq.Album.id ORDER BY flq.Photo.upload_date) AS previous_upload_date,
  LEAD(flq.Photo.upload_date) OVER(PARTITION BY flq.Album.id ORDER BY flq.Photo.upload_date) AS next_upload_date
FROM 
  flq.Photo 
  INNER JOIN flq.AlbumPhoto ON flq.Photo.id = flq.AlbumPhoto.photo_id 
  INNER JOIN flq.Album ON flq.AlbumPhoto.album_id = flq.Album.id;

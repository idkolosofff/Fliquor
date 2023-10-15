-- Уникальные индексы, которые не позволят добавлять записи с повторяющимися значениями отношений: 
CREATE UNIQUE INDEX idx_like_user_photo ON flq.Like(user_id, photo_id);
CREATE UNIQUE INDEX idx_follower_unique ON flq.Follower(follower_id, following_id);
CREATE UNIQUE INDEX idx_tagged_photo ON flq.TaggedPhoto(photo_id, tag_id);
CREATE UNIQUE INDEX idx_membership_unique ON flq.Membership(user_id, community_id);
CREATE UNIQUE INDEX idx_album_photo ON flq.AlbumPhoto(photo_id, album_id);

-- Индекс по полю email, поскольку этот столбец является уникальным и часто используется в запросах на поиск и проверку существования пользователя.
CREATE UNIQUE INDEX idx_user_email ON flq.User(email);

CREATE INDEX idx_like_user_id ON flq.Like USING btree (user_id);
CREATE INDEX idx_like_photo_id ON flq.Like USING btree (photo_id);

-- Для оптимизации поиска комментариев по идентификатору пользователя, фотографии и дате комментария
CREATE INDEX idx_comment_user_photo_comment_date ON flq.Comment(user_id, photo_id, comment_date);

CREATE INDEX idx_tagged_photo_tag_id ON flq.TaggedPhoto USING btree (tag_id);

CREATE INDEX idx_membership_user_id ON flq.Membership USING btree (user_id);
CREATE INDEX idx_membership_community_id ON flq.Membership USING btree (community_id);

-- Индекс ускорит поиск всех фотографий, принадлежащих определенному пользователю
CREATE INDEX photo_user_idx ON flq.Photo(user_id) USING btree;

CREATE INDEX idx_user_history_user_id_start_date ON flq.UserHistory(user_id, start_date);
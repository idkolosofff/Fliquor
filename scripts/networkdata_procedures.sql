CREATE OR REPLACE PROCEDURE flq.add_new_user(
    v_name VARCHAR(255),
    v_email VARCHAR(255),
    v_password VARCHAR(255),
    v_bio TEXT,
    v_creation_date TIMESTAMP WITH TIME ZONE
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO flq.User (name, email, password, bio, creation_date)
    VALUES (v_name, v_email, v_password, v_bio, v_creation_date);
END;
$$;

CALL flq.add_new_user('John Doer', 'johndoer@example.com', 'password', 'Hello, I am John Doer', NOW());

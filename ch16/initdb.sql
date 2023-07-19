# initdb.sql
DROP TABLE IF EXISTS posts CASCADE;

CREATE TABLE posts
(
    id             BIGSERIAL PRIMARY KEY,
    uuid           VARCHAR(36)  NOT NULL UNIQUE,
    user_id        NUMERIC      NOT NULL,
    title          VARCHAR(255) NOT NULL,
    content        TEXT         NOT NULL,
    comments_count NUMERIC               DEFAULT 0,
    created_at     TIMESTAMP    NOT NULL DEFAULT NOW(),
    updated_at     TIMESTAMP    NOT NULL DEFAULT NOW(),
    deleted_at     TIMESTAMP    NULL
);

CREATE INDEX user_id_key ON posts (user_id);

COMMENT ON COLUMN posts.title IS '標題';
    COMMENT ON COLUMN posts.content IS '內容';
    COMMENT ON COLUMN posts.comments_count IS '評論數';
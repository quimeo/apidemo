-- +micrate Up
CREATE TABLE tokens (
  id BIGSERIAL PRIMARY KEY,
  access_token VARCHAR(255),
  user_id BIGINT,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

-- +micrate Down
DROP TABLE IF EXISTS tokens;

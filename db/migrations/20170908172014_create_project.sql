-- +micrate Up
CREATE TABLE projects (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR,
  description VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

-- +micrate Down
DROP TABLE IF EXISTS projects;

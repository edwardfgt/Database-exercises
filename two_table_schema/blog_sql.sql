CREATE TABLE blogs (
  id SERIAL PRIMARY KEY,
  title text,
  content text
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  content text,
  author int,
  blog_id int,
  constraint fk_blogs foreign key(blog_id)
    references blogs(id)
    on delete cascade
);
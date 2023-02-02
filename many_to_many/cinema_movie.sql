CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title text,
  release_date date
);

-- Create the second table.
CREATE TABLE cinemas (
  id SERIAL PRIMARY KEY,
  city_name text
);

-- Create the join table.
CREATE TABLE cinemas_movies (
  movie_id int,
  cinema_id int,
  constraint fk_post foreign key(movie_id) references movies(id) on delete cascade,
  constraint fk_tag foreign key(cinema_id) references cinemas(id) on delete cascade,
  PRIMARY KEY (movie_id, cinema_id)
);
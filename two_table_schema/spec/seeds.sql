TRUNCATE TABLE blogs, comments RESTART IDENTITY;

INSERT INTO blogs (title, content) VALUES ('Blog 01', 'Welcome to my blog');
INSERT INTO blogs (title, content) VALUES ('Blog 02', 'Hello world');
INSERT INTO blogs (title, content) VALUES ('Blog 03', 'Goodbye world');
INSERT INTO comments (content, author, blog_id) VALUES ('Wow awesome blog', 'Edward', 1);
INSERT INTO comments (content, author, blog_id) VALUES ('Welcome', 'John', 1);
INSERT INTO comments (content, author, blog_id) VALUES ('Hello!', 'Mark', 2);
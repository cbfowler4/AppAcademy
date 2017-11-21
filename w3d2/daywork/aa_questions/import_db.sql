DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS questions;
CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body VARCHAR(255),
  user_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  question_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  parent_id INTEGER DEFAULT NULL,
  user_id INTEGER,
  body VARCHAR(255),

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)

);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  liked INTEGER,
  user_id INTEGER,
  question_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users(fname, lname)
VALUES
  ('Bryan', 'Fowler'),
  ('Michael', 'Berman');

INSERT INTO
  questions(title, body, user_id)
VALUES
  ('Join two tables?', 'How do you join two tables in SQL', (SELECT id FROM users WHERE fname = 'Michael' AND lname = 'Berman')),
  ('What are pirates?', 'Arrrr they criminals?', (SELECT id FROM users WHERE fname = 'Michael' AND lname = 'Berman')),
  ('Cat websites on the rise?', 'How do I create MORE cat websites', (SELECT id FROM users WHERE fname = 'Bryan' AND lname = 'Fowler'));

INSERT INTO
  replies(question_id, parent_id, user_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = 'Join two tables?'), NULL, (SELECT id FROM users WHERE fname = 'Bryan' AND lname = 'Fowler'), 'Try using an Inner outer inner join!'),
  ((SELECT id FROM questions WHERE title = 'Cat websites on the rise?'), NULL, (SELECT id FROM users WHERE fname = 'Michael' AND lname = 'Berman'), 'Breed more kittens');

INSERT INTO
  question_likes(liked, user_id, question_id)
VALUES
  (1, (SELECT id FROM users WHERE fname = 'Michael' AND lname = 'Berman'), (SELECT id FROM questions WHERE title = 'Join two tables?')),
  (1, (SELECT id FROM users WHERE fname = 'Bryan' AND lname = 'Fowler'), (SELECT id FROM questions WHERE title = 'Join two tables?')),
  (0, (SELECT id FROM users WHERE fname = 'Michael' AND lname = 'Berman'), (SELECT id FROM questions WHERE title = 'What are pirates?')),
  (1, (SELECT id FROM users WHERE fname = 'Bryan' AND lname = 'Fowler'), (SELECT id FROM questions WHERE title = 'What are pirates?')),
  (0, (SELECT id FROM users WHERE fname = 'Bryan' AND lname = 'Fowler'), (SELECT id FROM questions WHERE title = 'Cat websites on the rise?')),
  (1, (SELECT id FROM users WHERE fname = 'Bryan' AND lname = 'Fowler'), (SELECT id FROM questions WHERE title = 'Cat websites on the rise?'));

INSERT INTO
  question_follows(user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Michael' AND lname = 'Berman'), (SELECT id FROM questions WHERE title = 'Join two tables?')),
  ((SELECT id FROM users WHERE fname = 'Bryan' AND lname = 'Fowler'), (SELECT id FROM questions WHERE title = 'Join two tables?'));

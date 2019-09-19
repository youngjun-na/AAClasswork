PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_follows;

      CREATE TABLE question_follows (
        id INTEGER PRIMARY KEY,
        questions_id INTEGER NOT NULL,
        users_id INTEGER NOT NULL,

    FOREIGN KEY (questions_id) REFERENCES questions(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
  );

DROP TABLE IF EXISTS replies;

    CREATE TABLE replies (
      id INTEGER PRIMARY KEY,
      question_id INTEGER NOT NULL,
      parent_id INTEGER,
      author_id INTEGER NOT NULL,
      body TEXT NOT NULL,
  

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_likes;

    CREATE TABLE question_likes (
      id INTEGER PRIMARY KEY,
      question_id INTEGER NOT NULL,
      user_id INTEGER NOT NULL,

  FOREIGN KEY(question_id) REFERENCES questions(id),
  FOREIGN KEY(user_id) REFERENCES users(id)
);
DROP TABLE IF EXISTS questions;

    CREATE TABLE questions (
      id INTEGER PRIMARY KEY,
      title TEXT NOT NULL,
      body TEXT NOT NULL,
      author_id INTEGER NOT NULL,

  FOREIGN KEY(author_id) REFERENCES users(id)
);


DROP TABLE IF EXISTS users;

    CREATE TABLE users (
      id INTEGER PRIMARY KEY,
      fname TEXT NOT NULL,
      lname TEXT NOT NULL
    );


INSERT INTO
  users (fname, lname)
VALUES
  ('Jet', 'Black'),
  ('Freyja', 'Green'),
  ('Ralph', 'Pink');

INSERT INTO
    questions (title, body, author_id)
VALUES
  ('Homework', 'Is there a lot', 1),
  ('Assessment', 'Will I fail????', 2);

INSERT INTO 
  question_follows (questions_id, users_id)
VALUES
  (1, 2),
  (2, 1);

INSERT INTO
  replies (question_id, parent_id, author_id, body)
VALUES
  (1, NULL, 3, 'Yes.' ),
  (2, NULL, 3, 'Of course.'),
  (2, 2, 2, 'T_T');

INSERT INTO
  question_likes (question_id, user_id)
VALUES
  (1, 3),
  (2, 3),
  (2, 1);
  
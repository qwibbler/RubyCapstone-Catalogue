CREATE TABLE items (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN DEFAULT FALSE
)

CREATE TABLE games (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  item_id INT REFERENCES items (id),
  multiplayer BOOLEAN NOT NULL,
  last_played_at DATE NOT NULL
)

CREATE TABLE authors (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL
)

CREATE TABLE items_authors (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  item_id INT REFERENCES items (id),
  author_id INT REFERENCES authors (id)
)

CREATE TABLE books (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  item_id INT REFERENCES items (id),
  publisher VARCHAR(50) NOT NULL,
  cover_state VARCHAR(50) NOT NULL
)

CREATE TABLE labels (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  color VARCHAR(50) NOT NULL
)

CREATE TABLE items_labels (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  item_id INT REFERENCES items (id),
  label_id INT REFERENCES labels (id)
)
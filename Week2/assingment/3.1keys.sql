CREATE TABLE authors (
    author_id      INT PRIMARY KEY,
    author_name    VARCHAR(255),
    university     VARCHAR(255),
    date_of_birth  DATE,
    h_index        INT,
    gender         VARCHAR(20)
);

ALTER TABLE authors
ADD mentor INT;

ALTER TABLE authors
ADD CONSTRAINT fk_mentor
FOREIGN KEY (mentor) REFERENCES authors(author_id);
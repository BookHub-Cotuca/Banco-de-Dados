CREATE SCHEMA bookHub;

CREATE TABLE bookHub.employees (
  fun_id INT PRIMARY KEY IDENTITY(1,1),
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password CHAR(64) NOT NULL
);

CREATE TABLE bookHub.authors (
  author_id INT PRIMARY KEY IDENTITY(1,1),
  name VARCHAR(100) NOT NULL
);

CREATE TABLE bookHub.gender (
  gender_id INT PRIMARY KEY IDENTITY(1,1),
  name VARCHAR(20) NOT NULL
);

CREATE TABLE bookHub.books (
  book_id INT PRIMARY KEY IDENTITY(1,1),
  gender INT,
  title VARCHAR(255) NOT NULL,
  publication_year DATETIME,
  price DECIMAL(10, 2) NOT NULL,
  available BIT DEFAULT(1),
  CONSTRAINT fkBookGender FOREIGN KEY (gender) 
    REFERENCES bookHub.gender (gender_id)
);

CREATE TABLE bookHub.bookAuthors (
  id INT IDENTITY(1,1),
  book_id INT NOT NULL,
  author_Id INT,
  PRIMARY KEY (book_id, author_Id),
  CONSTRAINT fkBookId FOREIGN KEY (book_id) 
    REFERENCES bookHub.books (book_id),
  CONSTRAINT fkBookAuthId FOREIGN KEY (author_Id) 
    REFERENCES bookHub.authors (author_Id)
);

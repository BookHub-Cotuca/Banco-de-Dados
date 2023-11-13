CREATE SCHEMA bookHub;

CREATE TABLE bookHub.Employees (
  fun_id INT PRIMARY KEY IDENTITY(1,1),
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password CHAR(64) NOT NULL
);

CREATE TABLE bookHub.Authors (
  author_Id INT PRIMARY KEY IDENTITY(1,1),
  name VARCHAR(100) NOT NULL
);

CREATE TABLE bookHub.Gender (
  gender_id INT PRIMARY KEY IDENTITY(1,1),
  name VARCHAR(20) NOT NULL
);

CREATE TABLE bookHub.Books (
  book_id INT PRIMARY KEY IDENTITY(1,1),
  gender INT,
  title VARCHAR(255) NOT NULL,
  publication_year DATETIME,
  price DECIMAL(10, 2) NOT NULL,
  available BIT DEFAULT(1),
  CONSTRAINT fkBookGender FOREIGN KEY (gender) 
    REFERENCES bookHub.Gender (gender_id)
);

CREATE TABLE bookHub.BookAuthors (
  id INT IDENTITY(1,1),
  book_id INT NOT NULL,
  author_Id INT,
  PRIMARY KEY (book_id, author_Id),
  CONSTRAINT fkBookId FOREIGN KEY (book_id) 
    REFERENCES bookHub.Books (book_id),
  CONSTRAINT fkBookAuthId FOREIGN KEY (author_Id) 
    REFERENCES bookHub.Authors (author_Id)
);

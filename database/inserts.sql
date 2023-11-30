-- Inserções na tabela Employees
INSERT INTO bookHub.Employees (first_name, last_name, email, password)
VALUES ('John', 'Doe', 'john.doe@email.com', 'hashedpassword123'),
       ('Jane', 'Smith', 'jane.smith@email.com', 'hashedpassword456'),
       ('Bob', 'Johnson', 'bob.johnson@email.com', 'hashedpassword789'),
       ('Alice', 'Williams', 'alice.williams@email.com', 'hashedpassword012'),
       ('Charlie', 'Brown', 'charlie.brown@email.com', 'hashedpassword345');

-- Inserções na tabela Authors
INSERT INTO bookHub.Authors (name)
VALUES ('J.K. Rowling'),
       ('George Orwell'),
       ('Harper Lee'),
       ('Agatha Christie'),
       ('Stephen King');

-- Inserções na tabela Gender
INSERT INTO bookHub.Gender (name)
VALUES ('Teste'),
       ('Mystery'),
       ('Science Fiction'),
       ('Non-fiction'),
       ('Romance');

-- Inserções na tabela Books
INSERT INTO bookHub.Books (gender, title, publication_year, price, available)
VALUES (1, 'Harry Potter and the Sorcerer''s Stone', '1997-06-26', 29.99, 1),
       (2, '1984', '1949-06-08', 19.99, 1),
       (3, 'To Kill a Mockingbird', '1960-07-11', 24.99, 1),
       (4, 'Murder on the Orient Express', '1934-01-01', 14.99, 1),
       (5, 'The Shining', '1977-01-28', 22.99, 1);

-- Inserções na tabela BookAuthors
INSERT INTO bookHub.BookAuthors (book_id, author_Id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5);

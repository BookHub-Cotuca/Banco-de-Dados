CREATE INDEX idx_employees_email ON bookHub.Employees (email);
 
CREATE INDEX idx_authors_name ON bookHub.Authors (name);

CREATE INDEX idx_gender_name ON bookHub.Gender (name);

CREATE INDEX idx_books_title ON bookHub.Books (title);
CREATE INDEX idx_books_gender ON bookHub.Books (gender);

CREATE INDEX idx_bookauthors_book_id ON bookHub.BookAuthors (book_id);
CREATE INDEX idx_bookauthors_author_id ON bookHub.BookAuthors (author_Id);

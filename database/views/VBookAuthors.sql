CREATE VIEW bookHub.vw_BookAuthors AS
SELECT
  ba.book_id,
  ba.author_Id,
  b.title AS Título,
  a.name AS NomeDoAutor
FROM bookHub.BookAuthors ba
JOIN bookHub.Books b ON ba.book_id = b.book_id
JOIN bookHub.Authors a ON ba.author_Id = a.author_Id;

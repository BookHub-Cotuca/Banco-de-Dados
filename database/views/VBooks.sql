CREATE OR ALTER VIEW bookHub.vw_Books AS
SELECT 
  b.book_id,
  b.title AS Título,
  a.name AS Autor,
  g.name AS Gênero,
  b.publication_year AS AnoDePublicação,
  b.available AS Disponibilidade,
  b.price AS Preço
FROM bookHub.bookAuthors ba
INNER JOIN bookHub.books b ON ba.book_id = b.book_id
INNER JOIN bookHub.authors a ON ba.author_id = a.author_id
INNER JOIN bookHub.gender g ON g.gender_id = b.gender 

/*
SELECT * FROM bookHub.vw_Books
ORDER BY Título ASC;*/


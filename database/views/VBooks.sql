CREATE VIEW bookHub.vw_Books AS
SELECT
  b.book_id,
  b.title AS Título,
  b.publication_year AS AnoDePublicação,
  b.price AS Preço,
  b.available AS Disponibilidade,
  g.name AS Gênero
FROM bookHub.Books b
JOIN bookHub.Gender g ON b.gender = g.gender_id;

CREATE VIEW bookHub.vw_Authors AS
SELECT
  author_Id,
  name AS NomeDoAuthor
FROM bookHub.Authors;

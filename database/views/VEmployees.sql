CREATE VIEW bookHub.VEmployees AS
SELECT
  fun_id,
  first_name AS Nome,
  last_name AS Sobrenome,
  email
FROM bookHub.Employees;

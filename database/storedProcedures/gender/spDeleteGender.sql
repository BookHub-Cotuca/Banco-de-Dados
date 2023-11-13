CREATE OR ALTER PROCEDURE bookHub.spDeleteGender
  @gender_id INT
AS
BEGIN
  DELETE FROM bookHub.Gender
  WHERE gender_id = @gender_id;
END;
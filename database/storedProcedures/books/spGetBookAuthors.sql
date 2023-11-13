CREATE OR ALTER PROCEDURE bookHub.spGetBookAuthors
AS
BEGIN
    SELECT * FROM bookHub.VBookAuthors;
END
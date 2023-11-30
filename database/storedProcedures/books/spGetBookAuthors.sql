CREATE OR ALTER PROCEDURE bookHub.spSearchBook
@infoN VARCHAR(100)
AS 
BEGIN
    DECLARE 
    @info VARCHAR(100) = '%' + @infoN + '%';
    IF EXISTS (SELECT * FROM bookHub.vw_Books WHERE book_id LIKE @info)
    BEGIN
        (SELECT * FROM bookHub.vw_Books WHERE book_id LIKE @info)
        RETURN;
    END ELSE

    IF EXISTS (SELECT * FROM bookHub.vw_Books WHERE Título LIKE @info)
    BEGIN
        (SELECT * FROM bookHub.vw_Books WHERE Título LIKE @info)
        RETURN;
    END ELSE

    IF EXISTS (SELECT * FROM bookHub.vw_Books WHERE Autor LIKE @info)
    BEGIN
        (SELECT * FROM bookHub.vw_Books WHERE Autor LIKE @info)
        RETURN;
    END ELSE

    IF EXISTS (SELECT * FROM bookHub.vw_Books WHERE Gênero LIKE @info)
    BEGIN
        (SELECT * FROM bookHub.vw_Books WHERE Gênero LIKE @info)
        RETURN;
    END ELSE

    IF EXISTS (SELECT * FROM bookHub.vw_Books WHERE AnoDePublicação LIKE @info)
    BEGIN
       (SELECT * FROM bookHub.vw_Books WHERE AnoDePublicação LIKE @info)
       RETURN;
    END
    IF EXISTS (SELECT * FROM bookHub.vw_Books WHERE Disponibilidade LIKE @info)
    BEGIN
       (SELECT * FROM bookHub.vw_Books WHERE Disponibilidade LIKE @info)
       RETURN;
    END
    IF EXISTS (SELECT * FROM bookHub.vw_Books WHERE Preço LIKE @info)
    BEGIN
       (SELECT * FROM bookHub.vw_Books WHERE Preço LIKE @info)
       RETURN;
    END
END

EXEC bookHub.spSearchBook 
    @infoN = 'h'



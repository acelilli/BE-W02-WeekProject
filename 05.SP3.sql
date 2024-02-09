-- =============================================
-- 3) Una SP che consenta di eliminare un determinato verbale identificandolo con il proprio identificativo. 
-- =============================================
CREATE PROCEDURE EliminaVerbalePerID
    @IdVerbale INT
AS
BEGIN
    DELETE FROM VERBALE
    WHERE idVerbale = @IdVerbale;
END;
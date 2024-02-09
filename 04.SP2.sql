-- =============================================
-- 2) Una SP parametrica che, ricevendo in input una data, visualizzi il totale dei punti decurtati in quella determinata data
      -- Visto che non ho
-- =============================================
CREATE PROCEDURE PuntiPerData 
-- Parametro in inglesso + tipo
@DataRicerca date
AS
BEGIN  --- inizio funzione
	SELECT SUM(PuntiDecurtati) AS TotalePuntiDecurtati
	FROM VERBALE
	WHERE DataViolazione = @DataRicerca -- filtra le righe in base al parametro(all'input)
END -- fine funzione
GO

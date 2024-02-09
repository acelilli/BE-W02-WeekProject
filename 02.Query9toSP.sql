-- =============================================
-- 9.  Query parametrica che visualizzi Data violazione, Importo e decurta mento punti relativi ad una certa data, 
-- =============================================
CREATE PROCEDURE VisualizzaPerData 
-- Parametro in inglesso + tipo
@DataRicerca date
AS
BEGIN  --- inizio funzione
	SELECT @DataRicerca AS DataRicerca, Importo, PuntiDecurtati
	FROM VERBALE
	WHERE DataViolazione = @DataRicerca -- filtra le righe in base al parametro(all'input)
END -- fine funzione
GO

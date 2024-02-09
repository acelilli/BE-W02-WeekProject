-- =============================================
-- 1) Query parametrica che ricevendo in input un anno visualizzi l'elenco delle contravvenzioni effettuate in quell'anno
-- =============================================
CREATE PROCEDURE VisualizzaPerAnno
-- Parametro in inglesso + tipo
@AnnoRicerca int
AS
BEGIN  --- inizio funzione
	SELECT @AnnoRicerca AS AnnoRicerca, DataViolazione, Importo, PuntiDecurtati
	FROM VERBALE
	WHERE YEAR(DataViolazione) = @AnnoRicerca; -- filtra le righe in base al parametro(all'input)
END -- fine funzione
GO

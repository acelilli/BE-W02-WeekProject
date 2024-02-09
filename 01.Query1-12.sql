--1. Conteggio dei verbali trascritti
SELECT COUNT(*) AS TotaleVerbali FROM VERBALE;
-------------------------------------------------
--2. Conteggio dei verbali trascritti raggruppati per anagrafe
SELECT idAnagrafica, COUNT(*) AS VerbaliPerAnagrafica FROM VERBALE GROUP BY idAnagrafica;
-------------------------------------------------
--3. Conteggio dei verbali trascritti raggruppati per tipo di violazione, 
SELECT idAnagrafica, COUNT(*) AS VerbaliPerAnagrafica FROM VERBALE GROUP BY idAnagrafica;
-------------------------------------------------
--4. Totale dei punti decurtati per ogni anagrafe, 
SELECT idAnagrafica, SUM(PuntiDecurtati) AS PuntiPerAnagrafica FROM VERBALE GROUP BY idAnagrafica;
-------------------------------------------------
--5. Cognome, Nome, Data violazione, Indirizzo violazione, importo e punti decurtati per tutti gli anagrafici residenti a Palermo, 
SELECT A.Cognome, A.Nome, V.DataViolazione, V.IndirizzoViolazione, V.Importo, V.PuntiDecurtati -- I dati che mi servono da ognuna delle table
FROM ANAGRAFICA A -- Tabella sx dove A è l'alias
INNER JOIN VERBALE V ON A.idAnagrafica = V.idAnagrafica -- Inner Join = mostra i dati correlati tra le tabelle
WHERE A.Citta = 'Palermo';
-------------------------------------------------
--6. Cognome, Nome, Indirizzo, Data violazione, importo e punti decurtati per le violazioni fatte tra il febbraio 2009 e luglio 2009, 
SELECT A.Cognome, A.Nome, A.Citta, V.DataViolazione, V.IndirizzoViolazione, V.Importo, V.PuntiDecurtati -- I dati che mi servono da ognuna delle table
FROM ANAGRAFICA A -- Tabella sx dove A è l'alias
INNER JOIN VERBALE V ON A.idAnagrafica = V.idAnagrafica -- Inner Join = mostra i dati correlati tra le tabelle
WHERE V.DataViolazione BETWEEN '2009-02-01' AND '2009-07-31';
-------------------------------------------------
--7. Totale degli importi per ogni anagrafico,
SELECT idAnagrafica, SUM(Importo) AS ImportoPerAnagrafica FROM VERBALE GROUP BY idAnagrafica;
-------------------------------------------------
--8. Visualizzazione di tutti gli anagrafici residenti a Palermo, 
SELECT * FROM ANAGRAFICA WHERE Citta = 'Palermo'
-------------------------------------------------
--9. Query parametrica che visualizzi Data violazione, Importo e decurta mento punti relativi ad una certa data,
-- File a parte ----------------------------------------------------------------------------------------------
--10. Conteggio delle violazioni contestate raggruppate per Nominativo dell’agente di Polizia
SELECT NominativoAgente, COUNT(*) AS ViolazioniContestate FROM VERBALE GROUP BY NominativoAgente;
-------------------------------------------------
--11. Cognome, Nome, Indirizzo, Data violazione, Importo e punti decurtati per tutte le violazioni che superino il decurtamento di 5 punti
SELECT DISTINCT A.Cognome, A.Nome, A.Citta, V.DataViolazione, V.IndirizzoViolazione, V.PuntiDecurtati
FROM ANAGRAFICA A
INNER JOIN VERBALE V ON A.idAnagrafica = V.idAnagrafica
WHERE (SELECT SUM(PuntiDecurtati) FROM VERBALE WHERE idAnagrafica = A.idAnagrafica) >= 5;

-- nb. distinct funziona solo per la prima voce
-------------------------------------------------
--12. Cognome, Nome, Indirizzo, Data violazione, Importo e punti decurtati per tutte le violazioni che superino l’importo di 400 euro.
SELECT DISTINCT A.Cognome, A.Nome, A.Citta, V.DataViolazione, V.IndirizzoViolazione, V.Importo, V.PuntiDecurtati
FROM ANAGRAFICA A
INNER JOIN VERBALE V ON A.idAnagrafica = V.idAnagrafica
WHERE (SELECT SUM(Importo) FROM VERBALE WHERE idAnagrafica = A.idAnagrafica) > 400;
-- nb. distinct funziona solo per la prima voce
-------------------------------------------------

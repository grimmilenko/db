/* --- Aufgabenblatt 7 - Aufgabe 7.1 --- */

/* VIEW, da Daten schon vorhanden sind */
CREATE VIEW Maschinen_Einkauf AS
SELECT MNR, ANSCH_DATUM
FROM MASCHINE
WHERE ANSCH_DATUM > 31-DEC-2015 AND ANSCH_DATUM < 1-JAN-2017;

/* VIEW, da Daten schon vorhanden sind */
CREATE VIEW Maschinen_Reparatur_Aktuell AS
SELECT MNR, Rep_Erklaerung
FROM Maschinen_Reparatur;

/* VIEW, da Daten schon vorhanden sind */
CREATE VIEW Maschinen_Rep_Kosten_Gesamt AS
SELECT MNR,SUM(Rep_Kosten)
AS RepKostenGesamt
FROM Maschinen_Reparatur
GROUP BY MNR;

/* Datensatz so nicht vorhanden, deswegen TABLE erstellen */
CREATE TABLE ALTERSVORSORGE (
PNR INT,
VorsorgeID INT PRIMARY KEY,
FOREIGN KEY (PNR) REFERENCES Personal(PNR)
);

/* VIEW, da Daten schon vorhanden sind */
CREATE VIEW ABT_VERKAUF AS
SELECT Personal.*
FROM Personal
JOIN ABTEILUNG
ON Personal.ABT_NR = ABTEILUNG.ABT_NR
WHERE Abteilung.NAME = 'Verkauf';

/* Datensatz so nicht vorhanden, deswegen TABLE erstellen */
CREATE TABLE ABTEILUNGSLEITER (
AbtLeiterID INT PRIMARY KEY,
PNR INT,
ABT_NR VARCHAR(5),
FOREIGN KEY (PNR) REFERENCES Personal(PNR),
FOREIGN KEY (ABT_NR) REFERENCES Abteilung(ABT_NR)
);

/* Datensatz so nicht vorhanden, deswegen TABLE erstellen */
CREATE TABLE PERSONAL_ADRESSE (
PNR INT PRIMARY KEY,
STRASSE VARCHAR(40),
Hausnummer INT,
Stadt VARCHAR(50),
Postleitzahl INT,
FOREIGN KEY (PNR) REFERENCES Personal(PNR)
);

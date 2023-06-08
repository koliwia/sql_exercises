--Wszystkie informacje o klientach, ktorzy kiedykolwiek wypozyczyli ksiazki-- 

SELECT DISTINCT klient.kID, klient.nazw, klient.imie, klient.mscZam
FROM klient
INNER JOIN wypozyczenie
ON wypozyczenie.kID = klient.kID
WHERE wypozyczenie.dataWyp IS NOT NULL


--Wszystkie informacje o klientach, ktorzy nigdy nie wypozyczylu ksiazki--
SELECT DISTINCT klient.kID, klient.nazw, klient.imie, klient.mscZam
FROM klient
WHERE klient.kID NOT IN (SELECT DISTINCT wypozyczenie.kID FROM wypozyczenie)

--Imiona i nazwiska klientow, ktorzy wypozyczyli ksiazki dluzsze niz 300 stron po 1 maja 2013--

SELECT DISTINCT klient.nazw, klient.imie
FROM klient
INNER JOIN wypozyczenie
ON klient.kID = wypozyczenie.kID
INNER JOIN ksiazka
ON wypozyczenie.ksID = ksiazka.ksID
WHERE ksiazka.liczbaStr > 300 AND wypozyczenie.dataWyp > '2013-05-01'

--Wszystkie informacje o ksiazkach napisanych przez klientow-- 

SELECT DISTINCT * FROM ksiazka
WHERE ksiazka.nazwAutora || ksiazka.imieAutora IN (SELECT klient.nazw || klient.imie FROM klient)

--CONCAT IN SQL STANDARD--

--Wszystkie informacje o kliencie o najkrotszym nazwisku--

SELECT * FROM klient
ORDER BY LENGTH(klient.nazw) ASC LIMIT 1

--Wszystkie informacje o wypozyczeniu wraz z miejscowoscia zamieszkania wypozyczajacego--

SELECT wypozyczenie.*, klient.mscZam FROM wypozyczenie
INNER JOIN klient
ON klient.kID = wypozyczenie.kID

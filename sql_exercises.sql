-- 1 Znajdź tytuły wszystkich filmów, których reżyserem jest Steven Spielberg
SELECT title FROM Movie WHERE director = "Steven Spielberg";


--2 Znajdź wszystkie lata, w których premierę miał film oceniany na 4 lub 5 gwiazdek i posortuj je rosnąco
SELECT DISTINCT year
FROM Movie
INNER JOIN Rating
ON Movie.mID = Rating.mID 
WHERE stars = "4" OR stars ="5" ORDER BY year ASC;

--3 Znajdź tytuły wszystkich filmów, które nie zostały ocenione
SELECT title FROM Movie
WHERE NOT EXISTS (
SELECT mID FROM Rating WHERE Movie.mID = Rating.mID);

-- 4 Niektórzy oceniający nie podali daty oceny. 
-- Znajdź imiona i nazwiska wszystkich oceniających, którzy mają wystawioną ocenę z wartością NULL w polu daty

SELECT name FROM Reviewer
INNER JOIN Rating
ON Reviewer.rID = Rating.rID
WHERE ratingDate IS NULL;

--5 Napisz zapytanie, które zwróci oceny w bardziej czytelnym formacie: imię i nazwisko oceniającego, tytuł filmu,
-- liczbę gwiazdek, datę oceny. Posortuj dane według imienia i nazwiska oceniającego, tytułu filmu i liczby gwiazdek

SELECT Reviewer.name, Movie.title, Rating.stars, Rating.ratingDate 
FROM Reviewer 
INNER JOIN Rating
ON Rating.rID = Reviewer.rID
INNER JOIN Movie
ON Movie.mID = Rating.mID
ORDER BY name;


-- 6 Dla każdego filmu, który ma choć jedną ocenę, znajdź najwyższą liczbę gwiazdek, jaką ten film otrzymał.
-- Zwróc tytuł i liczbę gwiazdek. Posortuj po tytule filmu.

SELECT title, MAX(stars) 
FROM Rating 
INNER JOIN Movie 
ON Rating.mID = Movie.mID 
GROUP BY Rating.mID
ORDER BY title;
--1 exercise

--1. List all directors of Pixar movies (alphabetically), without duplicates

SELECT DISTINCT Director FROM movies ORDER BY Director;


--2.  List the last four Pixar movies released (ordered from most recent to least)


SELECT * FROM movies ORDER BY Year DESC LIMIT 4;


--3. List the **first** five Pixar movies sorted alphabetically


SELECT * FROM movies ORDER BY Title LIMIT 5;


--4.  List the **next** five Pixar movies sorted alphabetically


SELECT Title FROM movies ORDER BY Title ASC LIMIT 5 OFFSET 5;


--2 exercise

--1. List all the Canadian cities and their populations


SELECT City, Population FROM north_american_cities
WHERE Country = "Canada";


--2.  Order all the cities in the United States by their latitude from north to south


SELECT City FROM north_american_cities
WHERE Country = "United States" 
ORDER BY Latitude DESC;


--3.  List the two largest cities in Mexico (by population)


SELECT City FROM north_american_cities
WHERE Country = "Mexico" ORDER BY Population DESC LIMIT 2;


--4. List the third and fourth largest cities (by population) in the United States and their population


SELECT City, Population FROM north_american_cities
WHERE Country LIKE "United States"
ORDER BY Population DESC
LIMIT 2 OFFSET 2;



--3 exercise

--1. Find the domestic and international sales for each movie 


SELECT Boxoffice.Domestic_sales, Boxoffice.International_sales, Movies.Title
FROM Boxoffice
INNER JOIN Movies ON Movies.Id = Boxoffice.Movie_id ;


--2. Show the sales numbers for each movie that did better internationally rather than domestically 


SELECT Boxoffice.International_sales, Boxoffice.Domestic_sales, Movies.Title
FROM Boxoffice
INNER JOIN Movies ON Movies.Id = Boxoffice.Movie_id
WHERE International_sales > Domestic_sales;

--3.  List all the movies by their ratings in descending order 


SELECT Movies.Title, Boxoffice.Rating
FROM Boxoffice
INNER JOIN Movies ON Boxoffice.Movie_id = Movies.Id
ORDER BY Rating DESC;


--4 exercise

--1. Find the name and role of all employees who have not been assigned to a building 


SELECT Name, Role FROM Employees
WHERE Building IS NULL;


--5 exercise

--1. List all movies that were released on even number years 


SELECT Title FROM Movies
WHERE Year % 2 = 0;


--6 exercise

--1. Find the longest time that an employee has been at the studio


SELECT MAX(Years_employed) FROM Employees;


--2.  Find the total number of employee years worked in each building 


SELECT SUM(Years_employed), Building
FROM Employees
GROUP BY Building


--3. Find the number of Artists in the studio (without a **HAVING** clause) 


SELECT COUNT(Role) FROM Employees
WHERE Role = "Artist";

--7 exercise

--1. Find the number of movies each director has directed


SELECT Director, Title, COUNT(Title) FROM Movies
GROUP BY Director;


--2. Find the total domestic and international sales that can be attributed to each director 


SELECT Director, SUM(International_sales + Domestic_sales) FROM Boxoffice
INNER JOIN Movies 
ON Movies.Id = Boxoffice.Movie_id
GROUP BY Director;

USE sakila;

-- 1.1
SELECT * FROM `actor`;
-- 1.2
SELECT * FROM `actor` WHERE `first_name` = 'john';
SELECT * FROM `actor` ORDER BY `first_name` ASC;
-- 1.3
SELECT * FROM `actor` WHERE `last_name` = 'neeson';
-- 1.4
SELECT * FROM `actor` WHERE `actor_id` % 10 = 0;
-- 1.5
SELECT `description` FROM `film` WHERE `film_id` = 100;
-- 1.6
SELECT `title`,`rating` FROM `film` WHERE `rating` = 'R';
-- 1.7
SELECT `title`,`rating` FROM `film` WHERE `rating` != 'R';
-- 1.8
SELECT * FROM `film` ORDER BY `length` ASC, `title` LIMIT 10;
-- 1.9
SELECT `title` FROM `film` ORDER BY `length` ASC, `title` LIMIT 10;
-- 1.10
SELECT DISTINCT `country` FROM `country`;
-- 1.11
SELECT DISTINCT `length` FROM `film`;
-- 1.12
SELECT `name` FROM `language` ORDER BY `name` ASC;
SELECT * FROM `language`;

-- 2.1 Which actor has appeared in the most films?
SELECT `actor_id`, COUNT(`actor_id`) AS number_of_films FROM `film_actor` 
  GROUP BY `actor_id` 
  ORDER BY number_of_films DESC;
SELECT CONCAT(`first_name`, ' ', `last_name`) AS full_name FROM `actor` WHERE `actor_id` = 107;
-- OR
SELECT CONCAT(`first_name`, ' ', `last_name`) AS full_name FROM `actor` 
  WHERE `actor_id` = (
  SELECT `actor_id` FROM `film_actor` 
  GROUP BY `actor_id` 
  ORDER BY COUNT(`actor_id`) DESC LIMIT 1
);

-- 2.2 What is the average running time of all the films in the database?
SELECT AVG(`length`) AS average_film_runtime FROM `film`;

-- 2.3 What is the average running time of films by category?
SELECT `category`, AVG(`length`) AS mean_duration FROM `film_list` 
  GROUP BY `category` 
  ORDER BY `category` ASC;

-- 2.4 How many films have robots in them?
SELECT COUNT(*) AS films_containing_robots FROM `film` WHERE `description` LIKE '%robot%';

-- 2.5 Find the films with the longest runtimes (TOP 10) ***
SELECT `title`, `length` FROM `film` ORDER BY `length` DESC, `title` LIMIT 10;
-- Or
SELECT `title`, `length` FROM `film` 
  WHERE `length` = ( SELECT MAX(`length`) FROM `film`);

-- 2.6 Count how many films were released in 2010
SELECT COUNT(`title`) AS films_released_in_2010 FROM `film` WHERE `release_year` = 2010;

-- 2.7 Which last names are not repeated?
SELECT 
  `last_name`, COUNT(`last_name`) AS occurences_of_surname 
FROM 
  `actor` 
GROUP BY 
  `last_name` 
HAVING 
  occurences_of_surname = 1;

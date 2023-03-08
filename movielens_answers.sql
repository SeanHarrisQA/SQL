-- movielens task

USE movielens;

-- Question 1: List the titles and release dates of movies released between 1983-1993 in reverse 
-- chronological order. *** I assumed this should include 1983 but not 1993
SELECT `title`, `release_date` FROM `movies`
  WHERE `release_date` >= '1983-01-01' AND `release_date` < '1993-01-01'
  ORDER BY `release_date`;
  
-- Question 2: Without using LIMIT, list the titles of the movies with the lowest average rating.
SELECT `title`, `id` FROM `movies`
  WHERE `id` IN (
    -- Gives field containg the movie_id for each film with the lowest average rating
    SELECT 	`movie_id` FROM `ratings`
      GROUP BY `movie_id`
      HAVING AVG(`rating`) = (
	    -- Calculate the lowest average rating
        SELECT MIN(`mean_rating`.`average_rating`) FROM (
            SELECT AVG(`rating`) AS `average_rating` FROM `ratings`
              GROUP BY `movie_id`
		  ) AS `mean_rating`
    )
    ORDER BY `movie_id` ASC
  );

-- Question 3: List the unique records for Sci-Fi movies where male 24-year-old students have given 
-- 5-star ratings

SELECT rating
COUNT(*) AS Frequency
From dvd_rentals.film_list
GROUP BY rating
SELECT 
        rating,
        category,
        COUNT(*) AS Frequency
FROM dvd_rentals.film_list
GROUP BY rating,category
ORDER BY Frequency DESC
LIMIT 5;
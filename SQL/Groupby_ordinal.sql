SELECT
        rating,
        category,
        COUNT(*) as Frequency
FROM dvd_rentals.film_list
GROUP BY 1,2
ORDER BY 3;

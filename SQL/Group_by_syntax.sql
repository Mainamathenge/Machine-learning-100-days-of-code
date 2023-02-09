SELECT
        rating,
        category,
        COUNT (*) AS Frequency
        COUNT (*) :: NUMERIC/SUM(COUNT(*))OVER() AS Percentage
FROM dvd_rentals.film_list
ORDER BY Frequency 
-- the quick brown fox
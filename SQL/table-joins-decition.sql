-- getting the reltionship between the customers and the number of ecords
-- WITH cte_count AS (
--         SELECT
--         customer_id,
--         COUNT(*) AS record_counts
--         FROM dvd_rentals.rental
--         GROUP BY customer_id
--         )

-- SELECT
--         record_counts,
--         COUNT(*) AS customer_count
-- FROM cte_count
-- GROUP BY record_counts
-- ORDER BY customer_count

        -- SELECT
        -- customer_id,
        -- COUNT(*) AS record_counts
        -- FROM dvd_rentals.rental
        -- GROUP BY customer_id
        -- ORDER BY record_counts DESC;
-- SELECT COUNT(DISTINCT inventory_id) FROM dvd_rentals.rental; produces 4581
-- SELECT COUNT(DISTINCT inventory_id) FROM dvd_rentals.inventory; this has 4580 records
-- SELECT COUNT(DISTINCT inventory_id) FROM dvd_rentals.rental;

-- how to get that unique record using the antijoin command

-- SELECT * FROM dvd_rentals.inventory
-- WHERE NOT EXISTS (
-- SELECT inventory
-- FROM dvd_rentals.rental
-- WHERE inventory.inventory_id=rental.inventory_id);
-- WITH cte_counts AS (
-- SELECT 
-- inventory_id, 
-- COUNT(*) AS record_counts 
-- FROM dvd_rentals.rental
-- GROUP BY inventory_id
-- )
-- SELECT 
-- record_counts,
-- count(*) AS unique_records
-- FROM cte_counts
-- GROUP BY record_counts
-- ORDER BY record_counts;
 
-- SELECT 
-- inventory_id, 
-- COUNT(*) AS record_counts 
-- FROM dvd_rentals.rental
-- GROUP BY inventory_id

-- There will be multiple inventory records per unique film_id value in the dvd_rentals inventory table

-- WITH cte_counts AS (
-- SELECT 
--   film_id,
--   COUNT(DISTINCT inventory_id) AS dvd_num
-- FROM dvd_rentals.inventory
-- GROUP BY film_id
-- )
-- SELECT 
-- dvd_num,
-- COUNT(*) as NO_OF_INVENTORY
-- FROM cte_counts
-- GROUP BY 1
-- ORDER BY 1;

-- SELECT 
--   film_id,
--   COUNT(DISTINCT inventory_id) AS dvd_num
-- FROM dvd_rentals.inventory
-- GROUP BY film_id

-- DROP TABLE IF EXISTS left_rental_join;
-- CREATE TEMP TABLE left_rental_join AS
-- SELECT
--   rental.customer_id,
--   rental.inventory_id,
--   inventory.film_id
-- FROM dvd_rentals.rental
-- LEFT JOIN dvd_rentals.inventory
--   ON rental.inventory_id = inventory.inventory_id;

-- DROP TABLE IF EXISTS inner_rental_join;
-- CREATE TEMP TABLE inner_rental_join AS
-- SELECT
--   rental.customer_id,
--   rental.inventory_id,
--   inventory.film_id
-- FROM dvd_rentals.rental
-- INNER JOIN dvd_rentals.inventory
--   ON rental.inventory_id = inventory.inventory_id;

-- -- check the counts for each output (bonus UNION usage)
-- -- note that these parantheses are not really required but it makes
-- -- the code look and read a bit nicer!
-- (
--   SELECT
--     'left join' AS join_type,
--     COUNT(*) AS record_count,
--     COUNT(DISTINCT inventory_id) AS unique_key_values
--   FROM left_rental_join
-- )
-- UNION
-- (
--   SELECT
--     'inner join' AS join_type,
--     COUNT(*) AS record_count,
--     COUNT(DISTINCT inventory_id) AS unique_key_values
--   FROM inner_rental_join
-- );
  
 
 
 
 
 
 
 
 
 
 

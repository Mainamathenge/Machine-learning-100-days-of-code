-- SELECT
--         AVG(measure_value)
-- FROM health.user_logs

-- SELECT
--         measure,
--         COUNT(*) AS COUNT
-- FROM health.user_logs
-- GROUP BY measure
-- ORDER BY measure

-- SELECT 
--         measure,
--         ROUND(AVG(measure_value),2) AS avarage,
--         COUNT(*) AS counts
-- FROM health.user_logs
-- GROUP BY measure
-- ORDER BY counts DESC

-- WITH sample_data (example_values) AS (
--         VALUES 
--         (82),(51),(144),(56),(87),(90),(76)
-- )
-- SELECT 
--         AVG(example_values) AS mean_value,
--         PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY example_values) AS median_value,
--         MODE() WITHIN GROUP (ORDER BY example_values) AS mode_values
-- from sample_data

-- WITH sample_data (example_values) AS (
--  VALUES
--  (82), (51), (144), (84), (120), (148), (148), (108), (160), (86)
-- )
-- SELECT
--   ROUND(VARIANCE(example_values), 2) AS variance_value,
--   ROUND(STDDEV(example_values), 2) AS standard_dev_value,
--   ROUND(AVG(example_values), 2) AS mean_value,
--   PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY example_values) AS median_value,
--   MODE() WITHIN GROUP (ORDER BY example_values) AS mode_value
-- FROM sample_data;
-- 

-- SELECT mean_value from health.user_logs WHERE measure = 'weight' ORDER BY 1 DESC LIMIT 100;

-- WITH percentile_values AS (
--         SELECT
--         measure_value,
--         NTILE(100) OVER (
--                 ORDER BY 
--                 measure_value
--         )
--         FROM clean_weight_logs
--         )
-- SELECT 
-- percentile,
-- MIN(measure_value) AS floor_value,
-- MAX(measure_value) AS cealing_value,
-- COUNT(*) AS percentile_counts
-- FROM percentile_values
-- GROUP BY percentile
-- ORDER BY percentile;
-- WITH percentile_values AS (
--   SELECT
--     measure_value,
--     NTILE(100) OVER (
--       ORDER BY
--         measure_value
--     ) AS percentile
--   FROM health.user_logs
--   WHERE measure = 'weight'
-- )
-- SELECT
--   measure_value,
--   -- these are examples of window functions below
--   ROW_NUMBER() OVER (ORDER BY measure_value DESC) as row_number_order,
--   RANK() OVER (ORDER BY measure_value DESC) as rank_order,
--   DENSE_RANK() OVER (ORDER BY measure_value DESC) as dense_rank_order
-- FROM percentile_values
-- WHERE percentile = 100
-- ORDER BY measure_value DESC;

-- HOW TO CARRY OUT DATA CLEANING USING STATISTICS 
-- SELECT
--   ROUND(MIN(measure_value), 2) AS minimum_value,
--   ROUND(MAX(measure_value), 2) AS maximum_value,
--   ROUND(AVG(measure_value), 2) AS mean_value,
--   ROUND(
--     -- this function actually returns a float which is incompatible with ROUND!
--     -- we use this cast function to convert the output type to NUMERIC
--     CAST(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY measure_value) AS NUMERIC),
--     2
--   ) AS median_value,
--   ROUND(
--     MODE() WITHIN GROUP (ORDER BY measure_value),
--     2
--   ) AS mode_value,
--   ROUND(STDDEV(measure_value), 2) AS standard_deviation,
--   ROUND(VARIANCE(measure_value), 2) AS variance_value
-- FROM health.user_logs
-- WHERE measure = 'weight';

SELECT
        measure_value,
        NTILE(100) OVER (
                ORDER BY 
                measure_value
        ) as percentile
FROM health.user_logs
WHERE measure= 'weight'
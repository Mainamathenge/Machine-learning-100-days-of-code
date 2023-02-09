-- SELECT
-- measure,
-- COUNT(*) AS record
-- FROM health.user_logs
-- WHERE measure_value = 0
-- GROUP BY measure;

SELECT 
        id,
        COUNT(*)
FROM health.user_logs
WHERE systolic = 0 OR systolic is NULL;

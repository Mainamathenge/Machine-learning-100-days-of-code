-- WITH deduped_logs AS (
--         SELECT DISTINCT *
--         FROM health.user_logs
-- )
-- SELECT COUNT(*)
-- FROM deduped_logs; 

SELECT COUNT(*)
FROM(
SELECT DISTINCT*
FROM health.user_logs
) as subquery;
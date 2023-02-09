SELECT id,
COUNT(*) as row_count
FROM health.user_logs
GROUP BY id
ORDER BY row_count DESC
LIMIT 10;
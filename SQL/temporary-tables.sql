DROP TABLE IF EXISTS dup_user_logs;


CREATE TEMP TABLE dup_user_logs
AS SELECT DISTINCT *
FROM health.user_logs;

SELECT COUNT(*)
FRPM dup_user_logs;
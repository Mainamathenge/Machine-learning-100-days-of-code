-- 1. How many unique users exist in the logs dataset?
SELECT
COUNT(DISTINCT user_id)
FROM health.user_logs;

-- for questions 2-8 we created a temporary table
DROP TABLE IF EXISTS user_measure_count;
CREATE TEMP TABLE user_measure_cout AS 
(SELECT
    id,
    COUNT(*) AS measure_count,
    COUNT(DISTINCT measure) as unique_measures
  FROM health.user_logs
  GROUP BY 1); 

-- 2. How many total measurements do we have per user on average?
SELECT
  CAST(ROUND(AVG(measure_count)),2)
FROM user_measure_count;

-- 3. What about the median number of measurements per user?
SELECT
  ROUND(CAST(PERCENTILE_CONTINUOUS(0.5) WITHIN GROUP (ORDER BY id) AS median_value),2)
FROM user_measure_count;

-- 4. How many users have 3 or more measurements?
SELECT
  COUNT(*)
FROM user_measure_count
HAVING measure >= 3;

-- 5. How many users have 1,000 or more measurements?
SELECT
  SUM(id)
FROM user_measure_count
WHERE measure_count >= 1000;

-- 6. Have logged blood glucose measurements?
SELECT
  COUNT DISTINCT id
FROM health.user_logs
WHERE measure is 'blood_sugar';

-- 7. Have at least 2 types of measurements?
SELECT
  COUNT(*)
FROM user_measure_count
WHERE COUNT(DISTINCT measures) >= 2;

-- 8. Have all 3 measures - blood glucose, weight and blood pressure?
SELECT
  COUNT(*)
FROM usr_measure_count
WHERE unique_measures = 3;

-- 9.  What is the median systolic/diastolic blood pressure values?
SELECT
  PERCENTILE_CONT(0.5) WITHIN (ORDER BY systolic) AS median_systolic
  PERCENTILE_CONT(0.5) WITHIN (ORDER BY diastolic) AS median_diastolic
FROM health.user_logs
WHERE measure is blood_pressure;
SELECT
    YEAR(event_timestamp) AS year_no,
    MONTH(event_timestamp) AS month_no,
    COUNT(DISTINCT user_id) AS mau
FROM pa_project.events
GROUP BY
    YEAR(event_timestamp),
    MONTH(event_timestamp)
ORDER BY
    year_no,
    month_no;
    
SELECT
    DATE_FORMAT(event_timestamp,'%Y-%m') AS month,
    COUNT(DISTINCT user_id) AS mau
FROM pa_project.events
GROUP BY DATE_FORMAT(event_timestamp,'%Y-%m')
ORDER BY month;
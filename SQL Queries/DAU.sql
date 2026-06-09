SELECT
    DATE(event_timestamp) dt,
    COUNT(DISTINCT user_id) DAU
FROM pa_project.events
GROUP BY 1
ORDER BY 1;
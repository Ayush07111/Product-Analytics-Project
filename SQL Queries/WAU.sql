SELECT
    YEAR(event_timestamp) AS year_no,
    WEEK(event_timestamp, 1) AS week_no,
    COUNT(DISTINCT user_id) AS wau
FROM pa_project.events
GROUP BY
    YEAR(event_timestamp),
    WEEK(event_timestamp, 1)
ORDER BY
    year_no,
    week_no;
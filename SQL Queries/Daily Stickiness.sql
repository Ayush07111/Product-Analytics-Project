WITH dau AS
(
    SELECT
        DATE(event_timestamp) AS dt,
        DATE_FORMAT(event_timestamp,'%Y-%m') AS month,
        COUNT(DISTINCT user_id) AS dau
    FROM pa_project.events
    GROUP BY
        DATE(event_timestamp),
        DATE_FORMAT(event_timestamp,'%Y-%m')
),

mau AS
(
    SELECT
        DATE_FORMAT(event_timestamp,'%Y-%m') AS month,
        COUNT(DISTINCT user_id) AS mau
    FROM pa_project.events
    GROUP BY DATE_FORMAT(event_timestamp,'%Y-%m')
)

SELECT
    d.dt,
    d.dau,
    m.mau,
    ROUND(
        100 * d.dau / m.mau,
        2
    ) AS stickiness_pct
FROM dau d
JOIN mau m
ON d.month = m.month
ORDER BY d.dt;
WITH daily_active AS
(
    SELECT
        DATE(event_timestamp) AS activity_date,
        DATE_FORMAT(event_timestamp,'%Y-%m') AS month,
        COUNT(DISTINCT user_id) AS dau
    FROM pa_project.events
    GROUP BY
        DATE(event_timestamp),
        DATE_FORMAT(event_timestamp,'%Y-%m')
),

monthly_active AS
(
    SELECT
        DATE_FORMAT(event_timestamp,'%Y-%m') AS month,
        COUNT(DISTINCT user_id) AS mau
    FROM pa_project.events
    GROUP BY
        DATE_FORMAT(event_timestamp,'%Y-%m')
),

avg_daily AS
(
    SELECT
        month,
        AVG(dau) AS avg_dau
    FROM daily_active
    GROUP BY month
)

SELECT
    a.month,
    ROUND(a.avg_dau,0) AS avg_dau,
    m.mau,
    ROUND(
        100 * a.avg_dau / m.mau,
        2
    ) AS stickiness_pct
FROM avg_daily a
JOIN monthly_active m
ON a.month = m.month
ORDER BY a.month;
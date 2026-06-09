WITH visitors AS
(
    SELECT COUNT(DISTINCT user_id) AS total_visitors
    FROM pa_project.events
    WHERE event_name = 'app_open'
),

buyers AS
(
    SELECT COUNT(DISTINCT user_id) AS total_buyers
    FROM pa_project.events
    WHERE event_name = 'purchase'
)

SELECT
    total_visitors,
    total_buyers,
    ROUND(
        100.0 * total_buyers / total_visitors,
        2
    ) AS conversion_rate_pct
FROM visitors, buyers;
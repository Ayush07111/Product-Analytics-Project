WITH visitors AS
(
    SELECT
        u.device,
        COUNT(DISTINCT e.user_id) AS visitors
    FROM pa_project.events e
    JOIN pa_project.users u
        ON e.user_id = u.user_id
    WHERE e.event_name = 'app_open'
    GROUP BY u.device
),

buyers AS
(
    SELECT
        u.device,
        COUNT(DISTINCT e.user_id) AS buyers
    FROM pa_project.events e
    JOIN pa_project.users u
        ON e.user_id = u.user_id
    WHERE e.event_name = 'purchase'
    GROUP BY u.device
),

revenue AS
(
    SELECT
        u.device,
        ROUND(SUM(o.revenue),2) revenue
    FROM pa_project.orders o
    JOIN pa_project.users u
        ON o.user_id = u.user_id
    GROUP BY u.device
)

SELECT
    v.device,
    visitors,
    COALESCE(b.buyers,0) buyers,
    ROUND(
        100.0 * COALESCE(b.buyers,0) / visitors,
        2
    ) conversion_rate,
    revenue
FROM visitors v
LEFT JOIN buyers b
ON v.device=b.device
LEFT JOIN revenue r
ON v.device=r.device;

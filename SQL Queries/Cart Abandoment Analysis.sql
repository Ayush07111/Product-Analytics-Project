WITH cart_users AS
(
    SELECT DISTINCT user_id
    FROM pa_project.events
    WHERE event_name = 'add_to_cart'
),

purchase_users AS
(
    SELECT DISTINCT user_id
    FROM pa_project.events
    WHERE event_name = 'purchase'
)

SELECT
    COUNT(*) AS cart_users,

    COUNT(*) -
    COUNT(p.user_id) AS abandoned_users,

    ROUND(
        100.0 *
        (
            COUNT(*) -
            COUNT(p.user_id)
        ) /
        COUNT(*),
        2
    ) AS abandonment_rate_pct

FROM cart_users c
LEFT JOIN purchase_users p
ON c.user_id = p.user_id;
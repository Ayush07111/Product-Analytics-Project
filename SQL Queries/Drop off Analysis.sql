WITH funnel AS
(
    SELECT
        event_name,
        COUNT(DISTINCT session_id) AS sessions,
        CASE event_name
            WHEN 'app_open' THEN 1
            WHEN 'home_view' THEN 2
            WHEN 'search' THEN 3
            WHEN 'product_view' THEN 4
            WHEN 'add_to_cart' THEN 5
            WHEN 'checkout' THEN 6
            WHEN 'purchase' THEN 7
        END AS step_no
    FROM pa_project.events
    WHERE event_name <> 'payment_failed'
    GROUP BY event_name
)

SELECT
    event_name,
    sessions,

    LAG(sessions)
    OVER(ORDER BY step_no)
    - sessions AS drop_off

FROM funnel
ORDER BY step_no;
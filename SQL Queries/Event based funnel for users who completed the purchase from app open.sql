SELECT
    event_name,
    COUNT(DISTINCT user_id) AS users
FROM pa_project.events
GROUP BY event_name
ORDER BY
CASE event_name
    WHEN 'app_open' THEN 1
    WHEN 'home_view' THEN 2
    WHEN 'search' THEN 3
    WHEN 'product_view' THEN 4
    WHEN 'add_to_cart' THEN 5
    WHEN 'checkout' THEN 6
    WHEN 'purchase' THEN 7
    WHEN 'payment_failed' THEN 8
END;
WITH funnel AS
(
SELECT
event_name,
COUNT(DISTINCT session_id) sessions,
CASE event_name
WHEN 'app_open' THEN 1
WHEN 'home_view' THEN 2
WHEN 'search' THEN 3
WHEN 'product_view' THEN 4
WHEN 'add_to_cart' THEN 5
WHEN 'checkout' THEN 6
WHEN 'purchase' THEN 7
END step_no
FROM pa_project.events
WHERE event_name IN
(
'app_open',
'home_view',
'search',
'product_view',
'add_to_cart',
'checkout',
'purchase'
)
GROUP BY event_name
)

SELECT
event_name,
sessions,

ROUND(
100.0 *
sessions /
MAX(sessions) OVER(),
2
) AS pct_of_start,

ROUND(
100.0 *
sessions /
LAG(sessions) OVER(ORDER BY step_no),
2
) AS step_conversion

FROM funnel
ORDER BY step_no;
SELECT
u.traffic_source,
COUNT(DISTINCT e.user_id) users,
COUNT(
CASE
WHEN e.event_name='purchase'
THEN 1
END
) purchases

FROM pa_project.events e
JOIN pa_project.users u
ON e.user_id=u.user_id
GROUP BY u.traffic_source
ORDER BY purchases DESC;

WITH visitors AS
(
SELECT
u.traffic_source,
COUNT(DISTINCT e.user_id) visitors
FROM pa_project.events e
JOIN pa_project.users u
ON e.user_id=u.user_id
WHERE e.event_name='app_open'
GROUP BY u.traffic_source
),
buyers AS (
SELECT
u.traffic_source,
COUNT(DISTINCT e.user_id) buyers
FROM pa_project.events e
JOIN pa_project.users u
ON e.user_id=u.user_id
WHERE e.event_name='purchase'
GROUP BY u.traffic_source
)
SELECT
v.traffic_source,
visitors,
COALESCE(buyers,0) buyers,
ROUND(
100.0 * COALESCE(buyers,0)
/ visitors,
2
) conversion_rate
FROM visitors v
LEFT JOIN buyers b
ON v.traffic_source=b.traffic_source
ORDER BY conversion_rate DESC;
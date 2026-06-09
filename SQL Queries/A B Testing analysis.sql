SELECT
    experiment_variant,
    COUNT(*) sessions
FROM pa_project.sessions
GROUP BY experiment_variant;

WITH visitors AS (
SELECT
    s.experiment_variant,
    COUNT(DISTINCT s.session_id) visitors
FROM pa_project.sessions s
GROUP BY s.experiment_variant
),
buyers AS (
SELECT
    s.experiment_variant,
    COUNT(DISTINCT s.session_id) buyers
FROM pa_project.sessions s
JOIN pa_project.events e
ON s.session_id=e.session_id
WHERE e.event_name='purchase'
GROUP BY s.experiment_variant
)
SELECT
    v.experiment_variant,
    visitors,
    buyers,
    ROUND(100.0*buyers/visitors,2) conversion_rate
FROM visitors v
JOIN buyers b
ON v.experiment_variant=b.experiment_variant;

SELECT s.experiment_variant, COUNT(o.order_id) orders,
		ROUND(SUM(o.revenue), 2) revenue,
		ROUND(AVG(o.revenue), 2) avg_order_value
FROM pa_project.sessions s
LEFT JOIN pa_project.orders o
ON s.session_id=o.session_id
GROUP BY s.experiment_variant;

SELECT
    u.device,
    s.experiment_variant,
	COUNT(
        DISTINCT CASE
        WHEN e.event_name='purchase' THEN s.session_id
        END
    ) buyers,
	COUNT(DISTINCT s.session_id) visitors
FROM pa_project.sessions s
JOIN pa_project.users u
ON s.user_id=u.user_id
LEFT JOIN pa_project.events e
ON s.session_id=e.session_id
GROUP BY
    u.device,
    s.experiment_variant;
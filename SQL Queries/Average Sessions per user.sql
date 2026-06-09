SELECT
COUNT(*) / COUNT(DISTINCT user_id) AS avg_sessions_per_user
FROM pa_project.sessions;

SELECT
AVG(session_cnt) AS avg_sessions_per_active_user
FROM
(
    SELECT
        user_id,
        COUNT(*) AS session_cnt
    FROM pa_project.sessions
    GROUP BY user_id
) t;
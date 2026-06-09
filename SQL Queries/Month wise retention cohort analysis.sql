WITH first_visit AS
(
    SELECT
        user_id,
        DATE_FORMAT(
            MIN(session_start),
            '%Y-%m'
        ) cohort_month
    FROM pa_project.sessions
    GROUP BY user_id
),

cohort_size AS
(
    SELECT
        cohort_month,
        COUNT(*) users
    FROM first_visit
    GROUP BY cohort_month
),

retention AS
(
    SELECT
        f.cohort_month,
        DATE_FORMAT(
            s.session_start,
            '%Y-%m'
        ) activity_month,
        COUNT(DISTINCT s.user_id) retained_users
    FROM first_visit f
    JOIN pa_project.sessions s
        ON f.user_id=s.user_id
    GROUP BY
        f.cohort_month,
        activity_month
)

SELECT
    r.cohort_month,
    r.activity_month,
    retained_users,
    ROUND(
        100.0 *
        retained_users /
        c.users,
        2
    ) retention_pct
FROM retention r
JOIN cohort_size c
ON r.cohort_month=c.cohort_month;
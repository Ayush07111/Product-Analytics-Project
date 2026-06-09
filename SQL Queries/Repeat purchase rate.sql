WITH buyer_orders AS
(
SELECT
user_id,
COUNT(*) orders
FROM pa_project.orders
GROUP BY user_id
)

SELECT

COUNT(
CASE WHEN orders > 1
THEN user_id
END
) repeat_buyers,

COUNT(*) total_buyers,

ROUND(
100.0 *
COUNT(
CASE WHEN orders > 1
THEN user_id
END
)
/ COUNT(*),
2
) repeat_purchase_rate

FROM buyer_orders;
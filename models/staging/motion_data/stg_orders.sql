WITH orders AS(
    SELECT 
        id as order_id,
        user_id as customer_id,
        order_date,
        status
    FROM 
        briteflux.motion_data.orders
)
SELECT * FROM orders
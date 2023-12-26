WITH customers AS(
    SELECT 
        id as customer_id,
        first_name,
        last_name
    FROM
        briteflux.motion_data.customers
)
SELECT * FROM customers
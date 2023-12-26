WITH customers AS (
    SELECT
        id as customer_id,
        first_name,
        last_name
    from
        briteflux.motion_data.customers
)
SELECT * FROM customers
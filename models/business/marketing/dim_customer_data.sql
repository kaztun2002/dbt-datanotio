{{
    config(materialized="table")
}}

WITH customers AS(
    SELECT * FROM {{ ref('stg_customer_data')}}
),
orders AS(
    SELECT * FROM {{ ref('stg_order_data')}}
),

customer_order AS(
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date,
        MAX(order_date) AS most_recent_order_date,
        COUNT(order_id) AS num_of_orders
    FROM 
        orders 
    GROUP BY 
        1
),
customer_order_summary AS(
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        co.first_order_date,
        co.most_recent_order_date,
        COALESCE(co.num_of_orders,0) as num_of_orders
    FROM 
        customers c
    LEFT JOIN
        customer_order co 
    USING(customer_id)
)
SELECT * FROM customer_order_summary
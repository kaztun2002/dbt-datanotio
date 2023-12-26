{{
    config(materialized="table")
}}

WITH customers AS (
    SELECT * FROM {{ ref('stg_customer')}}
),
orders AS (
    SELECT * FROM {{ ref('stg_orders')}}
),
customer_orders as(
    SELECT
        customer_id,
        MIN(order_date) as first_order_date,
        MAX(order_date) as most_recent_order_date,
        COUNT(order_id) as number_of_orders
    FROM 
        orders
    GROUP BY 1
),
customer_order_summary as (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        co.first_order_date,
        co.most_recent_order_date,
        COALESCE(co.number_of_orders, 0) as number_of_orders
    FROM 
        customers c 
    LEFT JOIN
        customer_orders co USING (customer_id)   
)
SELECT * FROM customer_order_summary
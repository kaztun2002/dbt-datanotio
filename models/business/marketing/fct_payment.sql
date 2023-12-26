WITH orders AS(
    SELECT * FROM {{ ref('stg_order_data')}}
),
payments AS(
    SELECT * FROM {{ ref("stg_payment")}}
),
fct_payment AS(
    SELECT 
        order_id,
        payment_id,
        amount
    FROM 
        orders o 
    LEFT JOIN 
        payments p 
    ON o.order_id = p.orderid
)
SELECT * FROM fct_payment
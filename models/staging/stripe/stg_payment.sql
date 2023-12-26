WITH payment AS(
    SELECT 
        id as payment_id,
        orderid,
        paymentmethod,
        status,
        amount,
        created
    FROM
        briteflux.stripe.payment
)
SELECT * FROM payment
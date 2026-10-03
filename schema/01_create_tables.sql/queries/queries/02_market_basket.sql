WITH TransactionItems AS (
    SELECT DISTINCT transaction_id, product_id 
    FROM sales
)
SELECT 
    p1.product_name AS product_A,
    p2.product_name AS product_B,
    COUNT(*) AS times_bought_together
FROM TransactionItems t1
JOIN TransactionItems t2 
    ON t1.transaction_id = t2.transaction_id 
   AND t1.product_id < t2.product_id
JOIN products p1 ON t1.product_id = p1.product_id
JOIN products p2 ON t2.product_id = p2.product_id
GROUP BY p1.product_name, p2.product_name
ORDER BY times_bought_together DESC;
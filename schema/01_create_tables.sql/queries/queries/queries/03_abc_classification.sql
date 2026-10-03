WITH ProductRevenue AS (
    SELECT 
        p.product_id,
        p.product_name,
        SUM(s.quantity_sold * p.selling_price) AS total_revenue
    FROM products p
    JOIN sales s ON p.product_id = s.product_id
    GROUP BY p.product_id, p.product_name
),
RevenueCumulative AS (
    SELECT 
        product_id,
        product_name,
        total_revenue,
        SUM(total_revenue) OVER () AS grand_total_revenue,
        SUM(total_revenue) OVER (ORDER BY total_revenue DESC) AS running_revenue
    FROM ProductRevenue
)
SELECT 
    product_id,
    product_name,
    total_revenue,
    ROUND((running_revenue / grand_total_revenue) * 100, 2) AS cumulative_revenue_pct,
    CASE 
        WHEN (running_revenue / grand_total_revenue) <= 0.70 THEN 'A (Top 70%)'
        WHEN (running_revenue / grand_total_revenue) <= 0.90 THEN 'B (Mid 20%)'
        ELSE 'C (Bottom 10%)'
    END AS abc_class
FROM RevenueCumulative
ORDER BY total_revenue DESC;
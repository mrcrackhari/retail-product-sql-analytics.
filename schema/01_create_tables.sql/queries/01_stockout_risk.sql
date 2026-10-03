SELECT 
    p.product_id,
    p.product_name,
    i.stock_on_hand,
    p.reorder_level,
    (p.reorder_level - i.stock_on_hand) AS units_short,
    ROUND((p.reorder_level - i.stock_on_hand) * p.selling_price, 2) AS estimated_revenue_at_risk
FROM products p
JOIN inventory i ON p.product_id = i.product_id
WHERE i.stock_on_hand < p.reorder_level
ORDER BY estimated_revenue_at_risk DESC;
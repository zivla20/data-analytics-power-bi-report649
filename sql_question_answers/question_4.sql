SELECT
    s.store_type as "Store Type",
    SUM(p.sale_price * o."Product Quantity") as "Total Sales",
    (SUM(p.sale_price * o."Product Quantity") / SUM(SUM(p.sale_price * o."Product Quantity")) OVER ()) * 100 AS "Percentage of Total Sales",
    COUNT(o.product_code) AS "Total Orders"
FROM
    orders_powerbi AS o 
    INNER JOIN dim_stores AS s ON s."store code" = o."Store Code"
    INNER JOIN dim_products AS p ON p.product_code = o.product_code
GROUP BY    
    s.store_type
SELECT
    p.category AS "Category",
    SUM((p.sale_price - p.cost_price) * o."Product Quantity") AS "Profit"
FROM
    orders_powerbi as o 
    INNER JOIN dim_products AS p ON p.product_code = o.product_code
    INNER JOIN dim_stores AS s ON s."store code" = o."Store Code"
WHERE
    s.country_region = 'Wiltshire'
GROUP BY
    p.category
ORDER BY 
    "Profit" DESC
LIMIT 1;
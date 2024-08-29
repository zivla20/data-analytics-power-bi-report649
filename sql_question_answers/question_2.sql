SELECT 
    TO_CHAR(TO_DATE("Order Date", 'YYYY-MM-DD'), 'Month') AS "Month Name",
    SUM(p.sale_price * o."Product Quantity") AS "Total Revenue"
FROM 
    orders_powerbi AS o 
    INNER JOIN dim_products AS p ON p.product_code = o.product_code
WHERE
    EXTRACT(YEAR FROM TO_DATE(o."Order Date", 'YYYY-MM-DD')) = 2022
GROUP BY
    TO_CHAR(TO_DATE(o."Order Date", 'YYYY-MM-DD'), 'Month')
ORDER BY
    "Total Revenue" DESC
LIMIT 1
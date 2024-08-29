SELECT
    s.store_type AS "Store Type",
    SUM(p.sale_price * o."Product Quantity") AS "Revenue"
FROM 
    orders_powerbi as o
INNER JOIN dim_products AS p ON p.product_code = o.product_code
INNER JOIN dim_stores AS s on o."Store Code" = s."store code"
WHERE
    EXTRACT(YEAR FROM TO_DATE(o."Order Date", 'YYYY-MM-DD')) = 2022
    AND s.country_code = 'DE'
GROUP BY
    "Store Type"
ORDER BY 
    "Revenue" DESC
LIMIT 1

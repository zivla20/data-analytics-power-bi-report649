SELECT SUM("staff numbers") AS "Total Staff in UK Stores"
FROM dim_stores
WHERE country_code = 'GB';


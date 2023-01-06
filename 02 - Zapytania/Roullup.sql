--rolloup
SELECT
    nvl(bis.name, 'ALL') bistro_name,
    inv.client_rating,
    COUNT(inv.id)        invoice_count,
    SUM(inv.price_value) takings
FROM
         invoice inv
    JOIN bistro bis ON bis.id = inv.bistro_id
GROUP BY
    rollup(bis.name, inv.client_rating)
ORDER BY
    bis.name;

SELECT
    nvl(bis.name, 'OVERALL RATING') bistro_name,
    inv.month,
    ROUND(AVG(INV.client_rating),6) avg_rate
FROM
         invoice inv
JOIN bistro bis ON bis.id = inv.bistro_id
GROUP BY
    rollup(bis.name, inv.month)
ORDER BY
    bis.name, inv.month;

SELECT
    nvl(bis.name, 'OVERALL') bistro_name,
    nvl(poc.type, 'OVERALL TYPE') TYPE,
    count(poc.type)
FROM
         invoice inv
JOIN bistro bis ON bis.id = inv.bistro_id
JOIN place_of_consumption poc ON poc.id = inv.poc_id
GROUP BY
    rollup(bis.name, poc.type)
ORDER BY
    bis.name, poc.type
;
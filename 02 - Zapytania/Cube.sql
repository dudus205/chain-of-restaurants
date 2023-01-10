--cube
SELECT
    nvl(bis.name, 'ALL') bistro_name,
    COUNT(inv.id)        invoice_count,
    SUM(inv.price_value) takings
FROM
         invoice inv
    JOIN bistro bis ON bis.id = inv.bistro_id
GROUP BY
    CUBE(bis.name)
ORDER BY
    bis.name;
-- nazwa bistro, liczba faktur, ile zarobia 

SELECT
    nvl(bis.name, 'OVERALL RATING') bistro_name,
    MIN(cli.age) min_age,
    MAX(cli.age) max_age,
    ROUND(AVG(cli.age),1) avg_age,
    ROUND(AVG(INV.client_rating),6) avg_rate
FROM
         invoice inv
JOIN bistro bis ON bis.id = inv.bistro_id
JOIN client cli on cli.id = inv.client_id
GROUP BY
    CUBE(bis.name)
ORDER BY
    bis.name;
--nazwa bistro, minimalny, maksymalny i średni wiek, średnia ocena

SELECT
    nvl(bis.name, 'OVERALL') bistro_name,
    nvl(poc.type, 'OVERALL TYPE') TYPE,
    count(poc.type)
FROM
         invoice inv
JOIN bistro bis ON bis.id = inv.bistro_id
JOIN place_of_consumption poc ON poc.id = inv.poc_id
GROUP BY
    CUBE(bis.name, poc.type)
ORDER BY
    bis.name, poc.type
;
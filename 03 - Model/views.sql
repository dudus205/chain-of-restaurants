Create or replace view V_PRODUCT_RATE AS
SELECT
    inv.product_id,
    pr.category,
    inv.id,
    CASE
            WHEN inv.client_rating < 6  THEN 'GOOD' ELSE 'BAD'
    END rating
FROM invoice inv
JOIN product pr ON inv.product_id = pr.id
                and inv.id < 66000;


Create or replace view V_PRODUCT_RATE_TEST AS
SELECT
    inv.product_id,
    pr.category,
    inv.id,
    CASE
           WHEN inv.client_rating < 6  THEN 'GOOD' ELSE 'BAD'
    END rating
FROM invoice inv
JOIN product pr ON inv.product_id = pr.id
                and inv.id between 66000 and 132000;

Create or replace view V_PRODUCT_RATE_APPLY AS
SELECT
    inv.product_id,
    pr.category,
    inv.id,
    CASE
           WHEN inv.client_rating < 6  THEN 'GOOD' ELSE 'BAD'
    END rating
FROM invoice inv
JOIN product pr ON inv.product_id = pr.id
                and inv.id between 132000 AND 200000;

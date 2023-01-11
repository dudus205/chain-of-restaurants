Create or replace view V_PRODUCT_RATE_GR AS
SELECT
    inv.product_id,
    pr.category,
    inv.id,
    CASE
            WHEN inv.client_rating < 6  THEN 'GOOD' ELSE 'BAD'
    END rating
FROM invoice inv
JOIN product pr ON inv.product_id = pr.id
                and inv.id < 90000;

Create or replace view V_PRODUCT_RATE_GR_APPLY AS
SELECT
    inv.product_id,
    pr.category,
    inv.id,
    CASE
            WHEN inv.client_rating < 6  THEN 'GOOD' ELSE 'BAD'
    END rating
FROM invoice inv
JOIN product pr ON inv.product_id = pr.id
                and inv.id >= 90000;
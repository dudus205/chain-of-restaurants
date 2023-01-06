--partition
SELECT
    BIS.NAME AS BISTRO,
    TAKINGS AS "TAKINGS  % IN YEAR"
FROM
    (
        SELECT
            DISTINCT INV.BISTRO_ID,
            INV.YEAR,
            ROUND(
                (
                    100 * sum(PRICE_VALUE) OVER (partition BY INV.BISTRO_ID, INV.YEAR) / SUM(INV.PRICE_VALUE) OVER (partition by INV.YEAR)
                ),
                2
            ) TAKINGS
        FROM
            INVOICE INV
        ORDER BY
            INV.YEAR ASC
    ) MAIN
    JOIN BISTRO BIS ON BIS.ID = MAIN.BISTRO_ID;

SELECT
    PROD.NAME AS PRODUCT,
    MN.NAME AS MENU,
    PIM AS "% PRODUCT IN MENU"
FROM
    (
        SELECT
            DISTINCT INV.PRODUCT_ID,
            INV.MENU_ID,
            ROUND(
                (
                    100 * COUNT(INV.PRODUCT_ID) OVER (partition BY INV.PRODUCT_ID, INV.MENU_ID) / COUNT(INV.PRODUCT_ID) OVER (partition by INV.MENU_ID)
                ),
                2
            ) as PIM
        FROM
            INVOICE INV
        ORDER BY
            INV.MENU_ID
    ) MAIN
    JOIN PRODUCT PROD ON PROD.ID = MAIN.PRODUCT_ID
    JOIN MENU MN ON MN.ID = MAIN.MENU_ID;

SELECT
    BIS.NAME AS BISTRO,
    BN.NAME AS BONUS,
    BIB AS "% BONUS IN BISTRO"
FROM
    (
        SELECT
            DISTINCT INV.BONUS_ID,
            INV.BISTRO_ID,
            ROUND(
                (
                    100 * COUNT(INV.BONUS_ID) OVER (partition BY INV.BONUS_ID, INV.BISTRO_ID) / COUNT(INV.BONUS_ID) OVER (partition by INV.BISTRO_ID)
                ),
                2
            ) as BIB
        FROM
            INVOICE INV
        ORDER BY
            INV.BISTRO_ID
    ) MAIN
    JOIN BISTRO BIS ON MAIN.BISTRO_ID = BIS.ID
    JOIN BONUS BN ON BN.ID = MAIN.BONUS_ID;

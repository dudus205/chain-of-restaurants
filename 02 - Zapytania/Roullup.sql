--rolloup
SELECT
    NVL(TO_CHAR(BIS.NAME), 'ALL') AS BISTRO,
    MONTH,
    YEAR,
    TAKINGS
FROM
    BISTRO BIS
    RIGHT OUTER JOIN (
        SELECT
            BISTRO_ID,
            NVL(TO_CHAR(INV.MONTH), 'ALL') AS "MONTH",
            NVL(TO_CHAR(INV.YEAR), 'ALL') AS "YEAR",
            sum(INV.PRICE_VALUE) "TAKINGS"
        FROM
            INVOICE INV
        GROUP BY
            ROLLUP(INV.YEAR, INV.MONTH, INV.BISTRO_ID)
    ) MAIN ON MAIN.BISTRO_ID = BIS.ID;

SELECT
    NVL(TO_CHAR(BIS.NAME), 'ALL') AS BISTRO,
    NVL(TO_CHAR(PROD.NAME), 'ALL') AS PRODUCT,
    YEAR,
    MONTH,
    SALES
FROM
    (
        SELECT
            BISTRO_ID,
            PRODUCT_ID,
            NVL(TO_CHAR(INV.YEAR), 'ALL') AS YEAR,
            NVL(TO_CHAR(INV.MONTH), 'ALL') AS MONTH,
            count (*) AS SALES
        FROM
            INVOICE INV
        group by
            rollup(INV.BISTRO_ID, INV.PRODUCT_ID, INV.MONTH, INV.YEAR)
        order by
            INV.BISTRO_ID ASC,
            INV.PRODUCT_ID ASC,
            INV.MONTH ASC,
            INV.YEAR ASC
    ) MAIN
    LEFT OUTER JOIN BISTRO BIS ON BIS.ID = MAIN.BISTRO_ID
    LEFT OUTER JOIN PRODUCT PROD ON PROD.ID = MAIN.PRODUCT_ID;

SELECT
    NVL(TO_CHAR(BIS.NAME), 'ALL') AS BISTRO,
    NVL(TO_CHAR(MEN.NAME), 'ALL') AS MENU,
    WEEKDAY,
    "SALES COUNT"
FROM
    (
        SELECT
            BISTRO_ID,
            NVL(TO_CHAR(INV.WEEKDAY), 'ALL') AS WEEKDAY,
            MENU_ID,
            count (*) AS "SALES COUNT"
        FROM
            INVOICE INV
        group by
            rollup(S.BISTRO_ID, INV.WEEKDAY, INV.MENU_ID)
        order by
            INV.BISTRO_ID ASC,
            INV.WEEKDAY ASC,
            INV.MENU_ID ASC
    ) MAIN
    LEFT OUTER JOIN BISTRO BIS ON B.ID = MAIN.BISTRO_ID
    LEFT OUTER JOIN MENU MEN ON MMEN.ID = MAIN.MENU_ID;

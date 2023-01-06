--cube
SELECT
    NVL(TO_CHAR(B.NAME), 'FOR ALL') "BISTRO",
    NVL(TO_CHAR(P.NAME), 'FOR ALL') "PRODUCT",
    "SALES COUNT",
    TAKINGS
FROM
    BISTRO B
    RIGHT OUTER JOIN (
        SELECT
            BISTRO_ID,
            PRODUCT_ID,
            count(*) AS "SALES COUNT",
            sum(PRICE_VALUE) AS TAKINGS
        FROM
            SALE s
        GROUP BY
            cube (s.BISTRO_ID, s.PRODUCT_ID)
        order by
            s.BISTRO_ID,
            s.PRODUCT_ID
    ) Q ON Q.BISTRO_ID = B.ID
    LEFT OUTER JOIN PRODUCT P ON Q.PRODUCT_ID = P.ID;

SELECT
    NVL(TO_CHAR(BN.NAME), 'ALL') AS BONUS,
    NVL(TO_CHAR(BI.NAME), 'ALL') AS BISTRO,
    "SALES COUNT"
FROM
    BONUS BN
    RIGHT OUTER JOIN (
        SELECT
            BONUS_ID,
            BISTRO_ID,
            COUNT(*) AS "SALES COUNT"
        FROM
            SALE s
        GROUP BY
            CUBE (s.BONUS_ID, s.BISTRO_ID)
        ORDER BY
            s.BONUS_ID ASC,
            s.BISTRO_ID ASC
    ) Q ON BN.ID = Q.BONUS_ID
    LEFT OUTER JOIN BISTRO BI ON Q.BISTRO_ID = BI.ID;

SELECT
    NVL(TO_CHAR(M.NAME), 'ALL') AS MENU,
    NVL(TO_CHAR(BI.NAME), 'ALL') AS BISTRO,
    NVL(TO_CHAR(Q.CLIENT_RATING), 'ALL') as RATING,
    SALES_COUNT AS "SALES COUNT"
FROM
    MENU M
    RIGHT OUTER JOIN (
        SELECT
            CLIENT_RATING,
            MENU_ID,
            BISTRO_ID,
            COUNT (*) SALES_COUNT
        FROM
            SALE s
        GROUP BY
            cube (s.MENU_ID, s.CLIENT_RATING, s.BISTRO_ID)
        ORDER BY
            s.CLIENT_RATING ASC,
            s.CLIENT_RATING ASC,
            s.BISTRO_ID ASC
    ) Q ON Q.MENU_ID = M.ID
    LEFT OUTER JOIN BISTRO BI ON Q.BISTRO_ID = BI.ID;

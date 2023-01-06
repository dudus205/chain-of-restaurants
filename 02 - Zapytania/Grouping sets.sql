--grouping sets
SELECT
    NVL(TO_CHAR(CHI.NAME), 'ALL') AS "CHEF NAME",
    NVL(TO_CHAR(CHI.SURNAME), 'ALL') AS "CHEF SURNAME",
    NVL(TO_CHAR(MN.NAME), 'ALL') AS MENU,
    CLIENT_RATING AS "CLIENT RATING",
    "SALES COUNT"
FROM
    (
        SELECT
            CHIEF_ID,
            MENU_ID,
            NVL(TO_CHAR(INV.CLIENT_RATING), 'ALL') AS CLIENT_RATING,
            COUNT(*) AS "SALES COUNT"
        FROM
            INVOICE INV
        GROUP BY
            GROUPING SETS(
                (INV.CHIEF_ID),
                (INV.CHIEF_ID, INV.CLIENT_RATING),
                (INV.CHIEF_ID, INV.MENU_ID),
                (INV.CLIENT_RATING)
            )
    ) MAIN
    LEFT OUTER JOIN MENU MN ON MAIN.MENU_ID = MN.ID
    LEFT OUTER JOIN CHIEF CHI ON CHI.ID = MAIN.CHIEF_ID;

SELECT
    NVL(TO_CHAR(BIS.NAME), 'ALL') AS BISTRO,
    HOUR,
    WEEKEDAY,
    SALES
FROM
    (
        SELECT
            BISTRO_ID,
            NVL(TO_CHAR(INV.HOUR), 'ALL') AS "HOUR",
            NVL(TO_CHAR(INV.WEEKDAY), 'ALL') AS "WEEKEDAY",
            count(*) sales
        FROM
            INVOICE INV
        GROUP BY
            GROUPING SETS(
                (INV.HOUR),
                (INV.HOUR, INV.WEEKDAY),
                (INV.BISTRO_ID, INV.HOUR, INV.WEEKDAY),
                (INV.HOUR, INV.WEEKDAY)
            )
        ORDER BY
            INV.BISTRO_ID ASC,
            INV.HOUR ASC,
            INV.WEEKDAY ASC
    ) MAIN
    LEFT OUTER JOIN BISTRO BIS ON BIS.ID = MAIN.BISTRO_ID;

SELECT
    NVL(TO_CHAR(BIS.NAME), 'ALL') AS BISTRO,
    NVL(TO_CHAR(CHI.NAME), 'ALL') AS "CHEF NAME",
    NVL(TO_CHAR(CHI.SURNAME), 'ALL') AS "CHEF SURNAME",
    CLIENT_RATING AS "CLIENT RATING",
    AVERAGE_QTY AS "AVERAGE QUANTITY"
FROM
    (
        SELECT
            BISTRO_ID,
            CHIEF_ID,
            NVL(TO_CHAR(INV.CLIENT_RATING), 'ALL') AS CLIENT_RATING,
            ROUND(AVG(INV.QUANTITY), 2) as AVERAGE_QTY
        FROM
            INVOICE INV
        GROUP BY
            GROUPING SETS(
                (INV.BISTRO_ID),
                (INV.CHIEF_ID),
                (INV.CLIENT_RATING),
                (INV.BISTRO_ID, INV.CLIENT_RATING)
            )
        ORDER BY
            INV.BISTRO_ID ASC,
            INV.CHIEF_ID ASC,
            INV.CLIENT_RATING ASC
    ) MAIN
    LEFT OUTER JOIN BISTRO BIS ON BIS.ID = MAIN.BISTRO_ID
    LEFT OUTER JOIN CHIEF CHI ON CHI.ID = MAIN.CHIEF_ID;

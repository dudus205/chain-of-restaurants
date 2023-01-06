--rankongowe
SELECT
    BIS.ID,
    BIS.NAME,
    MAIN.COUNT "SALES COUNT",
    DENSE_RANK() OVER (
        ORDER BY
            MAIN.COUNT DESC
    ) AS RANK
FROM
    (
        SELECT
            INV.BISTRO_ID as ID,
            COUNT(*) AS COUNT
        FROM
            INVOICE INV
        GROUP BY
            INV.BISTRO_ID
    ) MAIN
    JOIN BISTRO BIS ON BIS.ID = MAIN.ID;

SELECT
    BIS.ID,
    BIS.NAME,
    MAIN.AVG_RATING AVG_RATING,
    DENSE_RANK() OVER (
        ORDER BY
            MAIN.AVG_RATING DESC
    ) AS RANK
FROM
    (
        SELECT
            INV.BISTRO_ID as ID,
            ROUND(AVG(INV.CLIENT_RATING), 2) AVG_RATING
        FROM
            INVOICE INV
        GROUP BY
            INV.BISTRO_ID
    ) MAIN
    JOIN BISTRO BIS ON BIS.ID = MAIN.ID;

SELECT
    CHI.ID,
    CHI.NAME,
    CHI.SURNAME,
    MAIN.AVG_RATING,
    DENSE_RANK() OVER (
        ORDER BY
            MAIN.AVG_RATING DESC
    ) AS RANK
FROM
    (
        SELECT
            INV.CHIEF_ID AS ID,
            ROUND(AVG(INV.CLIENT_RATING), 2) AVG_RATING
        FROM
            INVOICE INV
        GROUP BY
            INV.CHIEF_ID
    ) MAIN
    JOIN CHIEF CHI ON CHI.ID = MAIN.ID
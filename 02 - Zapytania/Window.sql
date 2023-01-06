--window
SELECT
    YEAR,
    MONTH,
    PV AS "THIS MONTH TAKINGS",
    Sum(PV) over (
        PARTITION BY YEAR
        ORDER BY
            MONTH RANGE BETWEEN unbounded preceding
            AND CURRENT ROW
    ) AS "TAKINGS SUM TO THIS MONTH"
from
    (
        SELECT
            MONTH,
            YEAR,
            SUM(PRICE_VALUE) PV
        FROM
            INVOICE
        GROUP BY
            MONTH,
            YEAR
    )
ORDER BY
    YEAR,
    MONTH;

SELECT
    YEAR,
    MONTH,
    L_SPRZED AS INVOICES_COUNT,
    NVL(
        L_SPRZED -(
            Lag(L_SPRZED, 1) over (
                ORDER BY
                    YEAR,
                    MONTH
            )
        ),
        0
    ) AS "DIFF BETWEEN MONTHS"
from
    (
        SELECT
            MONTH,
            YEAR,
            COUNT(*) L_SPRZED
        FROM
            INVOICE
        GROUP BY
            MONTH,
            YEAR
    )
ORDER BY
    YEAR ASC,
    MONTH ASC;

SELECT
    YEAR,
    MONTH,
    A_RAT AS AVG_RATING,
    NVL(
        A_RAT -(
            Lag(A_RAT, 1) over (
                ORDER BY
                    YEAR,
                    MONTH
            )
        ),
        0
    ) AS "DIFF BETWEEN MONTHS"
from
    (
        SELECT
            MONTH,
            YEAR,
            ROUND(AVG(CLIENT_RATING), 2) A_RAT
        FROM
            INVOICE
        GROUP BY
            MONTH,
            YEAR
    )
ORDER BY
    YEAR ASC,
    MONTH ASC;
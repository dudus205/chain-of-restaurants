load data 
infile '../csv/Invoice.csv' "str '\r\n'"
append
into table INVOICE
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID,
             BISTRO_ID,
             POC_ID,
             PRODUCT_ID,
             MENU_ID,
             CHIEF_ID,
             PAYMENT_ID,
             WORKER_ID,
             DELIVERY_ID,
             BONUS_ID,
             CLIENT_ID,
             QUANTITY,
             PRICE_VALUE,
             CLIENT_RATING,
             HOUR,
             DAY,
             WEEKDAY,
             MONTH,
             YEAR
           )

load data 
infile '../csv/Delivery.csv' "str '\r\n'"
append
into table DELIVERY
fields terminated by ';'
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID,
             DG_NAME CHAR(255),
             DG_SURNAME CHAR(255),
             DG_SENIORITY,
             TRANSPORT CHAR(255),
             DELIVERY_TIME_IN_MIN
           )

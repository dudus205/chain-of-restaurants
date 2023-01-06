load data 
infile '../csv/Payment.csv' "str '\r\n'"
append
into table PAYMENT
fields terminated by ';'
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID,
             BILL_NUMBER,
             METHOD CHAR(255),
             TIP
           )

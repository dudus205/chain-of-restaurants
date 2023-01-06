load data 
infile '../csv/Product.csv' "str '\r\n'"
append
into table PRODUCT
fields terminated by ';'
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID,
             NAME CHAR(255),
             CATEGORY CHAR(255)
           )

load data 
infile '../csv/Bonus.csv' "str '\r\n'"
append
into table BONUS
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID,
             NAME CHAR(255),
             DISCOUNT
           )

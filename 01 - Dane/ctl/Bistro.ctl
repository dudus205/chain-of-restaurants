load data 
infile '../csv/Bistro.csv' "str '\r\n'"
append
into table BISTRO
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID,
             NAME CHAR(255),
             CITY CHAR(255),
             ADM_UNIT CHAR(255)
           )

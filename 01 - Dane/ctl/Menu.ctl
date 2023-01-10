load data 
infile '../csv/Menu.csv' "str '\r\n'"
append
into table MENU
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID,
             NAME CHAR(255),
             TYPE CHAR(255)
           )

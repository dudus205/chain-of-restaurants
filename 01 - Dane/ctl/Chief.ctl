load data 
infile '../csv/Chief.csv' "str '\r\n'"
append
into table CHIEF
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID,
             NAME CHAR(255),
             SURNAME CHAR(255),
             SENIORITY
           )

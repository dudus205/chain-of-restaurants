load data 
infile '../csv/Worker.csv' "str '\r\n'"
append
into table WORKER
fields terminated by ';'
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID,
             NAME CHAR(255),
             SURNAME CHAR(255),
             SENIORITY
           )

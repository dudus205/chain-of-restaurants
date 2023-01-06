load data 
infile '../csv/Client.csv' "str '\r\n'"
append
into table CLIENT
fields terminated by ';'
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID,
             GENDER CHAR(1),
             TYPE CHAR(50),
			 AGE
           )

load data 
infile '../csv/PlaceOfConsumption.csv' "str '\r\n'"
append
into table PLACE_OF_CONSUMPTION
fields terminated by ';'
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID,
             TYPE CHAR(255),
             STREET CHAR(255),
             CITY CHAR(255),
             ADM_UNIT CHAR(255)
           )

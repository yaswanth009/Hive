load data inpath '/Data/Space/test/File/TextFile.txt' into table dopsmdm_db.report_load;

INSERT INTO dopsmdm_db.report PARTITION(file_date)
SELECT Brand as Brand, 
Make as Make, 
Model as Model, 
Position as Position, 
Fuel_Type as Fuel_Type, 
Primary_Market_Area as Primary_Market_Area, 
ts as ts, 
Number as Number, 
CURRENT_DATE as filedate 
from dopsmdm_db.report_load;


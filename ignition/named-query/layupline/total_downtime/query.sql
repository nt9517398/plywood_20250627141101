	
SELECT 
	max("Downtime") -min("Downtime")
FROM downtime

where 	t_stamp <  :date_to 
		AND t_stamp >  :date_from
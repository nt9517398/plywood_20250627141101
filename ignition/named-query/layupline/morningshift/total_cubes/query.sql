	
SELECT 
   sum("Vol")
FROM group_table

where 	t_stamp <=  :date_to 
		AND t_stamp >=  :date_from
		and t_stamp::time >= '06:00:00' and t_stamp::time < '14:00:00'
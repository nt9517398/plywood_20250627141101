	
SELECT 
	count(*) 
FROM group_table

where 	t_stamp <=  :date_to 
		AND t_stamp >=  :date_from
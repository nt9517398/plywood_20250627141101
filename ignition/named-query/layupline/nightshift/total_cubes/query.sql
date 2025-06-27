	
SELECT 
   sum("Vol")
FROM group_table

where 	t_stamp <=  :date_to 
		AND t_stamp >=  :date_from
		and "Log_Night_shift_Data" = 1
SELECT 
	sum("Volume"::decimal) 

FROM group_table
where t_stamp >= (current_date -4) 
and t_stamp < (current_date -3) 
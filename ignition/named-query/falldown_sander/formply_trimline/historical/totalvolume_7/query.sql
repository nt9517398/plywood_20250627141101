SELECT 
	sum("Volume"::decimal) 

FROM group_table
where t_stamp >= (current_date -7) 
and t_stamp < (current_date -6)
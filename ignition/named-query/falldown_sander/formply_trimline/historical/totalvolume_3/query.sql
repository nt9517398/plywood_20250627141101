SELECT 
	sum("Volume"::decimal) 

FROM group_table

where t_stamp >= (current_date -3) 
and t_stamp < (current_date -2) 
select count(*) 
from group_table 
where t_stamp >= ((current_date - :x)-1) + TIME '05:30:00'
	and t_stamp <= ((current_date - :x)-1) + TIME '15:30:00'

select count(*) 
from group_table 
where t_stamp >= (current_date -5) 
and t_stamp < (current_date -4)


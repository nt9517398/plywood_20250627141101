select count(*) 
from group_table 
where t_stamp >= (current_date -2) 
and t_stamp < (current_date -1) 


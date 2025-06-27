select count(*) 
from group_table 
where t_stamp >= (current_date -1) 
and t_stamp < current_date


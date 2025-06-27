select count(*) 
from group_table 
where t_stamp >= (current_date - :x) -1
and t_stamp < (current_date - :x)


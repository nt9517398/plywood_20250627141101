
SELECT (EXTRACT(EPOCH FROM (max(t_stamp) - min(t_stamp)))) /3600
FROM public.group_table 
WHERE t_stamp < (current_date - 2) and t_stamp >= (current_date - 3)
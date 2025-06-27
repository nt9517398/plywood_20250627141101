
SELECT (EXTRACT(EPOCH FROM (max(t_stamp) - min(t_stamp)))) /3600
FROM public.group_table 
WHERE t_stamp < (current_date- :x) and t_stamp >= (current_date -:x) - 1
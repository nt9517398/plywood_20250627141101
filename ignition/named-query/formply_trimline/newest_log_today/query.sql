SELECT t_stamp

FROM public.group_table
WHERE t_stamp >= current_date
ORDER BY t_stamp asc
limit 1

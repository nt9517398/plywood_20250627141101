
SELECT t_stamp

FROM group_table
WHERE t_stamp >= current_date 
ORDER BY t_stamp desc
limit 1


SELECT 
	
CASE
	WHEN "Stand"= 1  THEN 'A'
	WHEN "Stand"= 2  THEN 'B'
    WHEN "Stand"= 4  THEN 'D'
    WHEN "Stand"= 5  THEN 'E'
END as class,


CASE
	WHEN "Stand"= 1 THEN sum(case when "Stand"= 1  then 1 else 0 end)
	WHEN "Stand"= 2 THEN sum(case when "Stand"= 2  then 1 else 0 end)
	WHEN "Stand"= 4 THEN sum(case when "Stand"= 4  then 1 else 0 end)
	WHEN "Stand"= 5 THEN sum(case when "Stand"= 5  then 1 else 0 end)
END as n


FROM group_table_debarker
WHERE
			time_stamp <=  :date_to
		AND time_stamp >=  :date_from

Group by group_table_debarker."Stand"

ORDER by class;

SELECT *
FROM  group_table

WHERE
			t_stamp <=  :date_to 
		AND t_stamp >=  :date_from
order by t_stamp desc
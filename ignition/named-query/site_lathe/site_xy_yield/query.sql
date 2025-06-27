Select  "t_stamp","BlockYield" From site_xy_yield

where 	t_stamp <=  :date_to 
		AND t_stamp >=  :date_from
Order by t_stamp asc
Select  avg("BlockYield") From site_xy_yield

where 	t_stamp <=  :date_to 
		AND t_stamp >=  :date_from

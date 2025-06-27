SELECT sum(site_logline_rejects."Vol") FROM public.site_logline_rejects

where 	t_stamp <=  :date_to 
		AND t_stamp >=  :date_from
		And "Length" > 4000
SELECT sum(site_logline."Vol") FROM public.site_logline

where 	t_stamp <=  :date_to 
		AND t_stamp >=  :date_from
		And "Length" > 4000
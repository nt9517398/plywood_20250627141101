select ROUND(sum("Vol")::numeric,2)
FROM public.site_wet_stacker_bin4

where 	t_stamp <=  :date_to 
		AND t_stamp >=  :date_from
		
		
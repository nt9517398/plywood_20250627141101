select count("CounterBin4") 
FROM public.site_wet_stacker_bin4

where 	t_stamp <=  :date_to 
		AND t_stamp >=  :date_from
		and bin4_recipe_thickness_after = 400
		
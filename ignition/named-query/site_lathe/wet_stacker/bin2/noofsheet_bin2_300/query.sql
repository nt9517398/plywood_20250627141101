select count("CounterBin2") 
FROM public.site_wet_stacker_bin2

where 	t_stamp <=  :date_to 
		AND t_stamp >=  :date_from
		and bin2_recipe_thickness_after = 300
		
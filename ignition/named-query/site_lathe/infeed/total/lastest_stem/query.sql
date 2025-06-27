
SELECT MAX(t_stamp) AS latest_timestamp
	FROM (
    SELECT t_stamp FROM public.site_logline
    UNION ALL
    SELECT t_stamp FROM  site_wet_stacker_bin1
    UNION ALL
    SELECT t_stamp FROM  site_wet_stacker_bin2
    UNION ALL
    SELECT t_stamp FROM  site_wet_stacker_bin3
    UNION ALL
    SELECT t_stamp FROM  site_wet_stacker_bin4
	) AS subquery;
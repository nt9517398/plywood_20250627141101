SELECT 
    thickness,
    grade,
    product,
    construction,
    COUNT(CASE WHEN scw_ns_back = 1 OR scw_g1s_back = 1  THEN 1 ELSE NULL END) AS total_count
   	
FROM 
    public.falldown_sander
WHERE 
    t_stamp >= :date_from AND t_stamp <= :date_to

GROUP BY 
    thickness,
    grade,
    product,
    construction
order by
	Total_Count DESC

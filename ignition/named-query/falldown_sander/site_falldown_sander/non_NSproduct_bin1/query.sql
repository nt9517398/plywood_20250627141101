
SELECT COUNT(*) AS ns_count
FROM public.counterbin1
WHERE grade != 'NS' AND
	t_stamp >= :date_from AND t_stamp < :date_to


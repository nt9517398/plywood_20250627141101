SELECT SUM(count_row)
FROM (
    SELECT COUNT(*) AS count_row FROM public.counterbin1 WHERE t_stamp >= :date_from AND t_stamp < :date_to
    UNION ALL
    SELECT COUNT(*) AS count_row FROM public.counterbin2 WHERE t_stamp >= :date_from AND t_stamp < :date_to
    UNION ALL
    SELECT COUNT(*) AS count_row FROM public.counterbin3 WHERE t_stamp >= :date_from AND t_stamp < :date_to
    UNION ALL
    SELECT COUNT(*) AS count_row FROM public.counterbin4 WHERE t_stamp >= :date_from AND t_stamp < :date_to
) AS counts;

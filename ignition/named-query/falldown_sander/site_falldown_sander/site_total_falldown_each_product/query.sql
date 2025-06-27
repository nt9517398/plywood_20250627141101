SELECT 
    thickness,
    grade,
    product,
    construction,
    COUNT(*) AS count,
    ROUND(
        COUNT(*) * 1.0 / (
            SELECT SUM(count_row)
            FROM (
                SELECT COUNT(*) AS count_row FROM public.counterbin1 WHERE t_stamp >= :date_from AND t_stamp < :date_to
                UNION ALL
                SELECT COUNT(*) AS count_row FROM public.counterbin2 WHERE t_stamp >= :date_from AND t_stamp < :date_to
                UNION ALL
                SELECT COUNT(*) AS count_row FROM public.counterbin3 WHERE t_stamp >= :date_from AND t_stamp < :date_to
                UNION ALL
                SELECT COUNT(*) AS count_row FROM public.counterbin4 WHERE t_stamp >= :date_from AND t_stamp < :date_to
            ) AS counts
        ), 
        5
    ) AS percentage
FROM 
    public.falldown_sander
WHERE 
    t_stamp >= :date_from AND t_stamp <= :date_to
GROUP BY 
    thickness,
    grade,
    product,
    construction
ORDER BY 
    percentage DESC;

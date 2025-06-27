SELECT Min(t_stamp) AS latest_timestamp
FROM (
    SELECT t_stamp FROM site_wet_stacker_bin1
    WHERE CAST(t_stamp AS DATE) = DATE(:date_from)
    UNION ALL
    SELECT t_stamp FROM site_wet_stacker_bin2
    WHERE CAST(t_stamp AS DATE) = DATE(:date_from)
    UNION ALL
    SELECT t_stamp FROM site_wet_stacker_bin3
    WHERE CAST(t_stamp AS DATE) = DATE(:date_from)
    UNION ALL
    SELECT t_stamp FROM site_wet_stacker_bin4
    WHERE CAST(t_stamp AS DATE) = DATE(:date_from)
) AS subquery;

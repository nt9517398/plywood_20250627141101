WITH time_range_1 AS (
    SELECT 
        DATE_TRUNC('day', t_stamp) AS day,
        MAX("Downtime") - MIN("Downtime") as gap
    FROM downtime
    WHERE 
        t_stamp >= :date_from AND t_stamp <= :date_to 
        AND t_stamp::time >= '22:00:00' AND t_stamp::time <= '23:59:59'
    GROUP BY day
),
time_range_2 AS (
    SELECT 
        DATE_TRUNC('day', t_stamp) AS day,
        MAX("Downtime") - MIN("Downtime") as gap
    FROM downtime
    WHERE 
        t_stamp >= :date_from AND t_stamp <= :date_to 
        AND t_stamp::time >= '00:00:00' AND t_stamp::time < '06:00:00'
    GROUP BY day
)
SELECT 
   
    SUM(gap)
FROM (
    SELECT * FROM time_range_1
    UNION ALL
    SELECT * FROM time_range_2
) AS combined;


		
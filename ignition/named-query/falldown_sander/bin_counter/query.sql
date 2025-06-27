SELECT
    CONCAT(main.thickness, ' ',main.grade, ' ', main.product, ' ', main."length", 'x', main.width) AS combined_column,
	main.thickness as pthickness,
	main.grade as pgrade,
	main.product as pproduct,
	main."length" as plength,
	main.width as pwidth,
	main.thickness as lthickness,
	main.grade as lgrade,
	main.product as lproduct,
	main."length" as llength,
	main.width as lwidth,
	
	

    main.row_count,
    CASE
        WHEN (main.grade = 'NS' OR :grade = 'ALL' AND main.grade = 'NS') THEN COALESCE(counter.sum_count, 0)
        ELSE COALESCE(counterbin1.count_row, 0)
    END AS select_product,
    
    CASE
        WHEN main.grade != 'NS' THEN COALESCE(counterbin2.count_row, 0)
    END AS "NS",
    
    
    COALESCE(counterbin3.count_row, 0) AS "PG/G1S",
    
    COALESCE(counterbin4.count_row, 0) AS "reject"
FROM
    (
        SELECT
            grade,
            product,
            thickness,
            "length",
            width,
            COUNT(*) AS row_count
        FROM
            public.falldown_sander
        WHERE
            t_stamp >= :date_from AND t_stamp <= :date_to
        GROUP BY
            grade,
            product,
            thickness,
            "length",
            width
        HAVING
            COUNT(*) > 1
    ) main
LEFT JOIN
    (
        SELECT
            product,
            thickness,
            "length",
            width,
            SUM(row_count) AS sum_count
        FROM
            (
                SELECT
                    product,
                    thickness,
                    "length",
                    width,
                    COUNT(*) AS row_count
                FROM
                    public.counterbin1
                WHERE
                    t_stamp >= :date_from AND t_stamp <= :date_to
                GROUP BY
                    product,
                    thickness,
                    "length",
                    width
                UNION ALL
                SELECT
                    product,
                    thickness,
                    "length",
                    width,
                    
                COUNT(*) AS row_count
                FROM
                    public.counterbin2
                WHERE
                    t_stamp >= :date_from AND t_stamp <= :date_to
               GROUP BY
                    product,
                    thickness,
                    "length",
                    width
            ) counterbin
        
        GROUP BY
            product,
            thickness,
            "length",
            width
    ) counter ON main.product = counter.product
        AND main.thickness = counter.thickness
        AND main."length" = counter."length"
        AND main.width = counter.width
LEFT JOIN
    (
        SELECT
            product,
            thickness,
            "length",
            width,
            COUNT(*) AS count_row
        FROM
            public.counterbin1
        WHERE
            t_stamp >= :date_from AND t_stamp <= :date_to
        GROUP BY
            product,
            thickness,
            "length",
            width
    ) counterbin1 ON main.product = counterbin1.product
        AND main.thickness = counterbin1.thickness
        AND main."length" = counterbin1."length"
        AND main.width = counterbin1.width
LEFT JOIN
    (
        SELECT
            product,
            thickness,
            "length",
            width,
            COUNT(*) AS count_row
        FROM
            public.counterbin2
        WHERE
            t_stamp >= :date_from AND t_stamp <= :date_to
        GROUP BY
            product,
            thickness,
            "length",
            width
    ) counterbin2 ON main.product = counterbin2.product
        AND main.thickness = counterbin2.thickness
        AND main."length" = counterbin2."length"
        AND main.width = counterbin2.width
LEFT JOIN
    (
        SELECT
            product,
            thickness,
            "length",
            width,
            COUNT(*) AS count_row
        FROM
            public.counterbin3
        WHERE
            t_stamp >= :date_from AND t_stamp <= :date_to
        GROUP BY
            product,
            thickness,
            "length",
            width
    ) counterbin3 ON main.product = counterbin3.product
        AND main.thickness = counterbin3.thickness
        AND main."length" = counterbin3."length"
        AND main.width = counterbin3.width
LEFT JOIN
    (
        SELECT
            product,
            thickness,
            "length",
            width,
            COUNT(*) AS count_row
        FROM
            public.counterbin4
        WHERE
            t_stamp >= :date_from AND t_stamp <= :date_to
        GROUP BY
            product,
            thickness,
            "length",
            width
    ) counterbin4 ON main.product = counterbin4.product
        AND main.thickness = counterbin4.thickness
        AND main."length" = counterbin4."length"
        AND main.width = counterbin4.width;

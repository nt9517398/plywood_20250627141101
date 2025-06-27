SELECT
    CONCAT(main.thickness, ' ', main.grade, ' ', main.product, ' ', main."length", 'x', main.width, 'x', main.construction,'ply') AS combined_column,
    main.thickness AS pthickness,
    main.grade AS pgrade,
    main.product AS pproduct,
    main."length" AS plength,
    main.width AS pwidth,
    main.construction AS pconstruction,
    main.thickness AS lthickness,
    main.grade AS lgrade,
    main.product AS lproduct,
    main."length" AS llength,
    main.width AS lwidth,
    main.construction AS lconstruction,
    main.row_count,
    CASE
        WHEN main.grade = 'NS' THEN COALESCE(counter.sum_count, 0)
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
            construction,
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
            width,
            construction
        HAVING
            COUNT(*) > 1
    ) main
LEFT JOIN
    (
        SELECT
            grade,
            product,
            thickness,
            "length",
            width,
            construction,
            SUM(row_count) AS sum_count
        FROM
            (
                SELECT
                    grade,
                    product,
                    thickness,
                    "length",
                    width,
                    construction,
                    COUNT(*) AS row_count
                FROM
                    public.counterbin1
                WHERE
           			t_stamp >= :date_from AND t_stamp <= :date_to
                GROUP BY
                    grade,
                    product,
                    thickness,
                    "length",
                    width,
                    construction
                UNION ALL
                SELECT
                    grade,
                    product,
                    thickness,
                    "length",
                    width,
                    construction,
                    COUNT(*) AS row_count
                FROM
                    public.counterbin2
                WHERE
            		t_stamp >= :date_from AND t_stamp <= :date_to
                GROUP BY
                    grade,
                    product,
                    thickness,
                    "length",
                    width,
                    construction
            ) counterbin
        GROUP BY
            grade,
            product,
            thickness,
            "length",
            width,
            construction
    ) counter ON main.grade = counter.grade
        AND main.product = counter.product
        AND main.thickness = counter.thickness
        AND main."length" = counter."length"
        AND main.width = counter.width
        AND main.construction = counter.construction
LEFT JOIN
    (
        SELECT
            grade,
            product,
            thickness,
            "length",
            width,
            construction,
            COUNT(*) AS count_row
        FROM
            public.counterbin1
        WHERE
            t_stamp >= :date_from AND t_stamp <= :date_to
        GROUP BY
            grade,
            product,
            thickness,
            "length",
            width,
            construction
    ) counterbin1 ON main.grade = counterbin1.grade
        AND main.product = counterbin1.product
        AND main.thickness = counterbin1.thickness
        AND main."length" = counterbin1."length"
        AND main.width = counterbin1.width
        AND main.construction = counterbin1.construction
LEFT JOIN
    (
        SELECT
            grade,
            product,
            thickness,
            "length",
            width,
            construction,
            COUNT(*) AS count_row
        FROM
            public.counterbin2
        WHERE
            t_stamp >= :date_from AND t_stamp <= :date_to
        GROUP BY
            grade,
            product,
            thickness,
            "length",
            width,
            construction
    ) counterbin2 ON main.grade = counterbin2.grade
        AND main.product = counterbin2.product
        AND main.thickness = counterbin2.thickness
        AND main."length" = counterbin2."length"
        AND main.width = counterbin2.width
        AND main.construction = counterbin2.construction
LEFT JOIN
    (
        SELECT
            grade,
            product,
            thickness,
            "length",
            width,
            construction,
            COUNT(*) AS count_row
        FROM
            public.counterbin3
        WHERE
            t_stamp >= :date_from AND t_stamp <= :date_to
        GROUP BY
            grade,
            product,
            thickness,
            "length",
            width,
            construction
    ) counterbin3 ON main.grade = counterbin3.grade
        AND main.product = counterbin3.product
        AND main.thickness = counterbin3.thickness
        AND main."length" = counterbin3."length"
        AND main.width = counterbin3.width
        AND main.construction = counterbin3.construction
LEFT JOIN
    (
        SELECT
            grade,
            product,
            thickness,
            "length",
            width,
            construction,
            COUNT(*) AS count_row
        FROM
            public.counterbin4
       	WHERE
            t_stamp >= :date_from AND t_stamp <= :date_to
        GROUP BY
            grade,
            product,
            thickness,
            "length",
            width,
            construction
    ) counterbin4 ON main.grade = counterbin4.grade
        AND main.product = counterbin4.product
        AND main.thickness = counterbin4.thickness
        AND main."length" = counterbin4."length"
        AND main.width = counterbin4.width
        AND main.construction = counterbin4.construction

WHERE	
		(:product = 'ALL' OR main.product = :product)
    	AND (:thickness = 0 OR main.thickness = :thickness)
    	AND (:length = 0 OR main."length" = :length)
    	AND (:grade = 'ALL' OR main.grade = :grade)
        AND (:construction = 0 OR main.construction = :construction)
        AND (:width = 0 OR main.width = :width);
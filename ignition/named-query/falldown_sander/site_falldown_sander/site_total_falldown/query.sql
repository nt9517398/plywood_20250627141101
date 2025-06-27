Select count(*)
FROM public.falldown_sander
where  t_stamp >= :date_from and t_stamp <= :date_to

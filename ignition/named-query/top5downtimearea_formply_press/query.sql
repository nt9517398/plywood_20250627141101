

SELECT sub_area, to_char(start_time::date, 'yyyy/mm/dd') as day,
  sum(duration::decimal) as duration_total
FROM downtime_formply_press
where start_time >= :date_from
  	and end_time <= :date_to
    and start_time::date = end_time::date
    AND downtime_formply_press.fault != 'OS-OVERNIGHT SHUT'
group by to_char(start_time::date, 'yyyy/mm/dd'), sub_area

Order by duration_total desc
limit 10
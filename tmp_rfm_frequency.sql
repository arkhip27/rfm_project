INSERT INTO analysis.tmp_rfm_frequency (user_id, frequency)


select user_id ,
	--count_orders, 
	NTILE(5) OVER (ORDER by count_orders ASC) AS group_number
from (

select
    vu.id user_id,
    count(order_id) count_orders
FROM
    v_orders vo
right join v_users vu 
	on vo.user_id = vu.id and vo.status = 4
	--where date>=01/01/2022  
GROUP BY
    vu.id
) order_date_max

order by group_number desc





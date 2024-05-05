INSERT INTO analysis.tmp_rfm_monetary_value (user_id, monetary_value)


select user_id ,
	--sum_payments, 
	NTILE(5) OVER (ORDER by coalesce(sum_payments, 0,0) ASC) AS group_number
from (

select
    vu.id user_id,
    sum(vo.payment) AS sum_payments
FROM
    v_orders vo
right join v_users vu 
	on vo.user_id = vu.id and vo.status = 4
	--where date>=01/01/2022  
GROUP BY
    vu.id
) order_date_max

order by group_number desc



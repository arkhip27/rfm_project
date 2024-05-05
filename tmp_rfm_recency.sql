insert into analysis.tmp_rfm_recency (user_id, recency) 
select 
  vpu.id, 
  ntile (5) over (
    order by 
      max(coalesce (vpo.order_ts,to_timestamp(0)))
  )
from 
  analysis.view_production_users vpu 
  left join analysis.view_production_orders vpo on vpo.user_id = vpu.id 
  and vpo.status = 4
group by 
  vpu.id
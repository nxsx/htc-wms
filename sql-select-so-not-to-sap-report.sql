select t.so,t.posnr, 
       t.mat_code, 
       c.mat_desc, 
       t.car_no, 
       count(distinct sern) as qty, 
       t.created_by 
from so_barcode_detail t 
left join cd_mat_info c on t.mat_code=c.mat_code 
where t.last_upd between to_date('2015-01-01','yyyy-mm-dd') and to_date('2015-10-01','yyyy-mm-dd') 
and t.itemid is null 
group by t.so,t.mat_code,t.posnr,t.car_no,c.mat_desc,t.created_by 
order by t.so,t.posnr 

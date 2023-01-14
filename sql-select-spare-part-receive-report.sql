select w.plant_code, 
       w.dn_no, 
       w.po_no, 
       w.item_id, 
       w.mat_code, 
       w.mat_desc, 
       w.gr_qty, 
       w.unit_code, 
       w.stor_loc, 
       w.delivery_date, 
       w.vendor_id, 
       w.vendor_name, 
       w.created_by, 
       w.created 
from wms_inreceiveinfo w 
where w.created between to_date('20220101','YYYYMMDD') and to_date('20221231','YYYYMMDD')
and w.stor_loc in ('SP00','SP09')
order by w.plant_code,w.created

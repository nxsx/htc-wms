SELECT b.plant_code || '_' || b.mat_code || '_' || b.vendor_id AS "indexKey", 
       b.mat_code, 
       b.mat_desc, 
       b.unit_code, 
       a.currency, 
       a.vendor_id, 
       a.vendor_name 
FROM wms_inreceiveinfo b 
LEFT JOIN po_detail a ON b.plant_code = a.plant_code 
AND b.po_no = a.po_no AND b.item_id = a.item_id 
WHERE b.plant_code IN ('9771', '9773', '9774') 
AND b.gr_status = 'S' 
AND b.gr_type = 'DN' 
AND b.po_type = 'PO' 
AND TO_CHAR(b.created, 'YYYY') = '2022' 
GROUP BY b.plant_code || '_' || b.mat_code || '_' || b.vendor_id, 
      b.mat_code, 
      b.mat_desc, 
      b.unit_code, 
      a.currency, 
      a.vendor_id, 
      a.vendor_name 
ORDER BY b.plant_code || '_' || b.mat_code || '_' || b.vendor_id 

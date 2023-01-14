SELECT b.plant_code || '_' || b.mat_code || '_' || b.vendor_id AS "indexKey", 
       AVG(a.net_price / a.price_unit) AS "averagePrice", 
       SUM((a.net_price / a.price_unit) * b.gr_qty) AS "sumAmount", 
       SUM(b.gr_qty) AS "sumQuantity" 
FROM wms_inreceiveinfo b 
LEFT JOIN po_detail a ON b.plant_code = a.plant_code 
AND b.po_no = a.po_no AND b.item_id = a.item_id 
WHERE b.plant_code IN ('9771', '9773', '9774') 
AND b.gr_status = 'S' 
AND b.gr_type = 'DN' 
AND b.po_type = 'PO' 
AND TO_CHAR(b.created, 'YYYY-MM') = '2022-12' 
GROUP BY b.plant_code || '_' || b.mat_code || '_' || b.vendor_id 
ORDER BY b.plant_code || '_' || b.mat_code || '_' || b.vendor_id 

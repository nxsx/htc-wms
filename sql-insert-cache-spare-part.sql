SELECT * FROM B_CACHE t WHERE t.row_id LIKE '70036986%' 
--INSERT INTO B_CACHE t(t.row_id,t.order_no,t.item_no,t.material_no,t.material_desp,t.qty,t.finish_qty,t.plant,t.location,t.close,t.unit,t.finish_flag,t.flag,t.create_by,t.create_date,t.modify_by,t.modify_date) 
VALUES('700369860029','REQ20150305','0010','2FB23214057730N','DR RACK RB/GTV105ICYR(CLEAR)SCREEN','5','0','9771','0','0','PC','0','0','70036986',SYSDATE,'70036986',SYSDATE) 

SELECT * FROM B_CACHE t 
--UPDATE B_CACHE t SET t.qty = '55' 
WHERE t.material_no LIKE '2FB23214057730N' 

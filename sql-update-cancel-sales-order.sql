SELECT t.*, t.rowid FROM FG_INOUT t
--UPDATE FG_INOUT t SET t.date_out=NULL,t.out_flag=NULL,t.remark='20130401cancle DN',t.last_upd=sysdate,t.last_upd_by='WH Scan wrong'
WHERE t.plant='9771' AND --t.date_out IS NULL AND t.date_IN IS NOT NULL AND t.order_id IS NOT NULL
t.sern IN ( 
''
)

SELECT t.*, t.rowid FROM SO_BARCODE_DETAIL t
--DELETE FROM SO_BARCODE_DETAIL t
WHERE t.sern IN (
''
)

SELECT t.*, t.rowid FROM SO_DETAIL t 
--UPDATE SO_DETAIL t SET t.fIN_qty=1118
WHERE  t.so IN ('9200248274') AND t.posnr IN ('000010')

SELECT t.dn_doc,t.CNT_BG_CODE,t.*, t.rowid FROM SO_HV_DETAIL t 
--UPDATE SO_HV_DETAIL t SET t.qty=0
WHERE  t.order_id IN ('9200248274') AND t.posnr IN ('000010') AND t.cnt_bg_code IN ('129361','129343','129415','129365')

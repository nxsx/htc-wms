SELECT t.order_no,t.amount,t.barcode_qty,t.produce_amt,t.*, t.rowid FROM T_prd_ORDER t 
--UPDATE T_prd_ORDER t SET t.produce_amt=0 
WHERE t.order_no IN ('050004696501') 

SELECT b.flag,b.*, b.rowid FROM BARCODE_ORDER b 
--UPDATE BARCODE_ORDER b SET b.flag='0' 
WHERE b.order_no IN ('050004696501') AND b.barcode IN ('0060833886A########PRD4S0221'); 

SELECT f.order_id,f.sern,f.offlINe_flag,f.*, f.rowid FROM FG_INOUT f 
--UPDATE FG_INOUT f SET f.order_id='_'||f.order_id,f.sern='_'||f.sern 
WHERE f.order_id IN ('050004696501') AND f.sern IN ('0060833886A########PRD4S0221'); 

SELECT f.order_id,f.sern,f.offlINe_flag,f.*, f.rowid FROM SFG_INOUT f 
--UPDATE SFG_INOUT f SET f.order_id='_'||f.order_id,f.sern='_'||f.sern 
WHERE f.order_id IN ('050004696501') AND f.sern IN ('0060833886A########PRD4S0221'); 

SELECT o.*, o.rowid FROM OFFLINEDC o 
--UPDATE OFFLINEDC o SET o.order_id='_'||o.order_id,o.sap_flag='C',o.remark='20130430_Mistake' 
WHERE --o.sap_flag ='0' --o.order_id like '%_01000067941%';--'%050003665595%' 
o.order_id='050004696501' 

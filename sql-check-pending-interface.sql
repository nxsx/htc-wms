--PP Blackflush 
SELECT t.row_id, t.order_id, t.qty,t.unit, t.* FROM OFFLINEDC t WHERE t.SAP_FLAG = '0' 

--SD GIPost 
SELECT t.* FROM SO_HV_DETAIL t WHERE t.pgi='0' 

--MM GRPost 
SELECT * FROM wms_inreceiveinfo WHERE GR_STATUS='R' AND ACTIVATE_FLAG = '1' AND DELETE_FLAG = '0' 

--MM GIPost 
SELECT * FROM MAT_HV_DETAIL t WHERE t.IF_SAP_NEED = '1' 

--SP Trans311 
SELECT t.if_sap_need, t.hv_amt, t.wkpos_code, t.send_spot, t.* FROM B_HV_DETAIL t WHERE t.IF_SAP_NEED = '1' 

--SP GIPost 
SELECT t.pgi,t.order_id,t.posnr,t.qty,t.unit,t.plant,t.ware_id,t.* FROM B_SO_SAP_SUM t WHERE t.PGI='0' 

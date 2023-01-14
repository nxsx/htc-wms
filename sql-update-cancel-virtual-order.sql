SELECT * FROM t_order_detail t 
--SELECT * FROM mat_hv_detail t 
--UPDATE t_order_detail t SET t.status='no',t.total_hv_amt=0,t.hv_man=NULL,t.remark='Cancel_VirtualOrder',t.last_upd=sysdate,t.last_upd_by='KBIT',if_sap_need='1'
WHERE t.mat_code = '2MK6P111443000N' 
AND t.order_no IN(
'80434876010001'
)

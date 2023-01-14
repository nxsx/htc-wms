SELECT t.send_spot, t.if_sap_need, t.* FROM b_hv_detail t 
--UPDATE b_hv_detail t SET t.send_spot = '0012', t.if_sap_need = '1' 
WHERE t.order_no IN (
'D201503106885'
)

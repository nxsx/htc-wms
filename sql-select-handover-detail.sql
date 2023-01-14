SELECT order_no ||'_'|| mat_code ||'_'|| wkpos_code AS HCHECK, 
       SUM(b.hv_amt) AS total_hv, 
       b.if_sap_need AS incoming 
FROM mat_hv_detail b 
WHERE b.order_no IN(
'040000068938',
'050004306815'
) AND b.if_sap_need = '2' 
GROUP BY order_no,mat_code,wkpos_code,if_sap_need
ORDER BY order_no

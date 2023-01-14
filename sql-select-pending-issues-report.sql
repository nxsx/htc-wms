SELECT p.FACTORY_CODE, 
       w.DEPT, 
       p.ORDER_NO, 
       p.PRODUCT_DATE, 
       p.MAT_CODE, 
       p.MAT_DESC, 
       p.AMOUNT, 
       p.PRODUCE_AMT, 
       d.MAT_CODE, 
       d.MAT_DESC, 
       d.AMOUNT, 
       d.TOTAL_HV_AMT, 
       d.AMOUNT - d.TOTAL_HV_AMT AS DIFF, 
       d.MRP_CODE, 
       d.SEND_SPOT, 
       d.WKPOS_CODE 
FROM T_PRD_ORDER p 
JOIN T_ORDER_DETAIL d ON d.ORDER_NO = p.ORDER_NO 
JOIN CD_MAT_INFO i ON i.MAT_CODE = d.MAT_CODE AND i.PLANT = d.FACTORY_CODE 
LEFT JOIN TMP_WRKPOS w ON w.WKPOS_CODE = d.WKPOS_CODE
WHERE i.MRP <> '000'
AND (
    (p.PRODUCT_DATE >= TO_DATE('2022.12.01', 'yyyy.mm.dd') AND ROUND(p.PRODUCE_AMT*d.UNIT_CONSUME_AMT, 3) > d.TOTAL_HV_AMT)
    OR
    (p.PRODUCT_DATE BETWEEN TO_DATE('2022.12.01', 'yyyy.mm.dd') AND TO_DATE('2022.12.27','yyyy.mm.dd') AND ROUND(p.PRODUCE_AMT*d.UNIT_CONSUME_AMT, 3) = 0)    
    )
AND (d.STATUS <> 'end' OR d.STATUS IS NULL)
AND NOT (d.MAT_CODE LIKE '%PU')
AND NOT (d.MAT_DESC LIKE 'TRIM%')                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
AND NOT (d.MAT_DESC LIKE 'CAB%')
AND NOT (d.MAT_DESC LIKE '%SCRAP%')
ORDER BY p.FACTORY_CODE, w.DEPT, d.MAT_CODE, p.ORDER_NO 

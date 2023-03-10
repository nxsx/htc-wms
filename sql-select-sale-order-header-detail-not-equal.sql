SELECT h.ORDER_ID, h.POSNR, h.MAT_CODE, h.CNT_BG_CODE, h.DN_DOC, 
       SUM(h.QTY) AS QtyHeader, 
       d.QtyDetail 
FROM SO_HV_DETAIL h
LEFT JOIN 
(
    SELECT SO,POSNR,ITEMID,SUM(QTY) AS QtyDetail
    FROM SO_BARCODE_DETAIL     
    GROUP BY SO,POSNR,ITEMID 
) d ON h.ORDER_ID=d.SO AND h.POSNR = d.POSNR AND h.CNT_BG_CODE = d.ITEMID 
WHERE TO_CHAR(h.LAST_UPD, 'yyyy/mm/dd') BETWEEN '2015/02/01' AND '2015/02/28' 
      -- AND h.order_id = '9200147795' AND h.posnr = '000010' -- AND h.CNT_BG_CODE = '104107' 
Group by h.ORDER_ID,h.POSNR,h.MAT_CODE,h.CNT_BG_CODE,h.DN_DOC,d.QtyDetail 
Order by h.ORDER_ID,h.POSNR,h.MAT_CODE,h.CNT_BG_CODE 

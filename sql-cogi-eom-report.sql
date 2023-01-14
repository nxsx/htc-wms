/*
SELECT * FROM COGI
SELECT * FROM TotalHV
SELECT * FROM zgwjj_rec
SELECT * FROM ORDERSAP
SELECT * FROM PendingIssue
SELECT * FROM MatDoc
*/

/*
DELETE FROM COGI
DELETE FROM TotalHV
DELETE FROM zgwjj_rec
DELETE FROM ORDERSAP
DELETE FROM PendingIssue
DELETE FROM MatDoc
*/


SELECT e.[ORDER],e.Material,e.Descr,e.ErrorText,e.Sloc, 
       TotalHV=ISNULL(h.TOTAL_HV_AMT,0), 
       QtyinORDER = o.TargetQty, 
       e.Quantity, 
       PendingIssue = p.Quantity, 
       PendingIssue01 = p.AgingPendding01, 
       PendingIssue02 = p.AgingPendding02, 
       PendingIssue03 = p.AgingPendding03, 
       PendingIssueM03 = p.AgingPenddingM03, 
       PendingIssueTECO = p1.Quantity, 
       PendingIssueMatDoc = mdoc.Quantity, 
       e.EUn, e.MRPC, e.PstngDate, 
       AlreadyIncoming=nxf.Quantity, 
       NoGoods=xf.Quantity 
FROM COGI e (NOlock) 
LEFT JOIN TotalHV h (Nolock) ON h.Hcheck = e.Hcheck 
LEFT JOIN ORDERSAP o (NOlock) ON o.[ORDER] = e.[ORDER] 

--LEFT JOIN
--(
--    SELECT Material, Quantity = SUM(Quantity) 
--    FROM zgwjj_rec (NOlock)
--    WHERE flag = 'X'
--    GROUP BY Material
--) xf ON xf.Material = e.Material
--LEFT JOIN
--(
--    SELECT Material, Quantity = SUM(Quantity) 
--    FROM zgwjj_rec (NOlock)
--    WHERE flag <> 'X' OR flag IS NULL 
--    GROUP BY Material
--) nxf ON nxf.Material = e.Material

LEFT JOIN
(
      SELECT HCheck, Quantity = SUM(Quantity) 
      FROM zgwjj_rec (NOlock)
      WHERE flag = 'X' 
      GROUP BY HCheck
) xf ON xf.HCheck = e.HCheck1 
LEFT JOIN
(
      SELECT HCheck, Quantity = SUM(Quantity) 
      FROM zgwjj_rec (NOlock)
      WHERE flag <> 'X' OR flag IS NULL 
      GROUP BY HCheck
) nxf ON nxf.HCheck=e.HCheck1 
LEFT JOIN
(
      SELECT p.MAT_CODE1, 
      Quantity=SUM(p.Diff), 
      AgingPendding01 = SUM(
                       CASE WHEN datediff(MONTH, 
                         CONVERT(datetime, 
                         substring(product_date,charindex('/',product_date,charindex('/',product_date,1)+1)+1,4) 
                         + '/' + 
                         substring(product_date,charindex('/',product_date,1)+1,(charindex('/',product_date,charindex('/',product_date,1)+1))-(charindex('/',product_date,1)+1)) 
                         + '/' + 
                         substring(product_date,1,charindex('/',product_date,1)-1)
                         ),getdate()
                        ) <= 1 THEN p.Diff ELSE 0 END
                       ), 
      AgingPendding02 = SUM(
                      CASE WHEN datediff(MONTH, 
                        CONVERT(datetime, 
                        substring(product_date,charindex('/',product_date,charindex('/',product_date,1)+1)+1,4) 
                        + '/' + 
                        substring(product_date,charindex('/',product_date,1)+1,(charindex('/',product_date,charindex('/',product_date,1)+1))-(charindex('/',product_date,1)+1))
                        + '/' + 
                        substring(product_date,1,charindex('/',product_date,1)-1)
                        ),getdate()
                       ) = 2 THEN p.Diff ELSE 0 END
                      ), 
      AgingPendding03 = SUM(
                      CASE WHEN datediff(MONTH,
                        CONVERT(datetime,
                        substring(product_date,charindex('/',product_date,charindex('/',product_date,1)+1)+1,4)
                        + '/' +
                        substring(product_date,charindex('/',product_date,1)+1,(charindex('/',product_date,charindex('/',product_date,1)+1))-(charindex('/',product_date,1)+1))
                        + '/' +
                        substring(product_date,1,charindex('/',product_date,1)-1)
                        ),getdate()
                       ) = 3 THEN p.Diff ELSE 0 END
                      ), 
      AgingPenddingM03 = SUM(
                       CASE WHEN datediff(MONTH,
                         CONVERT(datetime,
                         substring(product_date,charindex('/',product_date,charindex('/',product_date,1)+1)+1,4)
                         + '/' +
                         substring(product_date,charindex('/',product_date,1)+1,(charindex('/',product_date,charindex('/',product_date,1)+1))-(charindex('/',product_date,1)+1))
                         + '/' +
                         substring(product_date,1,charindex('/',product_date,1)-1)
                         ),getdate()
                        ) > 3 THEN p.Diff ELSE 0 END
                       )
      FROM PendingIssue p (NOlock)
      INNER JOIN ORDERSAP o (NOlock) ON o.[ORDER] = p.ORDER_NO
      WHERE o.SystemStatus NOT LIKE '%TECO%'
      GROUP BY p.MAT_CODE1
) p ON p.MAT_CODE1 = e.Material
LEFT JOIN
(
      SELECT p.MAT_CODE1,Quantity = SUM(p.Diff) 
      FROM PendingIssue p (NOlock)
      INNER JOIN ORDERSAP o (NOlock) ON o.[ORDER] = p.ORDER_NO
      WHERE o.SystemStatus LIKE '%TECO%'
      GROUP BY p.MAT_CODE1
) p1 ON p1.MAT_CODE1 = e.Material
LEFT JOIN 
(
      SELECT p.MAT_CODE1,Quantity = SUM(p.Diff) 
      FROM MatDoc p (NOlock)
      GROUP BY p.MAT_CODE1
) mdoc ON mdoc.MAT_CODE1  =e.Material
ORDER BY e.Material,e.[ORDER]

SELECT b.prd_line, b.* FROM barcode_order b 
--UPDATE barcode_order b SET b.prd_line = 'UB'
WHERE b.order_no IN(
'050007778973'
)

SELECT s.prd_line, s.* FROM sfg_inout s 
--UPDATE sfg_inout s SET s.prd_line = 'UB' 
WHERE s.order_id IN(
'050007778973'
)

SELECT * FROM loading_plan_code a 
-- DELETE FROM loading_plan_code a WHERE a.row_id = '230372' 
WHERE a.cnt_bg_code = '0023011662-A1387990/0001' 

SELECT * FROM loading_plan_code_temp b 
-- DELETE FROM loading_plan_code_temp b WHERE b.row_id = '202301161709237700' 
WHERE b.cnt_bg_code =  '0023011662-A1387990/0001' 

SELECT * FROM loading_plan_code_dtl c 
-- DELETE FROM loading_plan_code_dtl c WHERE c.row_id = '' 
WHERE c.cnt_bg_code = '0023011662-A1387990/0001'

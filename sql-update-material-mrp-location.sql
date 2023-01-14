SELECT t.mrp, t.stock, t.* FROM cd_mat_info t 
--UPDATE cd_mat_info t SET t.mrp = '029', t.stock = '0014', t.last_upd_by = '70036986', t.last_upd = sysdate 
WHERE t.mat_code IN(
'1813001124N'
)

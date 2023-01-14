SELECT t.norm_qty, t.mrp, t.stock, t.* FROM cd_mat_info t 
--UPDATE cd_mat_info t SET t.norm_qty = '1', t.last_upd_by = '70036986', t.last_upd = sysdate 
WHERE t.mat_code IN(
'0060845027A'
)

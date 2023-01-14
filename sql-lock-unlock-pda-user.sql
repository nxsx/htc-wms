SELECT SUBSTR(u.user_id, 2, 10) AS DUAL_CODE, 
       u.row_id, 
       u.user_id, 
       u.user_pass, 
       u.dept, 
       u.user_desc 
FROM cd_pda_user u 
WHERE SUBSTR(u.user_id, 1, 1) = '_' 
AND u.user_id IN ('70036986', '80007101') 

/* Lock user */
--UPDATE cd_pda_user SET user_id = '_' || user_id WHERE SUBSTR(user_id, 1, 1) <> '_' AND user_id IN ('70036986', '80007101') 

/* Unlock User */
--UPDATE cd_pda_user SET user_id = SUBSTR(user_id, 2, 10) WHERE SUBSTR(user_id, 1, 1) = '_'

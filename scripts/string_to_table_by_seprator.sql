--Input string
WITH input_string AS (SELECT ',India,Netherlands,,Denmark,Italy,Australia,' AS str FROM dual)
SELECT 
seq AS KEY,
substr(str, start_pos, end_pos - start_pos + 1) AS VALUE
FROM (
SELECT 
str,
seq, 
nvl(LAG(comma_pos) OVER (ORDER BY seq) +1,CASE WHEN comma_pos > seq THEN 1 ELSE NULL END)  AS start_pos,
comma_pos -1 AS end_pos
FROM (
SELECT 
str,
ROWNUM AS seq, 
CASE WHEN instr(str,',',1,ROWNUM) = 0 THEN  LENGTH(str)+ 1 ELSE instr(str,',',1,ROWNUM) END AS comma_pos
FROM (SELECT str FROM input_string ) 
CONNECT BY ROWNUM <= (nvl(LENGTH(str),0)- nvl(LENGTH(REPLACE(str,',')),0) + 1)) ORDER BY seq) ORDER BY seq;

/*
OUTPUT:
       KEY VALUE                                       
---------- --------------------------------------------
         1                                             
         2 India                                       
         3 Netherlands                                 
         4                                             
         5 Denmark                                     
         6 Italy                                       
         7 Australia                                   
         8                                             

8 rows selected.
*/


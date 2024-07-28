--Text processing example

COLUMN RESULT FORMAT a20
SELECT nvl(res,str) AS RESULT FROM (
SELECT str,seq,val,len, val||lpad(val,len -1,' ') res FROM (
SELECT str,ROWNUM AS seq, CASE WHEN ROWNUM BETWEEN 2 AND len -1 THEN substr(str, ROWNUM, 1) END AS val, len 
FROM (SELECT 'MALYALAM' AS str, nvl(LENGTH('MALYALAM'),0) AS len FROM dual)
CONNECT BY ROWNUM<=nvl(LENGTH(str),0))
);

/*
Output:

RESULT              
--------------------
MALYALAM
A      A
L      L
Y      Y
A      A
L      L
A      A
MALYALAM

8 rows selected. 
*/


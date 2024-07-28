SET SERVEROUTPUT ON;

DECLARE
    TYPE varchar_array IS
        TABLE OF VARCHAR2(4000);
    data_list varchar_array;
BEGIN
    data_list := varchar_array('','Vietnam', 'India','', 'Indonesia', 'Australia','');
    FOR indx IN 1..data_list.count LOOP
        dbms_output.put_line(indx
                             || ': '
                             || data_list(indx));
    END LOOP;

END;
/

/*
Output:
1: 
2: Vietnam
3: India
4: 
5: Indonesia
6: Australia
7: 


PL/SQL procedure successfully completed.
*/


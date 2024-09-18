SELECT
    stuid, stufname, stulname
FROM
    uni.student
WHERE
    studob < TO_DATE('30/Apr/1992', 'dd/Mon/yyyy')
ORDER BY
    stuid;

SELECT
    to_char(sysdate, 'dd/Mon/yyyy hh24:mi:ss') AS server_date
FROM
    dual;

SELECT
    to_char(sysdate+10/24, 'hh24:mi:ss') AS server_time_plus_10_hrs
FROM
    dual;

 WHERE UPPER(manuf_name) = UPPER('DJI Da-Jiang Innovations')

 WHERE UPPER(emp_fname) like UPPER('Malika') and
       UPPER(emp_lname) = UPPER('Casey')
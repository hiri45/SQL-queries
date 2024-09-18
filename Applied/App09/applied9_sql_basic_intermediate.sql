/*
Databases Applied 09
applied9_sql_basic_intermediate.sql

student id: 32522681
student name: Hirun
applied class number: wednesday 4pm
last modified date: 18/09/2024

*/

/* Part A - Retrieving data from a single table */

-- A1
SELECT
    *
FROM
    uni.student
WHERE
    stuaddress LIKE '%Caulfield'
ORDER BY
    stuid;

-- A2
-- select *
-- from uni.UNIT
-- where

-- A3
SELECT
    stuid,
    stufname,
    stulname,
    stuaddress
FROM
    uni.student
WHERE
    upper(stulname) LIKE upper('S%')
    AND upper(stufname) LIKE upper(('%i'))
ORDER BY
    stuid;

-- A4
SELECT
    unitcode
FROM
    uni.unit,
    uni.enrolment
WHERE
    to_char(enrol_year, 'yyyy') = '2021'
ORDER BY
    unitcode;

-- A5
SELECT
    to_char(ofyear, 'yyyy') AS year,
    unitcode
FROM
    uni.offering
WHERE
    ofsemester = 2
    AND (to_char(ofyear, 'yyyy') = '2019'
    OR to_char(ofyear, 'yyyy') = '2020')
ORDER BY
    year,
    unitcode;

-- A6
SELECT
    STUID,
    UNITCODE,
    ENROL_MARK
FROM
    ENROLMENT
WHERE
 /* Part B - Retrieving data from multiple tables */
 
    -- B1
    -- select *
    -- from uni.OFFERING o join uni.STAFF s using (staffid);
    -- its good to use join on
    SELECT
        UNITCODE,
        OFSEMESTER,
        STAFFFNAME,
        STAFFLNAME
    FROM
        UNI.OFFERING O
        JOIN UNI.STAFF S
        ON O.STAFFID = S.STAFFID
    WHERE
        TO_CHAR(OFYEAR, 'yyyy') = '2021'
    ORDER BY
        OFSEMESTER,
        UNITCODE;

-- B2
SELECT
    e.stuid,
    stufname
    || ''
    || stulname AS studentname,
    unitname
FROM
    uni.student   s
    JOIN uni.enrolment e
    ON s.stuid = e.stuid
    JOIN uni.unit u
    ON u.unitcode = e.unitcode
WHERE
    ofsemester = 1
    AND to_char(ofyear, 'yyyy') = '2021'
ORDER BY
    unitname,
    stuid
 -- B3
    -- B4
    -- B5
    SELECT
        u.unitcode,
        u.unitname,
        p.prerequnitcode AS prereq_unitcode,
        u2.unitname      AS prereq_unitname
    FROM
        uni.unit   u
        JOIN uni.prereq p
        ON p.unitcode = u.unitcode
        JOIN uni.unit u2
        ON p.prerequnitcode = u2.unitcode
    ORDER BY
        u.unitcode,
        p.prerequnitcode;

-- B6


-- B7


-- B8



/* Part C - Aggregate Function, Group By and Having */

-- C1


-- C2


-- C3
SELECT
    unitcode,
    count(prerequnitcode) AS prereq_count
FROM
    uni.prereq
GROUP BY
    unitcode
ORDER BY
    unitcode;

-- C4
SELECT
    unitcode,
    ofsemester,
    count(stuid) AS numof_enrolement
FROM
    uni.enrolment
WHERE
    to_char(ofyear, 'yyyy') = '2019'
GROUP BY
    unitcode,
    ofsemester
ORDER BY
    count(stuid),
    unitcode,
    ofsemester;

-- C5


-- C6


-- C7
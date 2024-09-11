/*
Databases Applied 8
applied8_dml.sql

student id: 32522681
student name: Hirun Hettigoda
last modified date: 11/09/2024

*/

---==INSERT==--
/*1. Write SQL INSERT statements to add the data into the specified tables */
INSERT INTO student VALUES(
    11111111,
    'Bloggs',
    'Fred',
    TO_DATE('01-Jan-2003', 'DD-Mon-YYYY')
);

INSERT INTO student VALUES(
    11111112,
    'Nice',
    'Nick',
    TO_DATE('10-Oct-2004', 'DD-Mon-YYYY')
);

INSERT INTO student VALUES(
    11111113,
    'Wheat',
    'Wendy',
    TO_DATE('05-May-2005', 'DD-Mon-YYYY')
);

INSERT INTO student VALUES(
    11111114,
    'Sheen',
    'Cindy',
    TO_DATE('25-Dec-2004', 'DD-Mon-YYYY')
);

SELECT
    *
FROM
    student;

COMMIT;

INSERT INTO unit VALUES(
    'FIT9999',
    'FIT Last Unit',
    6
);

INSERT INTO unit VALUES(
    'FIT9132',
    'Introduction to Databases',
    6
);

INSERT INTO unit VALUES(
    'FIT9161',
    'Project',
    6
);

INSERT INTO unit VALUES(
    'FIT5111',
    'Student''s Life',
    6
);

SELECT
    *
FROM
    unit;

COMMIT;

INSERT INTO enrolment VALUES(
    11111111,
    'FIT9132',
    2022,
    '1',
    35,
    'N'
);

INSERT INTO enrolment VALUES(
    11111111,
    'FIT9161',
    2022,
    '1',
    61,
    'C'
);

INSERT INTO enrolment VALUES(
    11111111,
    'FIT9132',
    2022,
    '2',
    42,
    'N'
);

INSERT INTO enrolment VALUES(
    11111111,
    'FIT5111',
    2022,
    '2',
    76,
    'D'
);

INSERT INTO enrolment VALUES(
    11111111,
    'FIT9132',
    2023,
    '1',
    NULL,
);

INSERT INTO enrolment VALUES(
    11111112,
    'FIT9132',
    2022,
    '2',
    83,
    'HD'
);

INSERT INTO enrolment VALUES(
    11111112,
    'FIT9161',
    2022,
    '2',
    79,
    'D'
);

INSERT INTO enrolment VALUES(
    11111113,
    'FIT9132',
    2023,
    '1',
    NULL,
    NULL
);

INSERT INTO enrolment VALUES(
    11111113,
    'FIT5111',
    2023,
    '1',
    NULL,
    NULL
);

INSERT INTO enrolment VALUES(
    11111114,
    'FIT9132',
    2023,
    '1',
    NULL,
    NULL
);

INSERT INTO enrolment VALUES(
    11111114,
    'FIT5111',
    2023,
    '1',
    NULL,
    NULL
);
SELECT * from ENROLMENT;
commit;
---==INSERT using SEQUENCEs ==--
/*1. Create a sequence for the STUDENT table called STUDENT_SEQ */
DROP SEQUENCE student_seq;

CREATE SEQUENCE student_seq START WITH 11111115 INCREMENT BY 1;

SELECT
    *
FROM
    cat;

/*2. Add a new student (MICKEY MOUSE) and an enrolment for this student as listed below, 
treat all the data that you add as a single transaction. */
INSERT INTO student VALUES(
    student_seq.NEXTVAL,
    'Mouse',
    'Mickey',
    TO_DATE('01-Jan-1998', 'DD-Mon-YYYY')
);

COMMIT;

SELECT
    *
FROM
    student;

INSERT INTO enrolment VALUES(
    student_seq.CURRVAL,
    'FIT9132',
    2023,
    '1',
    NULL,
    NULL
);

SELECT
    *
FROM
    enrolment;

COMMIT;

---==Advanced INSERT==--
/*1. A new student has started a course. Subsequently this new student needs to enrol into 
Introduction to databases. Enter the new student's details, then insert his/her enrollment 
to the database using the sequence in combination with a SELECT statement. You can 
make up details of the new student and when they will attempt Introduction to databases 
and you may assume there is only one student with such a name in the system.

You must not do a manual lookup to find the unit code of the Introduction to Databases 
and the student number.
 */

---=Creating a table and inserting data as a single SQL statement==--
/*1. Create a table called FIT5111_STUDENT. The table should contain all enrolments for the 
unit FIT5111 */

/*2. Check the table exists */


/*3. List the contents of the table */
SELECT
    *
FROM
    unit
WHERE
    upper(unit_code) = 'FIT9999';

---==8.2.5 UPDATE==--
/*1. Update the unit name of FIT9999 from 'FIT Last Unit' to 'place holder unit'.*/

update UNIT
set UNIT_NAME = 'place holder unit'
    where upper(unit_code) = 'FIT9999';
commit;
select * from unit where upper(UNIT_CODE) = 'FIT9999';

/*2. Enter the mark and grade for the student with the student number of 11111113 
for Introduction to Databases that the student enrolled in semester 1 of 2023. 
The mark is 75 and the grade is D.*/
update ENROLMENT
set ENROL_MARK = 75, ENROL_GRADE = 'D'
where STU_NBR = 11111113 and ENROL_SEMESTER = '1' and ENROL_YEAR = 2023 
and UNIT_CODE = (select UNIT_CODE from unit where upper(UNIT_NAME) = upper('Introduction to Databases'));

select * from ENROLMENT;
commit;
/*3. The university introduced a new grade classification scale. 
The new classification are:
0 - 44 is N
45 - 54 is P1
55 - 64 is P2
65 - 74 is C
75 - 84 is D
85 - 100 is HD
Change the database to reflect the new grade classification scale.
*/


/*4. Due to the new regulation, the Faculty of IT decided to change 'Project' unit code 
from FIT9161 into FIT5161. Change the database to reflect this situation.
Note: you need to disable the FK constraint before you do the modification 
then enable the FK to have it active again.
*/



--==DELETE==--
/*1. A student with student number 11111114 has taken intermission in semester 1 2023, 
hence all the enrolment of this student for semester 1 2023 should be removed. 
Change the database to reflect this situation.*/
select * from ENROLMENT;
delete FROM ENROLMENT
where STU_NBR = 11111114 and ENROL_YEAR = 2023 and ENROL_SEMESTER = '1';

commit;
select * from ENROLMENT;


/*2. The faculty decided to remove all Student's Life unit's enrolments. 
Change the database to reflect this situation.
Note: unit names are unique in the database.*/


/*3. Assume that Wendy Wheat (student number 11111113) has withdrawn from the university. 
Remove her details from the database.*/
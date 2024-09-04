SET ECHO ON
SPOOL applied7_alter_output.txt

drop table course cascade CONSTRAINTS purge;
drop table unit_course cascade constraints purge;

--  Add a new column to the UNIT table which will represent credit points 
--  for the unit (hint use the ALTER command). The credit points for a unit must be 
--  either 3, 6 or 12. The default value should be 6 points.
ALTER TABLE unit ADD(
    unit_credit_points NUMBER(2) default 6 NOT NULL
    CONSTRAINT chk_unit_credit_points CHECK (unit_credit_points in ('3','6','12'))
);
COMMENT ON COLUMN unit.unit_credit_points IS
    'Unit credit points, default 6';

CREATE TABLE course (
    course_code CHAR(5) NOT NULL,
    course_name VARCHAR2(40) NOT NULL,
    course_total_credit NUMBER(3) NOT NULL
);

ALTER TABLE course ADD CONSTRAINT course_pk PRIMARY KEY (course_code);
COMMENT ON COLUMN course.course_code IS
    'course code, primary key';
COMMENT ON COLUMN course.course_name IS
    'course name';
COMMENT ON COLUMN course.course_total_credit IS
    'course total credit points';

CREATE TABLE unit_course (
    course_code CHAR(5) NOT NULL,
    unit_code CHAR(7) NOT NULL
);
ALTER TABLE unit_course ADD CONSTRAINT unit_course_pk PRIMARY KEY (course_code,unit_code);
ALTER TABLE unit_course ADD CONSTRAINT unit_course_unit_fk FOREIGN KEY (unit_code) REFERENCES unit (unit_code);
ALTER TABLE unit_course ADD CONSTRAINT unit_course_course_fk FOREIGN KEY (course_code) REFERENCES course (course_code);

COMMENT ON COLUMN unit_course.course_code IS
    'unit course, course code';
COMMENT ON COLUMN unit_course.unit_code IS
    'unit course unit code';

spool off
set echo off

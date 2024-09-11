drop table CUSTBALANCE cascade constraints purge;

CREATE TABLE CUSTBALANCE (
    cust_id NUMBER(1) NOT NULL,
    cust_bal NUMBER(3) NOT NULL
);

select * from CUSTBALANCE;
SELECT * FROM BOARD;
SELECT * FROM GUESTBOOK;
SELECT * FROM MEMBER;

drop table board;
drop sequence board_no_seq;

CREATE TABLE board
( 
no           NUMBER(8),
title        VARCHAR2(200) NOT NULL,
content      VARCHAR2(4000) NOT NULL,
member_no    NUMBER(8),
member_ID  VARCHAR2(30),
view_cnt     NUMBER(10),
reg_date     DATE NOT NULL
) ;

ALTER TABLE board
ADD ( CONSTRAINT board_no_pk PRIMARY KEY ( no ) );


CREATE SEQUENCE board_no_seq
 START WITH     1
 INCREMENT BY   1
 MAXVALUE       99999999
 NOCACHE
 NOCYCLE;
 
 drop table GUESTBOOK;
drop sequence  GUESTBOOK_NO_SEQ;
 
 
 CREATE TABLE GUESTBOOK (
  NO NUMBER(20) NOT NULL,
  MEMBER_ID VARCHAR2(20) NOT NULL, 
  MESSAGE VARCHAR2(2000) NOT NULL,
  REG_DATE DATE,
  PRIMARY KEY (NO) 
);

CREATE SEQUENCE GUESTBOOK_NO_SEQ
INCREMENT BY 1
START WITH 1
MAXVALUE 9999999
NOCACHE
NOCYCLE;

drop table member;
drop sequence member_no_seq;

CREATE TABLE member
( 
no        NUMBER(8),
name      VARCHAR2(30),
member_id     VARCHAR2(80),
password  VARCHAR2(30),
gender    VARCHAR2(10),
couple_id     VARCHAR2(80)
) ;

ALTER TABLE member
ADD ( CONSTRAINT member_no_pk PRIMARY KEY ( no ) );


CREATE SEQUENCE member_no_seq
 START WITH     1
 INCREMENT BY   1
 MAXVALUE       99999999
 NOCACHE
 NOCYCLE;


 
drop table reply;

drop sequence reply_no_seq;

CREATE TABLE reply
( 
no        NUMBER(8),
content      VARCHAR2(2000) NOT NULL,
member_no     NUMBER(8),
member_id    VARCHAR2(30),
name 		 VARCHAR2(30),	
reg_date     DATE
) ;

ALTER TABLE reply
ADD ( CONSTRAINT reply_no_pk PRIMARY KEY ( no ) );


CREATE SEQUENCE reply_no_seq
 START WITH     1
 INCREMENT BY   1
 MAXVALUE       99999999
 NOCACHE
 NOCYCLE;

 
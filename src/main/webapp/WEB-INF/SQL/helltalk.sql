
/* Drop Tables */

DROP TABLE COMMENTS CASCADE CONSTRAINTS;
DROP TABLE BBS CASCADE CONSTRAINTS;
DROP TABLE CALCHECK CASCADE CONSTRAINTS;
DROP TABLE CALDAILY CASCADE CONSTRAINTS;
DROP TABLE DIET CASCADE CONSTRAINTS;
DROP TABLE EAT CASCADE CONSTRAINTS;
DROP TABLE EXERCISE CASCADE CONSTRAINTS;
DROP TABLE EXERCISEKIND CASCADE CONSTRAINTS;
DROP TABLE FOOD CASCADE CONSTRAINTS;
DROP TABLE FINFO CASCADE CONSTRAINTS;
DROP TABLE MBOOKMARK CASCADE CONSTRAINTS;
DROP TABLE MLIKECOUNT CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE MARKER CASCADE CONSTRAINTS;
DROP TABLE PAYMENT CASCADE CONSTRAINTS;
DROP TABLE SHOPBASKET CASCADE CONSTRAINTS;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;
DROP TABLE RLIKECOUNT CASCADE CONSTRAINTS;
DROP TABLE ROUTINE CASCADE CONSTRAINTS;
DROP TABLE TEACHABLE CASCADE CONSTRAINTS;
DROP TABLE USERS CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE BBS
(
	P_NO number NOT NULL,
	U_NO varchar2(100) NOT NULL,
	P_KIND nvarchar2(10) NOT NULL,
	P_TITLE nvarchar2(100) NOT NULL,
	P_CONTENT nvarchar2(500) NOT NULL,
	P_POSTDATE date DEFAULT SYSDATE,
	P_EDITDATE date DEFAULT SYSDATE,
	P_DELETEDATE date DEFAULT SYSDATE,
	P_RECOMMEND number NOT NULL,
	P_VIEW number NOT NULL,
	P_IMAGE varchar2(4000),
	PRIMARY KEY (P_NO)
);


CREATE TABLE CALCHECK
(
	CALC_NO number NOT NULL,
	U_NO varchar2(100) NOT NULL,
	CALC_CONTENT varchar2(1000) NOT NULL,
	CALC_STARTDATE date DEFAULT SYSDATE,
	CALC_ENDDATE date DEFAULT SYSDATE,
	CALC_COLOR nvarchar2(100) NOT NULL,
	PRIMARY KEY (CALC_NO)
);


CREATE TABLE CALDAILY
(
	CALD_NO number NOT NULL,
	U_NO varchar2(100) NOT NULL,
	CALD_TITLE nvarchar2(100) NOT NULL,
	CALD_CONTENT nvarchar2(1000) NOT NULL,
	CALD_STARTDATE date DEFAULT SYSDATE,
	CALD_COLOR nvarchar2(100) NOT NULL,
	PRIMARY KEY (CALD_NO)
);


CREATE TABLE COMMENTS
(
	C_NO number NOT NULL,
	U_NO varchar2(100) NOT NULL,
	P_NO number NOT NULL,
	C_CONTENT nvarchar2(100) NOT NULL,
	C_POSTDATE date DEFAULT SYSDATE,
	C_EDITDATE date DEFAULT SYSDATE,
	PRIMARY KEY (C_NO)
);


CREATE TABLE DIET
(
	D_NO number NOT NULL,
	EAT_NO number NOT NULL,
	D_DATECOUNT number NOT NULL,
	D_BREAKFAST nvarchar2(50) NOT NULL,
	D_LUNCH nvarchar2(50) NOT NULL,
	D_DINNER nvarchar2(50) NOT NULL,
	D_TOTALKCAL nvarchar2(50) NOT NULL,
	D_DATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (D_NO)
);


CREATE TABLE EAT
(
	EAT_NO number NOT NULL,
	U_NO varchar2(100) NOT NULL,
	FOOD_NO number NOT NULL,
	EAT_NAME nvarchar2(50) NOT NULL,
	EAT_MODE nvarchar2(50) NOT NULL,
	EAT_COUNT number NOT NULL,
	PRIMARY KEY (EAT_NO)
);


CREATE TABLE EXERCISE
(
	E_NO number NOT NULL,
	EK_NO number NOT NULL,
	E_NAME nvarchar2(20) NOT NULL,
	E_EQUIPMENT nvarchar2(20) NOT NULL,
	E_KCAL number NOT NULL,
	E_COUNT number NOT NULL,
	E_DESCRIPTION varchar2(100) NOT NULL,
	E_URL nvarchar2(100) NOT NULL,
	E_TIME number NOT NULL,
	PRIMARY KEY (E_NO)
);


CREATE TABLE EXERCISEKIND
(
	EK_NO number NOT NULL,
	EK_KIND nvarchar2(20),
	PRIMARY KEY (EK_NO)
);


CREATE TABLE FINFO
(
	FINFO_NO number NOT NULL,
	TAN varchar2(30) NOT NULL,
	DAN varchar2(30) NOT NULL,
	FAT varchar2(30) NOT NULL,
	COL varchar2(30) NOT NULL,
	NA varchar2(30) NOT NULL,
	PRIMARY KEY (FINFO_NO)
);


CREATE TABLE FOOD
(
	FOOD_NO number NOT NULL,
	FINFO_NO number NOT NULL,
	FOOD_NAME nvarchar2(50) NOT NULL,
	FOOD_KCAL nvarchar2(50) NOT NULL,
	FOOD_ALLERGY nvarchar2(50) NOT NULL,
	FOOD_COUNT nvarchar2(50) NOT NULL,
	FOOD_INFO varchar2(500) NOT NULL,
	PRIMARY KEY (FOOD_NO)
);


CREATE TABLE MARKER
(
	M_ID varchar2(100) NOT NULL,
	M_KEYWORD nvarchar2(100) NOT NULL,
	M_XCOORD varchar2(20) NOT NULL,
	M_YCOORD varchar2(20) NOT NULL,
	M_PHONENO varchar2(20) NOT NULL,
	M_ADDRESS nvarchar2(100) NOT NULL,
	M_COMMENT nvarchar2(100) NOT NULL,
	M_CATEGORY nvarchar2(100) NOT NULL,
	M_CONTENT nvarchar2(100) NOT NULL,
	M_TRAINER varchar2(100),
	PRIMARY KEY (M_ID)
);


CREATE TABLE MBOOKMARK
(
	U_NO varchar2(100) NOT NULL,
	M_ID varchar2(100) NOT NULL
);


CREATE TABLE MLIKECOUNT
(
	U_NO varchar2(100) NOT NULL,
	M_ID varchar2(100) NOT NULL
);


CREATE TABLE PAYMENT
(
	PD_RECEIPT varchar2(100) NOT NULL,
	U_NO varchar2(100) NOT NULL,
	SB_NO number NOT NULL,
	PD_NAME nvarchar2(50) NOT NULL,
	PD_PRICE varchar2(10) NOT NULL,
	PD_STATUS nvarchar2(10) NOT NULL,
	PD_DATE date DEFAULT SYSDATE,
	PRIMARY KEY (PD_RECEIPT)
);


CREATE TABLE PRODUCT
(
	PRO_NO number NOT NULL,
	PRO_NAME nvarchar2(30) NOT NULL,
	PRO_PRICE varchar2(20) NOT NULL,
	PRO_NOTE nvarchar2(200) NOT NULL,
	PRO_PIC varchar2(5000) NOT NULL,
	PRIMARY KEY (PRO_NO)
);


CREATE TABLE REVIEW
(
	R_NO number NOT NULL,
	M_ID varchar2(100) NOT NULL,
	U_NO varchar2(100) NOT NULL,
	R_CONTENT nvarchar2(200) NOT NULL,
	R_RANK number NOT NULL,
	R_DATE date DEFAULT SYSDATE,
	PRIMARY KEY (R_NO)
);


CREATE TABLE RLIKECOUNT
(
	U_NO varchar2(100) NOT NULL,
	ROUT_NO number NOT NULL
);


CREATE TABLE ROUTINE
(
	ROUT_NO number NOT NULL,
	ROUT_NAME nvarchar2(50) NOT NULL,
	ROUT_LEVEL nvarchar2(10) NOT NULL,
	ROUT_CATEGORY nvarchar2(100) NOT NULL,
	ROUT_EFFECT nvarchar2(100) NOT NULL,
	ROUT_GENDER nvarchar2(10) NOT NULL,
	ROUT_TIME number NOT NULL,
	ROUT_MODE nvarchar2(30) NOT NULL,
	ROUT_STARTDATE date DEFAULT SYSDATE NOT NULL,
	ROUT_ENDDATE date NOT NULL,
	ROUT_DISPLAY nvarchar2(10) NOT NULL,
	DAY1 varchar2(50) NOT NULL,
	DAY2 varchar2(50) NOT NULL,
	DAY3 varchar2(50) NOT NULL,
	DAY4 varchar2(50) NOT NULL,
	DAY5 varchar2(50) NOT NULL,
	DAY6 varchar2(50) NOT NULL,
	DAY7 varchar2(50) NOT NULL,
	PRIMARY KEY (ROUT_NO)
);


CREATE TABLE SHOPBASKET
(
	SB_NO number NOT NULL,
	U_NO varchar2(100) NOT NULL,
	PRO_NO number NOT NULL,
	SB_NOOFPRO number DEFAULT 1,
	PRIMARY KEY (SB_NO)
);


CREATE TABLE TEACHABLE
(
	TM_NO number NOT NULL,
	TH_HREF varchar2(100) NOT NULL,
	PRIMARY KEY (TM_NO)
);


CREATE TABLE USERS
(
	U_NO varchar2(100) NOT NULL,
	U_ID varchar2(40) NOT NULL,
	U_PW varchar2(40) NOT NULL,
	U_NICKNAME nvarchar2(40) NOT NULL,
	U_GENDER number NOT NULL,
	U_PHONENO varchar2(20) NOT NULL,
	U_EMAIL varchar2(100) NOT NULL,
	U_BIRTH varchar2(40) NOT NULL,
	U_HEIGHT varchar2(10) NOT NULL,
	U_WEIGHT varchar2(10) NOT NULL,
	U_ENTERDATE date DEFAULT SYSDATE,
	U_STATUS varchar2(10) NOT NULL,
	U_KIND nvarchar2(10) NOT NULL,
	U_KAKAO number(11),
	PRIMARY KEY (U_NO)
);



/* Create Foreign Keys */

ALTER TABLE COMMENTS
	ADD FOREIGN KEY (P_NO)
	REFERENCES BBS (P_NO)
;


ALTER TABLE DIET
	ADD FOREIGN KEY (EAT_NO)
	REFERENCES EAT (EAT_NO)
;


ALTER TABLE EXERCISE
	ADD FOREIGN KEY (EK_NO)
	REFERENCES EXERCISEKIND (EK_NO)
;


ALTER TABLE FOOD
	ADD FOREIGN KEY (FINFO_NO)
	REFERENCES FINFO (FINFO_NO)
;


ALTER TABLE EAT
	ADD FOREIGN KEY (FOOD_NO)
	REFERENCES FOOD (FOOD_NO)
;


ALTER TABLE MBOOKMARK
	ADD FOREIGN KEY (M_ID)
	REFERENCES MARKER (M_ID)
;


ALTER TABLE MLIKECOUNT
	ADD FOREIGN KEY (M_ID)
	REFERENCES MARKER (M_ID)
;


ALTER TABLE REVIEW
	ADD FOREIGN KEY (M_ID)
	REFERENCES MARKER (M_ID)
;


ALTER TABLE SHOPBASKET
	ADD FOREIGN KEY (PRO_NO)
	REFERENCES PRODUCT (PRO_NO)
;


ALTER TABLE RLIKECOUNT
	ADD FOREIGN KEY (ROUT_NO)
	REFERENCES ROUTINE (ROUT_NO)
;


ALTER TABLE PAYMENT
	ADD FOREIGN KEY (SB_NO)
	REFERENCES SHOPBASKET (SB_NO)
;


ALTER TABLE BBS
	ADD FOREIGN KEY (U_NO)
	REFERENCES USERS (U_NO)
;


ALTER TABLE CALCHECK
	ADD FOREIGN KEY (U_NO)
	REFERENCES USERS (U_NO)
;


ALTER TABLE CALDAILY
	ADD FOREIGN KEY (U_NO)
	REFERENCES USERS (U_NO)
;


ALTER TABLE COMMENTS
	ADD FOREIGN KEY (U_NO)
	REFERENCES USERS (U_NO)
;


ALTER TABLE EAT
	ADD FOREIGN KEY (U_NO)
	REFERENCES USERS (U_NO)
;


ALTER TABLE MBOOKMARK
	ADD FOREIGN KEY (U_NO)
	REFERENCES USERS (U_NO)
;


ALTER TABLE MLIKECOUNT
	ADD FOREIGN KEY (U_NO)
	REFERENCES USERS (U_NO)
;


ALTER TABLE PAYMENT
	ADD FOREIGN KEY (U_NO)
	REFERENCES USERS (U_NO)
;


ALTER TABLE REVIEW
	ADD FOREIGN KEY (U_NO)
	REFERENCES USERS (U_NO)
;


ALTER TABLE RLIKECOUNT
	ADD FOREIGN KEY (U_NO)
	REFERENCES USERS (U_NO)
;


ALTER TABLE SHOPBASKET
	ADD FOREIGN KEY (U_NO)
	REFERENCES USERS (U_NO)
;

CREATE SEQUENCE SEQ_CALCHECKNO
NOCYCLE
NOCACHE
;

CREATE SEQUENCE SEQ_CALDAILYNO
NOCYCLE
NOCACHE
;


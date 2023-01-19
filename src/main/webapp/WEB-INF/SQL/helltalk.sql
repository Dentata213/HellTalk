
/* Drop Tables */

DROP TABLE BLIKECOUNT CASCADE CONSTRAINTS;
DROP TABLE COMMENTS CASCADE CONSTRAINTS;
DROP TABLE BBS CASCADE CONSTRAINTS;
DROP TABLE CALCHECK CASCADE CONSTRAINTS;
DROP TABLE CALDAILY CASCADE CONSTRAINTS;
DROP TABLE CART CASCADE CONSTRAINTS;
DROP TABLE DIET CASCADE CONSTRAINTS;
DROP TABLE EAT CASCADE CONSTRAINTS;
DROP TABLE EATLIST CASCADE CONSTRAINTS;
DROP TABLE EXERCISE CASCADE CONSTRAINTS;
DROP TABLE EXERCISEKIND CASCADE CONSTRAINTS;
DROP TABLE FOOD CASCADE CONSTRAINTS;
DROP TABLE MBOOKMARK CASCADE CONSTRAINTS;
DROP TABLE MLIKECOUNT CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE MARKER CASCADE CONSTRAINTS;
DROP TABLE PAYMENT CASCADE CONSTRAINTS;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;
DROP TABLE QNA CASCADE CONSTRAINTS;
DROP TABLE RLIKECOUNT CASCADE CONSTRAINTS;
DROP TABLE ROUTINE CASCADE CONSTRAINTS;
DROP TABLE TEACHABLE CASCADE CONSTRAINTS;
DROP TABLE USERS CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE BBS
(
	P_NO number NOT NULL,
	U_NO number NOT NULL,
	P_KIND nvarchar2(10) NOT NULL,
	P_CONTENT nvarchar2(500) NOT NULL,
	P_POSTDATE date DEFAULT SYSDATE,
	P_EDITDATE date DEFAULT SYSDATE,
	P_DELETEDATE date DEFAULT SYSDATE,
	P_RECOMMEND number NOT NULL,
	P_VIEW number NOT NULL,
	P_IMAGE varchar2(4000),
	PRIMARY KEY (P_NO)
);


CREATE TABLE BLIKECOUNT
(
	U_NO number NOT NULL,
	P_NO number NOT NULL
);


CREATE TABLE CALCHECK
(
	CALC_NO number NOT NULL,
	U_NO number NOT NULL,
	ROUT_NO number NOT NULL,
	CALC_COLOR nvarchar2(100) NOT NULL,
	CALC_CHECKED nvarchar2(50),
	PRIMARY KEY (CALC_NO)
);


CREATE TABLE CALDAILY
(
	CALD_NO number NOT NULL,
	U_NO number NOT NULL,
	CALD_TITLE nvarchar2(100) NOT NULL,
	CALD_CONTENT nvarchar2(1000) NOT NULL,
	CALD_STARTDATE date DEFAULT SYSDATE,
	CALD_COLOR nvarchar2(100) NOT NULL,
	PRIMARY KEY (CALD_NO)
);


CREATE TABLE CART
(
	CART_NO number NOT NULL,
	U_NO number NOT NULL,
	PRO_NO number NOT NULL,
	CART_QUANTITY number DEFAULT 1,
	PRIMARY KEY (CART_NO)
);


CREATE TABLE COMMENTS
(
	C_NO number NOT NULL,
	U_NO number NOT NULL,
	P_NO number NOT NULL,
	C_CONTENT nvarchar2(100) NOT NULL,
	C_POSTDATE date DEFAULT SYSDATE,
	C_EDITDATE date DEFAULT SYSDATE,
	PRIMARY KEY (C_NO)
);


CREATE TABLE DIET
(
	DIET_NO number NOT NULL,
	EAT_NO number NOT NULL,
	DIET_DATECOUNT number NOT NULL,
	DIET_TOTALKCAL nvarchar2(50) NOT NULL,
	DIET_DATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (DIET_NO)
);


CREATE TABLE EAT
(
	EAT_NO number NOT NULL,
	U_NO number NOT NULL,
	FOOD_NO number NOT NULL,
	EAT_STATUS nvarchar2(50) NOT NULL,
	EAT_COUNT number NOT NULL,
	EATLIST_NO number NOT NULL,
	PRIMARY KEY (EAT_NO)
);


CREATE TABLE EATLIST
(
	EATLIST_NO number NOT NULL,
	FOOD_NO number NOT NULL,
	PRIMARY KEY (EATLIST_NO)
);


CREATE TABLE EXERCISE
(
	E_NO number NOT NULL,
	EK_NO number NOT NULL,
	E_NAME nvarchar2(20) NOT NULL,
	E_EQUIPMENT nvarchar2(20) NOT NULL,
	E_KCAL number NOT NULL,
	E_COUNT number NOT NULL,
	E_DESCRIPTION varchar2(2000) NOT NULL,
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


CREATE TABLE FOOD
(
	FOOD_NO number NOT NULL,
	FOOD_NAME nvarchar2(50) NOT NULL,
	FOOD_MAKER nvarchar2(50) NOT NULL,
	FOOD_SIZE nvarchar2(10) NOT NULL,
	FOOD_KCAL nvarchar2(50) NOT NULL,
	FOOD_TAN varchar2(10),
	FOOD_DAN varchar2(10),
	FOOD_FAT varchar2(10),
	FOOD_COL varchar2(10),
	FOOD_NA varchar2(10),
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
	U_NO number NOT NULL,
	M_ID varchar2(100) NOT NULL
);


CREATE TABLE MLIKECOUNT
(
	U_NO number NOT NULL,
	M_ID varchar2(100) NOT NULL
);


CREATE TABLE PAYMENT
(
	PM_RECEIPT varchar2(100) NOT NULL,
	U_NO number NOT NULL,
	PM_NAME nvarchar2(200) NOT NULL,
	PM_PRICE varchar2(10) NOT NULL,
	PM_STATUS nvarchar2(10) NOT NULL,
	PM_DATE date DEFAULT SYSDATE,
	PRIMARY KEY (PM_RECEIPT)
);


CREATE TABLE PRODUCT
(
	PRO_NO number NOT NULL,
	PRO_NAME nvarchar2(30) NOT NULL,
	PRO_PRICE varchar2(20) NOT NULL,
	PRO_NOTE nvarchar2(200) NOT NULL,
	PRO_IMG clob NOT NULL,
	PRIMARY KEY (PRO_NO)
);


CREATE TABLE QNA
(
	Q_NO number NOT NULL,
	U_NO number NOT NULL,
	Q_TITLE nvarchar2(100) NOT NULL,
	Q_CONTENT nvarchar2(1000) NOT NULL,
	Q_POSTDATE date DEFAULT SYSDATE NOT NULL,
	Q_ADATE date,
	Q_ANSWER nvarchar2(1000),
	Q_VIEW number NOT NULL,
	PRIMARY KEY (Q_NO)
);


CREATE TABLE REVIEW
(
	R_NO number NOT NULL,
	M_ID varchar2(100) NOT NULL,
	U_NO number NOT NULL,
	R_CONTENT nvarchar2(200) NOT NULL,
	R_RANK number NOT NULL,
	R_DATE date DEFAULT SYSDATE,
	PRIMARY KEY (R_NO)
);


CREATE TABLE RLIKECOUNT
(
	U_NO number NOT NULL,
	ROUT_NO number NOT NULL
);


CREATE TABLE ROUTINE
(
	ROUT_NO number NOT NULL,
	U_NO number NOT NULL,
	ROUT_NAME nvarchar2(50) NOT NULL,
	ROUT_CONTENT nvarchar2(1000) NOT NULL,
	ROUT_LEVEL nvarchar2(10) NOT NULL,
	ROUT_EFFECT nvarchar2(100) NOT NULL,
	ROUT_GENDER nvarchar2(10) NOT NULL,
	ROUT_TIME nvarchar2(20) NOT NULL,
	ROUT_MODE nvarchar2(30) NOT NULL,
	ROUT_STARTDATE date DEFAULT SYSDATE NOT NULL,
	ROUT_ENDDATE date NOT NULL,
	ROUT_DISPLAY nvarchar2(10) NOT NULL,
	DAY1 nvarchar2(100),
	DAY2 nvarchar2(100),
	DAY3 nvarchar2(100),
	DAY4 nvarchar2(100),
	DAY5 nvarchar2(100),
	DAY6 nvarchar2(100),
	DAY7 nvarchar2(100),
	PRIMARY KEY (ROUT_NO)
);


CREATE TABLE TEACHABLE
(
	TM_NO number NOT NULL,
	TH_HREF varchar2(100) NOT NULL,
	PRIMARY KEY (TM_NO)
);


CREATE TABLE USERS
(
	U_NO number NOT NULL,
	U_PW varchar2(500) NOT NULL,
	U_NICKNAME nvarchar2(40) NOT NULL,
	U_GENDER varchar2(10) NOT NULL,
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

ALTER TABLE BLIKECOUNT
	ADD FOREIGN KEY (P_NO)
	REFERENCES BBS (P_NO)
;


ALTER TABLE COMMENTS
	ADD FOREIGN KEY (P_NO)
	REFERENCES BBS (P_NO)
;


ALTER TABLE DIET
	ADD FOREIGN KEY (EAT_NO)
	REFERENCES EAT (EAT_NO)
;


ALTER TABLE EAT
	ADD FOREIGN KEY (EATLIST_NO)
	REFERENCES EATLIST (EATLIST_NO)
;


ALTER TABLE EXERCISE
	ADD FOREIGN KEY (EK_NO)
	REFERENCES EXERCISEKIND (EK_NO)
;


ALTER TABLE EAT
	ADD FOREIGN KEY (FOOD_NO)
	REFERENCES FOOD (FOOD_NO)
;


ALTER TABLE EATLIST
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


ALTER TABLE CART
	ADD FOREIGN KEY (PRO_NO)
	REFERENCES PRODUCT (PRO_NO)
;


ALTER TABLE CALCHECK
	ADD FOREIGN KEY (ROUT_NO)
	REFERENCES ROUTINE (ROUT_NO)
;


ALTER TABLE RLIKECOUNT
	ADD FOREIGN KEY (ROUT_NO)
	REFERENCES ROUTINE (ROUT_NO)
;


ALTER TABLE BBS
	ADD FOREIGN KEY (U_NO)
	REFERENCES USERS (U_NO)
;


ALTER TABLE BLIKECOUNT
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


ALTER TABLE CART
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


ALTER TABLE QNA
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


ALTER TABLE ROUTINE
	ADD FOREIGN KEY (U_NO)
	REFERENCES USERS (U_NO)
;

/*복사하고 erm  수정하세요*/
CREATE SEQUENCE SEQ_CALCHECKNO
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_CALDAILYNO
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_CART
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_PRODUCT
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_USERNO
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_exercisekind
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_exercise
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_BBS
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_FOOD
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_ROUTINE
NOCACHE
NOCACHE;



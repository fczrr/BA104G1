
-----讀圖(跑一次)-------------------------------------------------------------
CREATE OR REPLACE  DIRECTORY MEDIA_DIR AS 'C:/DB_photos1/'; 

CREATE OR REPLACE FUNCTION load_blob( myFileName VARCHAR) RETURN BLOB as result BLOB;  
  myBFILE      BFILE;
  myBLOB       BLOB;
BEGIN
    myBFILE := BFILENAME('MEDIA_DIR',myFileName);
    dbms_lob.createtemporary(myBLOB, TRUE);
    dbms_lob.fileopen(myBFILE,dbms_lob.file_readonly);
    dbms_lob.loadfromfile(myBLOB,myBFILE,dbms_lob.getlength(myBFILE) );
    dbms_lob.fileclose(myBFILE);
    RETURN myBLOB;
END load_blob;
-----讀圖(跑一次)-------------------------------------------------------------

--------DROP 檢舉SEQ-------
DROP SEQUENCE SHOPCOM_NO_SEQ;
DROP SEQUENCE HCCOM_NO_SEQ;
DROP SEQUENCE CARCOM_NO_SEQ;
DROP SEQUENCE MEALCOM_NO_SEQ;
--------DROP 檢舉SEQ-------

-------DROP 送餐SEQ--------
DROP SEQUENCE menu_seq;
DROP SEQUENCE mealOrderDetail_seq;
DROP SEQUENCE mealOrder_seq;
DROP SEQUENCE setMeal_seq;
DROP SEQUENCE dish_seq;
-------DROP 送餐 SEQ--------

------DROP 派車SEQ------
DROP SEQUENCE cartype_seq;
DROP SEQUENCE carschedul_seq;
DROP SEQUENCE carorder_seq;
DROP SEQUENCE cardetail_seq;
DROP SEQUENCE vehicle_seq;
------DROP 派車SEQ------
--------DROP 消息SEQ----------
DROP SEQUENCE HEALTHNO_SEQ;
DROP SEQUENCE NEWSNO_SEQ;
DROP SEQUENCE EMPSEVNO_SEQ;
--------DROP 消息SEQ----------

--------DROP 長照SEQ-----
DROP SEQUENCE HC_ORDER_DETAIL_NO_SEQ;
DROP SEQUENCE HC_COMPLAIN_NO_SEQ;
DROP SEQUENCE HC_ORDER_NO_SEQ;
--------DROP 長照SEQ-----

---------DROP 商城SEQ-------------
DROP sequence FORSHOPORDER;
DROP sequence FORSHOPITEM;
DROP sequence FORPROMOTION;
----------DROP 商城SEQ-------------

----------------DROP 會員 員工SEQ----------------
DROP SEQUENCE SEQ_EMPLOYEE;
DROP SEQUENCE SEQ_EMPPHOTONO;
DROP SEQUENCE SEQ_EXPERT;
DROP SEQUENCE SEQ_EMPPNO;
DROP SEQUENCE SEQ_EMPPEMPNO;
DROP SEQUENCE SEQ_MEMBER;
DROP SEQUENCE SEQ_BALANCETOPUPNO;
DROP SEQUENCE SEQ_THECARED;
DROP SEQUENCE SEQ_EMPPEMP_HCID;
DROP SEQUENCE SEQ_EMPPEMP_CARID;
DROP SEQUENCE SEQ_EMPPEMP_PHONE;
DROP SEQUENCE SEQ_EMPPEMP_MAIL;



----------------DROP會員 員工SEQ----------------


---------------------------------DROP 檢舉TABLE------------------------------------- 

DROP TABLE SHOPCOMPLAIN;
DROP TABLE HCCOMPLAIN;
DROP TABLE CARCOMPLAIN;
DROP TABLE MEALCOMPLAIN;
---------------------------------DROP 檢舉TABLE------------------------------------- 

-----------------DROP 消息TABLE----------------
DROP TABLE HEALTHNEWSDETAIL;
DROP TABLE NEWSDETAIL;
DROP TABLE EMPSERVICEDETAIL;
-----------------DROP 消息TABLE----------------

----------------DROP 商城TABLE--------------
DROP TABLE PROMOTIONDETAIL;
DROP TABLE PROMOTION;
DROP TABLE ORDERDETAIL;
DROP TABLE SHOPORDER;
DROP TABLE ShoppingMall;
DROP TABLE CLASSSTYLE;
----------------DROP 商城TABLE--------------

--------DROP 長照TABLE---------------------
DROP TABLE HC_WORKSHIFTS;
DROP TABLE HC_ORDER_DETAIL;
DROP TABLE HC_ORDER_MASTER;
--------DROP 長照TABLE----------------------

--------DROP 送餐TABLE----------------------
DROP TABLE MEAL_ORDER_DETAIL;
DROP TABLE MEAL_ORDER;
DROP TABLE MENU;
DROP TABLE SET_MEAL;
DROP TABLE DISH;
--------DROP 送餐TABLE----------------------


---DROP 派車TABLE-----------
DROP TABLE CAR_SCHEDUL;
DROP TABLE CAR_DETAIL;
DROP TABLE CAR_ORDER;
DROP TABLE VEHICLE;
DROP TABLE CARTYPE;
---DROP 派車TABLE-----------

---DROP 會員 員工TABLE-----------
DROP TABLE BALANCE;
DROP TABLE EMP_PHOTOS;
DROP TABLE BRANCHES;
DROP TABLE THECARED;
DROP TABLE EXPERT;
DROP TABLE EXPERT_LIST;
DROP TABLE EMPLOYEE;
DROP TABLE MEMBER;
---DROP 會員 員工TABLE-----------
------------------------------------------------------------------

--------------------------新增Table-----------------------------------
-------------------------------------------------------------
-------------------------------------------------------------

CREATE SEQUENCE SEQ_EMPLOYEE
START WITH 0001
INCREMENT BY 1;

CREATE SEQUENCE SEQ_EMPPHOTONO
START WITH 0001
INCREMENT BY 1;

CREATE SEQUENCE SEQ_MEMBER
START WITH 0001
INCREMENT BY 1;

CREATE SEQUENCE SEQ_BALANCETOPUPNO
START WITH 0001
INCREMENT BY 1;

CREATE SEQUENCE SEQ_THECARED
START WITH 0001
INCREMENT BY 1;

CREATE SEQUENCE SEQ_EXPERT
START WITH 0001
INCREMENT BY 1;


CREATE SEQUENCE SEQ_EMPPNO
START WITH 001
INCREMENT BY 1;

CREATE SEQUENCE SEQ_EMPPEMPNO
START WITH 001
INCREMENT BY 1;


CREATE SEQUENCE SEQ_EMPPEMP_HCID
START WITH 002
INCREMENT BY 1;

CREATE SEQUENCE SEQ_EMPPEMP_CARID
START WITH 001
INCREMENT BY 1;

CREATE SEQUENCE SEQ_EMPPEMP_PHONE
START WITH 001
INCREMENT BY 1;

CREATE SEQUENCE SEQ_EMPPEMP_MAIL
START WITH 002
INCREMENT BY 1;
-------------------------------------------------------------

CREATE TABLE EMPLOYEE(
	EMP_NO VARCHAR2(10) PRIMARY KEY NOT NULL,
	EMP_NAME VARCHAR2(15) NOT NULL,
	EMP_PHONE VARCHAR2(15) NOT NULL,
	EMP_GENDER VARCHAR2(15) NOT NULL,
	EMP_EMAIL VARCHAR2(30) NOT NULL,
	EMP_DEP VARCHAR2(15) NOT NULL,
	AUTHORITY_NO VARCHAR2(15) NOT NULL,
	EMP_TITLE VARCHAR2(15) NOT NULL,
	ON_BOARD_DATE DATE,
	EMP_ID VARCHAR2(15) NOT NULL,
	EMP_PWD VARCHAR2(15) NOT NULL, 
	EMP_STATUS VARCHAR2(15) DEFAULT 'ON',
	EMP_BRANCHES VARCHAR2(10) NOT NULL,
 	EMP_UPDATE_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '諸葛亮', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M','careU@care.com', '總部', '管理員', '經理', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
'admin00', 'pw0000', '10');



INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '孫尚香', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '貂蟬', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '小喬', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '關銀屏', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '大喬', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '周瑜', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '龐統', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '黃忠', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '趙雲', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '關羽', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '呂布', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '馬超', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '張遼', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '關羽', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '張角', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '袁紹', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '典韋', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '孔融', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '孫皓', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');
--------------派車部(EMP0022~41)------------------

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '李大壬', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '李民浩', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '孔張', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '凜凍旭', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '鄭花甲', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '鄭花明', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '鄭花亮', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '趙萌', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '夏侯淵', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '華雄', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '徐和', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '許昌', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '郭嘉', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '龐德', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '華佗', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '曹曹', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '魏延', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '司馬昭', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '司馬炎', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),4,'0')), '袁紹', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES ('EMP0000', '自動訂單', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M','careUX@care.com', '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
'a00', 'pw0000', '10');

--派車部新增員工的語法(跟原本產生奇怪的衝突)
--INSERT INTO EMPLOYEE VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '張三', '0919123456', 'M','ScottZHolmes@jourrapide.com', '派車', '派車人員', '專員', TO_DATE('2017/02/03 ', 'yyyy/mm/dd '), 'A1234567', 'A1234567','on', '10',CURRENT_TIMESTAMP);
--INSERT INTO EMPLOYEE VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '李四', '0919123123', 'M','JackALong@teleworm.us', '派車', '派車人員', '專員', TO_DATE('2013/05/22 ', 'yyyy/mm/dd '), 'B1234567', 'B1234567','on', '10',CURRENT_TIMESTAMP);
--INSERT INTO EMPLOYEE VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '王五', '0933475532', 'M','JamesGMarsh@jourrapide.com', '派車', '派車人員', '專員', TO_DATE('2014/10/02 ', 'yyyy/mm/dd '), 'C1234567', 'C1234567','on', '10',CURRENT_TIMESTAMP);


----------------------------------------------------------------------------------------


CREATE TABLE EMP_PHOTOS(
	EMP_PHOTO_NO VARCHAR2(10) PRIMARY KEY NOT NULL,
	EMP_NO VARCHAR2(10) NOT NULL,
	EMP_PHOTO BLOB,
  EMP_PHOTO_STATUS VARCHAR2(1)  DEFAULT 'M',
CONSTRAINT FK_EMP_PHOTOS_EMPLOYEE
FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO)
);



INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');

INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');

INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');

INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob(to_char('HC'||LPAD(to_char(SEQ_EMPPNO.NEXTVAL),3,'0')||'.jpg')),'T');

--------------------------------------------------------------------------------------

CREATE TABLE EXPERT_LIST(
	EXP_NO VARCHAR2(10) PRIMARY KEY NOT NULL,
	EXP_NAME VARCHAR2(30),
	EXP_SPEC VARCHAR2(100),
    EXP_PRICE NUMBER(10)
);

INSERT INTO EXPERT_LIST (EXP_NO,EXP_NAME,EXP_SPEC,EXP_PRICE) VALUES ('101','丙級照顧服務員',
'身體照顧,生活照顧,家務處理,緊急及意外事件處理,家庭支持,職業倫理',1200);

INSERT INTO EXPERT_LIST (EXP_NO,EXP_NAME,EXP_SPEC,EXP_PRICE) 
VALUES('102','乙級照顧服務員','身體照顧,生活照顧,家務處理,緊急及意外事件處理,家庭支持,職業倫理',1400);

INSERT INTO EXPERT_LIST (EXP_NO,EXP_NAME,EXP_SPEC,EXP_PRICE)
VALUES('201','普考護士執照', '健康問題之護理評估,預防保護之護理措施,護理指導及諮詢,醫療輔助行為',1600);

INSERT INTO EXPERT_LIST (EXP_NO,EXP_NAME,EXP_SPEC,EXP_PRICE) 
VALUES ('202','高考護理師執照', '健康問題之護理評估,預防保護之護理措施,護理指導及諮詢,醫療輔助行為',1800);

INSERT INTO EXPERT_LIST (EXP_NO,EXP_NAME,EXP_SPEC,EXP_PRICE) 
VALUES ('301','物理治療師', '物理機能修復,儀器治療／徒手治療／運動治療',1800);


---------------------------------------------------------------------------------------

CREATE TABLE EXPERT(
	EXP_OWN VARCHAR2(10) PRIMARY KEY NOT NULL,
	EMP_NO VARCHAR2(10) NOT NULL,
	EXP_NO VARCHAR2(10) NOT NULL,
CONSTRAINT FK_EXPERT_EMPLOYEE
FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO),
CONSTRAINT FK_EXPERT_EXPERT_LIST
FOREIGN KEY(EXP_NO) REFERENCES EXPERT_LIST(EXP_NO)
);

INSERT INTO EXPERT VALUES(to_char('EXP'||LPAD(to_char(SEQ_EXPERT.NEXTVAL),4,'0')),'EMP0002','101');
INSERT INTO EXPERT VALUES(to_char('EXP'||LPAD(to_char(SEQ_EXPERT.NEXTVAL),4,'0')),'EMP0003','102');
INSERT INTO EXPERT VALUES(to_char('EXP'||LPAD(to_char(SEQ_EXPERT.NEXTVAL),4,'0')),'EMP0004','201');
INSERT INTO EXPERT VALUES(to_char('EXP'||LPAD(to_char(SEQ_EXPERT.NEXTVAL),4,'0')),'EMP0005','202');
INSERT INTO EXPERT VALUES(to_char('EXP'||LPAD(to_char(SEQ_EXPERT.NEXTVAL),4,'0')),'EMP0006','101');
INSERT INTO EXPERT VALUES(to_char('EXP'||LPAD(to_char(SEQ_EXPERT.NEXTVAL),4,'0')),'EMP0007','102');
INSERT INTO EXPERT VALUES(to_char('EXP'||LPAD(to_char(SEQ_EXPERT.NEXTVAL),4,'0')),'EMP0008','201');
INSERT INTO EXPERT VALUES(to_char('EXP'||LPAD(to_char(SEQ_EXPERT.NEXTVAL),4,'0')),'EMP0009','202');
INSERT INTO EXPERT VALUES(to_char('EXP'||LPAD(to_char(SEQ_EXPERT.NEXTVAL),4,'0')),'EMP0010','101');
INSERT INTO EXPERT VALUES(to_char('EXP'||LPAD(to_char(SEQ_EXPERT.NEXTVAL),4,'0')),'EMP0011','102');
INSERT INTO EXPERT VALUES(to_char('EXP'||LPAD(to_char(SEQ_EXPERT.NEXTVAL),4,'0')),'EMP0012','201');
INSERT INTO EXPERT VALUES(to_char('EXP'||LPAD(to_char(SEQ_EXPERT.NEXTVAL),4,'0')),'EMP0013','202');
INSERT INTO EXPERT VALUES(to_char('EXP'||LPAD(to_char(SEQ_EXPERT.NEXTVAL),4,'0')),'EMP0014','101');
INSERT INTO EXPERT VALUES(to_char('EXP'||LPAD(to_char(SEQ_EXPERT.NEXTVAL),4,'0')),'EMP0015','102');
INSERT INTO EXPERT VALUES(to_char('EXP'||LPAD(to_char(SEQ_EXPERT.NEXTVAL),4,'0')),'EMP0016','201');
INSERT INTO EXPERT VALUES(to_char('EXP'||LPAD(to_char(SEQ_EXPERT.NEXTVAL),4,'0')),'EMP0017','202');
INSERT INTO EXPERT VALUES(to_char('EXP'||LPAD(to_char(SEQ_EXPERT.NEXTVAL),4,'0')),'EMP0018','101');
INSERT INTO EXPERT VALUES(to_char('EXP'||LPAD(to_char(SEQ_EXPERT.NEXTVAL),4,'0')),'EMP0019','102');
INSERT INTO EXPERT VALUES(to_char('EXP'||LPAD(to_char(SEQ_EXPERT.NEXTVAL),4,'0')),'EMP0020','201');

-------------------------------------------

CREATE TABLE BRANCHES(
	EMP_BRANCHES VARCHAR2(10) PRIMARY KEY NOT NULL,
	BRC_LAT NUMBER(8,5) NOT NULL,
	BRC_LON NUMBER(8,5) NOT NULL,
	BRC_NAME VARCHAR2(15)
);

INSERT INTO BRANCHES (EMP_BRANCHES,BRC_LAT,BRC_LON,BRC_NAME)
VALUES('10',25.04644, 121.51768,'TAIPEI');

INSERT INTO BRANCHES (EMP_BRANCHES,BRC_LAT,BRC_LON,BRC_NAME)
VALUES('20',24.96781, 121.19163,'TAOYUAN');

INSERT INTO BRANCHES (EMP_BRANCHES,BRC_LAT,BRC_LON,BRC_NAME)
VALUES('30',24.13719,120.68675,'TAICHUNG');

INSERT INTO BRANCHES (EMP_BRANCHES,BRC_LAT,BRC_LON,BRC_NAME)
VALUES('40',22.99930,120.21387,'TAINAN');

INSERT INTO BRANCHES (EMP_BRANCHES,BRC_LAT,BRC_LON,BRC_NAME)
VALUES('50',22.63976, 120.30210,'KAOHSIUNG');


----------------------------------



CREATE TABLE MEMBER(
	MEM_NO VARCHAR2(10) PRIMARY KEY NOT NULL,
	MEM_NAME VARCHAR2(15) NOT NULL,
	MEM_PHONE VARCHAR2(10) NOT NULL,
	MEM_GENDER VARCHAR2(15) NOT NULL,
	MEM_EMAIL VARCHAR2(30) NOT NULL,
	ADDRESS CLOB NOT NULL,
	POINT NUMBER(20) DEFAULT 0,
	MEM_ID VARCHAR2(15) NOT NULL,
	MEM_PWD VARCHAR2(15) NOT NULL,
	MEM_SRATUS VARCHAR2(15) DEFAULT'未驗證',
	CHK_IP VARCHAR2(15),
 	MEM_LOGINTIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
　　 　　　
INSERT INTO MEMBER (MEM_NO,MEM_NAME,MEM_PHONE,MEM_GENDER,MEM_EMAIL,ADDRESS, MEM_ID,MEM_PWD,MEM_LOGINTIME,POINT) VALUES
 (to_char('MEM'||LPAD(to_char(SEQ_MEMBER.NEXTVAL),4,'0')),'張飛', '0912000101', 'M','mem01@gmail.com', '桃園市中壢區中大路300號','mem01', 'pw0000',current_timestamp,15000);

INSERT INTO MEMBER (MEM_NO,MEM_NAME,MEM_PHONE,MEM_GENDER,MEM_EMAIL,ADDRESS, MEM_ID,MEM_PWD,MEM_LOGINTIME,POINT) VALUES
 (to_char('MEM'||LPAD(to_char(SEQ_MEMBER.NEXTVAL),4,'0')),'劉備', '0912000102', 'M','mem02@gmail.com', '桃園市中壢區中大路300號','mem02', 'pw0000',current_timestamp,0);

INSERT INTO MEMBER (MEM_NO,MEM_NAME,MEM_PHONE,MEM_GENDER,MEM_EMAIL,ADDRESS, MEM_ID,MEM_PWD,MEM_LOGINTIME,POINT) VALUES
 (to_char('MEM'||LPAD(to_char(SEQ_MEMBER.NEXTVAL),4,'0')),'孫權', '0912000103', 'M','mem03@gmail.com', '桃園市中壢區中大路300號','mem03', 'pw0000',current_timestamp,1000);

INSERT INTO MEMBER (MEM_NO,MEM_NAME,MEM_PHONE,MEM_GENDER,MEM_EMAIL,ADDRESS, MEM_ID,MEM_PWD,MEM_LOGINTIME,POINT) VALUES
 (to_char('MEM'||LPAD(to_char(SEQ_MEMBER.NEXTVAL),4,'0')),'曹操', '0912000104', 'M','mem04@gmail.com', '桃園市中壢區中大路300號','mem04', 'pw0000',current_timestamp,18000);

INSERT INTO MEMBER (MEM_NO,MEM_NAME,MEM_PHONE,MEM_GENDER,MEM_EMAIL,ADDRESS, MEM_ID,MEM_PWD,MEM_LOGINTIME,POINT) VALUES
 (to_char('MEM'||LPAD(to_char(SEQ_MEMBER.NEXTVAL),4,'0')),'張三', '0912000105', 'M','mem05@gmail.com', '桃園市中壢區中大路300號','mem05', 'pw0000',current_timestamp,1500);

INSERT INTO MEMBER (MEM_NO,MEM_NAME,MEM_PHONE,MEM_GENDER,MEM_EMAIL,ADDRESS, MEM_ID,MEM_PWD,MEM_LOGINTIME,POINT) VALUES
 (to_char('MEM'||LPAD(to_char(SEQ_MEMBER.NEXTVAL),4,'0')),'李四', '0912000106', 'M','mem06@gmail.com', '桃園市中壢區中大路300號','mem06', 'pw0000',current_timestamp,3330);

INSERT INTO MEMBER (MEM_NO,MEM_NAME,MEM_PHONE,MEM_GENDER,MEM_EMAIL,ADDRESS, MEM_ID,MEM_PWD,MEM_LOGINTIME,POINT) VALUES
 (to_char('MEM'||LPAD(to_char(SEQ_MEMBER.NEXTVAL),4,'0')),'王五', '0912000107', 'M','mem07@gmail.com', '桃園市中壢區中大路300號','mem07', 'pw0000',current_timestamp,1000);

INSERT INTO MEMBER (MEM_NO,MEM_NAME,MEM_PHONE,MEM_GENDER,MEM_EMAIL,ADDRESS, MEM_ID,MEM_PWD,MEM_LOGINTIME,POINT) VALUES
 (to_char('MEM'||LPAD(to_char(SEQ_MEMBER.NEXTVAL),4,'0')),'趙六', '0912000108', 'M','mem08@gmail.com', '桃園市中壢區中大路300號','mem08', 'pw0000',current_timestamp,18000);

------------------------------------------------------


CREATE TABLE BALANCE(
	TOPUP_NO VARCHAR2(10) PRIMARY KEY NOT NULL,
	MEM_NO VARCHAR2(10) NOT NULL,
	TOPUP_VALUE NUMBER(20) NOT NULL,
	TOPUP_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	TOPUP_WAY VARCHAR2(15) NOT NULL,
	STATUS VARCHAR2(15) DEFAULT 'OK',
CONSTRAINT FK_BALANCE_MEMBER
FOREIGN KEY (MEM_NO) REFERENCES MEMBER(MEM_NO)	
);

INSERT INTO BALANCE(TOPUP_NO, MEM_NO,TOPUP_VALUE,TOPUP_WAY)
VALUES(to_char('TPP'||to_char(sysdate,'yymm')||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),3,'0')),'MEM0001',10000,'CREDIT');


--------------------------------------------------

CREATE TABLE THECARED(
	CARED_NO VARCHAR2(10) PRIMARY KEY NOT NULL,
	MEM_NO VARCHAR2(10) NOT NULL,
	CARED_NAME VARCHAR2(15) NOT NULL,
	CARED_GENDER VARCHAR2(15) NOT NULL,
	KINSHIP VARCHAR2(15) NOT NULL,
	CARED_HEIGHT NUMBER(5) NOT NULL,
	CARED_WEIGHT NUMBER(5) NOT NULL,
	CARED_ADDRESS VARCHAR2(100) NOT NULL,
	CARED_PHONE VARCHAR2(10) NOT NULL,
	CON_STATUS VARCHAR2(30) NOT NULL,
	BIO_STATUS VARCHAR2(30) NOT NULL,
	MODIFY_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT FK_THECARED_MEMBER
FOREIGN KEY (MEM_NO) REFERENCES MEMBER(MEM_NO)
);

INSERT INTO THECARED (CARED_NO,MEM_NO,CARED_NAME,CARED_GENDER,KINSHIP, CARED_HEIGHT,CARED_WEIGHT,CARED_ADDRESS,CARED_PHONE,CON_STATUS,BIO_STATUS)
VALUES(to_char('CRD'||LPAD(to_char(SEQ_THECARED.NEXTVAL),4,'0')), 'MEM0002','劉弘', 'M','父母',170,60, '桃園市平鎮區延平路二段221號','0988001001','輕度','輕度');

INSERT INTO THECARED (CARED_NO,MEM_NO,CARED_NAME,CARED_GENDER,KINSHIP, CARED_HEIGHT,CARED_WEIGHT,CARED_ADDRESS,CARED_PHONE,CON_STATUS,BIO_STATUS)
VALUES(to_char('CRD'||LPAD(to_char(SEQ_THECARED.NEXTVAL),4,'0')),'MEM0002','劉母', 'M','父母',170,60, '桃園市平鎮區延平路二段221號','0988001001','輕度','輕度');

INSERT INTO THECARED (CARED_NO,MEM_NO,CARED_NAME,CARED_GENDER,KINSHIP, CARED_HEIGHT,CARED_WEIGHT,CARED_ADDRESS,CARED_PHONE,CON_STATUS,BIO_STATUS)
VALUES(to_char('CRD'||LPAD(to_char(SEQ_THECARED.NEXTVAL),4,'0')), 'MEM0003','張母吳氏', 'M','父母',170,60, '桃園市平鎮區延平路二段100號','0988001001','輕度','輕度');


COMMIT;




---------------------自增主鍵1(商品編號用)-----------------------------

create sequence FORSHOPITEM
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;

---------------------自增主鍵2(促銷編號用)-----------------------------
create sequence FORPROMOTION
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;

---------------------自增主鍵3(商品訂單專用)-----------------------------
create sequence FORSHOPORDER
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;


-----------------自己假裝會員-----------------------

----------------商品種類----------------------
CREATE TABLE CLASSSTYLE (
CLASSNO      NUMBER(10)  PRIMARY KEY ,
CLASSNAME  VARCHAR2(15) NOT NULL
);

----------------商品種類假資料------------------------------
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (1,'水果');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (2,'肉類');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (3,'魚類');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (4,'蔬菜類');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (5,'保健類');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (6,'食品類');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (7,'藥材類');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (8,'運動器材類');
INSERT INTO CLASSSTYLE(CLASSNO, CLASSNAME)  VALUES (9,'輔助器材類');


----------------商品----------------------
CREATE TABLE ShoppingMall (
ITEMNO      NUMBER(10)      PRIMARY KEY,
STOCK            NUMBER(5) NOT NULL,
PRICE          NUMBER(10),
STATE     NUMBER(2) ,
CLASSNO           NUMBER(10) NOT NULL,
NAME         VARCHAR2(400) NOT NULL,
DES          VARCHAR2(800),
PICTURE1        BLOB,
PICTURE2        BLOB,
PICTURE3        BLOB,
CONSTRAINT FK_CLASSNO  FOREIGN KEY (CLASSNO) REFERENCES CLASSSTYLE(CLASSNO)
);

----------------商品訂單----------------------
CREATE TABLE SHOPORDER (
ORDERNO VARCHAR2(15) PRIMARY KEY,
MEM_NO VARCHAR2(10),
ORDER_DATE TIMESTAMP,
ORDER_STATUS VARCHAR2(3),
CUSTOMER_ADDRESS VARCHAR2(100),
CUSTOMER_phone VARCHAR2(15),
CUSTOMER_NAME VARCHAR2(80),
CONSTRAINT FK_MEMBERNO  FOREIGN KEY (MEM_NO) REFERENCES MEMBER(MEM_NO)
);

----------------商品訂單假資料------------------
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_phone,CUSTOMER_NAME,ORDER_STATUS) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),'MEM0001',TO_DATE('2017/5/5', 'yyyy-mm-dd'),'台北天龍國','0926','連勝文','1');
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_phone,CUSTOMER_NAME,ORDER_STATUS) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),'MEM0002',TO_DATE('2010/4/5', 'yyyy-mm-dd'),'人情台南市','0918','陳水扁','1');
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_phone,CUSTOMER_NAME,ORDER_STATUS) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),'MEM0003',TO_DATE('2013/2/9', 'yyyy-mm-dd'),'人情台南市','0800','陳志中','1');
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_phone,CUSTOMER_NAME,ORDER_STATUS) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),'MEM0004',TO_DATE('1950/4/5', 'yyyy-mm-dd'),'台北天龍國','0987','蔡英文','1');
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_phone,CUSTOMER_NAME,ORDER_STATUS) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),'MEM0004',TO_DATE('1966/12/5', 'yyyy-mm-dd'),'台北天龍國','0926','馬英九','1');

INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_phone,CUSTOMER_NAME,ORDER_STATUS) 
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),'MEM0001',TO_DATE('1960/5/5', 'yyyy-mm-dd'),'熱情屏東市','0926','李登輝','1');

INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_phone,CUSTOMER_NAME,ORDER_STATUS) 
VALUES('20171026-000001','MEM0001',TO_DATE('1960/5/5', 'yyyy-mm-dd'),'熱情屏東市','0926789123','張飛','1');

INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_phone,CUSTOMER_NAME,ORDER_STATUS) 
VALUES('20171026-000002','MEM0002',TO_DATE('1960/5/5', 'yyyy-mm-dd'),'熱情屏東市','0926789123','劉備','1');
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_phone,CUSTOMER_NAME,ORDER_STATUS) 
VALUES('20171026-000003','MEM0003',TO_DATE('1960/5/6', 'yyyy-mm-dd'),'熱情屏東市','0920000123','孫權','1');
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_phone,CUSTOMER_NAME,ORDER_STATUS) 
VALUES('20171026-000004','MEM0004',TO_DATE('1960/5/7', 'yyyy-mm-dd'),'熱情屏東市','0926342145','曹操','1');


----------------促銷專案----------------------
CREATE TABLE PROMOTION (
PROMOTIONNO  NUMBER(10)  PRIMARY KEY,
NAME  VARCHAR2(45),
BEGINDATE DATE,
ENDDATE DATE
);

----------------促銷明細----------------------
CREATE TABLE PROMOTIONDETAIL (
PROMOTIONNO  NUMBER(10)  ,
ITEMNO           NUMBER(10),
PRICE          NUMBER(10),
constraint PR_SUPPLIER_EX_PK primary key(PROMOTIONNO, ITEMNO),
CONSTRAINT FK_PROMOTIONNO  FOREIGN KEY (PROMOTIONNO) REFERENCES PROMOTION(PROMOTIONNO),
CONSTRAINT FK_CLASSNOS  FOREIGN KEY (ITEMNO) REFERENCES ShoppingMall (ITEMNO)
);

----------------訂單明細----------------------
CREATE TABLE ORDERDETAIL (
ORDERNO      VARCHAR2(15) ,--20171023修改過--
ITEMNO         NUMBER(10),
ORDERCOUNT NUMBER(5),
constraint PR_SUPPLIER_EX_OR primary key(ORDERNO, ITEMNO),
CONSTRAINT FK_ORDERNO  FOREIGN KEY (ORDERNO) REFERENCES SHOPORDER(ORDERNO),
CONSTRAINT FK_NAME  FOREIGN KEY (ITEMNO) REFERENCES ShoppingMall(ITEMNO)
);
--------------------------商城商品假資料-----------------------------
INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,10,499,1,1,'【Daiwa】日本製通用輔助筷','長輩年紀漸長，手指力量退化，或者因為中風無法用慣用手執起筷子進食，樂齡網推薦此款筷子，可以讓其更容易自行進食而無需人餵食。連用不慣筷子的外國人亦可輕易使用本筷子而享用美食佳餚。');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,20,350,1,1,'【Forsound】第三代防痔型凝膠坐墊','很多年長者皆有排便不順的困擾，「有痔難伸」更是很多年長者的共同問題，有沒有一個好的座墊可以減輕坐下時的不便呢?樂齡網為您介紹一款外銷德、日的新專利減壓坐墊，特殊的造型及SGEL凝膠與人體工學的結合，讓您從此不再如坐針氈。');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,299,1,1,'Hi-Bone雙模式(骨傳導+空氣傳導)高感度耳機','您有多久沒有聽到優美的音樂? 家中是否有長者還不到要配戴助聽器，但是與人溝通不僅旁人要用較大的音量，而自己本身也聽的很辛苦，在溝通不良的狀況下，往往因此讓老人家逐漸封閉。');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,199,1,1,'日本製室內帽','樂齡族長時間待在冷氣房內或者外出寒流來襲，一定要注意頭部的保暖，稍一不慎就會受涼。樂齡網推薦一款日本製的室內帽，可有效保持頭部溫暖，對於髮量稀少或有掉髮困擾的銀髮族有也遮掩的效果。');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,899,1,1,'眼鏡式放大鏡 2.3倍','隨著年齡增長，視力越來越模糊不清，這時需要一個不占用雙手的放大鏡來閱讀或工作，此款商品將是您的最佳選擇。戴眼鏡或老花眼鏡也可再戴上此放大鏡，不用再一手拿著放大鏡，一手拿著書。用雙眼看，視野更開闊!');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'【LifePlus】開門式無障礙浴缸','家中長輩是不是很久沒有享受泡澡的幸福滋味? 一想到要腳跨過那高起的浴缸壁，便讓長輩打消泡澡的念頭。
※本產品價格不含安裝施工費用');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'【NISHIKI】女用防漏安心褲 - 吸水量150cc (輕失禁適用)','您有因為大笑、咳嗽或提重物，有不自主的漏尿情形嗎? 是否需要墊個護墊或衛生紙才敢外出? 其實熟年女性的漏尿情形是一個很普遍的現象，根據國民健康局96年調查，國人54歲以上女性每4位婦女中，就有1位有尿失禁困擾，65歲以上女性更是高達1/3，由於國人較為保守，大部分皆隱忍日常生活中因尿失禁的困擾。 樂齡網推薦您一款由日本手工精製，針對輕失禁婦女所設計的防漏內褲，吸水、消臭又輕薄，讓您隨時保持清爽，生活品質得以改善。');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'【SWANY】Walking Bag 134 復古風行李箱 (咖啡色)','日本行李箱大廠 - SWANY專為熟齡族群所設計的日用行李箱《Walking Bag》，符合人體工學，特殊的滑輪軸承設計超靜音，可360度旋轉，任意變換行走方向，無須上潤滑油即可保持 輪子的平順無聲。
可分離式的超輕量包，行李箱可變身為手提包，讓您到處趴趴走，不用擔心厚重的行李讓您的手臂過度疲勞。休息是為了走更長遠的路。可以讓您更省力，讓您雲遊四海無負擔!');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'樂齡室內福祉拖鞋','一般室內平底拖鞋由於整個鞋底機觸地面，容易造成跌倒。選購舒適的防跌、防滑鞋是老人做好居家防護的首選。為迎接高齡化社會的來臨，本公司自日本引進專為銀髮族人士設計的”福祉室內鞋”。造福年長者，創造健康舒適的家居生活。');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'【+VENTURE】多功能長效型速配鼎熱敷墊(未滅菌)家用型KB-243','衛字核可字號：衛部醫器製壹字第005451號');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'【Mr. Pad】超柔軟記憶泡棉地墊 40X60cm','冬天快來了，長者下床若能踏在溫暖止滑的地墊，不僅防止夜晚燈光微弱滑倒的風險，而且也可防止足部血管突然緊縮的風險。
本地墊質感豐厚，給予雙腳溫柔的呵護，適用於浴室門口、廚房、玄關，茶几旁；產品使用SBR防滑底面加強止滑，不易滑動，結實耐用不掉毛，可搭配洗衣網洗滌，清洗方法簡單又省時，讓您對它愛不釋手喔~');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'SHIMA銀髮族購物散步車，10/5-10/31買就送五段調高傘，送完為止!','由日本老人車製造大廠 - 島製作所，專為銀髮族而設計的購物散步車，方便銀髮族外出購物，到超市只要將菜藍放在車上即可開始購物，買完了放在本車的置物藍中，即可將購買物品推回家，不用提重物，走累了還可坐下休息。
無論您是要公園散步、逛街購物，還是要休閒運動都方便、省力及及安全，是一項非常貼心的銀髮族商品。');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'【Famica】睡眠專用床護欄','有些銀髮長者由於各種因素，從床上起身或躺下時常會感到很吃力，現在有了這一款床邊護欄，除了為長輩的睡眠安全加分，起身時可以更輕鬆了，讓老人家從床上起身更加有支撐力。');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'【Ryka】RKF1272M1600女用健走鞋','你也是個喜愛休閒健走，到處趴趴造的銀髮族嗎？
運動是維持活力的最佳妙方，但如何挑選一雙避免運動傷害的鞋子可是非常重要的。
尤其對於長者來說，寬楦不束縛、避震緩衝等等，都是挑選的重點。
樂齡網推薦此款【Ryka】健走休閒鞋！');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'【來可】側邊馬桶起身扶手','對於有些長輩來說，由於膝蓋、腰部的退化無力，要從馬桶站起來是相當辛苦的，而且在這顛沛起身的過程當中，不須安裝，直接擺放在廁所馬桶側邊，讓長輩要站起來時有所依靠，您貼心、他(她)窩心、全家都放心！');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'日本GREEN BELL腳指甲專用指甲剪','幫老人家剪腳指甲是不是很困難?

年長者由於細胞的新陳代新及再生能力退化，構成指甲的角質層的代謝也會減慢，導致角質層加厚，指甲變的堅硬難剪，尤其腳指甲若沒有泡軟，真的很難剪。 日本專業指甲剪大廠-GREEN BELL，便因此而開發了一系列專為厚指甲、變形指甲而設計的指甲剪，無論是自用或要幫老人家剪腳指甲皆方便多了。');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'【KeyCatch】磁力收納器','家裡大小事如麻，總是忘記鑰匙放在哪？
年長記憶力退化，緊急時刻就是找不到

推薦給您極簡收納的最佳方案【KeyCatch】磁力收納器
只要三秒鐘黏貼，家中任何平滑表面皆能收納，帶給您無限便利！');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'【MOTORIZED】活力手足健身機 (可正反轉)','銀髮族若能長期保持運動習慣，必會對身心產生極大的助益，本健身器可坐臥兩用，手腳皆可運動。 不用出力，本健身器會以電動的方式帶動您的手腳活動，讓您輕鬆自在達到運動效果。');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'相片輔記助聽電話','電話聽不清楚嗎? 怕記不住電話嗎? 按鍵太小看不清嗎? 不用擔心，本電話一次解決您所有問題!!!孝親最佳贈禮!');

INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES)  
VALUES (FORSHOPITEM.Nextval,50,100,1,1,'SHIMA銀髮族購物散步車，10/5-10/31買就送五段調高傘，送完為止!','由日本老人車製造大廠 - 島製作所，專為銀髮族而設計的購物散步車，方便銀髮族外出購物，到超市只要將菜藍放在車上即可開始購物，買完了放在本車的置物藍中，即可將購買物品推回家，不用提重物，走累了還可坐下休息。
');
--
--INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES,PICTURE1,PICTURE2,PICTURE3)  
--VALUES (FORSHOPITEM.Nextval,50,100,1,1,'鐵牛運功散2','強身健體2',?,?,?);

----------------商品訂單明細假資料(未來購物車新增以此方法為基底)------------------------------

INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000001',6,'0'),1,15);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000001',6,'0'),5,4);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000001',6,'0'),3,5);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000001',6,'0'),2,2);

INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000002',6,'0'),1,7);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000002',6,'0'),5,5);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000002',6,'0'),6,1);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000002',6,'0'),3,1);

INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000003',6,'0'),1,5);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000003',6,'0'),2,7);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000003',6,'0'),3,9);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000003',6,'0'),4,10);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000003',6,'0'),5,15);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000003',6,'0'),6,20);

INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000004',6,'0'),3,1);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000004',6,'0'),5,1);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000004',6,'0'),7,1);

INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000005',6,'0'),4,1);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000005',6,'0'),7,5);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000005',6,'0'),2,10);

INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000006',6,'0'),4,5);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000006',6,'0'),7,7);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD('000006',6,'0'),2,2);

INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES('20171026-000001',1,6);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES('20171026-000001',2,4);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES('20171026-000001',3,3);

INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES('20171026-000002',1,5);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES('20171026-000002',2,1);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES('20171026-000002',3,2);

INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES('20171026-000003',1,1);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES('20171026-000003',2,2);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES('20171026-000003',3,1);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES('20171026-000003',7,1);

INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES('20171026-000004',7,2);
INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES('20171026-000004',10,6);

INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_phone,CUSTOMER_NAME,ORDER_STATUS) 
VALUES('20171026-000002','MEM0001',TO_DATE('1960/5/5', 'yyyy-mm-dd'),'熱情屏東市','0926789123','張飛','1');
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_phone,CUSTOMER_NAME,ORDER_STATUS) 
VALUES('20171026-000003','MEM0002',TO_DATE('1960/5/6', 'yyyy-mm-dd'),'熱情屏東市','0920000123','劉備','1');
INSERT INTO SHOPORDER(ORDERNO,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_phone,CUSTOMER_NAME,ORDER_STATUS) 
VALUES('20171026-000004','MEM0003',TO_DATE('1960/5/7', 'yyyy-mm-dd'),'熱情屏東市','0926342145','孫權','1');


--------------------------促銷專案假資料------------------------------
INSERT INTO PROMOTION (PROMOTIONNO,NAME,BEGINDATE,ENDDATE) 
VALUES(1,'1月活動',TO_DATE('2017/1/1', 'yyyy-mm-dd'),TO_DATE('2017/1/30', 'yyyy-mm-dd'));

INSERT INTO PROMOTION (PROMOTIONNO,NAME,BEGINDATE,ENDDATE) 
VALUES(2,'2月活動',TO_DATE('2017/2/1', 'yyyy-mm-dd'),TO_DATE('2017/2/28', 'yyyy-mm-dd'));

INSERT INTO PROMOTION (PROMOTIONNO,NAME,BEGINDATE,ENDDATE) 
VALUES(3,'3月活動',TO_DATE('2017/3/1', 'yyyy-mm-dd'),TO_DATE('2017/3/30', 'yyyy-mm-dd'));

INSERT INTO PROMOTION (PROMOTIONNO,NAME,BEGINDATE,ENDDATE) 
VALUES(4,'4月活動',TO_DATE('2017/4/1', 'yyyy-mm-dd'),TO_DATE('2017/4/30', 'yyyy-mm-dd'));

INSERT INTO PROMOTION (PROMOTIONNO,NAME,BEGINDATE,ENDDATE) 
VALUES(5,'5月活動',TO_DATE('2017/5/1', 'yyyy-mm-dd'),TO_DATE('2017/5/30', 'yyyy-mm-dd'));

INSERT INTO PROMOTION (PROMOTIONNO,NAME,BEGINDATE,ENDDATE) 
VALUES(6,'6月活動',TO_DATE('2017/6/1', 'yyyy-mm-dd'),TO_DATE('2017/6/30', 'yyyy-mm-dd'));

INSERT INTO PROMOTION (PROMOTIONNO,NAME,BEGINDATE,ENDDATE) 
VALUES(7,'7月活動',TO_DATE('2017/7/1', 'yyyy-mm-dd'),TO_DATE('2017/7/30', 'yyyy-mm-dd'));

INSERT INTO PROMOTION (PROMOTIONNO,NAME,BEGINDATE,ENDDATE) 
VALUES(8,'8月活動',TO_DATE('2017/8/1', 'yyyy-mm-dd'),TO_DATE('2017/8/30', 'yyyy-mm-dd'));

INSERT INTO PROMOTION (PROMOTIONNO,NAME,BEGINDATE,ENDDATE) 
VALUES(9,'9月活動',TO_DATE('2017/9/1', 'yyyy-mm-dd'),TO_DATE('2017/9/30', 'yyyy-mm-dd'));

INSERT INTO PROMOTION (PROMOTIONNO,NAME,BEGINDATE,ENDDATE) 
VALUES(10,'10月活動',TO_DATE('2017/10/1', 'yyyy-mm-dd'),TO_DATE('2017/10/30', 'yyyy-mm-dd'));

INSERT INTO PROMOTION (PROMOTIONNO,NAME,BEGINDATE,ENDDATE) 
VALUES(11,'11月活動',TO_DATE('2017/11/1', 'yyyy-mm-dd'),TO_DATE('2017/11/30', 'yyyy-mm-dd'));

INSERT INTO PROMOTION (PROMOTIONNO,NAME,BEGINDATE,ENDDATE) 
VALUES(12,'12月活動',TO_DATE('2017/12/1', 'yyyy-mm-dd'),TO_DATE('2017/12/30', 'yyyy-mm-dd'));

-------------------------------促銷專案明細資料-----------------------------------------------
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(11,1,100);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(11,2,200);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(11,3,250);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(11,4,280);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(11,5,280);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(12,5,299);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(12,6,299);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(12,7,150);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(12,8,180);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(12,9,190);
INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(12,10,149);


COMMIT;
--------CREATE 長照SEQ-----
CREATE SEQUENCE HC_ORDER_NO_SEQ
INCREMENT BY 1
START WITH 500001
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE HC_ORDER_DETAIL_NO_SEQ
INCREMENT BY 1
START WITH 600001
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE HC_COMPLAIN_NO_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

--------CREATE 長照SEQ-----

---------員工班表-------------------------------------------------------------------------------------------------------

CREATE TABLE HC_WORKSHIFTS(
MONTH_OF_YEAR VARCHAR2(5) ,
EMP_NO VARCHAR2(10) ,
WORK_SHIFT_STATUS VARCHAR2(279),
TOTAL_WORK_SHIFTS NUMBER(3,0),
PRIMARY KEY (MONTH_OF_YEAR,EMP_NO),
CONSTRAINT FK_EMP_NO1 FOREIGN KEY (EMP_NO) REFERENCES EMPLOYEE (EMP_NO)
);


INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10610,'EMP0002','早空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空',0);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10610,'EMP0003','早空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空',0);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10610,'EMP0004','早空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空',0);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10610,'EMP0005','早空空早空空早空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空',0);




--INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
--VALUES(10611,'EMP0001','早中空早中空早中空早中空早中空早中空早中空早中空早中空早中空早中空早中空早中空早中空早中空早中空早中空早中空早中空早中空早中空早中空休休休休休休休休休休休休休休休休休休休休休休休休休休休',44);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10611,'EMP0002','空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空',0);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10611,'EMP0003','空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空',0);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10611,'EMP0004','空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空',0);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10611,'EMP0005','空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空',0);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10611,'EMP0006','空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空',0);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10611,'EMP0007','空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空',0);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10611,'EMP0008','空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空',0);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10611,'EMP0009','空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空',0);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10611,'EMP0010','空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空',0);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10611,'EMP0011','空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空',0);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10611,'EMP0012','空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空',0);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10611,'EMP0013','空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空',0);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10611,'EMP0014','空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空',0);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10611,'EMP0015','空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空',0);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10611,'EMP0016','空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空',0);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10611,'EMP0017','空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空',0);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10611,'EMP0018','空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空',0);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10611,'EMP0019','空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空',0);
INSERT INTO HC_WORKSHIFTS(MONTH_OF_YEAR,EMP_NO,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS) 
VALUES(10611,'EMP0020','空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空空',0);

CREATE TABLE HC_ORDER_MASTER (
ORDER_NO VARCHAR2(15) PRIMARY KEY,
MEM_NO VARCHAR2(10),
ORDER_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
CARED_NO VARCHAR2(10),
ORDER_STATUS VARCHAR2(15),
CONSTRAINT FK_MEM_NO FOREIGN KEY (MEM_NO) REFERENCES MEMBER (MEM_NO),
CONSTRAINT FK_CARED_NO FOREIGN KEY (CARED_NO) REFERENCES THECARED (CARED_NO)
);


commit;

INSERT INTO HC_ORDER_MASTER (ORDER_NO,MEM_NO,ORDER_DATE,CARED_NO,ORDER_STATUS)
VALUES('20171001'||'-'||LPAD(HC_ORDER_NO_SEQ.NEXTVAL,6,'0'),'MEM0002',to_date('2017/10/01','yyyy/mm/dd'),'CRD0001','已完成');
INSERT INTO HC_ORDER_MASTER (ORDER_NO,MEM_NO,ORDER_DATE,CARED_NO,ORDER_STATUS)
VALUES('20171001'||'-'||LPAD(HC_ORDER_NO_SEQ.NEXTVAL,6,'0'),'MEM0002',to_date('2017/10/01','yyyy/mm/dd'),'CRD0002','已完成');
INSERT INTO HC_ORDER_MASTER (ORDER_NO,MEM_NO,ORDER_DATE,CARED_NO,ORDER_STATUS)
VALUES('20171001'||'-'||LPAD(HC_ORDER_NO_SEQ.NEXTVAL,6,'0'),'MEM0002',to_date('2017/10/01','yyyy/mm/dd'),'CRD0001','已完成');
INSERT INTO HC_ORDER_MASTER (ORDER_NO,MEM_NO,ORDER_DATE,CARED_NO,ORDER_STATUS)
VALUES('20171001'||'-'||LPAD(HC_ORDER_NO_SEQ.NEXTVAL,6,'0'),'MEM0002',to_date('2017/10/01','yyyy/mm/dd'),'CRD0002','已完成');
--INSERT INTO HC_ORDER_MASTER (ORDER_NO,MEM_NO,ORDER_DATE,CARED_NO,ORDER_STATUS)
--VALUES(TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD(HC_ORDER_NO_SEQ.NEXTVAL,6,'0'),'MEM0003',CURRENT_TIMESTAMP,'CRD0003','已取消');

commit;

CREATE TABLE HC_ORDER_DETAIL (
ORDER_DETAIL_NO VARCHAR2 (15) PRIMARY KEY,
ORDER_NO VARCHAR2(15),
SERVICE_DATE DATE,
SERVICE_TIME VARCHAR2(15),
EMP_NO VARCHAR2(7),
ORDER_DEDIAL_STATUS VARCHAR2(15),
CONSTRAINT FK_ORDER_NO1 FOREIGN KEY (ORDER_NO) REFERENCES HC_ORDER_MASTER (ORDER_NO),
CONSTRAINT FK_EMP_NO2 FOREIGN KEY (EMP_NO) REFERENCES EMPLOYEE (EMP_NO),
constraint CSTNT_HC_ORDER_DETAIL unique (ORDER_NO, SERVICE_DATE, SERVICE_TIME,EMP_NO)
);




INSERT  INTO HC_ORDER_DETAIL (ORDER_DETAIL_NO,ORDER_NO,SERVICE_DATE,SERVICE_TIME,EMP_NO,ORDER_DEDIAL_STATUS)
VALUES('20171001'||'-'||LPAD(HC_ORDER_DETAIL_NO_SEQ.NEXTVAL,6,'0'),'20171001-500001',to_date('2017/10/01','yyyy/mm/dd'),'早','EMP0002','已完成');
INSERT  INTO HC_ORDER_DETAIL (ORDER_DETAIL_NO,ORDER_NO,SERVICE_DATE,SERVICE_TIME,EMP_NO,ORDER_DEDIAL_STATUS)
VALUES('20171001'||'-'||LPAD(HC_ORDER_DETAIL_NO_SEQ.NEXTVAL,6,'0'),'20171001-500002',to_date('2017/10/01','yyyy/mm/dd'),'早','EMP0003','已完成');
INSERT  INTO HC_ORDER_DETAIL (ORDER_DETAIL_NO,ORDER_NO,SERVICE_DATE,SERVICE_TIME,EMP_NO,ORDER_DEDIAL_STATUS)
VALUES('20171001'||'-'||LPAD(HC_ORDER_DETAIL_NO_SEQ.NEXTVAL,6,'0'),'20171001-500003',to_date('2017/10/01','yyyy/mm/dd'),'早','EMP0004','已完成');
INSERT  INTO HC_ORDER_DETAIL (ORDER_DETAIL_NO,ORDER_NO,SERVICE_DATE,SERVICE_TIME,EMP_NO,ORDER_DEDIAL_STATUS)
VALUES('20171001'||'-'||LPAD(HC_ORDER_DETAIL_NO_SEQ.NEXTVAL,6,'0'),'20171001-500004',to_date('2017/10/01','yyyy/mm/dd'),'早','EMP0005','已完成');
INSERT  INTO HC_ORDER_DETAIL (ORDER_DETAIL_NO,ORDER_NO,SERVICE_DATE,SERVICE_TIME,EMP_NO,ORDER_DEDIAL_STATUS)
VALUES('20171001'||'-'||LPAD(HC_ORDER_DETAIL_NO_SEQ.NEXTVAL,6,'0'),'20171001-500004',to_date('2017/10/02','yyyy/mm/dd'),'早','EMP0005','已完成');
INSERT  INTO HC_ORDER_DETAIL (ORDER_DETAIL_NO,ORDER_NO,SERVICE_DATE,SERVICE_TIME,EMP_NO,ORDER_DEDIAL_STATUS)
VALUES('20171001'||'-'||LPAD(HC_ORDER_DETAIL_NO_SEQ.NEXTVAL,6,'0'),'20171001-500004',to_date('2017/10/03','yyyy/mm/dd'),'早','EMP0005','已完成');

COMMIT;



--菜色--
CREATE TABLE DISH(
DISH_NO NUMBER(10) PRIMARY KEY NOT NULL,
DISH_NAME VARCHAR2(60),
DISH_PIC BLOB,
DISH_INTRO VARCHAR2(3000),
DISH_TYPE VARCHAR2(15)
);
 
--菜色自增主鍵--
CREATE SEQUENCE dish_seq
INCREMENT BY 1
START WITH 101
NOMAXVALUE
NOCYCLE;



--套餐--
CREATE TABLE SET_MEAL(
SM_NO NUMBER(10) PRIMARY KEY NOT NULL,
SM_NAME VARCHAR2(60),
SM_PRICE NUMBER(5) CHECK(SM_PRICE>=0),
SUPPLY NUMBER(5) CHECK(SUPPLY>=0),
SM_PIC1 BLOB,
SM_PIC2 BLOB,
SM_PIC3 BLOB,
SM_INTRO VARCHAR2(3000)
);
 
--套餐自增主鍵--
CREATE SEQUENCE setMeal_seq
INCREMENT BY 10
START WITH 10
NOMAXVALUE
NOCYCLE;

--送餐訂單--
CREATE TABLE MEAL_ORDER(
MO_NO VARCHAR2(15) PRIMARY KEY NOT NULL,
MEM_NO VARCHAR2(10) NOT NULL,
MO_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
MO_STATUS VARCHAR2(15) NOT NULL,
RCPT_NAME VARCHAR2(15) NOT NULL,
RCPT_ADD VARCHAR2(100) NOT NULL,
RCPT_PHONE VARCHAR2(10) NOT NULL,
CONSTRAINT MEAL_ORDER_MEM_NO_FK FOREIGN KEY (MEM_NO) REFERENCES MEMBER(MEM_NO)
);
 
--送餐訂單自增主鍵--
CREATE SEQUENCE mealOrder_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE;

--送餐訂單明細--
CREATE TABLE MEAL_ORDER_DETAIL(
MO_DETAIL_NO VARCHAR2(15) PRIMARY KEY NOT NULL,
MO_NO VARCHAR2(15) NOT NULL,
DELIVER_DATE DATE NOT NULL,
MEALTIME VARCHAR2(15) NOT NULL,
SM_NO NUMBER(10) NULL,
ORDER_QTY NUMBER(5) NOT NULL,
CONSTRAINT MO_DET_MO_NO_FK FOREIGN KEY (MO_NO) REFERENCES MEAL_ORDER(MO_NO),
CONSTRAINT MO_DET_SM_NO_FK FOREIGN KEY (SM_NO) REFERENCES SET_MEAL(SM_NO)
);
 
 
--送餐訂單明細自增主鍵--
CREATE SEQUENCE mealOrderDetail_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE;



 

--套餐菜單表--

CREATE TABLE MENU(
MENU_NO NUMBER(10) PRIMARY KEY NOT NULL,
SM_NO NUMBER(10),
MENUDATE DATE,
MEALTIME VARCHAR2(15),
DISH_NAME  VARCHAR2(30),
CONSTRAINT MENU_SM_NO FOREIGN KEY(SM_NO) REFERENCES SET_MEAL(SM_NO)
);



--套餐菜單表自增主鍵--
CREATE SEQUENCE menu_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE;


COMMIT;

--新增菜色--
--米食--
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'南瓜飯','南瓜中含有豐富的維生素E和β-胡蘿蔔素。維生素E具有很強的抗氧化作用，能有效地保護肌體免受一些氧自由基和過氧化物的損害，有助於增進皮膚與黏膜的健康。幫助牙齒和骨骼的發育與生長。','米食',load_blob('dish01.jpg'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'糙米飯','糙米中的米糠和胚芽部分含有豐富的維生素Ｂ與E，能增強人體免疫功能，促進血液循環，還能幫助人們消除沮喪煩躁的情緒，使人充滿活力。','米食',load_blob('dish02.jpg'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'什蔬拌飯','豐富的膳食纖維可促進腸道蠕動，使糞便比較柔軟而易於排出。膳食中有適量的膳食纖維時，可增加糞便量。','米食',load_blob('dish03.jpg'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'黑豆飯','黑豆含鈣、磷、鐵、銅、鎂、維生素Ｅ及Ｂ群、纖維素、蛋白質、卵磷脂等。構成血紅素與肌紅素的重要成分。有助於氧氣的輸送與利用。','米食',load_blob('dish04.jpg'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'紅豆飯','紅豆熱量低且富含維生素Ｅ及鉀、鎂、磷、鋅、硒等活性成分，減少不飽和脂肪酸的氧化。有助於維持細胞膜的完整性及減少自由基的產生。具抗氧化作用。增進皮膚與血球的健康。','米食',load_blob('dish05.jpg'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'養生豬肝元氣粥','富含鐵質及葉酸與蛋白質、維生素ABCDE、卵磷脂、鐵、磷等營養素。有助於紅血球的形成。有助於核酸與核蛋白的形成。有助胎兒的正常發育與生長。','米食',load_blob('dish06.png'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'淮山藥膳活力粥','淮山，俗稱的山藥，藥性平和，不會寒膩也不會溫燥，且含有豐富的澱粉質及消化酵素，能幫助消化，加上以清藥膳為基底去熬煮成清粥，溫和且富有營養，適合早上當作主食來食用。','米食',load_blob('dish07.png'));
--主食--
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'清蒸鱈魚','藍田精選鱈魚，以少鹽少油的烹煮方式，讓鱈魚的鮮度自然浮現出來，且鱈魚含有豐富的維生素A及D，富含多元不飽和脂肪酸，讓媽咪可以吸收到足夠的營養。','主食',load_blob('dish08.jpg'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'水晶雞','提供所需的維生素B12，有助於紅血球的形成。增進神經系統的健康。可以幫助食慾、提升睡眠品質；雞肉能提供礦物質硒Se人體必需的微量元素，是有效的抗氧化劑和自由基清除劑。可以減緩老化，幫助維持組織的柔軟性。','主食',load_blob('dish09.jpg'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'油雞','含有豐富的維生素A，所含的脂肪多為不飽和脂肪酸，增進皮膚與黏膜的健康。幫助牙齒和骨骼的發育與生長。為小兒、中老年人、虛弱者理想的蛋白質食品。','主食',load_blob('dish10.jpg'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'彩椒蝦仁','含有豐富的維生素A，所含的脂肪多為不飽和脂肪酸，增進皮膚與黏膜的健康。幫助牙齒和骨骼的發育與生長。為小兒、中老年人、虛弱者理想的蛋白質食品。','主食',load_blob('dish11.jpg'));
--湯品--
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'紅棗補氣魚湯','《本草綱目》記載：紅棗具有益氣養腎、補血養顏、補肝降壓。紅棗含有豐富的維生素A、B、C等維生素，以及18種氨基酸、礦物質等，加上藍田演選的新鮮的魚，紅棗補氣魚湯不只可幫助媽咪補氣血，也可幫助媽咪分泌乳汁，讓媽咪乳汁源源不絕。','湯品',load_blob('dish12.jpg'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'蓮藕山藥排骨湯','蓮藕含有大量水分及及少量碳水化合物（大部分為澱粉）；煮熟以後，性由涼變溫，對脾胃有益，有養胃滋陰，益血的功效，加上山藥含有豐富的澱粉質及消化酵素，與精選的豬排骨一起精心熬煮，成為營養成分充足的湯燉品。','湯品',load_blob('dish13.png'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'四神豬肚湯','健脾利水，增強腸胃吸收能力。通常體質較差、易感風寒、食慾不振。','湯品',load_blob('dish14.jpg'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'刺五加燉雞湯','益氣健脾，補腎安神。對於脾臟虛弱，體虛乏力，食慾不振，腰膝酸痛，失眠多夢尤為有效。','湯品',load_blob('dish15.jpg'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'首烏燉烏雞湯','促進食慾、幫助消化、調整體質、滋補強身、增強體力、精神旺盛、營養補給、健康維持、青春源頭、延年益壽、減少疲勞感、調節生理機能、促進新陳代謝、幫助維持消化道機能。','湯品',load_blob('dish16.jpg'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'首烏燉豬肝湯','有解毒，潤腸通便，養血益肝，固精益腎，健筋骨，烏髭髪、補虛益精，益肝腎、潤五臟、填精髓、堅韌筋骨、明耳目、療瘡止痛、收縮子宮與排除惡露等。','湯品',load_blob('dish17.jpg'));
--蔬食--
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'薑拌龍鬚菜','含豐富的維生素A、B1、B2及鉀、鈣、鎂、磷、鐵、鋅等多種營養素，幫助維持皮膚、心臟及神經系統的正常功能。有助於維持正常的食慾。而且熱量極低，多食用可助消化，加上藍田精心挑選4個月以上的老薑烹飪後，去除寒性，使得龍鬚菜美味又可口。','蔬食',load_blob('dish18.jpg'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'雙鮮綠蘆筍','蘆筍屬鹼性蔬菜，有豐富的纖維質，維生素A、C、E及蛋白質都很豐富，可促進腸道蠕動。增加飽足感。使糞便比較柔軟而易於排出。','蔬食',load_blob('dish19.jpg'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'五彩繽紛','營養均衡、低卡路里、豐富的鈣有助於維持骨骼與牙齒的正常發育及健康。幫助血液正常的凝固功能。','蔬食',load_blob('dish20.jpg'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'枸杞吻魚紅鳳菜','富含磷、鐵、蛋白質，對發育中的女孩是絕佳的料理。而紅鳳菜中高量鐵質，有助於正常紅血球的形成。構成血紅素與肌紅素的重要成分。有助於氧氣的輸送與利用。','蔬食',load_blob('dish21.jpg'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'豬肝菠菜','菠菜含有豐富葉酸，有助於核酸與核蛋白及紅血球的形成。有助胎兒的正常發育與生長。','蔬食',load_blob('dish22.jpg'));
--甜品--
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'紅棗銀耳湯','銀耳譽為“菌中之冠，內有有效成分酸性多糖類物質，能增強人體的免疫力，且富含維生素D，能防止鈣的流失，本身有天然植物性膠質，有滋陰作用，搭配紅棗益氣養腎、補血養顏。','甜品',load_blob('dish23.jpg'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'紅豆紫米小薏仁粥','維生素B1及B2、葉酸、蛋白質、脂肪等多種營養物質，以及鐵、鋅、鈣、磷等人體所需礦物元素。','甜品',load_blob('dish24.jpg'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'珍珠薏仁饌','富含有相當多的蛋白質與油脂、維生素 B1、B2，以及鈣、鐵、磷等礦物質。','甜品',load_blob('dish25.jpg'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'百果雪蓮子粥','含有維生素C、核黃素、胡蘿蔔素、鈣、磷、鐵、鉀、鎂等微量元素。促進膠原蛋白的形成，有助於傷口癒合。有助於維持細胞排列的緊密性。增進體內結締組織、骨骼及牙齒的生長。促進鐵的吸收。具抗氧化作用。','甜品',load_blob('dish26.jpg'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'芝麻糊','富含維生素E、具減少不飽和脂肪酸的氧化。有助於維持細胞膜的完整性。具抗氧化作用。增進皮膚與血球的健康。有助於減少自由基的產生。','甜品',load_blob('dish27.jpg'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'桂花酒釀蛋花','酒釀於每日早餐提供，是麴菌和糯米發酵而成，無酒精成份，可暖胃、增加泌乳，且不影響傷口癒合，所以剖腹生產的媽咪也可以享用。','甜品',load_blob('dish28.jpg'));
--飲品--
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'健康飲','於每日早餐提供，功效具有清熱、解毒、利肺、補中益氣、消水腫利尿之功效，能增強免疫力抗病毒，抑制細菌生長，並預防出血、產褥熱之發生。','飲品',load_blob('dish29.jpg'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'養肝茶','熬煮約10小時，有微酸味，能生津止渴、消水腫、祛風清血、壯筋骨，具有保肝、補氣、養血、安神可緩和藥膳的藥性。','飲品',load_blob('dish30.jpg'));
INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_INTRO,DISH_TYPE,DISH_PIC)
VALUES(dish_seq.NEXTVAL,'補血飲','以當歸黃耆為首的滋補飲，功能補血、活血、調經止痛、潤腸通便。(飲用生化湯期間停服) 產婦食用杜仲的主要目的是防止腰酸背痛，兼固腎強。','飲品',load_blob('dish31.jpg'));


--新增套餐--
INSERT INTO SET_MEAL(SM_NO,SM_NAME,SM_PRICE,SUPPLY,SM_INTRO,SM_PIC1,SM_PIC2,SM_PIC3)
VALUES(setMeal_seq.NEXTVAL,'活力養身餐',150,300,'新一代的銀髮族追求身體上的健康，少鹽、少油儼然成為新的飲食觀念，主廚使用多穀類米飯搭配鮮採食蔬以及每日補獲新鮮漁貨及合格溫體肉品。
味覺不敏感的銀髮族吃東西時常覺得索然無味，食物一端上桌就猛加鹽巴、醬油，很容易吃進過量的鈉，造成身體上的負擔並埋下慢性疾病的風險。
其實食物味道並不只有「鹹」味一種，主廚運用當季食材並善用食材特有的香氣，就可以讓料理少鹽少油也美味。',load_blob('smA01.jpg'),load_blob('smA02.jpg'),load_blob('smA03.jpg'));


INSERT INTO SET_MEAL(SM_NO,SM_NAME,SM_PRICE,SUPPLY,SM_INTRO,SM_PIC1,SM_PIC2,SM_PIC3)
VALUES(setMeal_seq.NEXTVAL,'疾病健康餐',150,300,'慢性疾病的發生，通常伴隨著年齡的老化，長期累積的飲食不均衡或生活型態不正常，導致生理調節機能或代謝障礙，導致疾病發生，因此，需要調理的不只是短暫的罹病過程，更是長期的調養。而在日常生活中，最容易，抑或最不容易被改善的，即是飲食內容的調整！許多疾病都能透過飲食控制而獲得改善，減少服用藥物所造成的肝腎負擔，進而延緩疾病進展。例如：糖尿病患者需要定時定量以及低GI的餐點，以有效控制血糖穩定度；高血壓患者需要限鹽、限鈉、低脂肪的餐點，以減少水分滯留情形和改善血液黏稠度，進而控制血壓，避免腦血管意外(中風)之合併症；腎臟病患者則需限水、限鉀、限蛋白餐點，以減緩腎臟衰竭速度。',load_blob('smB01.jpg'),load_blob('smB02.jpg'),load_blob('smB03.jpg'));


INSERT INTO SET_MEAL(SM_NO,SM_NAME,SM_PRICE,SUPPLY,SM_INTRO,SM_PIC1,SM_PIC2,SM_PIC3)
VALUES(setMeal_seq.NEXTVAL,'術後調理餐',150,300,'手術耗氣傷血，損及人體的正氣，多有氣血雙虧，或氣陰兩傷，或營衛失和的現象。術後體質也較虛弱，應多給予補氣養血的食物。
手術後的食療，以儘早恢復手術後氣血損傷、恢復體力為主要目的；術後飲食則要適當補充營養和熱量，給予高蛋白和富含維生素的飲食。
由於各方不斷的詢問，金品專業團隊特別規劃 [手術後餐] 來幫助住在美國的大家來解決手術後"吃"的問題。金品要給您最完整的飲食計畫，讓您輕鬆攝取均衡的營養，在最快的時間內幫您補益氣血、恢復體力。',load_blob('smC01.jpg'),load_blob('smC02.jpg'),load_blob('smC03.jpg'));




--新曾送餐訂單--
INSERT INTO MEAL_ORDER(MO_NO,MEM_NO,MO_STATUS,RCPT_NAME,RCPT_ADD,RCPT_PHONE)
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(mealOrder_seq.NEXTVAL),6,'0'),'MEM0001','未處理','三井壽','桃園市中壢區中大路300號','0987390369');
INSERT INTO MEAL_ORDER(MO_NO,MEM_NO,MO_STATUS,RCPT_NAME,RCPT_ADD,RCPT_PHONE)
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(mealOrder_seq.NEXTVAL),6,'0'),'MEM0002','未處理','牧神一','桃園市中壢區中大路300號','0987390369');

INSERT INTO MEAL_ORDER(MO_NO,MEM_NO,MO_STATUS,RCPT_NAME,RCPT_ADD,RCPT_PHONE)
VALUES('20171103-000002','MEM0001','未處理','劉備','桃園市中壢區中大路300號','0987390369');
INSERT INTO MEAL_ORDER(MO_NO,MEM_NO,MO_STATUS,RCPT_NAME,RCPT_ADD,RCPT_PHONE)
VALUES('20171103-000003','MEM0002','未處理','孫權','桃園市中壢區中大路300號','0987390369');
INSERT INTO MEAL_ORDER(MO_NO,MEM_NO,MO_STATUS,RCPT_NAME,RCPT_ADD,RCPT_PHONE)
VALUES('20171103-000004','MEM0002','未處理','孫權','桃園市中壢區中大路300號','0987390369');


--新增送餐訂單明細--
INSERT INTO MEAL_ORDER_DETAIL
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(mealOrderDetail_seq.NEXTVAL),6,'0'),to_char(sysdate,'yyyymmdd')||'-'||'000001',to_date('2017-12-16', 'yyyy-mm-dd'),'早餐',10,1);
INSERT INTO MEAL_ORDER_DETAIL
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(mealOrderDetail_seq.NEXTVAL),6,'0'),to_char(sysdate,'yyyymmdd')||'-'||'000001',to_date('2017-12-17', 'yyyy-mm-dd'),'早餐',10,1);
INSERT INTO MEAL_ORDER_DETAIL
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(mealOrderDetail_seq.NEXTVAL),6,'0'),to_char(sysdate,'yyyymmdd')||'-'||'000001',to_date('2017-12-18', 'yyyy-mm-dd'),'早餐',10,1);
INSERT INTO MEAL_ORDER_DETAIL
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(mealOrderDetail_seq.NEXTVAL),6,'0'),to_char(sysdate,'yyyymmdd')||'-'||'000002',to_date('2017-12-20', 'yyyy-mm-dd'),'午餐',20,1);
INSERT INTO MEAL_ORDER_DETAIL
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(mealOrderDetail_seq.NEXTVAL),6,'0'),to_char(sysdate,'yyyymmdd')||'-'||'000002',to_date('2017-12-21', 'yyyy-mm-dd'),'午餐',20,1);
INSERT INTO MEAL_ORDER_DETAIL
VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(mealOrderDetail_seq.NEXTVAL),6,'0'),to_char(sysdate,'yyyymmdd')||'-'||'000002',to_date('2017-12-23', 'yyyy-mm-dd'),'午餐',20,1);

INSERT INTO MEAL_ORDER_DETAIL
VALUES ('20171103-000002',to_char(sysdate,'yyyymmdd')||'-'||'000002',to_date('2017-11-23', 'yyyy-mm-dd'),'晚餐',20,1);
INSERT INTO MEAL_ORDER_DETAIL
VALUES ('20171103-000003',to_char(sysdate,'yyyymmdd')||'-'||'000002',to_date('2017-11-21', 'yyyy-mm-dd'),'晚餐',20,1);
INSERT INTO MEAL_ORDER_DETAIL
VALUES ('20171103-000004',to_char(sysdate,'yyyymmdd')||'-'||'000002',to_date('2017-11-22', 'yyyy-mm-dd'),'晚餐',20,1);


--新增菜單表--


COMMIT;


--1.派車:自增主鍵用----------------------------------------------------------------
CREATE SEQUENCE cartype_seq
INCREMENT BY 1
START WITH 1001
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE carschedul_seq
INCREMENT BY 1
START WITH 1001
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE carorder_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE cardetail_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE vehicle_seq
INCREMENT BY 1
START WITH 1001
NOMAXVALUE
NOCYCLE
NOCACHE;

commit;
--2.派車:新增表格用----------------------------------------------------------------

 CREATE TABLE CARTYPE(
 CARTYPE_NO                 NUMBER(10) NOT NULL,
 CARTYPE_NAME               VARCHAR2(60) NOT NULL,
 DESCRIPTION                VARCHAR2(300) NOT NULL,
 RENTAL_RATES               NUMBER(10)   NOT NULL,
 CAR_PIC                    BLOB,
 
 CONSTRAINT CARTYPE_NO_PRIMARY_KEY PRIMARY KEY (CARTYPE_NO));
 ------------------------------------------------------------------------------
 CREATE TABLE VEHICLE(
 VEHICLE_NO                NUMBER(10) NOT NULL,
 CARTYPE_NO                NUMBER(10) NOT NULL,
 EMP_NO                    VARCHAR2(10) NOT NULL,
 LICENSEPLATE_NO           VARCHAR2(8) NOT NULL,
 COLOR                     VARCHAR2(15) NOT NULL,
 VEHICLE_YEAR              VARCHAR2(15) NOT NULL,
 EMP_BRANCHES              VARCHAR2(10) NOT NULL,
 
 CONSTRAINT VEHICLE_NO_PRIMARY_KEY PRIMARY KEY (VEHICLE_NO),
 CONSTRAINT VEHICLE_CAR_TYPE_FK FOREIGN KEY(CARTYPE_NO) REFERENCES CARTYPE(CARTYPE_NO),
 CONSTRAINT VEHICLE_EMP_FK FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO),
 CONSTRAINT VEHICLE_BRANCHES_FK FOREIGN KEY (EMP_BRANCHES)REFERENCES BRANCHES (EMP_BRANCHES));
  ------------------------------------------------------------------------------
 CREATE TABLE CAR_ORDER(
 ORDER_NO                  VARCHAR2(15) NOT NULL,
 MEM_NO                    VARCHAR2(10) NOT NULL, 
 ORDER_DATE                TIMESTAMP(6), 
 ORDER_STATUS              VARCHAR2(15) NOT NULL, 
 
 CONSTRAINT ORDER_NO_PRIMARY_KEY PRIMARY KEY (ORDER_NO),
 CONSTRAINT CAR_ORDER_MEM_FK FOREIGN KEY(MEM_NO) REFERENCES MEMBER(MEM_NO));
 ------------------------------------------------------------------------------
 CREATE TABLE CAR_DETAIL(
 DETAIL_NO                VARCHAR2(15) NOT NULL,
 ORDER_NO                 VARCHAR2(15) NOT NULL,
 VEHICLE_NO               NUMBER(10)   NOT NULL,
 DETAIL_DATE              DATE         NOT NULL,
 DETAIL_TIME              VARCHAR2(15) NOT NULL,
 PASSENGER_NAME           VARCHAR2(15) NOT NULL,
 PASSENGER_PHONE          NUMBER(10)   NOT NULL,
 GETINTO_ADDRESS          VARCHAR2(100)NOT NULL,
 ARRIVAL_ADDRESS          VARCHAR2(100)NOT NULL,
 SENDCAR_STATUS           VARCHAR2(15) NOT NULL,
 
 CONSTRAINT DETAIL_NO_PRIMARY_KEY PRIMARY KEY (DETAIL_NO),
 CONSTRAINT DETAIL_VEHICLE_FK FOREIGN KEY (VEHICLE_NO)REFERENCES VEHICLE (VEHICLE_NO),
 CONSTRAINT DETAIL_CARORDER_FK FOREIGN KEY(ORDER_NO) REFERENCES CAR_ORDER(ORDER_NO));
  ------------------------------------------------------------------------------
  CREATE TABLE CAR_SCHEDUL(
 SERIAL_NO              NUMBER(10) NOT NULL,
 EMP_NO                 VARCHAR2(10) NOT NULL,
 YEAR_MONTH             DATE NOT NULL,
 ATTENDANCE             VARCHAR2(279) NOT NULL,
 WORK_HOURS             NUMBER(10,0) NOT NULL,
 
 CONSTRAINT SC_SERIAL_NO_PRIMARY_KEY PRIMARY KEY (SERIAL_NO),
 CONSTRAINT CAR_SCHEDUL_EMP_FK FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO));

commit;
 --假資料建立:員工-------------------------------------------------------------
--INSERT INTO EMPLOYEE VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '張三', '0919123456', 'M','ScottZHolmes@jourrapide.com', '派車', '派車人員', '專員', TO_DATE('2017/02/03 ', 'yyyy/mm/dd '), 'A1234567', 'A1234567','on', '10',CURRENT_TIMESTAMP);
--INSERT INTO EMPLOYEE VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '李四', '0919123123', 'M','JackALong@teleworm.us', '派車', '派車人員', '專員', TO_DATE('2013/05/22 ', 'yyyy/mm/dd '), 'B1234567', 'B1234567','on', '10',CURRENT_TIMESTAMP);
--INSERT INTO EMPLOYEE VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '王五', '0933475532', 'M','JamesGMarsh@jourrapide.com', '派車', '派車人員', '專員', TO_DATE('2014/10/02 ', 'yyyy/mm/dd '), 'C1234567', 'C1234567','on', '10',CURRENT_TIMESTAMP);


commit;
--假資料建立:車型-------------------------------------------------------------------
 INSERT INTO CARTYPE VALUES (cartype_seq.NEXTVAL,'四人座','豪華房車，溫馨小家庭出遊適用',1000,null);
 INSERT INTO CARTYPE VALUES (cartype_seq.NEXTVAL,'七人座','休旅車，闔家歡樂適合上山下海',1800,null);
 INSERT INTO CARTYPE VALUES (cartype_seq.NEXTVAL,'九人小巴','小巴士，樓頂揪樓咖奏夥來企逃',7500,null);
 commit;
--假資料建立:車輛-------------------------------------------------------------------
INSERT INTO VEHICLE VALUES (vehicle_seq.NEXTVAL,'1001','EMP0021','ABC7001','躍動紅','2011',10);
INSERT INTO VEHICLE VALUES (vehicle_seq.NEXTVAL,'1001','EMP0022','ABC7001','躍動紅','2011',10);
INSERT INTO VEHICLE VALUES (vehicle_seq.NEXTVAL,'1002','EMP0023','ABC7002','黑曜藍','2012',10);
INSERT INTO VEHICLE VALUES (vehicle_seq.NEXTVAL,'1003','EMP0024','ABC7003','珍珠白','2013',10);
INSERT INTO VEHICLE VALUES (vehicle_seq.NEXTVAL,'1001','EMP0025','ABC7001','躍動紅','2011',10);
INSERT INTO VEHICLE VALUES (vehicle_seq.NEXTVAL,'1002','EMP0026','ABC7002','黑曜藍','2012',20);
INSERT INTO VEHICLE VALUES (vehicle_seq.NEXTVAL,'1003','EMP0027','ABC7003','珍珠白','2013',20);
INSERT INTO VEHICLE VALUES (vehicle_seq.NEXTVAL,'1001','EMP0028','ABC7001','躍動紅','2011',20);
INSERT INTO VEHICLE VALUES (vehicle_seq.NEXTVAL,'1002','EMP0029','ABC7002','黑曜藍','2012',20);
INSERT INTO VEHICLE VALUES (vehicle_seq.NEXTVAL,'1003','EMP0030','ABC7003','珍珠白','2013',20);
INSERT INTO VEHICLE VALUES (vehicle_seq.NEXTVAL,'1001','EMP0031','ABC7001','躍動紅','2011',30);
INSERT INTO VEHICLE VALUES (vehicle_seq.NEXTVAL,'1002','EMP0032','ABC7002','黑曜藍','2012',30);
INSERT INTO VEHICLE VALUES (vehicle_seq.NEXTVAL,'1003','EMP0033','ABC7003','珍珠白','2013',30);
INSERT INTO VEHICLE VALUES (vehicle_seq.NEXTVAL,'1001','EMP0034','ABC7001','躍動紅','2011',30);
INSERT INTO VEHICLE VALUES (vehicle_seq.NEXTVAL,'1002','EMP0035','ABC7002','黑曜藍','2012',30);
INSERT INTO VEHICLE VALUES (vehicle_seq.NEXTVAL,'1003','EMP0036','ABC7003','珍珠白','2013',40);
INSERT INTO VEHICLE VALUES (vehicle_seq.NEXTVAL,'1001','EMP0037','ABC7001','躍動紅','2011',40);
INSERT INTO VEHICLE VALUES (vehicle_seq.NEXTVAL,'1002','EMP0038','ABC7002','黑曜藍','2012',40);
INSERT INTO VEHICLE VALUES (vehicle_seq.NEXTVAL,'1003','EMP0039','ABC7003','珍珠白','2013',50);
INSERT INTO VEHICLE VALUES (vehicle_seq.NEXTVAL,'1001','EMP0040','ABC7001','躍動紅','2011',50);
commit;
--假資料建立:派車訂單-------------------------------------------------------------------
INSERT INTO CAR_ORDER　VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(CARORDER_SEQ.Nextval),6,'0'),'MEM0001',CURRENT_TIMESTAMP,'未確認');
INSERT INTO CAR_ORDER　VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(CARORDER_SEQ.Nextval),6,'0'),'MEM0002',CURRENT_TIMESTAMP,'未確認');
INSERT INTO CAR_ORDER　VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(CARORDER_SEQ.Nextval),6,'0'),'MEM0003',CURRENT_TIMESTAMP,'未確認');
INSERT INTO CAR_ORDER　VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(CARORDER_SEQ.Nextval),6,'0'),'MEM0004',CURRENT_TIMESTAMP,'服務中');
INSERT INTO CAR_ORDER　VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(CARORDER_SEQ.Nextval),6,'0'),'MEM0005',CURRENT_TIMESTAMP,'已確認');
INSERT INTO CAR_ORDER　VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(CARORDER_SEQ.Nextval),6,'0'),'MEM0006',CURRENT_TIMESTAMP,'未確認');
INSERT INTO CAR_ORDER　VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(CARORDER_SEQ.Nextval),6,'0'),'MEM0007',CURRENT_TIMESTAMP,'服務中');
INSERT INTO CAR_ORDER　VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(CARORDER_SEQ.Nextval),6,'0'),'MEM0008',CURRENT_TIMESTAMP,'服務中');



INSERT INTO CAR_ORDER　VALUES( '20171026-000001','MEM0001',CURRENT_TIMESTAMP,'已確認');
INSERT INTO CAR_ORDER　VALUES( '20171102-000010','MEM0002',CURRENT_TIMESTAMP,'已確認');
INSERT INTO CAR_ORDER　VALUES( '20171102-000012','MEM0003',CURRENT_TIMESTAMP,'已確認');
INSERT INTO CAR_ORDER　VALUES( '20171021-000011','MEM0001',CURRENT_TIMESTAMP,'已完成');
INSERT INTO CAR_ORDER　VALUES( '20171021-000101','MEM0002',CURRENT_TIMESTAMP,'已完成'); 
INSERT INTO CAR_ORDER　VALUES( '20171022-000312','MEM0003',CURRENT_TIMESTAMP,'已完成');


commit;
--假資料建立:派車明細-------------------------------------------------------------------
INSERT INTO CAR_DETAIL　VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(cardetail_seq.Nextval),6,'0'),to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(cardetail_seq.Nextval),6,'0'),1001,TO_DATE('2017/12/08','YYYY/MM/DD'),'O','李興隆',0963117220,'桃園市中壢區中大路300號','桃園市平鎮區廣泰路77號','未出車');
INSERT INTO CAR_DETAIL　VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(cardetail_seq.Nextval),6,'0'),to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(cardetail_seq.Nextval),6,'0'),1001,TO_DATE('2017/12/08','YYYY/MM/DD'),'M','黃建業',0963117220,'台中市南屯區文心路一段521號','台中市中區柳川東路三段36號','未出車');
INSERT INTO CAR_DETAIL　VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(cardetail_seq.Nextval),6,'0'),to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(cardetail_seq.Nextval),6,'0'),1001,TO_DATE('2017/12/08','YYYY/MM/DD'),'A','陳宛婷',0963117220,'高雄市三民區建國二路320號','高雄市新興區中山一路14之27號','未出車');
INSERT INTO CAR_DETAIL　VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(cardetail_seq.Nextval),6,'0'),to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(cardetail_seq.Nextval),6,'0'),1001,TO_DATE('2017/12/08','YYYY/MM/DD'),'O','李興隆',0963117220,'桃園市中壢區中大路300號','桃園市平鎮區廣泰路77號','未出車');
INSERT INTO CAR_DETAIL　VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(cardetail_seq.Nextval),6,'0'),to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(cardetail_seq.Nextval),6,'0'),1001,TO_DATE('2017/12/08','YYYY/MM/DD'),'M','黃建業',0963117220,'台中市南屯區文心路一段521號','台中市中區柳川東路三段36號','未出車');
INSERT INTO CAR_DETAIL　VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(cardetail_seq.Nextval),6,'0'),to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(cardetail_seq.Nextval),6,'0'),1001,TO_DATE('2017/12/08','YYYY/MM/DD'),'A','陳宛婷',0963117220,'高雄市三民區建國二路320號','高雄市新興區中山一路14之27號','未出車');
commit;     

--假資料建立:派車人員班表-------------------------------------------------------------------
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0021',TO_DATE('2017/11','YYYY/MM'),'早空晚早空空空中晚空空晚空中晚空空空空空空早中晚早中空空中晚空空空空中晚空空空空空空早空空早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0021',TO_DATE('2017/12','YYYY/MM'),'空中晚空空空空空空早中晚早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0021',TO_DATE('2018/01','YYYY/MM'),'早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早空晚早空空空中晚空空晚早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0022',TO_DATE('2017/11','YYYY/MM'),'早空晚早空空空中晚空空晚空中晚空空空空空空早中晚早中空空中晚空空空空中晚空空空空空空早空空早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0023',TO_DATE('2017/11','YYYY/MM'),'空中晚空空空空空空早中晚早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0024',TO_DATE('2017/11','YYYY/MM'),'早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早空晚早空空空中晚空空晚早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0022',TO_DATE('2017/12','YYYY/MM'),'早空晚早空空空中晚空空晚空中晚空空空空空空早中晚早中空空中晚空空空空中晚空空空空空空早空空早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0023',TO_DATE('2017/12','YYYY/MM'),'空中晚空空空空空空早中晚早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0024',TO_DATE('2017/12','YYYY/MM'),'早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早空晚早空空空中晚空空晚早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0022',TO_DATE('2018/01','YYYY/MM'),'早空晚早空空空中晚空空晚空中晚空空空空空空早中晚早中空空中晚空空空空中晚空空空空空空早空空早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0023',TO_DATE('2018/01','YYYY/MM'),'空中晚空空空空空空早中晚早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0024',TO_DATE('2018/01','YYYY/MM'),'早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早空晚早空空空中晚空空晚早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0025',TO_DATE('2017/11','YYYY/MM'),'早空晚早空空空中晚空空晚空中晚空空空空空空早中晚早中空空中晚空空空空中晚空空空空空空早空空早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0026',TO_DATE('2017/11','YYYY/MM'),'空中晚空空空空空空早中晚早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0027',TO_DATE('2017/11','YYYY/MM'),'早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早空晚早空空空中晚空空晚早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0025',TO_DATE('2017/12','YYYY/MM'),'早空晚早空空空中晚空空晚空中晚空空空空空空早中晚早中空空中晚空空空空中晚空空空空空空早空空早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0026',TO_DATE('2017/12','YYYY/MM'),'空中晚空空空空空空早中晚早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0027',TO_DATE('2017/12','YYYY/MM'),'早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早空晚早空空空中晚空空晚早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0025',TO_DATE('2018/01','YYYY/MM'),'早空晚早空空空中晚空空晚空中晚空空空空空空早中晚早中空空中晚空空空空中晚空空空空空空早空空早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0026',TO_DATE('2018/01','YYYY/MM'),'空中晚空空空空空空早中晚早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0027',TO_DATE('2018/01','YYYY/MM'),'早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早空晚早空空空中晚空空晚早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0028',TO_DATE('2017/12','YYYY/MM'),'早空晚早空空空中晚空空晚空中晚空空空空空空早中晚早中空空中晚空空空空中晚空空空空空空早空空早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0029',TO_DATE('2017/12','YYYY/MM'),'空中晚空空空空空空早中晚早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0030',TO_DATE('2017/12','YYYY/MM'),'早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早空晚早空空空中晚空空晚早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0031',TO_DATE('2017/12','YYYY/MM'),'早空晚早空空空中晚空空晚空中晚空空空空空空早中晚早中空空中晚空空空空中晚空空空空空空早空空早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0032',TO_DATE('2017/12','YYYY/MM'),'空中晚空空空空空空早中晚早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0033',TO_DATE('2017/12','YYYY/MM'),'早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早空晚早空空空中晚空空晚早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0034',TO_DATE('2017/12','YYYY/MM'),'早空晚早空空空中晚空空晚空中晚空空空空空空早中晚早中空空中晚空空空空中晚空空空空空空早空空早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0035',TO_DATE('2017/12','YYYY/MM'),'空中晚空空空空空空早中晚早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0036',TO_DATE('2017/12','YYYY/MM'),'早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早空晚早空空空中晚空空晚早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0037',TO_DATE('2017/12','YYYY/MM'),'早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早空晚早空空空中晚空空晚早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0038',TO_DATE('2017/12','YYYY/MM'),'早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早空晚早空空空中晚空空晚早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0039',TO_DATE('2017/12','YYYY/MM'),'早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早空晚早空空空中晚空空晚早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
INSERT INTO CAR_SCHEDUL　VALUES(carschedul_seq.NEXTVAL,'EMP0040',TO_DATE('2017/12','YYYY/MM'),'早空晚早空空空中晚空空晚早中空空中晚空空空空中晚空空空空空空早空空早空晚早空空空中晚空空晚早中空空中晚空空空早中晚空空空空空空早中空早中空空中晚空空晚早中晚空空空空空空早中空空中空空中晚',160);
commit;
 
 ---------------------------------  自增主鍵 -------------------------------------

--------- 1. 保健消息

CREATE SEQUENCE HEALTHNO_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

--------- 2. 最新消息
CREATE SEQUENCE NEWSNO_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

--------- 3. 線上客服
CREATE SEQUENCE EMPSEVNO_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

 
 





--------- 1. 最新資訊-----




CREATE TABLE NEWSDETAIL(
 NEWSNO         VARCHAR2(15)   NOT NULL,
 NEWSTITLE      VARCHAR2(200) NOT NULL,
 NEWSINTRO      CLOB,
 EMP_NO         VARCHAR2(10)   NOT NULL,
 COVERPIC       BLOB,
 NEWSPIC1       BLOB,
 NEWSPIC2       BLOB,
 NEWSDATE       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 STATUS		VARCHAR2(15)  NOT NULL,
 

CONSTRAINT NEWS_NO_PRIMARY_KEY PRIMARY KEY (NEWSNO),
CONSTRAINT NEWS_EMP_FK FOREIGN KEY(EMP_NO)REFERENCES EMPLOYEE(EMP_NO)
);


commit;

--------- 2. 保健資訊-----

CREATE TABLE HEALTHNEWSDETAIL(
 HEALTHNO       VARCHAR2(15)  NOT NULL,
 NEWSTITLE      VARCHAR2(200) NOT NULL,
 NEWSINTRO      CLOB,
 EMP_NO         VARCHAR2(10)  NOT NULL,
 COVERPIC       BLOB,
 NEWSPIC1       BLOB,
 NEWSPIC2       BLOB,
 NEWSDATE       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 STATUS		    VARCHAR2(15)  NOT NULL,

CONSTRAINT HEALTH_NO_PRIMARY_KEY PRIMARY KEY (HEALTHNO),
CONSTRAINT HEALTH_EMP_FK FOREIGN KEY(EMP_NO)REFERENCES EMPLOYEE(EMP_NO)
);


commit;






--------- 3. 線上客服紀錄-----

CREATE TABLE EMPSERVICEDETAIL(
 EMPSEVNO       VARCHAR2(15) NOT NULL,
 EMP_NO         VARCHAR2(10) NOT NULL,
 EMPSEVIMG      BLOB,
 EMPSEVINTRO    CLOB,
 EMPSEVDATE     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 EMPSEVSTATUS   VARCHAR2(15),
 MEM_NO         VARCHAR2(10),

CONSTRAINT EMPSEV_NO_PRIMARY_KEY PRIMARY KEY (EMPSEVNO),
CONSTRAINT SEVICE_EMP_FK FOREIGN KEY(EMP_NO)REFERENCES EMPLOYEE(EMP_NO),
CONSTRAINT SEVICE_MEM_FK FOREIGN KEY(MEM_NO)REFERENCES MEMBER(MEM_NO)
);

commit;




---------------------------------  最新消息假資料 -------------------------------------
INSERT INTO NEWSDETAIL(NEWSNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC , STATUS)
VALUES ((to_char('ND'||LPAD(to_char(NEWSNO_SEQ.NEXTVAL),4,'0'))),'南部的鄉親久等了，有我罩你7月起開始在大高雄地區服務囉!',
'居家照顧已經邁入第12年，服務範圍橫跨雙北、桃園及大台中、累積了上萬人次的服務經驗，今年七月將跨越濁水溪，成立「南區照護管理中心」，將以最完整且全方位的銀髮居家照顧網絡，來服務大高雄區域!
有我罩你以長輩為中心的服務設計，希望陪伴長輩的每一個老化階段:除了基本的生活、營養備餐、身體照顧、輔具及相關銀髮產品諮詢之外，還有更多客製化的服務，幫助長輩自主生活得愈久愈好，滿足長輩在家享老的願望。
為了提供更完整的服務，除了一直以來的優質居家照顧服務，更於2016年建構了一站式的整合平台，將優質的銀髮照護用品納入「有我罩你」網站，同時整合了以雙北為主的「北區照護管理中心」、涵蓋大台中區的「中區照護管理中心」，
加上最新成立的「南區照護管理中心」，並以全台通用的「412-8178」服務諮詢專線，增加使用服務的便利性，提供更多長輩優質的照護服務。','EMP0001'
,load_blob('ND001.jpg'),'上架'  
);


INSERT INTO NEWSDETAIL(NEWSNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('ND'||LPAD(to_char(NEWSNO_SEQ.NEXTVAL),4,'0'))),'客製化餐點 照顧癌友營養',
'據衛生福利部統計發現，每五分二十六秒就有一人被診斷出罹患癌症。若癌症病患在治療期間能正確攝取營養將輔助治療成效，讓每一次的化療療程順利完成。有我罩你希望藉由配送客製化的化療餐，協助癌症病患攝取均衡的營養，並分享正確的營養知識。
客製化化療餐 解決病人食慾問題:有我罩你化療餐的菜單經由營養師針對不同化療週期而調配，然後再由廚師烹煮。營養師會依照不同癌症別個案、治療狀況、用藥種類與週期設計菜單。 營養師洪彩綾說：「每個不同的癌症，都有本身的禁忌。例如大腸癌因為腸內有傷口，必須減少排便量，所以調配菜單時，就會減少纖維豐富的食物。」
同時，營養師也會進行家訪，將病患的個人飲食喜好納入考量，為病患量身打造餐點。洪彩綾表示，同樣是粥品，會針對不同病患做細部的改變。如果病患不喜歡竹筍，那麼會改為山藥；如果不吃白米，就會改為糙米。菜餚的鹹淡度，米飯的軟硬度，都會配合病患要求，進行更改。
洪彩綾表示，在設計菜單的過程中，最困難的是遇到病患同時擁有不同的疾病，造成飲食上的衝突。例如癌症病患必須攝取高熱量、高蛋白質，如果病人同時擁有糖尿病，就無法攝取澱粉類食物，但熱量最大來源就是澱粉。但是她說：「其實沒有任何一個東西是完全不可以吃的，只是份量的問題。」遇到這種狀況時，營養師就會計算，要如何才能不超過病患可以攝取的份量。
洪彩綾說：「當病人有特定口味上的需求時，我們會先考慮他們的要求是否合理。當你滿足他某一點的需求時，說不定就可以藉由這點讓他有更好的食慾。」化療餐希望能夠讓病患更好地攝取營養，所以在不違背這個原則下，營養師會盡可能去滿足病患的需求。
','EMP0001',load_blob('ND002.jpg'),'上架'  
);



INSERT INTO NEWSDETAIL(NEWSNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('ND'||LPAD(to_char(NEWSNO_SEQ.NEXTVAL),4,'0'))),'12/26 【鬥陣搏戲 歡喜作自己】，免費互動式講座、名額有限，請把握報名唷!!',
'據衛生福利部統計發現，每五分二十六秒就有一人被診斷出罹患癌症。若癌症病患在治療期間能正確攝取營養將輔助治療成效，讓每一次的化療療程順利完成。有我罩你希望藉由配送客製化的化療餐，協助癌症病患攝取均衡的營養，並分享正確的營養知識。
客製化化療餐 解決病人食慾問題:有我罩你化療餐的菜單經由營養師針對不同化療週期而調配，然後再由廚師烹煮。營養師會依照不同癌症別個案、治療狀況、用藥種類與週期設計菜單。 營養師洪彩綾說：「每個不同的癌症，都有本身的禁忌。例如大腸癌因為腸內有傷口，必須減少排便量，所以調配菜單時，就會減少纖維豐富的食物。」
同時，營養師也會進行家訪，將病患的個人飲食喜好納入考量，為病患量身打造餐點。洪彩綾表示，同樣是粥品，會針對不同病患做細部的改變。如果病患不喜歡竹筍，那麼會改為山藥；如果不吃白米，就會改為糙米。菜餚的鹹淡度，米飯的軟硬度，都會配合病患要求，進行更改。
洪彩綾表示，在設計菜單的過程中，最困難的是遇到病患同時擁有不同的疾病，造成飲食上的衝突。例如癌症病患必須攝取高熱量、高蛋白質，如果病人同時擁有糖尿病，就無法攝取澱粉類食物，但熱量最大來源就是澱粉。但是她說：「其實沒有任何一個東西是完全不可以吃的，只是份量的問題。」遇到這種狀況時，營養師就會計算，要如何才能不超過病患可以攝取的份量。
洪彩綾說：「當病人有特定口味上的需求時，我們會先考慮他們的要求是否合理。當你滿足他某一點的需求時，說不定就可以藉由這點讓他有更好的食慾。」化療餐希望能夠讓病患更好地攝取營養，所以在不違背這個原則下，營養師會盡可能去滿足病患的需求。
','EMP0001',load_blob('ND003.jpg'),'上架'  
);


INSERT INTO NEWSDETAIL(NEWSNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('ND'||LPAD(to_char(NEWSNO_SEQ.NEXTVAL),4,'0'))),'以愛陪伴 打造孩子的希望樂園',
'台灣兒童少年希望協會致力於照顧弱勢家庭的孩童，目前在鶯歌、三峽、樹林皆有服務據點，他們結合在地資源，與在地人一起照顧在地的孩子，給予更多陪伴與關心，讓孩童重拾自信與笑容。
不只幫助孩子 更要服務弱勢家庭
許多弱勢家庭無法給予孩童適當的陪伴與照顧，家長除了沒有時間，也沒有資源能夠提供孩子完好的環境。因此，台灣兒童少年希望協會針對有需求的家庭進行家訪與評估，「我們家訪主要是針對清寒，但沒辦法拿到福利身份的家庭，因為他們都還是有經濟困難。」協會的秘書長林芯怡說，協會透過與學校、社福單位與公部門合作，建立鶯歌、三峽和樹林三個據點，希望能減輕更多父母照顧孩子的壓力。
除了協助兒童課後照顧及生活輔導，協會工作人員會細心了解每個孩子的成長背景，「接觸孩子家庭是很重要的部分，因為不了解就不知道他們為什麼會這樣。」林芯怡認為，很多孩童的狀況都與家庭有很大的關係，所以協會除了照顧之外，也有責任關心孩子的家庭，並且提供有特殊需求的個案必要的資源和轉介服務，像是法律諮詢、急難救助、緊急安置等等，透過資源整合的方式來照顧這些弱勢家庭。
多元活動 開闊孩子對於未來的想像
協會工作人員針對孩子的需求會規劃不同的活動，不只讓孩子接觸手工藝、烘焙、美術課等課程，有時也會帶孩子到不同縣市走一走，讓孩子不會侷限在自己的小小空間，而是有機會了解不同的城市。今年暑假，協會和附近國小合作，舉辦兩天一夜的營隊，讓孩子體驗溯溪、高空活動，進而認識山林。林芯怡表示：「我們的孩子接觸的東西比較少，沒有一些外在刺激，對外面的世界就不是那麼認識。」所以他們更希望孩子能透過「玩中學」、「做中學」的方式探索自己的方向與興趣。
較特別的是，協會工作人員特別為孩子舉辦職業探索課程，邀請各行各業的人為孩子進行演講，像是刺青師、水上活動教練、軍人等等，鶯歌據點的社工張立遠說：「因為之前讓孩子做過問卷，發現他們對職業的認識只停在爸媽的工作。」而透過這些有趣、實作的職業體驗活動，不但能增加孩子對於職業工作的初步體認，也讓他們對於未來的想像能更寬廣。
','EMP0001',load_blob('ND004.jpg'),'上架'
);





INSERT INTO NEWSDETAIL(NEWSNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('ND'||LPAD(to_char(NEWSNO_SEQ.NEXTVAL),4,'0'))),'有我罩你實踐「在家享老」長照產業化',
'隨著長照2.0上路，中化銀髮正式推出由經濟部工業局指導、工研院產經中心IEK擔任輔導單位的「居家照護一站式平台」，邀請到經濟部工業局民生化工組副組長李佳峰、衛生福利部主任秘書王宗曦、工研院產經中心IEK副主任鍾俊元、新北市衛生局局長林奇宏、國立臺北護理健康大學校長謝楠楨等產、官、學、研、醫界等各方代表，
共同見證台灣長照產業化願景在有我罩你與夥伴的努力下起飛，實踐「在家享老」的美好期盼。
經濟部工業局民生化工組副組長李佳峰表示，經濟部工業局於今年開始執行為期四年的健康福祉創新服務推動計畫，
從國內在地銀髮需求出發，運用資通訊科技及跨業整合，透過發展整合型創新服務模式、打造台灣成為亞太健康福祉產業創新重鎮。
「有我罩你居家照護一站式平台」是國內第一個由政府單位所輔導的健康福祉跨產業雲端電子市集交易平台先驅典範，
為台灣『長照產業化』開啟關鍵第一步！希望未來有更多產業或跨領域供應商加入，有競爭才有進步，透過產業間的媒合與具體合作，打造共創、共享、共贏的銀髮產業環境。」
近年更朝全方位照護發展，擴增銀髮人才培訓、銀髮產業經營顧問等服務。除了針對照顧難度高、
需求量大的失智症以及術後復健期的長輩開立專門照顧方案、設計適合的居家健康促進活動外，未來也將推廣居家安寧的服務項目。
','EMP0001',load_blob('ND005.jpg'),'上架'  
);



INSERT INTO NEWSDETAIL(NEWSNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('ND'||LPAD(to_char(NEWSNO_SEQ.NEXTVAL),4,'0'))),'以愛陪伴 打造孩子的希望樂園',
'台灣兒童少年希望協會致力於照顧弱勢家庭的孩童，目前在鶯歌、三峽、樹林皆有服務據點，他們結合在地資源，與在地人一起照顧在地的孩子，給予更多陪伴與關心，讓孩童重拾自信與笑容。
不只幫助孩子 更要服務弱勢家庭
許多弱勢家庭無法給予孩童適當的陪伴與照顧，家長除了沒有時間，也沒有資源能夠提供孩子完好的環境。因此，台灣兒童少年希望協會針對有需求的家庭進行家訪與評估，「我們家訪主要是針對清寒，但沒辦法拿到福利身份的家庭，因為他們都還是有經濟困難。」協會的秘書長林芯怡說，協會透過與學校、社福單位與公部門合作，建立鶯歌、三峽和樹林三個據點，希望能減輕更多父母照顧孩子的壓力。
除了協助兒童課後照顧及生活輔導，協會工作人員會細心了解每個孩子的成長背景，「接觸孩子家庭是很重要的部分，因為不了解就不知道他們為什麼會這樣。」林芯怡認為，很多孩童的狀況都與家庭有很大的關係，所以協會除了照顧之外，也有責任關心孩子的家庭，並且提供有特殊需求的個案必要的資源和轉介服務，像是法律諮詢、急難救助、緊急安置等等，透過資源整合的方式來照顧這些弱勢家庭。
多元活動 開闊孩子對於未來的想像
協會工作人員針對孩子的需求會規劃不同的活動，不只讓孩子接觸手工藝、烘焙、美術課等課程，有時也會帶孩子到不同縣市走一走，讓孩子不會侷限在自己的小小空間，而是有機會了解不同的城市。今年暑假，協會和附近國小合作，舉辦兩天一夜的營隊，讓孩子體驗溯溪、高空活動，進而認識山林。林芯怡表示：「我們的孩子接觸的東西比較少，沒有一些外在刺激，對外面的世界就不是那麼認識。」所以他們更希望孩子能透過「玩中學」、「做中學」的方式探索自己的方向與興趣。
較特別的是，協會工作人員特別為孩子舉辦職業探索課程，邀請各行各業的人為孩子進行演講，像是刺青師、水上活動教練、軍人等等，鶯歌據點的社工張立遠說：「因為之前讓孩子做過問卷，發現他們對職業的認識只停在爸媽的工作。」而透過這些有趣、實作的職業體驗活動，不但能增加孩子對於職業工作的初步體認，也讓他們對於未來的想像能更寬廣。
','EMP0001',load_blob('ND006.jpg'),'上架'
);




INSERT INTO NEWSDETAIL(NEWSNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('ND'||LPAD(to_char(NEWSNO_SEQ.NEXTVAL),4,'0'))),'引進日本輔具清潔設備 全台首家非營利「輔具清潔工場」開張',
'根據統計，目前全台的身心障礙者人數約120萬人，65歲以上長者近320萬人，且隨著高齡社會來臨，比例年年攀升，加上有好幾十萬的長者平均臥床長達七年之久，許多民眾都需要「輔具清潔」來協助生活品質。
全台首家「輔具清潔工場」近日在臺南開張了！引進了日本專業輔具清潔設備，從回收開始，進行條碼編列、入庫清點；接著透過多次重複的高壓沖洗、高溫去污以及輪胎清潔，去除塵垢與深層的髒污，並且使用專業臭氧機淨化異味，溶解更細的粉塵。
清潔流程還沒完喔！清潔完的輪椅、電動床，還會送進全台唯一的大型乾燥機進行乾燥流程，此舉能減少殘留輔具上有害物質，並降低濕度避免細菌孳生。在清洗完成後，還會檢查修補、包裝、入庫保管等等，清潔流程才算正式完成。
','EMP0001',load_blob('ND007.jpg'),'上架'
);






INSERT INTO NEWSDETAIL(NEWSNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('ND'||LPAD(to_char(NEWSNO_SEQ.NEXTVAL),4,'0'))),'今天換狗當治療師！狗狗怎麼協助失智阿嬤、中風阿公？',
'精神奕奕的台灣動物輔助治療專業發展協會（以下簡稱為台灣治療犬協會）理事長陳美麗，只見她拿出一大疊厚厚的冊子，裡面寫滿在各地奔波，提供「動物輔療」服務的行程表，氣色極好的她，看不出來才剛剛完成一項動物輔療的服務。
與其他的動輔師一樣，她有另一份正職，另一個身分是臺北護理健康大學的護理系講師，但對於來往奔波服務，她始終樂此不疲，因為在她的生命藍圖裡，洋溢著喜悅與溫情，如同其他助人工作者所言：「我得到的，永遠比我付出的還多。」
不願復健的中風長者
「有一位長者，其中一隻手因為中風的關係麻癱了，家屬和工作人員請他用健康的手拉著癱瘓的手去運動，這樣斷斷續續過了一年後他還是說做不到。可是當他看其他長者可以摸小狗，跟小狗玩，在他的心裡起了一些作用吧！我們告訴他，狗狗喜歡他的生病的手來摸，剛開始，他口裡說不要，做不到；沒想到他卻不經意的嘗試著用健側的手拉起患側的手，說著我要摸狗狗，『兩隻手都要摸到小狗』這個目標，他達到了。」因此，我們也會用幫狗狗梳毛、餵食、套圈圈、投籃等方式激勵長輩的復健運動。
其實許多中風長者不願意復健，是因為心情低落的緣故；動物輔療以狗狗作為誘因，讓許多長者從願意「試試看」到「我要改變」；在大家持續不斷的鼓勵下，長者慢慢打開心門與身體的功能，才越來越容易恢復。
','EMP0001',load_blob('ND008.jpg'),'上架'  
);


INSERT INTO NEWSDETAIL(NEWSNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('ND'||LPAD(to_char(NEWSNO_SEQ.NEXTVAL),4,'0'))),'只要一通電話，長照服務送到家！ 1966 長照專線12月開通',
'「市民疑難雜症打1999，生命線打1995，訂Pizza打4129889，需要長照要打多少啦？」
「長照2.0上路那麼久，服務到底要怎麼申請？實在是霧煞煞…...」這絕對絕對不是詐騙集團，這其實是衛福部為了取代先前大家可能依稀記得的「412-8080」長照服務專線，而新設置的長照專線。
從今以後，大家不用再記落落長的電話，我真的也記不起來！現在只要簡單的四個數字1966，
就能聯繫各縣市長照中心，這項措施不僅可以增加民眾取得服務的可近性、普及長照服務之外，真的是一項非常便民的措施呢！
 而且！好康還不只如此，這通電話竟然還提供前五分鐘免費的服務，但是超過五分鐘，通話費是需要由民眾自行負擔的喔。
 1966 這四個數字很重要！因為他就像是一道長照大門的通關密碼，只要你進入這道門並且符合資格，裡面的服務與資源都是你可以使用的，這可是攸關你個人或家人的權益，所以！請你現在記下來，當你需要長照服務時，請記得撥打 1966 諮詢長照管理中心，來減輕你自我生活或照顧上的負擔！
','EMP0001',load_blob('ND009.jpg'),'上架'  
);


INSERT INTO NEWSDETAIL(NEWSNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('ND'||LPAD(to_char(NEWSNO_SEQ.NEXTVAL),4,'0'))),'不會照顧家中長輩嗎？ 政府補助照指員到你家',
'台灣老老照顧的現象愈來愈普遍，平常雖然有聘僱居家服務員短暫的協助，但是居家服務員一旦離開，照顧責任仍回歸到家人身上，照顧指導員吳先岳說，很多照顧者在幫忙伸展時，動作都做錯，被照顧者容易受傷，照顧者也同樣容易扭傷。衛福部社家署今年起擴大補助對象，只要家中沒有聘僱外勞或看護工，即可申請照指員的服務，並補助最高12小時。
過去若是有申請喘息服務或是其他長照服務，照顧指導員的申請就會受限，今年起擴大補助對象，只要家中沒有聘僱外籍家庭看護工，自行照顧65歲以上長輩或是55歲以上原住民、失能身心障礙者的家庭照顧者，可以申請照顧指導員的補助。
補助內容則是低收入戶全額免費、中低收入戶需要自付10%，為每小時35元、一般戶自付30％，為每小時105元，最多補助12小時。若是一般家庭不符合資格仍須要照顧指導員的服務，同樣也能申請，只是需要全額自付費用，每小時為350元。
弘道老人基金會執行長李若綺表示，弘道承辦社家署的委託計畫，目前已經培訓出274位照指員，希望能繼續增加照指員的數量。社家署長簡慧娟表示，目前全台已有54個單位，可以提供照指員的服務，可洽各縣市政府社會局或長期照顧管理中心，或可善用長照專線，市話直撥412-8080（幫您幫您）、手機請撥（區碼）-412-8080，將有專人提供專業諮詢服務。
','EMP0001',load_blob('ND010.jpg'),'上架'  
);


INSERT INTO NEWSDETAIL(NEWSNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('ND'||LPAD(to_char(NEWSNO_SEQ.NEXTVAL),4,'0'))),'已經聘僱外籍看護，還可以獲得「長照2.0」的照護嗎？',
'綜合來看，已經聘僱外籍看護的長者，並不是長照2.0照護網之外的「孤兒」，只要拿起電話，先向各地照管中心聯繫，就能享受長照2.0的部分照護了。
小靚雖然不是回教徒，但是她卻知道回教有「齋戒月」，以及「開齋節」等習俗。由於小靚母親的外籍看護是印尼回教徒，每逢開齋節一定會要求休假，因為開齋節就像是她們的新年。
不是開齋節的時候，看護的好朋友們如果約好要出遊，看護也會跟著請假。這時小靚也只好跟著向公司請特休，回娘家陪伴獨居的母親。
臺灣目前聘僱外籍看護的長者約有22萬人，這些長者與家人，對於「長照2.0」會有兩種迷思；一種是以為都「照」得到，一種是以為都「照」不到。事實是，有的項目「照」得到，有的項目「照」不到。
對於已經聘僱外籍看護的長者，到底哪些項目可以申請補助？哪些項目不可以？會因各地方政府財政而略有不同。建議正確的作法是，先連絡各地政府的總窗口，也就是各縣市政府的「照顧管理中心」（簡稱照管中心）。
北市照管中心表示，不管有沒有聘僱外籍看護，長者或是家人只要撥專線到照管中心（譬如台北市為1999轉5880再按9；其他縣市則為412-8080），照管專員（簡稱照專）就會約時間到府服務，不用大費周章的推輪椅、陪長輩來回奔波。
照專到府後，會先確認長輩是否為「服務對象」。理論上，根據巴氏量表評估過，已經申請外籍看護的長者，應該也會是「長照2.0」的服務對象。但是照專仍須按ADLs（日常生活活動功能）；或是IADLs（工具性日常生活活動功能），再做一次評估。
','EMP0001',load_blob('ND011.jpg'),'上架'  
);


INSERT INTO NEWSDETAIL(NEWSNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('ND'||LPAD(to_char(NEWSNO_SEQ.NEXTVAL),4,'0'))),'台北市勞動局成立銀髮人才就業諮詢站 「高年級實習生」快看這裡！',
'面臨銀色海嘯撲面而來，隨著國人平均壽命增加，很多優秀的人才在面臨65退休大關時，只好離開職場，滿懷才華與經驗卻無處可施力，很多銀髮族更擔心，退休後如果沒有事情做，就會快速衰老，甚至心理、生理都因此受到影響，加上許多中高齡者其實有意願再度投入職場，因此「退而不休」成了一股新趨勢。
延續銀髮智慧，北市東區地下街設銀髮就業諮詢站:
為了妥善運用人力再創勞動價值，臺北市就業服務處於臺北捷運東區地下街30號店鋪(鄰近忠孝敦化站)成立銀髮人才就業諮詢站。除了提供銀髮族職涯諮詢、履歷及面試諮詢以及就業媒合等服務，也希望如同電影「高年級實習生」般，將有管理長才、顧問能力的銀髮族組成人才顧問團，讓有心力工作的銀髮高齡者得以貢獻智慧，再次在職場舞台上展現風采。
臺北市政府勞動局局長表示，為了延續銀髮族的勞動價值，以「One More Chance」為口號，鼓勵企業聘用銀髮專業人才。銀髮人才就業諮詢站特地設立在交通位置方便的地方，目的就是為讓長輩可以輕鬆到達，以便諮詢就業內容，服務項目包括一對一職涯諮詢、求職求才、創業協助以及銀髮人才顧問團等服務，有就業需求的銀髮族也可以在網站上找到最新、有保障的職缺，也能精準地與求才企業做媒合。
','EMP0001',load_blob('ND012.jpg'),'上架'  
);

INSERT INTO NEWSDETAIL(NEWSNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('ND'||LPAD(to_char(NEWSNO_SEQ.NEXTVAL),4,'0'))),'你還搞不清楚嗎？外籍看護不是外傭，叫看護做其他家事，小心觸法',
'你怎麼稱呼幫忙照顧、陪伴爺爺奶奶的外籍幫手們呢？是外勞還是外傭？其實正確的解答是「外籍看護」。外籍看護和外傭的工作職責不同，大家可要搞清楚，不要錯把外籍看護當外傭看待，不只是忽略了外籍看護的權益，也可能違反法律喔。
根據勞動部訂定的「外國人從事就業服務法第46條第1項第8款至第11款工作資格及審查標準」，家庭幫傭，主要是在家庭內從事房舍清理、食物烹調、照料家庭成員起居或其他與家事服務有關的工作；而家庭看護工，也就是我們稱之的外籍看護，則是在家庭內從事病患、身心障礙者的日常生活照顧相關事務工作。
所以兩者是不一樣的；家庭幫傭的工作為「家事服務」，而家庭看護工的工作範圍，則是在「照顧」重病的受看護人。
別再將「外籍看護」和「外傭」混為一談，如果指派了「外籍看護」從事全戶打掃、洗車、等照料家戶生活起居許可範圍之外的工作，將涉違反就業服務法第57條第3款規定，而受新臺幣3萬元以上15萬元以下罰鍰。
對於來家庭中提供居家服務和照顧的人，許多人不自覺仍帶有就傳統框架，覺得對方是「傭人」，就該包辦所有事；但無論本籍或外籍勞工的勞動權都該獲得尊重，畢竟，他們也是來協助我們照顧最愛的家人，要有好的照顧品質，也須「各司其職」。
','EMP0001',load_blob('ND013.jpg'),'上架'  
);
---------------------------------  保健假資料 -------------------------------------

INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('HD'||LPAD(to_char(HEALTHNO_SEQ.NEXTVAL),4,'0'))),'一個動作疏通全身阻塞的淋巴，水腫肥肉都消滅！',
'每天一起床，第一個動作就是拿起手機看看訊息；翻閱書報、吃飯時也是保持前傾姿勢，更不用說每天長時間上班面對電腦，幾乎都是拱著身子前彎看電腦，使得人人幾乎都有胸悶、肩頸僵硬的困擾，更不用說久坐帶來的循環不良，讓人水腫又不健康。透過一個簡單的瑜珈動作，就能輕鬆伸展到身體前半部、給予脊椎良好刺激，同時活絡鼠蹊部和大腿前半部，消除水腫促進循環！
伸展僵硬肢體　促進循環排出老廢棄物 ，日本瑜珈老師上村由夏表示，瑜珈的姿勢之中，有著能以舒服的方式反向伸展脊椎的動作，對於重整姿勢有幫助，也有助於讓人恢復元氣。 
日本運動教練古川美佳表示，現代生活的便利，讓運動量不足的人越來越多，特別是從事辦公室工作的人，如果沒有有意識的多多活動，特別容易運動不足，而不常活動的大腿，就會變得僵硬，身體不需要的老廢棄物都無法透過靜脈和淋巴排出，多餘的水分和廢棄物就造成了水腫，血液循環不良，也讓營養素和氧氣難以運送，就會讓脂肪也變得容易囤積。 
而上村由夏老師表示，這個姿勢不只能夠伸展到身體的前半部，打開胸口，讓呼吸變深沉，強化脊椎、矯正姿勢，還能能刺激到有著淋巴結的鼠蹊部以及大腿前半部，能夠預防水腫，此外，由於是需要肌力支撐、也需要平衡感的動作，因此具有強化腹肌和頸部周圍的效果。',
'EMP0001',load_blob('HD001.jpg'),'上架'
);



INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('HD'||LPAD(to_char(HEALTHNO_SEQ.NEXTVAL),4,'0'))),'60秒桌上鴿式伸展，放鬆臀部肌肉、緩解下背痛',
'在辦公室坐著打電腦一整天，該是時候起來活動活動筋骨囉！或許有些人認為，伸展就是需要寬闊的空間、悠閒的時間，才能真正放鬆。不過其實只要趁空檔時間、每次花60秒進行這項簡單的「桌上鴿式伸展」，就能幫助放鬆因久坐而緊繃的臀部，還能提升深蹲效果、預防下背痛等問題！ 
「Men’s Health」網站的健身顧問BJ Gaddour指出，如果站立時雙腳沒有自然朝前，就可能是臀部的旋轉肌群過於緊繃，而這通常是由於靜態活動、特別是坐著的時間過久所導致。而有在進行深蹲、硬舉等鍛鍊，久坐也可能是導致運動表現停滯的原因。下背疼痛、膝蓋疼痛、無法跳高，都可能是臀部肌肉緊繃導致。 
健身教練、物理治療師Kelly Starrett指出，每天利用空檔時間進行數次伸展，對於提升身體活動性的益處，和耗費大量時間的訓練其實差不多。而鴿式伸展的動作，除了能夠打開緊繃的臀部之外，也有助於緩解下背疼痛，同時也能提升深蹲、硬舉鍛鍊等運動的表現。而且，這項運動非常簡便，可以在任何地方進行，所需的工具僅有一張桌子、長凳，或是自己的辦公桌或書桌。 
鴿式伸展原本是一種瑜珈動作，練習時需要趴在地上、並彎曲其中一側的膝蓋後，將上半身前傾、貼近地面，
以達到伸展效果。不過，對於較少伸展的人而言，一開始就練習這樣的伸展較為困難；而健身網站「The Art of Manliness」則認為，
藉由桌子的幫助，可以讓這個伸展容易許多，同時還能從多個不同的角度伸展肌肉。 ',
'EMP0001',load_blob('HD002.jpg') ,'上架' 
);




INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('HD'||LPAD(to_char(HEALTHNO_SEQ.NEXTVAL),4,'0'))),'4種營養改善氣喘、過敏性鼻炎！1張表看懂過敏吃什麼',
'敏兒該怎麼吃？除了生活習慣，飲食與過敏的關聯甚大，除了避開地雷食物外，有些天然的營養素、好的飲食習慣可以有效緩解過敏。 
日常生活常見的食物之中，其實就隱含著改善呼吸道過敏的微量元素，究竟要如何獲得呢？ 對於氣喘、過敏性鼻炎有幫助的微量元素。維生素A :修復功能：可維持人體上皮黏膜細胞的完整，因此過敏原不容易進入體內。如果擔心劑量失當會導致中毒，可以多吃富含β胡蘿蔔素的食材。 食物：深綠色、橘色、紅色的蔬菜水果。和油脂一起食用，吸收率會更好。 維生素C :
修復功能：非常多的研究已經證實它可以改善過敏或氣喘。 食物：奇異果、芭樂等水果。益生菌 :修復功能：有60%的免疫系統在腸道，當腸道健康，免疫系統也比較穩定。好菌可以幫助我們調整腸道的菌相，減少過敏被誘發的情況。
。Omega-3的油脂 :修復功能：可以幫助預防支氣管收縮，改善氣喘的發生。 食物：鯖魚、秋刀魚都是天然Omega-3的來源。 
',
'EMP0001',load_blob('HD003.jpg'),'上架' 
);

INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('HD'||LPAD(to_char(HEALTHNO_SEQ.NEXTVAL),4,'0'))),'洗澡注意這件事，好睡眠幫大腦回春防失智',
'轉個身就想不起來剛才是要做什麼，常常忘東忘西，或是突然叫不出熟人的名字？如果常發生上述這些情形，可能是老化造成健忘的徵兆。但是當情形持續發生，甚至漸漸影響到日常生活，就要小心是腦部出現問題！日本北里大學醫學部名譽教授川上正也表示，維持良好睡眠品質有助於大腦修復與整理記憶，睡前可以做1件事，幫助大腦回春，預防失智不再健忘！ 
健忘情形加重、頭痛想吐要注意！川上正也教授表示，我們的記憶有長期記憶、短期記憶兩種類型，分別儲存在大腦不同的位置。每天接觸到的大量情報，首先會送到大腦皮質，新接收到的情報會被送到海馬迴暫時保管，當情報經由判斷確定為重要訊息之後，再被送回大腦皮質變成長期記憶保存。 
隨著年齡增長，海馬迴會開始萎縮、衰退，無法有效率的整理短期情報，因此會變成舊事很容易想起來，例如老家的地址等，卻無法記得「今天早餐吃了什麼」之類的最新訊息，但是這種是短期記憶，忘記也屬正常，不會造成生活上的障礙。 
但是如果有「忘記自己已經吃過早餐」、「經提示仍記不起熟人、親人的名字」等類似的情形並且持續發生，甚至有頭痛、想吐、手腳發麻等身體不適狀況，可能是腦部出現問題，需要到醫院就診。
','EMP0001',load_blob('HD004.jpg'),'上架' 
);

INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('HD'||LPAD(to_char(HEALTHNO_SEQ.NEXTVAL),4,'0'))),'骨盆歪了，少年人竟也漏尿！學螃蟹走路練臀肌輕鬆改善
',
'根據臺南奇美醫院的公開資料統計顯示，25～55歲婦女中約有20%、55歲以上婦女中則約有30%左右，有著不同程度的漏尿、尿失禁問題，隨著年齡增加，以及肌力的流失，這些困擾人的排尿困擾也會越來越明顯。而根據日本2016年的最新調查，其實不光是女性，連20歲的年輕男性，都有高達85%曾有尿失禁及漏尿經驗。 
正常來說 女性30歲後 男性40歲後才易頻尿、漏尿
日本整體師久孃由起子則在自己的暢銷書《やせたいなら肛筋を鍛えなさい》（暫譯：想瘦的話就鍛鍊肛門肌肉）中表示，其實女性在30歲以後、男性在40歲以後，都很容易因為肌力過度減少，慢慢變得頻尿、易漏尿。 
此外，生過小孩的女性，更是容易因為自然產時，產道後面的肛門括約肌受傷，而導致控制排尿、排便的能力都受到影響。 
現代人20歲就開始漏尿 關鍵就在「坐姿傷害」！
但是為什麼開頭的研究中卻發現，肌肉正發達的25歲女性以及20歲左右男性也都有漏尿、尿失禁問題呢？ 
久孃由起子指出，這要歸因於現代人長期的坐姿不良所導致的「姿勢傷害」！位於屁股正下方的提肛肌，以及內、外肛門括約肌等深層肌群，是坐著的時候負責支撐上半身跟脊椎重量的重要肌肉，也是所謂骨盆底肌群的一部份，不只能夠控制排便，也能夠控制排尿。 
一旦坐姿不正，或是太常敞開雙腿、偏重在單側屁股上，都會使得這三處肌群鬆弛、肌力流失，骨盆更會受到肌肉收縮的拉扯而位移，下盤支撐脊椎的力量則會減少，基礎代謝就會大幅降低，就算年紀正輕，也可能會出現漏尿問題。 
','EMP0001',load_blob('HD005.jpg'),'上架'
);


INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('HD'||LPAD(to_char(HEALTHNO_SEQ.NEXTVAL),4,'0'))),'防乳癌必切乳？7件事助排毒、遠離慢性發炎，就是在防癌
',
'2013年，美國影星安潔莉娜裘莉（Angelina Jolie）在紐約時報登文，說明她進行了預防性的乳房切除手術，而兩年後又預防性的切除卵巢。裘莉在文章中表示，目睹自己的母親及阿姨罹患乳癌及卵巢癌，在不到60歲的年紀就逝世，因為擔心而做了基因檢測，發現自己抑制乳癌發生的基因確實有缺陷。 
提到裘莉的狀況，基因功能營養醫學專家劉博仁醫師解釋，能夠抑制乳癌的是BRCA1基因，而當此基因出現缺陷時，就有很高的機率在45歲罹患乳癌、50歲時罹患卵巢癌。 
現在越來越多人會做基因檢測，可藉此找到自身基因缺陷，提供預防的參考，但若是發現基因問題，是不是只能做預防性手術？ 
對此，劉醫師回應，裘莉事件造成很大的影響，雖然國外針對基因的異常缺陷，會提供預防性的手術，「但我絕對不會鼓勵你，因為你基因有問題，就要做一些器官的切除手術。」 
環境荷爾蒙易致癌，飲食多吃十字花科類蔬菜，至於我們該如何得知自己是否有罹患乳癌的風險，劉醫師也點出應該注意的面向。 
「假設您家族史中有人罹患乳癌，當然可以考慮先做基因檢測。」劉醫師表示，透過檢測可了解是否有缺陷，但他強調基因造成腫瘤的機率大概有10％，「換句話說有很多是後天的問題。」 
「平常用寶特瓶裝水，晃啊晃的喝下去，塑化劑濃度非常高。」劉醫師指出，要特別注意環境荷爾蒙，舉凡食物、外用保養品、
盥洗用品（沐浴乳、洗髮精），甚至用塑膠袋盛裝熱食、寶特瓶裝水等，都容易吃到塑化毒。',
'EMP0001',load_blob('HD006.jpg'),'上架'
);


INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('HD'||LPAD(to_char(HEALTHNO_SEQ.NEXTVAL),4,'0'))),'熊爪式淋巴按摩排出體內壞氣，消長年肩痛、提高免疫力
',
'每天忙於工作、家庭，責任和壓力的重擔牢牢壓在肩上，總是讓人感到喘不過氣，不論是抽空喝喝下午茶、按按摩，都無法舒緩，過沒幾天又覺得肩頸僵硬、疲勞，整個人覺得怪怪的，感覺很不舒服？不妨試試簡單的熊爪式淋巴按摩術，在家就能輕鬆進行，天天為自己疏通淋巴，消除肌肉僵硬，排出體內廢棄物！
上半身囤積壞氣，導致身心失調：日本淋巴護理研究協會指出，淋巴藉由淋巴管通過淋巴結過濾老廢棄物，因此淋巴結是否順暢，就是淋巴循環的關鍵，例如雙臂的淋巴管就會通過腋下，一但這個地方阻塞，就會造成雙手的水腫、鬆弛，胸部也會變得容易下垂。 
日本人氣療癒諮詢師日下由紀惠指出，身心感到不適的人，有可能是因為來自負面情感的「壞氣」滯留體內的緣故。例如憤怒、悲傷、不安、恐懼等等的負面能量，會囤積於上半身的腋下、胸口以及骨頭之中，如果放置不管，就會讓好的氣無法進來，不只讓人變得消極，也會陷入身體不適、生病的局面。 
而按摩腋下的淋巴結到肋骨之間，就有助於讓囤積於上半身的壞氣流動，達到淨化的效果。如果按壓腋下會痛，就是憤怒和悲傷囤積著的證據。 疏通腋下淋巴結，治好長年肩痛、排毒增高免疫力
日本芳療整體院Andona指出，對於有著長年肩頸僵硬問題的客人，比起肩膀，他們會從腋下的淋巴著手，透過疏通淋巴節，有許多長年靠著按摩肩膀卻都無法消除僵硬疼痛的客人，都有了驚人的改善。 

','EMP0001',load_blob('HD007.jpg'),'上架'
);

INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('HD'||LPAD(to_char(HEALTHNO_SEQ.NEXTVAL),4,'0'))),'80％的病是因為慢性發炎！赤腳接地氣消炎防癌又抗老',
'大地是天然的消炎劑，而地球本身就是這個星球上最大的電子捐贈者，這對你來說有什麼意義？ 
你只要想像一下，有一群強大的隱形游離電子部隊，從地球表面馳騁而來，抵達你體內各處，以優勢武力將那些導致發炎的自由基一掃而空，消除因缺乏接地而產生的電子不足症狀，使身體能夠開始復原。
身體的發炎、病痛，都只是缺乏電子的徵兆，只是程度不同罷了。而解決之道近在眼前，就是你身處其上的大地。 
發炎分為兩種：急性發炎與慢性發炎。急性發炎是身體對抗有害刺激的第一反應，受傷部位會像剛剛描述的，湧進大量血漿（淡黃色液體，組成血液的成分）與白血球。這是好現象，是受傷時所必需的。
另一種則是慢性發炎，也就是長時間發炎的狀態。這是應該避免的狀況。慢性發炎意味著發炎部位的活動逐漸出現改變，身體一面破壞、一面修復組織，但大量有害的自由基卻侵入了周遭的健康組織。於是破壞與修復的競賽不斷延長，這會給身體帶來嚴重的傷害。 
自由基在免疫反應中無疑扮演著關鍵角色，但是任務完成後，自由基要是沒有及時退場，就會惹出大麻煩。好人突然變臉成了壞人，大肆破壞，硬是拆爛無辜的健康細胞，大家可以把它們想像成擺平小偷後，突然回頭反咬主人的惡犬。 
自由基持續攻擊健康組織，將其氧化，導致免疫系統進入超高速運轉模式，不斷派出更多白血球，結果製造出更多自由基。所以自由基才會惡名在外，科學家也因此一致同意，自由基是造成慢性疾病與老化的根本原因，更會加速老化，縮短壽命。 
我們相信，正常發炎過程之所以會失控，是因為我們失去了和大地的連結。現代人面臨了電子不足的問題。我們體內沒有足夠的自由電子來滿足因飢渴而作亂的自由基，於是自由基不斷攻擊相鄰的健康組織，導致不斷擴張的惡性循環。自由基毫不容情的攻擊引發了免疫反應，表現在身體上就成了慢性發炎。免疫系統失去控制，回過頭來攻擊主人，也就是你。  

','EMP0001',load_blob('HD008.jpg'),'上架'
);


INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('HD'||LPAD(to_char(HEALTHNO_SEQ.NEXTVAL),4,'0'))),'敲膽經不只瘦腿，還能治耳鳴頭痛！名醫教你這樣敲
','
敲膽經膽的功能正常，則諸臟易安，故有「 凡十一臟取決於膽」之說。所以，敲膽經，可刺激膽汁分泌，促進膽經的氣血通暢，使肌體消化功能正常，維持各臟腑間的協調平衡， 是女性從根本上美顏塑身的奇招。 
可以這樣敲：姿勢隨意，以便於操作為宜；雙手握空拳，沿大腿外側的環跳穴開始敲，依次經過風市、中瀆，敲到膝蓋處的膝陽關。每次敲到大腿外側的這四個穴位點上，可以稍用力一些，以每敲打四下為一次，每天敲左右大腿各五十次，也就是左右各兩百下。 
膽經為半表半裡的經絡，它與外界無直接的通道，所以，在敲膽經時濁氣會從腸道中排出。有少數人在敲膽經時會出現頭疼腦脹、失眠多夢的現象，這是由於膽經裡的濁氣沒有從腸道排出，而是從三焦經上跑到了臉部。這時只須按膽經的陽陵泉，以及點揉一下右側三焦經上的支溝穴，不適症就會消失了。 
另外，膽經上還有許多特效的穴位，感興趣的女性朋友，不妨多按一下。足竅陰可治用腦過度引起的乳房脹痛；俠溪可治精神緊張，肝膽火旺，臉頰腫痛，耳鳴頭痛；足臨泣可治月經不調及伴有腰痛；陽輔可治腰腿酸軟、月經發黑並夾雜著血塊；陽陵泉可治天生皮膚發黃、沒有光澤。 
敲膽經最佳的時間是膽經當令時—子時（即夜裡十一～凌晨一點），以及與其相表裡的肝經當令時—子丑時（即凌晨一至三點）。但是這兩個時段，人應該是處於深度睡眠的階段，起來做按摩有些不實際。所以除了這兩個時段外，敲膽經還可以選在 每天上午的七至十一點間。上午敲打膽經，同樣能達到 疏通膽經、 促進身體排毒的療效。
','EMP0001',load_blob('HD009.jpg'),'上架'
);

INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('HD'||LPAD(to_char(HEALTHNO_SEQ.NEXTVAL),4,'0'))),'冬天最易傷腎！腎臟科醫師警告：避開這6件事
','
冬天氣溫低，除了留意心血管疾病問題外，腎臟病患也不宜大意！尤其冬天容易暴飲暴食，大啖美食加上飲水不足，更容易加重腎臟負擔。新光醫院腎臟科張瑞廷醫師提醒，腎臟病變初期症狀不明，極容易為人所忽略，以致症狀加劇時恐已造成不可逆的腎臟損傷，不可不慎！
冬天的活動力普遍偏低，加上天冷不易出汗，就容易減少飲水。若身體持續缺水會讓體內的毒素及廢物不易排出，容易造成結石甚至腎功能減退。 
對於健康的民眾而言，建議每日需攝取約2,000cc的水分，並採少量多次補充身體所需，因茶水或市售飲料可能含有大量的鉀離子，年長者過量飲用恐超過腎臟負荷。而嚴重慢性腎臟病患則應依照醫師建議控制水分攝取，以免出現肺積水。
飲食控制不良:冬天最常圍爐吃火鍋，但市售火鍋往往過油、過鹹，對腎臟病友是沉重的負擔。譬如：食材久煮後的湯底含有大量的鉀、鈉、與普林，肉類食材含過高的蛋白質，沙茶、豆瓣醬、辣椒醬等火鍋調味料都含有過高的鹽分，一餐下來即會血壓上升、加速腎臟功能惡化。
因此，腎臟病友吃火鍋時應避免飲用高湯，多吃新鮮蔬菜、少吃肉類、雞蛋、海鮮等富含蛋白質的食材；火鍋調味料建議採用新鮮的蔥、薑、蒜、生辣椒、醋、蘿蔔泥等食材調味，以降低腎臟負擔。
暴飲暴食 :腎臟病友須嚴格控制飲食內容、並且盡可能固定時間用餐、避免大小餐。當血糖不穩、血壓過高或過低時，都會增加腎臟負擔以及腎內血管硬化的程度，因此，勿因天冷而暴飲暴食，以維持血糖及血壓穩定。
張瑞廷醫師提醒，腎臟保健預防勝於治療，建議平時採均衡飲食與正常作息，最好戒菸並避免過量飲酒，若有三高問題或慢性疾病者應配合醫師做好疾病控制，以免腎臟病況惡化。 
冬天竟是腎臟病友的一大挑戰？新光醫院腎臟科張瑞廷醫師表示，冬天早晚溫差大，若身體一直處在寒冷的狀態就會加重腎臟運作負擔；此外，若有憋尿習慣也可能造成腎功能低下，提醒民眾應提高警覺，別輕忽腎臟保健的重要性！
','EMP0001',load_blob('HD010.jpg'),'上架'
);

INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('HD'||LPAD(to_char(HEALTHNO_SEQ.NEXTVAL),4,'0'))),'走路就能消除痛風？注意這件事，輕鬆促進尿酸排泄
','
痛風，請用非常輕鬆的步調行走。 
據說痛風的劇烈疼痛，就像被鋸子或鑽頭凌遲一樣；這個疾病的患者幾乎是成年男性，發病原因是細胞的代謝物—尿酸。 
尿酸在體內生成過多時，便無法順利排出；而血液中的尿酸難以完全溶解時，就會結晶化囤積在關節裡；這就是導致劇烈疼痛的原因。 
尿酸是肝臟或酒精等物體裡隱含的嘌呤所生成的，因此，改變飲食習慣是預防和改善痛風的第一步。此外，利用健走提升新陳代謝機能，也能加速體內尿酸排除，進而改善痛風的症狀。 
有效消除痛風的健走方法，就是用非常輕鬆的步調健走：促進血液循環提升代謝機能，增加排泄尿酸的效果。另外，確實做好暖身運動，也有促進尿酸排泄的效果。反之，從事太過激烈的健走，反而有提高血液中尿酸值的風險，務必特別留意。 
','EMP0001',load_blob('HD011.jpg'),'上架'
);


INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('HD'||LPAD(to_char(HEALTHNO_SEQ.NEXTVAL),4,'0'))),'日醫學博士：這樣走路不只減重，還能防癌、抗高血壓
','
長期臥床、憂鬱症、失智症、腦中風、心肌梗塞等心臟病、癌症等生活習慣病、動脈硬化、骨質疏鬆症、高血壓、糖尿病……。只要稍微調整走路方式，從高居日本人死因排行第一、二名的癌症、心肌梗塞，到生活習慣病當中最具代表性的疾病——糖尿病和高血壓等，其實都是可以預防的。 
與其等發病再應付病症，不如就用這個方法事前做好預防——這樣不是更有效率、更健康、也更經濟嗎？「八千步／二十分」是為了讓您能更盡情享受往後人生的一種健走形式，也是一種生活習慣。請容我稍微再向各位介紹一下「中之條研究」。 
在這個研究當中還有其他的發現，那就是「切莫過度步行」。根據研究發現，持續過著每天一萬步的生活，對於飽受代謝症候群之苦的人具有改善的效果。所謂的代謝症候群，指的就是內臟脂肪型肥胖。由於飲酒過量、飲食不均衡、缺乏運動等因素，內臟附著大量的脂肪。腹部突出、皮帶附近很緊繃的人，很有可能就是「代謝症候群」患者。 
從改善代謝症候群的觀點來看，這些人的確是需要過「一萬步／三十分」的生活。然而，除此之外的族群或代謝症候群已經改善的人，只要做到「八千步／二十分」即可。因為根據「中之條研究」，我發現除了改善代謝症候群之外，「一萬步／三十分」與「八千步／二十分」的效果，其實相去不遠。 
附帶一提，據說在代謝症候群的病例當中，有很多人都過著運動不足的生活。這樣的人如果突然發願說：「好！那我從明天就開始堅持『一萬步／三十分』，以改善我的代謝症候群！」其實是非常莽撞的，請您千萬不要這樣做。因為這並非「只要走個一萬步就行了」，還要配合快走等「三十分鐘的中強度運動」。對以往不太運動的人而言，突然設定這樣的目標，實在是太強人所難了。 
剛開始必須逐步增加兩千步，並先適應「八千步／二十分」的健走形態。至於那些持續每天走一萬兩千步以上的人會怎麼樣呢？事實上，在「中之條研究」當中發現，這樣做即使有助於減重，但就疾病預防的觀點而言，和走八千步的效果並無二致。如果步數再往上增加，達到一萬四千步、一萬六千步……結果將反而會造成免疫力下降，形成容易生病的體質。 
','EMP0001',load_blob('HD012.jpg'),'上架'
);

INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('HD'||LPAD(to_char(HEALTHNO_SEQ.NEXTVAL),4,'0'))),'改善失眠、讓血管更年輕，每天只要20分鐘就行
','
前面建議過各位想消除水腫，「抬頭挺胸，以固定節奏每次持續走二十分鐘」。那麼，一天當中哪個時間健走效果最好呢？ 
一說到健走或慢跑，多數人聯想到的時間大概都是「清晨」吧，的確，在早晨清新的空氣中活動身體，能讓心情愉快。不過，我並不建議一大早運動，因為比較容易受傷。 
清晨是一天當中交感神經作用急遽上升的時間帶，血液容易滯流，也會造成血管收縮，當血管收縮，肌肉會變得僵硬，因此容易受傷。 
其中尤其必須注意的是慢跑。交感神經興奮的早晨，從事慢跑等激烈運動，更容易使交感神經佔上風，血壓急遽上升，因而很容易引起昏倒。尤其是平常沒有從事或不習慣激烈運動的人，請避免清晨慢跑。
◎飯後健走，能提高睡眠品質，消除全身痠痛: 事實上，清晨是一天當中大腦最活躍的時間。所以與其利用這段時間從事激烈運動，帶著疲憊的身體面對工作，不如利用這段時間激發創意，或是學習語言等大腦的活動，更有效地利用時間。 
那麼，什麼時候運動最理想呢？ 建議在晚餐後到就寢前一小時運動。而且不是慢跑等激烈運動，而是以悠閒散步的速度，二十～三十分鐘的步行最為理想。或許有人認為：如果晚上睡覺前運動，會使交感神經作用提升導致失眠。其實不需要擔心，如果是慢跑等激烈運動，確實有可能使交感神經上升，興奮而睡不著覺。但是，輕鬆的健走運動，反而能使血液循環順暢，消除一整天的疲勞，帶來品質良好的睡眠。而且，由於適度的運動，能促進褪黑激素等熟睡荷爾蒙的分泌，所以能夠一夜熟睡。
','EMP0001',load_blob('HD013.jpg'),'上架'
);


INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('HD'||LPAD(to_char(HEALTHNO_SEQ.NEXTVAL),4,'0'))),'家庭便利藥 免除小病痛
','生活中難免有不舒服或小意外發生，你的家裡有準備醫藥箱嗎？當發生不舒服或臨時小狀況時能派上用場？而且有多久沒檢查是否完備呢？ 
舉凡居家常會發生吃壞肚子、便祕、小孩意外跌倒小撞傷、運動後肌肉痠痛、扭傷一類的小毛病等等，
這些狀況都可以先詢問過藥局藥師，進而準備居家常備用藥就能獲得解決，節省跑醫院耗費的時間和金錢。 
家庭便利用藥準備原則-三大類 :
1.急用內服藥：包含感冒藥、解熱鎮痛、胃腸藥及暈車暈機等旅行用藥。可到社區藥局諮詢藥師，選購適當的藥品，回家後分別標明用途。也可選購有口碑藥廠出的全系列家庭便利藥。 
2. 急用外用藥：包含基本急救用品像是殺菌紗布、無菌棉球、OK繃、繃帶、透氣膠帶、優碘、生理食鹽水、消炎軟膏、酸痛貼布等。
3. 個人疾病用藥：對患有高血壓、糖尿病等慢性病患來說，是不能斷藥的，可利用慢性處方箋先備妥藥物，以防不時之需。 
','EMP0001',load_blob('HD014.jpg'),'上架'
);

INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('HD'||LPAD(to_char(HEALTHNO_SEQ.NEXTVAL),4,'0'))),'藥包寫日期就可以防吃錯？聽聽失智症專家良心建議
','其實，對病患及其家屬來說，最大的敵人不是失智症，而是對失智症的偏見。藥包標示日期就可以提醒患者吃藥？症狀輕微只需要在家自行照顧？平均每天診斷超過100名失智症患者的日本失智症權威醫師：奧村步，為你解答失智症的「45個迷思」！各類失智症知識、應對法及照顧法，讓你即學即用，找回和親愛家人的幸福生活。 
迷思1：為了讓失智症患者能自行按時吃藥，可將當日藥包貼在月曆上當提醒？
◎ 為何有這樣的迷思？◎
我經常遇到患者家屬因患者忘了按時服藥而感到困擾。據說，他們常常要在仔細查看後，才發現竟還有一堆藥未服用。
為此，家屬為了讓患者得以自行按時服藥，可是耗費了心思，例如將當日的藥包貼在月曆上，或是在藥包外用麥克筆標示日期。
◎ 解開迷思！◎
月曆提醒法或麥克筆標示法，對於上了年紀的普通「健忘」的確有效，但對於失智症患者卻不盡然。因為失智症患者不僅「健忘」，連時間概念都會喪失。
忘記吃藥還好，最怕是一不小心服用過量（例如吃掉了明日份的藥物），過比不及要來得令人憂心。當然，不只是失智症的藥物，高血壓或糖尿病等的藥物也是如此，誤服過量十分危險。
近來，急診室常出現昏迷的高齡患者，他們既不是腦中風，也不是心臟病發作，而是因為過量服用高血壓、糖尿病或安眠藥等藥物。現在服用過量的例子愈來愈多；事實上，這些患者也多半潛在著失智症的記憶障礙問題。 
','EMP0001',load_blob('HD015.jpg'),'上架'
);


INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('HD'||LPAD(to_char(HEALTHNO_SEQ.NEXTVAL),4,'0'))),'藥局沒告訴你的成藥副作用
','許多人生病時不想看醫生，便自行前往藥局買藥吃，但你確定你吃的藥安全嗎？其實生活中許多成藥都包含我們所不知道的副作用，讓你不知不覺吃進更多毒素。跟著藥劑師一起來認識我們所不知道的成藥，避開副作用，才不會傻傻賠了健康。
《警告！身近な薬の副作用》（暫譯：警告！周遭藥物副作用）作者武政文彦與  望月眞弓都是藥劑師，他們有鑑於越來越多人自己上藥局購買成藥，卻不清楚藥品的副作用，長期吃下來可能會有嚴重的後遺症。不管是感冒藥、頭痛藥、退燒藥，都應該先了解副作用再自行斟酌。
1.過度使用鼻噴霧藥會加重鼻塞
市面上販售的多款鼻噴霧藥，主要成份都含有血管收縮劑。使用鼻噴霧後鼻塞馬上就會消失，這是因為血管收縮劑會讓自律神經運作，抑制鼻粘膜充血、腫脹。然而這種藥只是讓血管收縮，沒有辦法根本地治好鼻塞。如果使用過度，還會造成鼻粘膜增厚，未來鼻塞的機率就會大增。使用鼻噴霧藥時，記得偶爾使用即可，勿過度依賴。
2.皮質類固醇外用劑不能長期使用
皮質類固醇如果使用得好，可以在短時間內有效抑制皮膚炎。但如果長期連續使用，會壓制合成真皮的膠原蛋白纖維細胞，造成皮膚的萎縮與血管擴張，讓皮膚紅腫等副作用產生。這類藥品如果使用了5~6天還是沒有起色，就該停止使用並詢問醫師。
3.戒煙貼片害你失眠
許多人靠戒煙貼片戒煙，卻不知道戒煙貼片有造成失眠的副作用。睡覺前務必將戒煙貼片撕下，就能解決這樣的問題。此外如果長期貼同一部位，可能會導致接觸性皮膚炎，因此每天最好換地方貼。
4.感冒藥、胃藥會使尿液變少
市面上販售的感冒藥、鼻炎藥與胃藥都含有抗膽鹼激素，雖然可以止住鼻水、抑制胃液分泌，但副作用是會害你便秘、尿量變少。特別是有前列腺肥大問題的人，如果服用過多抗膽鹼激素，會使排尿更加困難。因此醫師建議，過了中年的男性每年都應該檢查前列腺，並謹慎服用成藥。
','EMP0001',load_blob('HD016.jpg'),'上架'
);



INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('HD'||LPAD(to_char(HEALTHNO_SEQ.NEXTVAL),4,'0'))),'耳部老化：耳鳴、聽不見蚊子聲？助耳朵抗老的8個對策
','主要徵兆是聽力變差,耳部老化的徵兆，最主要體現在聽力變差這點，一般稱為老人家重聽。這是由於內耳老化，連帶著感覺細胞、神經細胞也老化，導致聽力減退。 
原因1：內耳血液循環不良隨著年紀增長，血管壁堆積許多血脂、膽固醇等污垢，血管逐漸硬化，造成血管變窄，就會導致血管阻塞。一旦血管阻塞，四周的組織會因為缺血，引發氧氣及養分不足的現象，進而造成部分組織壞死。
當血液循環不良的情形發生在內耳，內耳組織受到損傷，就會導致聽力衰退，開始出現耳部老化的症狀。 
原因2：神經退化萎縮。
內耳負責取得身體平衡的資訊，透過神經路徑傳遞到中樞，以此維持身體平衡，讓身體可以順利進行各種活動，也 是耳部的功能之一。 
但是隨著年紀增長，這項機能也會逐漸衰退，因為負責傳遞平衡相關資訊的神經路徑老化，或是疾病等原因造成神經路徑減少，會導致資訊無法順利傳遞，人變得容易失去平衡，也因此容易跌倒、骨折，必須多加注意。 
原因3：壓力過大、睡眠不足。
除了以上兩個原因，正值壯年期、主管級的上班族，也可能因為工作及生活的雙重壓力，外加用腦過度、睡眠不足，導致自律神經常過於興奮，以及血液供應量不足。長期造成的血管過度收縮、神經萎縮，也會造成內耳的傷害。 
','EMP0001',load_blob('HD017.jpg'),'上架'
);


INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('HD'||LPAD(to_char(HEALTHNO_SEQ.NEXTVAL),4,'0'))),'黑豆、牛蒡茶利腎排水毒，有助消滅子宮肌瘤、囊腫！
','子宮囊腫或子宮肌瘤是常見的子宮疾病之一。子宮囊腫與子宮肌瘤都是生成在子宮之中的一種腫瘤，唯獨囊腫之中包含許多水分，而肌瘤則是腫瘤中滿是肌肉，而有所不同。 
腫瘤生長的位置也稍有不同。首先，子宮肌瘤生長在構成子宮絕大部分的平滑肌上，以西醫的觀點認為，是構成子宮的平滑肌的其中一個細胞不正常的增生，才生成子宮肌瘤的現象。比起子宮肌瘤，囊腫則較常在卵巢之中產生，因此又被稱作卵巢囊腫，只要是還有生理期的女性，無論年齡，都是時常被發現的良性囊腫。 
不管是子宮肌瘤或是子宮囊腫，大部分都沒有任何外顯的跡象。只有約25%的機率才會自我察覺子宮肌瘤，而子宮囊腫則是絕大部分都無法發現症狀。因為是良性囊腫的關係，也沒有演變為癌症的可能性，就算真的在子宮中出現腫瘤，也沒有過度恐慌的必要。 
即使如此，也不能夠佯作不知就此放任不理。若 子宮中有肌瘤，則會難以懷孕、也會因為生理期不順而備受痛苦。若有 子宮囊腫的情況，經血可能會增加、或者生理痛變得嚴重，也可能會有月經週期變長等等狀況出現。就算不是生理期間，有時也會有出血的現象。 
卵巢囊腫大致上可以分成功能性囊腫與腫瘤性囊腫兩種。若屬功能性囊腫則不須過度擔憂，未滿8公分大小的囊腫大部分在經過大約兩個月之後，就會慢慢縮小消失；反之，若屬於腫瘤性囊腫則因為有演變為卵巢癌的可能性，需要積極的治療。 
','EMP0001',load_blob('HD018.jpg'),'上架'
);

INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('HD'||LPAD(to_char(HEALTHNO_SEQ.NEXTVAL),4,'0'))),'坐骨神經痛：是神經負擔超載，日首席整骨師3穴位改善
','坐骨神經痛的主要症狀為腰、臀、大腿後側、小腿後外側及足外側產生疼痛，主要由坐骨神經炎、腰椎間盤突出、糖尿病等引起，運動不足、年紀增長等因素也會導致坐骨神經痛，隨著腰椎周圍的肌肉減少，增加坐骨神經的負擔，最後導致疼痛。 
3穴位舒緩坐骨神經痛,環跳:
整個人站直，大腿骨上方被稱為「大轉子」，與股骨相連處有個陷下去的地方，就是「環跳」穴。中醫認為坐骨神經痛是氣血不通所致，「環跳」穴被認為可以利腰腿、通經絡。研究也發現，每日針灸「環跳」穴1次，連續進行15天之後，有近1/3原發性坐骨神經痛患者痊癒。 
,丘墟:外側腳踝前方凹陷處就是「丘墟」穴，可用大拇指按壓腳踝外緣。《頸腕踝穴位按摩神奇療法》表示，按摩「丘墟」穴不僅能緩解腰椎周圍的肌肉疼痛，也能提升肝功能。 
,懸鐘:外側腳踝上方4指寬處即為「懸鐘」穴。依《頸腕踝穴位按摩神奇療法》，「懸鐘」穴能消除坐骨神經痛出現的腰腿無力，也有助於改善腳部水腫和肌肉疼痛。 
','EMP0001',load_blob('HD019.jpg'),'上架'
);

INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO, COVERPIC, STATUS)
VALUES ((to_char('HD'||LPAD(to_char(HEALTHNO_SEQ.NEXTVAL),4,'0'))),'癌症：中西醫聯手開防癌處方！梳頭推背10分鐘排全身毒
','提到癌症，一般會認為是受到飲食與環境的致癌基因影響，如空氣中的廢氣、抽菸與食品添加物等刺激，長時間下來使細胞多次突變而癌化，並快速複製分裂成惡性腫瘤。  
不過，安保徹於《非常識醫學書：日本三大名醫聯手打破你的醫學迷思》一書，就自體免疫的角度提出另一個觀點：形成癌症的最大因素在於「壓力導致交感神經的緊張狀態」。  
安保徹分析，腎上腺素受交感神經緊張影響而持續運作，使得血管收縮、血液循環不順，體內的氧氣與營養成分便難以運送到全身，廢物也不容易排出。代謝機能低下，自然使身體處於36度以下的低體溫狀態。  
另外，具備腎上腺素受體的顆粒球增加會釋放大量活性氧，使身體受傷。攻擊癌細胞的淋巴球（NK細胞）則會減少，並且受到低體溫的影響而運作不良，免疫力隨之降低，癌細胞便能藉機繁殖。  
平衡自律神經，恢復免疫力 
目前針對癌症有藥物及放射線治療等療法，在治療之餘不如以一些簡單的方式提高體溫，改善循環。《氧生：21世紀最有效的防癌新革命》一書即指出，提高體溫雖然距離殺死癌細胞還有一大段距離，但藉著喝熱水、泡澡等方式改善循環，的確有助於減少末梢循環缺氧，對癌症有間接幫助。  
安保徹則建議，運用提高免疫的飲食、呼吸和泡澡等不拘泥形式的方式提高體溫，便能活化淋巴球，恢復免疫力。
','EMP0001',load_blob('HD020.jpg'),'上架'
);

commit;

--------- 1. 商城
CREATE SEQUENCE SHOPCOM_NO_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

--------- 2. 長照
CREATE SEQUENCE HCCOM_NO_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

--------- 3. 派車
CREATE SEQUENCE CARCOM_NO_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

--------- 4. 送餐
CREATE SEQUENCE MEALCOM_NO_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

commit;


--------------------------------- 新增表格 ----------------------------------
--------- 1. 商城申訴

CREATE TABLE SHOPCOMPLAIN(
 COMPLAINNO           VARCHAR2(15) NOT NULL,
 ORDERNO              VARCHAR2(15) NOT NULL,
 COMPLAINDETAIL       CLOB,
 DETAILDATE           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 COMPLAINREPLY        CLOB,
 REPLYDATE            TIMESTAMP,
 EMP_NO               VARCHAR2(10), 
 COMPLAINSTATUS       VARCHAR2(15) NOT NULL,

CONSTRAINT SHOPCOMPLAIN_NO_PRIMARY_KEY PRIMARY KEY (COMPLAINNO),
CONSTRAINT COMPLAIN_SHOP_FK FOREIGN KEY(ORDERNO)REFERENCES SHOPORDER (ORDERNO),
CONSTRAINT SHOPCOMPLAIN_EMP_FK FOREIGN KEY(EMP_NO)REFERENCES EMPLOYEE(EMP_NO)
);

commit;


--------- 2. 長照申訴

CREATE TABLE HCCOMPLAIN(
 COMPLAINNO           VARCHAR2(15) NOT NULL,
 ORDER_NO             VARCHAR2(15) NOT NULL,
 COMPLAINDETAIL       CLOB,
 DETAILDATE           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 COMPLAINREPLY        CLOB,
 REPLYDATE            TIMESTAMP,
 EMP_NO               VARCHAR2(10), 
 COMPLAINSTATUS       VARCHAR2(15) NOT NULL,

CONSTRAINT HCCOMPLAIN_NO_PRIMARY_KEY PRIMARY KEY (COMPLAINNO),
CONSTRAINT COMPLAIN_HC_FK FOREIGN KEY(ORDER_NO)REFERENCES HC_ORDER_MASTER (ORDER_NO),
CONSTRAINT HCCOMPLAIN_EMP_FK FOREIGN KEY(EMP_NO)REFERENCES EMPLOYEE(EMP_NO)
);

commit;

--------- 3. 派車申訴

CREATE TABLE CARCOMPLAIN(
 COMPLAINNO           VARCHAR2(15) NOT NULL,
 ORDER_NO             VARCHAR2(15) NOT NULL,
 COMPLAINDETAIL       CLOB,
 DETAILDATE           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 COMPLAINREPLY        CLOB,
 REPLYDATE            TIMESTAMP,
 EMP_NO               VARCHAR2(10),
 COMPLAINSTATUS       VARCHAR2(15) NOT NULL,

CONSTRAINT CARCOMPLAIN_NO_PRIMARY_KEY PRIMARY KEY (COMPLAINNO),
CONSTRAINT COMPLAIN_CAR_FK FOREIGN KEY(ORDER_NO)REFERENCES CAR_ORDER (ORDER_NO),
CONSTRAINT COMPLAIN_EMP_FK FOREIGN KEY(EMP_NO )REFERENCES EMPLOYEE (EMP_NO)
);


commit;

--------- 4. 送餐申訴

CREATE TABLE MEALCOMPLAIN(
 COMPLAINNO           VARCHAR2(15) NOT NULL,
 MO_NO                VARCHAR2(15) NOT NULL,
 COMPLAINDETAIL       CLOB,
 DETAILDATE           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 COMPLAINREPLY        CLOB,
 REPLYDATE            TIMESTAMP,
 EMP_NO               VARCHAR2(10), 
 COMPLAINSTATUS       VARCHAR2(15) NOT NULL,

CONSTRAINT MEALCOMPLAIN_NO_PRIMARY_KEY PRIMARY KEY (COMPLAINNO),
CONSTRAINT COMPLAIN_MEAL_FK FOREIGN KEY(MO_NO)REFERENCES MEAL_ORDER (MO_NO),
CONSTRAINT MEALCOMPLAIN_EMP_FK FOREIGN KEY(EMP_NO)REFERENCES EMPLOYEE(EMP_NO)
);
commit;



---------------------------------  假資料 -------------------------------------

--------- 1. 商城申訴單


INSERT INTO SHOPCOMPLAIN(
COMPLAINNO, ORDERNO, COMPLAINDETAIL,COMPLAINSTATUS)
VALUES (to_char('SP'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0')),'20171026-000001','商品有瑕疵,我覺得不行,收到已破損','未處理');


INSERT INTO SHOPCOMPLAIN(
COMPLAINNO,ORDERNO,COMPLAINDETAIL,COMPLAINSTATUS)
VALUES (to_char('SP'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0')),'20171026-000002','請問商品要退換貨的流程是？','未處理');


INSERT INTO SHOPCOMPLAIN(
COMPLAINNO,ORDERNO,COMPLAINDETAIL,COMPLAINREPLY,REPLYDATE, EMP_NO ,COMPLAINSTATUS)
VALUES (to_char('SP'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0')),'20171026-000003','有使用上的問題,不會用阿!','您好,我們會請客服人員與您聯繫',CURRENT_TIMESTAMP ,'EMP0001' ,'已完成');




--------- 2. 長照申訴單
INSERT INTO HCCOMPLAIN(
COMPLAINNO,ORDER_NO,COMPLAINDETAIL,COMPLAINSTATUS)
VALUES (to_char('HC'||LPAD(to_char(HCCOM_NO_SEQ.NEXTVAL),6,'0')),'20171001-500001','突然臨時有事, 請問可更改日期嗎？','未處理');


INSERT INTO HCCOMPLAIN(
COMPLAINNO,ORDER_NO,COMPLAINDETAIL,COMPLAINREPLY,REPLYDATE, EMP_NO ,COMPLAINSTATUS)
VALUES (to_char('HC'||LPAD(to_char(HCCOM_NO_SEQ.NEXTVAL),6,'0')),'20171001-500002','長照人員大遲到','您好,已收到您的申訴,轉交給長照部上層做處理,照成您的不便,不好意思。',CURRENT_TIMESTAMP ,'EMP0001' ,'已完成');


INSERT INTO HCCOMPLAIN(
COMPLAINNO,ORDER_NO,COMPLAINDETAIL,COMPLAINREPLY,REPLYDATE, EMP_NO ,COMPLAINSTATUS)
VALUES (to_char('HC'||LPAD(to_char(HCCOM_NO_SEQ.NEXTVAL),6,'0')),'20171001-500003','請問可以看到訂購成功媒合長照人員是哪位嗎？','您好在會員資料的訂單上可以看到',CURRENT_TIMESTAMP ,'EMP0001' ,'已完成');

INSERT INTO HCCOMPLAIN(
COMPLAINNO,ORDER_NO,COMPLAINDETAIL ,COMPLAINSTATUS)
VALUES (to_char('HC'||LPAD(to_char(HCCOM_NO_SEQ.NEXTVAL),6,'0')),'20171001-500004','您好，想詢問一下長照人員預計抵達的時間？','未處理');




--------- 3. 派車申訴單
-- 動態編號語法 (to_char('CR'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0'))

INSERT INTO CARCOMPLAIN(
COMPLAINNO,ORDER_NO,COMPLAINDETAIL,COMPLAINSTATUS)
VALUES (to_char('CR'||LPAD(to_char(CARCOM_NO_SEQ.NEXTVAL),6,'0')),'20171021-000011','車子太顛坡阿','未處理');


INSERT INTO CARCOMPLAIN(
COMPLAINNO,ORDER_NO,COMPLAINDETAIL,COMPLAINSTATUS)
VALUES (to_char('CR'||LPAD(to_char(CARCOM_NO_SEQ.NEXTVAL),6,'0')),'20171021-000101','請問司機可以更改嗎','未處理');

INSERT INTO CARCOMPLAIN(
COMPLAINNO,ORDER_NO,COMPLAINDETAIL,COMPLAINREPLY,REPLYDATE, EMP_NO ,COMPLAINSTATUS)
VALUES (to_char('CR'||LPAD(to_char(CARCOM_NO_SEQ.NEXTVAL),6,'0')),'20171022-000312','司機好帥,請問單身嗎？','您好,已轉交司機,請司機給你line會再與您聯繫',CURRENT_TIMESTAMP,'EMP0001' ,'已完成');



--------- 4. 送餐申訴單
-- 動態編號語法 (to_char('MO'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0'))

INSERT INTO MEALCOMPLAIN(
COMPLAINNO, MO_NO,COMPLAINDETAIL,COMPLAINSTATUS)
VALUES (to_char('MO'||LPAD(to_char(MEALCOM_NO_SEQ.NEXTVAL),6,'0')),'20171103-000002','餐點太清淡,下一餐可以換別的餐點嗎?','未處理');

INSERT INTO MEALCOMPLAIN(
COMPLAINNO,MO_NO,COMPLAINDETAIL ,COMPLAINSTATUS)
VALUES (to_char('MO'||LPAD(to_char(MEALCOM_NO_SEQ.NEXTVAL),6,'0')),'20171103-000003','請問可以再多追加餐點嗎?' ,'未處理');

INSERT INTO MEALCOMPLAIN(
COMPLAINNO,MO_NO,COMPLAINDETAIL,COMPLAINREPLY,REPLYDATE, EMP_NO ,COMPLAINSTATUS)
VALUES (to_char('MO'||LPAD(to_char(MEALCOM_NO_SEQ.NEXTVAL),6,'0')),'20171103-000004','今天午餐的小黃瓜有點爛爛的','您好,已轉交客服,客服人員會再與您聯繫',CURRENT_TIMESTAMP ,'EMP0001' ,'已完成');


COMMIT;





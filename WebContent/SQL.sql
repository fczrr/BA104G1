


--讀圖片用的
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
/     

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
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '諸葛亮', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M','careU@care.com', '總部', '管理員', '經理', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
'admin00', 'pw0000', '10');



INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '孫尚香', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '貂蟬', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '小喬', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '關銀屏', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '大喬', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '周瑜', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '龐統', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '黃忠', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '趙雲', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '關羽', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '呂布', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '馬超', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '張遼', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '關羽', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '張角', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '袁紹', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '典韋', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '孔融', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '孫皓', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '長照', '長照人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('a'||LPAD(to_char(SEQ_EMPPEMP_HCID.NEXTVAL),3,'0')), 'pw0000', '10');
--------------派車部(EMP0022~41)------------------

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '李大壬', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '李民浩', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '孔張', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '凜凍旭', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '鄭花甲', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '鄭花明', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '鄭花亮', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '趙萌', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '夏侯淵', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '華雄', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '徐和', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '許昌', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '郭嘉', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '龐德', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '華佗', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '曹曹', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '魏延', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '司馬昭', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '司馬炎', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
'M',to_char('care'||LPAD(to_char(SEQ_EMPPEMP_MAIL.NEXTVAL),3,'0')||'@care.com'), '派車', '派車人員', '專員', TO_DATE('2003/05/03 ', 'yyyy/mm/dd '), 
to_char('b'||LPAD(to_char(SEQ_EMPPEMP_CARID.NEXTVAL),3,'0')), 'pw0000', '10');

INSERT INTO EMPLOYEE 
(EMP_NO, EMP_NAME, EMP_PHONE, EMP_GENDER, EMP_EMAIL, EMP_DEP, AUTHORITY_NO, EMP_TITLE, ON_BOARD_DATE, EMP_ID, EMP_PWD, EMP_BRANCHES)  
VALUES (to_char('EMP'||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),4,'0')), '袁紹', to_char('0912345'||LPAD(to_char(SEQ_EMPPEMP_PHONE.NEXTVAL),3,'0')),
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
  EMP_PHOTO_STATUS VARCHAR2(1)  DEFAULT 'T',
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

INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob('CAR001.jpg'),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob('CAR002.jpg'),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob('CAR003.jpg'),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob('CAR004.jpg'),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob('CAR005.jpg'),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob('CAR006.jpg'),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob('CAR007.jpg'),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob('CAR008.jpg'),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob('CAR009.jpg'),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob('CAR010.jpg'),'T');

INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob('CAR011.jpg'),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob('CAR012.jpg'),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob('CAR013.jpg'),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob('CAR014.jpg'),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob('CAR015.jpg'),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob('CAR016.jpg'),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob('CAR017.jpg'),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob('CAR018.jpg'),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob('CAR019.jpg'),'T');
INSERT INTO EMP_PHOTOS VALUES (to_char('EPH'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),to_char('EMP'||LPAD(to_char(SEQ_EMPPEMPNO.NEXTVAL),4,'0')),load_blob('CAR020.jpg'),'T');

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

 
--送餐人員班表--
--CREATE TABLE MEAL_STAFF_SCHEDULE(
--SERIAL_NO NUMBER(10) PRIMARY KEY NOT NULL,
--EMP_NO VARCHAR2(10) NOT NULL,
--YEAR_MONTH VARCHAR2(6)  NOT NULL,
--WORK_STATE VARCHAR2(93) ,
--CONSTRAINT SCHEDULE_EMP_NO_FK FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO)
--);
 
--送餐人員班表自增主鍵--
--CREATE SEQUENCE mealStaffSchedule_seq
--INCREMENT BY 1
--START WITH 5001
--NOMAXVALUE
--NOCYCLE;
 

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

 
 
CREATE TABLE HEALTHNEWSDETAIL(
 HEALTHNO       VARCHAR2(15)  NOT NULL,
 NEWSTITLE      VARCHAR2(200) NOT NULL,
 NEWSINTRO      CLOB,
 EMP_NO         VARCHAR2(10)  NOT NULL,
 COVERPIC       BLOB,
 NEWSPIC1       BLOB,
 NEWSPIC2       BLOB,
 NEWSDATE       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 STATUS			VARCHAR2(15)  NOT NULL,

CONSTRAINT HEALTH_NO_PRIMARY_KEY PRIMARY KEY (HEALTHNO),
CONSTRAINT HEALTH_EMP_FK FOREIGN KEY(EMP_NO)REFERENCES EMPLOYEE(EMP_NO)
);


commit;


--------- 2. 最新資訊-----

CREATE TABLE NEWSDETAIL(
 NEWSNO         VARCHAR2(15)   NOT NULL,
 NEWSTITLE      VARCHAR2(200) NOT NULL,
 NEWSINTRO      CLOB,
 EMP_NO         VARCHAR2(10)   NOT NULL,
 COVERPIC       BLOB,
 NEWSPIC1       BLOB,
 NEWSPIC2       BLOB,
 NEWSDATE       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 STATUS			VARCHAR2(15)  NOT NULL,
 

CONSTRAINT NEWS_NO_PRIMARY_KEY PRIMARY KEY (NEWSNO),
CONSTRAINT NEWS_EMP_FK FOREIGN KEY(EMP_NO)REFERENCES EMPLOYEE(EMP_NO)
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

---------------------------------  假資料 -------------------------------------

INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO, STATUS)
VALUES ((to_char('HD'||LPAD(to_char(HEALTHNO_SEQ.NEXTVAL),4,'0'))),'吃零食也可以顧健康！巧克力不僅能養顏美容，連老年失智都可以預防',
'秋冬季節只要涼風一吹、空氣濕度下降，許多女性的肌膚馬上有感，出現緊繃、乾癢，甚至脫屑的現象，再加上有些人以為秋冬的紫外線較弱，疏忽了防曬，
根據國際期刊《Journal of Cosmetic Dermatology》（化妝品皮膚病學雜誌）於2009年刊載一篇文章，研究團隊發現巧克力中的黃酮類化合物（flavanols）
成分是一種抗氧化物，具有降低體內自由基、減少促發炎因子（如：前發炎性細胞激素、一氧化氮）的作用，每天攝取20公克巧克力，持續12周，
可以保護皮膚免受傷害，減少因紫外線暴露所引起的紅斑。鄭欣宜營養師說明，研究使用的巧克力，每20公克平均含600毫克的可可類黃酮（cocoa flavanols）
，抗氧化能力（ORAC）數值大於1萬，抗發炎和抗氧化的表現優異，因此運用於肌膚保養方面，可以減少慢性紫外線暴露，進而預防皮膚提早老化。','EMP0006' ,'上架' 
);

INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO, STATUS)
VALUES ((to_char('HD'||LPAD(to_char(HEALTHNO_SEQ.NEXTVAL),4,'0'))),'居家照護好便利　到宅護理「足」感心',
'居家護理以人為本，管理更入心!
居家護理係以人為本、以家庭為單位、以社區為基礎，提供被照顧者及照顧者持續性的照護。根據統計，目前居家護理所共計有534家，其設置的型態有醫院附設型態、獨立型態及衛生所附設型態；
其中醫院附設型態計194家(36.4%)、獨立型為224家(41.9%)，而衛生所附設則有116家(21.7%)。呂郁芳指出，居家護理師所提供服務內容，除大眾所熟知的到家進行傷口護理、管路更換（如鼻胃管、
導尿管、氣管套管等）、注射及代採檢體送檢外，還包括一般身體檢查和評估、居家安全評估與建議、健康問題處理和指導及社會資源諮詢和轉介，護理師一旦發現個案現存健康問題或潛在危險因素後，
並可提供個別化的護理諮詢、指導及護理措施。居家照護小細節　足部護理很重要。「?之於未有，治之於未亂」，呂郁芳理事長以足部健康危害因子舉例，如龜裂、趾甲增厚、長趾甲、趾甲嵌入症、
老繭皮、雞眼、趾甲疾病與變形等問題，都可透過居家足部照護而獲得改善。','EMP0011' ,'上架' 
);

INSERT INTO HEALTHNEWSDETAIL(HEALTHNO, NEWSTITLE, NEWSINTRO, EMP_NO, STATUS)
VALUES ((to_char('HD'||LPAD(to_char(HEALTHNO_SEQ.NEXTVAL),4,'0'))),'醬料重鹹吃多傷腎 這些疾病也跟著來',
'天氣濕濕冷冷，此時吃火鍋、羊肉爐、薑母鴨最適合了！不過，營養師蔡素琴提醒，民眾吃鍋物最喜歡沾加工醬料，重口味飲食容易鈉含量攝取超標，增加高血壓、腎臟負擔，也容易加速骨質流失。
醬料不鹹　含鈉量卻很高。台北市立聯合醫院松德院區營養科營養師蔡素琴指出，常見的加工醬料，如番茄醬、辣椒醬、
豆乳醬、沙茶醬、豆瓣醬，雖然嚐起來不鹹，但所含的鹽分卻很驚人。根據衛福部建議，每人每天鈉攝取量是2400毫克，相當6克的鹽，但吃一餐火鍋就超過一天建議量。
吃太鹹　容易得這些病。蔡素琴營養師表示，鹽攝取過多容易存積在血管壁內，當血管壁管徑失去彈性，血流通過的阻力愈大、血壓就愈高，鹽也會影響新陳代謝、阻礙水分排出及鈣質吸收，
增加高血壓、中風、腎臟病，以及骨質疏鬆的風險。天然蔬果醬料較健康蔡素琴營養師強調，健康飲食觀念是吃食物的原味，許多蔬菜水果具有天然重口味，
且富含維生素等營養素，如番茄、檸檬帶有酸味，洋蔥、大蒜、辣椒帶有辛辣味，柳橙、蘋果帶有甜味，建議民眾可將食材切碎，
加上橄欖油混均勻，搭配食物吃得出天然美味。','EMP0001'  ,'下架'
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
-- 動態編號語法 (to_char('SP'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0'))

INSERT INTO SHOPCOMPLAIN(
COMPLAINNO, ORDERNO, COMPLAINDETAIL,COMPLAINSTATUS)
VALUES (to_char('SP'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0')),'20171026-000002','商品有瑕疵,我覺得不行,收到已破損','未處理');


INSERT INTO SHOPCOMPLAIN(
COMPLAINNO,ORDERNO,COMPLAINDETAIL,COMPLAINREPLY,REPLYDATE, EMP_NO ,COMPLAINSTATUS)
VALUES (to_char('SP'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0')),'20171026-000003','商品有瑕疵,我覺得不行,收到已破損','您好,已收到您的申訴,立馬幫你更換寄送新的。',CURRENT_TIMESTAMP ,'EMP0001' ,'已完成');


INSERT INTO SHOPCOMPLAIN(
COMPLAINNO,ORDERNO,COMPLAINDETAIL,COMPLAINREPLY,REPLYDATE, EMP_NO ,COMPLAINSTATUS)
VALUES (to_char('SP'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0')),'20171026-000004','有使用上的問題,不會用阿!','您好,我們會請客服人員與您聯繫',CURRENT_TIMESTAMP ,'EMP0001' ,'已完成');


--------- 2. 長照申訴單
-- 動態編號語法 (to_char('HC'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0'))
INSERT INTO HCCOMPLAIN(
COMPLAINNO,ORDER_NO,COMPLAINDETAIL,COMPLAINSTATUS)
VALUES (to_char('HC'||LPAD(to_char(HCCOM_NO_SEQ.NEXTVAL),6,'0')),'20171001-500001','突然臨時有事, 請問可更改日期嗎？','未處理');


INSERT INTO HCCOMPLAIN(
COMPLAINNO,ORDER_NO,COMPLAINDETAIL,COMPLAINREPLY,REPLYDATE, EMP_NO ,COMPLAINSTATUS)
VALUES (to_char('HC'||LPAD(to_char(HCCOM_NO_SEQ.NEXTVAL),6,'0')),'20171001-500002','長照人員大遲到','您好,已收到您的申訴,轉交給長照部上層做處理,照成您的不便,不好意思。',CURRENT_TIMESTAMP ,'EMP0001' ,'處理中');


INSERT INTO HCCOMPLAIN(
COMPLAINNO,ORDER_NO,COMPLAINDETAIL,COMPLAINREPLY,REPLYDATE, EMP_NO ,COMPLAINSTATUS)
VALUES (to_char('HC'||LPAD(to_char(HCCOM_NO_SEQ.NEXTVAL),6,'0')),'20171001-500003','請問可以看到訂購成功媒合長照人員是哪位嗎？','您好在會員資料的訂單上可以看到',CURRENT_TIMESTAMP ,'EMP0001' ,'已完成');

--------- 3. 派車申訴單
-- 動態編號語法 (to_char('CR'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0'))

INSERT INTO CARCOMPLAIN(
COMPLAINNO,ORDER_NO,COMPLAINDETAIL,EMP_NO ,COMPLAINSTATUS)
VALUES (to_char('CR'||LPAD(to_char(CARCOM_NO_SEQ.NEXTVAL),6,'0')),'20171026-000001','車子太顛坡阿','EMP0001' ,'未處理');


INSERT INTO CARCOMPLAIN(
COMPLAINNO,ORDER_NO,COMPLAINDETAIL,COMPLAINREPLY,REPLYDATE, EMP_NO ,COMPLAINSTATUS)
VALUES (to_char('CR'||LPAD(to_char(CARCOM_NO_SEQ.NEXTVAL),6,'0')),'20171102-000010','請問司機可以更改嗎','您好,已轉交客服,客服人員會再與您聯繫',CURRENT_TIMESTAMP ,'EMP0001' ,'處理中');

INSERT INTO CARCOMPLAIN(
COMPLAINNO,ORDER_NO,COMPLAINDETAIL,COMPLAINREPLY,REPLYDATE, EMP_NO ,COMPLAINSTATUS)
VALUES (to_char('CR'||LPAD(to_char(CARCOM_NO_SEQ.NEXTVAL),6,'0')),'20171102-000012','司機好帥,請問單身嗎？','您好,已轉交司機,請司機給你line會再與您聯繫',CURRENT_TIMESTAMP,'EMP0001' ,'已完成');



--------- 4. 送餐申訴單
-- 動態編號語法 (to_char('MO'||LPAD(to_char(SHOPCOM_NO_SEQ.NEXTVAL),6,'0'))

INSERT INTO MEALCOMPLAIN(
COMPLAINNO, MO_NO,COMPLAINDETAIL,COMPLAINSTATUS)
VALUES (to_char('MO'||LPAD(to_char(MEALCOM_NO_SEQ.NEXTVAL),6,'0')),'20171103-000002','餐點太清淡,下一餐可以換別的餐點嗎?','未處理');

INSERT INTO MEALCOMPLAIN(
COMPLAINNO,MO_NO,COMPLAINDETAIL,COMPLAINREPLY,REPLYDATE, EMP_NO ,COMPLAINSTATUS)
VALUES (to_char('MO'||LPAD(to_char(MEALCOM_NO_SEQ.NEXTVAL),6,'0')),'20171103-000003','請問可以再多追加餐點嗎?','您好,已轉交客服,客服人員會再與您聯繫',CURRENT_TIMESTAMP ,'EMP0001' ,'處理中');

INSERT INTO MEALCOMPLAIN(
COMPLAINNO,MO_NO,COMPLAINDETAIL,COMPLAINREPLY,REPLYDATE, EMP_NO ,COMPLAINSTATUS)
VALUES (to_char('MO'||LPAD(to_char(MEALCOM_NO_SEQ.NEXTVAL),6,'0')),'20171103-000004','今天午餐的小黃瓜有點爛爛的','您好,已轉交客服,客服人員會再與您聯繫',CURRENT_TIMESTAMP ,'EMP0001' ,'處理中');

COMMIT;







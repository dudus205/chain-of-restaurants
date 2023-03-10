--drop section
DROP TABLE INVOICE CASCADE CONSTRAINTS;
DROP TABLE BISTRO CASCADE CONSTRAINTS;
DROP TABLE PLACE_OF_CONSUMPTION CASCADE CONSTRAINTS;
DROP TABLE CLIENT CASCADE CONSTRAINTS;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;
DROP TABLE PAYMENT CASCADE CONSTRAINTS;
DROP TABLE WORKER CASCADE CONSTRAINTS;
DROP TABLE MENU CASCADE CONSTRAINTS;
DROP TABLE CHIEF CASCADE CONSTRAINTS;
DROP TABLE DELIVERY CASCADE CONSTRAINTS;
DROP TABLE BONUS CASCADE CONSTRAINTS;


CREATE TABLE BISTRO (
    ID NUMBER(3) PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL,
    CITY VARCHAR(255) NOT NULL,
    ADM_UNIT VARCHAR(255) NOT NULL
);

CREATE TABLE PLACE_OF_CONSUMPTION (
    ID NUMBER(7) PRIMARY KEY,
    TYPE VARCHAR(255),
    STREET VARCHAR(255),
    CITY VARCHAR(255),
    ADM_UNIT VARCHAR(255)
);

CREATE TABLE PRODUCT (
    ID NUMBER(3) PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL,
    CATEGORY VARCHAR(255) NOT NULL
);

CREATE TABLE MENU (
    ID NUMBER(3) PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL,
    TYPE VARCHAR(255) NOT NULL
);

CREATE TABLE CHIEF (
    ID NUMBER(3) PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL,
    SURNAME VARCHAR(255) NOT NULL,
    SENIORITY NUMBER(2) NOT NULL
);

CREATE TABLE PAYMENT (
    ID NUMBER(7) PRIMARY KEY,
    BILL_NUMBER NUMBER NOT NULL,
    METHOD VARCHAR(255) NOT NULL,
    TIP NUMBER(5,2) NOT NULL
);

CREATE TABLE WORKER (
    ID NUMBER(4) PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL,
    SURNAME VARCHAR(255) NOT NULL,
    SENIORITY NUMBER(2) NOT NULL
);

CREATE TABLE DELIVERY (
    ID NUMBER(7) PRIMARY KEY,
    DG_NAME VARCHAR(255) NOT NULL,
    DG_SURNAME VARCHAR(255) NOT NULL,
    DG_SENIORITY NUMBER(2) NOT NULL,
    TRANSPORT VARCHAR(255) NOT NULL,
    DELIVERY_TIME_IN_MIN NUMBER(4) NOT NULL
);

CREATE TABLE BONUS (
    ID NUMBER(2) PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL,
    DISCOUNT NUMBER(2) NOT NULL
);

CREATE TABLE CLIENT (
    ID NUMBER(7) PRIMARY KEY,
    GENDER VARCHAR(1) NOT NULL,
    AGE NUMBER(2) NOT NULL,
    TYPE VARCHAR(50) NOT NULL
);

CREATE TABLE INVOICE (
    ID NUMBER(7) PRIMARY KEY,
    BISTRO_ID NUMBER(3) REFERENCES BISTRO(ID) NOT NULL,
    POC_ID NUMBER(7) REFERENCES PLACE_OF_CONSUMPTION(ID) NOT NULL,
    PRODUCT_ID NUMBER(3) REFERENCES PRODUCT(ID) NOT NULL,
    MENU_ID NUMBER(3) REFERENCES MENU(ID) NOT NULL,
    CHIEF_ID NUMBER(3) REFERENCES CHIEF(ID) NOT NULL,
    PAYMENT_ID NUMBER(7) REFERENCES PAYMENT(ID) NOT NULL,
    WORKER_ID NUMBER(4) REFERENCES WORKER(ID) NOT NULL,
    DELIVERY_ID NUMBER(7) REFERENCES DELIVERY(ID) NOT NULL,
    BONUS_ID NUMBER(2) REFERENCES BONUS(ID) NOT NULL,
    CLIENT_ID NUMBER(7) REFERENCES CLIENT(ID) NOT NULL, 
    QUANTITY NUMBER(6,2) NOT NULL,
    PRICE_VALUE NUMBER(6,2) NOT NULL,
    CLIENT_RATING NUMBER(2) NOT NULL,
    HOUR NUMBER(2) NOT NULL,
    DAY NUMBER(2) NOT NULL,
    WEEKDAY NUMBER(1) NOT NULL,
    MONTH NUMBER(2) NOT NULL,
    YEAR NUMBER(4) NOT NULL
);
exit
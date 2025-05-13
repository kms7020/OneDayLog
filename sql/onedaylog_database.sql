-- ? ���� ����� Ȯ��
SELECT USER FROM DUAL;

-- -------------------------------
-- ? USERS (ȸ�� ���̺�)
-- -------------------------------
CREATE TABLE USERS (
    USER_ID         NUMBER PRIMARY KEY,
    EMAIL           VARCHAR2(100) UNIQUE NOT NULL,
    LOGIN_ID        VARCHAR2(50) NOT NULL,
    PASSWORD        VARCHAR2(100) NOT NULL,
    NAME            VARCHAR2(50) NOT NULL,
    CREATED_AT      DATE DEFAULT SYSDATE,
    WITHDRAWN_AT    DATE DEFAULT NULL,
    PROFILE_IMAGE   VARCHAR2(255) DEFAULT 'default.jpg',
    IS_DELETED      CHAR(1) DEFAULT 'N'
);

-- USERS PK �ڵ� �Ҵ� ������ & Ʈ����
CREATE SEQUENCE USERS_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE OR REPLACE TRIGGER TRG_USERS_ID
BEFORE INSERT ON USERS
FOR EACH ROW
BEGIN
    SELECT USERS_SEQ.NEXTVAL INTO :NEW.USER_ID FROM DUAL;
END;
/

-- -------------------------------
-- ? ADMIN (������ ���̺�)
-- -------------------------------
CREATE TABLE ADMIN (
    ADMIN_ID        NUMBER PRIMARY KEY,
    ADMIN_LOGIN_ID  VARCHAR2(50) UNIQUE NOT NULL,
    ADMIN_PASSWORD  VARCHAR2(100) NOT NULL,
    ADMIN_NAME      VARCHAR2(50),
    CREATED_AT      DATE DEFAULT SYSDATE
);

-- �ʱ� ������ ���� INSERT (��й�ȣ�� BCrypt ��ȣȭ��)
INSERT INTO ADMIN (
    ADMIN_ID, ADMIN_LOGIN_ID, ADMIN_PASSWORD, ADMIN_NAME, CREATED_AT
) VALUES (
    1, 'kms7262',
    '$2a$10$Hk.BYCRcN8yQ04WTAaFF/uqalaCP5RC58OOebAk1FC13Fz8iCMRnG',
    '���� ������', SYSDATE
);

-- -------------------------------
-- ? DIARY (�ϱ� ���̺�)
-- -------------------------------
CREATE TABLE DIARY (
    DIARY_ID    NUMBER PRIMARY KEY,
    USER_ID     NUMBER NOT NULL,
    DIARY_DATE  DATE DEFAULT SYSDATE,
    CONTENT     VARCHAR2(1000),
    CONSTRAINT FK_DIARY_USER FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID)
);

CREATE SEQUENCE DIARY_SEQ
    START WITH 1
    INCREMENT BY 1;

-- -------------------------------
-- ? TODO (�� �� ��� ���̺�)
-- -------------------------------
CREATE TABLE TODO (
    TODO_ID     NUMBER PRIMARY KEY,
    USER_ID     NUMBER NOT NULL,
    TASK        VARCHAR2(255),
    COMPLETED   NUMBER(1) DEFAULT 0,        -- 0: �̿Ϸ�, 1: �Ϸ�
    CATEGORY    VARCHAR2(20)                -- today / tomorrow / later
);

CREATE SEQUENCE TODO_SEQ
    START WITH 1
    INCREMENT BY 1;

-- ī�װ� ���� ������Ʈ
UPDATE TODO SET CATEGORY = 'today'   WHERE TODO_ID = 1;
UPDATE TODO SET CATEGORY = 'tomorrow'WHERE TODO_ID = 2;
UPDATE TODO SET CATEGORY = 'later'   WHERE TODO_ID = 3;

-- -------------------------------
-- ? DDAY (���� ���̺�)
-- -------------------------------
CREATE TABLE DDAY (
    DDAY_ID     NUMBER PRIMARY KEY,
    USER_ID     NUMBER NOT NULL,
    TITLE       VARCHAR2(100) NOT NULL,
    TARGET_DATE DATE NOT NULL,
    CREATED_AT  DATE DEFAULT SYSDATE,
    IMPORTANT   NUMBER(1) DEFAULT 0        -- 1: �߿� ǥ��
);

CREATE SEQUENCE DDAY_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

-- -------------------------------
-- ? �׽�Ʈ ��ȸ ����
-- -------------------------------
SELECT * FROM USERS;
SELECT * FROM ADMIN;
SELECT * FROM DIARY;
SELECT * FROM TODO;
SELECT * FROM DDAY;

-- ��¥ ���� �׽�Ʈ
SELECT TO_CHAR(DIARY_DATE, 'YYYY-MM-DD HH24:MI:SS') FROM DIARY ORDER BY DIARY_DATE DESC;

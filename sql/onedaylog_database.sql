-- ? 현재 사용자 확인
SELECT USER FROM DUAL;

-- -------------------------------
-- ? USERS (회원 테이블)
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

-- USERS PK 자동 할당 시퀀스 & 트리거
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
-- ? ADMIN (관리자 테이블)
-- -------------------------------
CREATE TABLE ADMIN (
    ADMIN_ID        NUMBER PRIMARY KEY,
    ADMIN_LOGIN_ID  VARCHAR2(50) UNIQUE NOT NULL,
    ADMIN_PASSWORD  VARCHAR2(100) NOT NULL,
    ADMIN_NAME      VARCHAR2(50),
    CREATED_AT      DATE DEFAULT SYSDATE
);

-- 초기 관리자 계정 INSERT (비밀번호는 BCrypt 암호화됨)
INSERT INTO ADMIN (
    ADMIN_ID, ADMIN_LOGIN_ID, ADMIN_PASSWORD, ADMIN_NAME, CREATED_AT
) VALUES (
    1, 'kms7262',
    '$2a$10$Hk.BYCRcN8yQ04WTAaFF/uqalaCP5RC58OOebAk1FC13Fz8iCMRnG',
    '최초 관리자', SYSDATE
);

-- -------------------------------
-- ? DIARY (일기 테이블)
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
-- ? TODO (할 일 목록 테이블)
-- -------------------------------
CREATE TABLE TODO (
    TODO_ID     NUMBER PRIMARY KEY,
    USER_ID     NUMBER NOT NULL,
    TASK        VARCHAR2(255),
    COMPLETED   NUMBER(1) DEFAULT 0,        -- 0: 미완료, 1: 완료
    CATEGORY    VARCHAR2(20)                -- today / tomorrow / later
);

CREATE SEQUENCE TODO_SEQ
    START WITH 1
    INCREMENT BY 1;

-- 카테고리 예시 업데이트
UPDATE TODO SET CATEGORY = 'today'   WHERE TODO_ID = 1;
UPDATE TODO SET CATEGORY = 'tomorrow'WHERE TODO_ID = 2;
UPDATE TODO SET CATEGORY = 'later'   WHERE TODO_ID = 3;

-- -------------------------------
-- ? DDAY (디데이 테이블)
-- -------------------------------
CREATE TABLE DDAY (
    DDAY_ID     NUMBER PRIMARY KEY,
    USER_ID     NUMBER NOT NULL,
    TITLE       VARCHAR2(100) NOT NULL,
    TARGET_DATE DATE NOT NULL,
    CREATED_AT  DATE DEFAULT SYSDATE,
    IMPORTANT   NUMBER(1) DEFAULT 0        -- 1: 중요 표시
);

CREATE SEQUENCE DDAY_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

-- -------------------------------
-- ? 테스트 조회 구문
-- -------------------------------
SELECT * FROM USERS;
SELECT * FROM ADMIN;
SELECT * FROM DIARY;
SELECT * FROM TODO;
SELECT * FROM DDAY;

-- 날짜 포맷 테스트
SELECT TO_CHAR(DIARY_DATE, 'YYYY-MM-DD HH24:MI:SS') FROM DIARY ORDER BY DIARY_DATE DESC;

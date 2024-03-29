--CREATE TABLE TEST(
--    TNO NUMBER,
--    TNAME VARCHAR2(20),
--    TDATE DATE
--);
--
--SELECT * FROM TEST;

DROP TABLE PLAYER;
CREATE TABLE PLAYER(
    PLAYERNO	NUMBER PRIMARY KEY, --번호
    PLAYERNAME	VARCHAR2(15 BYTE) NOT NULL UNIQUE, -- 선수이름
    PLAYERPOSITION    VARCHAR2(5 BYTE)  CHECK(PLAYERPOSITION IN ('FW','MF','DF','GK')), -- 포지션
    FOOTPOSITION	CHAR(1 BYTE) CHECK(FOOTPOSITION IN ('L','R')), --왼발,오른발 여부
    AGE    NUMBER, --나이
    HEIGHT NUMBER, -- 키
    WEIGHT NUMBER, -- 몸무게
    LOCATION    VARCHAR2(100 BYTE), -- 출생지
    DEBUTDATE	DATE DEFAULT SYSDATE NOT NULL --데뷔일
);


DROP SEQUENCE SEQ_PLAYERNO;
CREATE SEQUENCE SEQ_PLAYERNO
NOCACHE;

INSERT INTO PLAYER
VALUES(SEQ_PLAYERNO.NEXTVAL, '김민재', 'DF', 'R', 27, 188, 70, '대한민국', '2005-07-16');

INSERT INTO PLAYER
VALUES(SEQ_PLAYERNO.NEXTVAL, '호날두', 'FW', 'R', 38, 184, 82, '마데이라', '1998-08-16');

COMMIT;
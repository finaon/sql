CREATE TABLE TB_CATEGORY (
    NAME VARCHAR2(10),
    USE_YN CHAR(1) DEFAULT 'Y'
);

CREATE TABLE TB_CLASS_TYPE(
    NO VARCHAR2(5) PRIMARY KEY,
    NAME VARCHAR2(10)
);

ALTER TABLE TB_CATEGORY ADD NAME VARCHAR2(5) PRIMARY KEY;

ALTER TABLE TB_CLASS_TYPE MODIFY NAME VARCHAR2(10) NOT NULL;

ALTER TABLE TB_CATEGORY

ALTER TABLE TB_CATEGORY RENAME COLUME NAME TO  CATEGORY_NAME;
ALTER TABLE TB_CLASS_TYPE RENAME COLUME NAME TO CLASS_TYPE_NAME;

INSERT INTO TB_CATEGORY 
VALUES('공학','Y');
INSERT INTO TB_CATEGORY 
VALUES('자연과학','Y');
INSERT INTO TB_CATEGORY 
VALUES('의학','Y');
INSERT INTO TB_CATEGORY 
VALUES('예체능','Y');
INSERT INTO TB_CATEGORY 
VALUES('인문사회','Y');
COMMIT;


ALTER TABLE TB_DEPARTMENT ADD CONSTRAINT FK_DEPARTMENT_CATEGORY FOREIGN KEY
            REFERENCES TB_CATEGORY;


CREATE VIEW VW_STUDENT











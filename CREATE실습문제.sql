--�ǽ����� --
--�������� ���α׷��� ����� ���� ���̺�� �����--
--�̶�, �������ǿ� �̸��� �ο��� ��
--   �� �÷��� �ּ��ޱ�
DROP TABLE TB_MEMBER;
DROP TABLE TB_BOOK;
DROP TABLE TB_PUBLISHER;


/*
    1. ���ǻ�鿡 ���� �����͸� ������� ���ǻ� ���̺�(TB_PUBLISHER)
    �÷� : PUB_NO(���ǻ� ��ȣ) - �⺻Ű(PUBLISHER_PK)
          PUB_NAME(���ǻ��) -- NOT NULL(PUBLISHER_NN)
          PHONE(���ǻ���ȭ��ȣ) -- �������Ǿ���
*/

CREATE TABLE TB_PUBLISHER(
  PUB_NO NUMBER PRIMARY KEY,
  PUB_NAME CHAR(20) NOT NULL,
  PHONE VARCHAR2(13)
);

DROP TABLE TB_PUBLISHER;

COMMENT ON COLUMN TB_PUBLISHER.PUB_NO IS '���ǻ� ��ȣ';
COMMENT ON COLUMN TB_PUBLISHER.PUB_NAME IS '���ǻ��';
COMMENT ON COLUMN TB_PUBLISHER.PHONE IS '���ǻ���ȭ��ȣ';

SELECT * FROM TB_PUBLISHER;

INSERT INTO TB_PUBLISHER
VALUES(1, '�ѿ�', '010-1111-1111');
INSERT INTO TB_PUBLISHER
VALUES(2, '����', '010-1111-1112');
INSERT INTO TB_PUBLISHER
VALUES(3, '����', '010-1111-1113');

DROP TABLE V;


--���� 3������ ����

/*
    2. �����鿡 ���� �����͸� ������� ���� ���̺�(TB_BOOK)
    �÷� : BK_NO(������ȣ)--�⺻Ű(BOOK_PK)
          BK_TITLE(������)--NOT NULL(BOOK__NN_TITLE)
          BK_AUTHOR(���ڸ�)--NOT NULL(BOOK__NN_AUTHOR)
          BK_PRICE(����)-- �������Ǿ���
          BK_PUB_NO(���ǻ� ��ȣ)--�ܷ�Ű(BOOK_FK)(TB_PUBLISHER���̺��� ����)
                                �̶� �����ϰ� �ִ� �θ����� ������ �ڽĵ����͵� ���� �ǵ��� �ɼ�����
                                
*/

CREATE TABLE TB_BOOK(
    BK_NO NUMBER CONSTRAINT BOOK_PK PRIMARY KEY,
    BK_TITLE CHAR(20) NOT NULL,
    BK_AUTHOR CHAR(20) NOT NULL,
    BK_PRICE VARCHAR(20),
    BK_PUB_NO NUMBER REFERENCES TB_PUBLISHER(PUB_NO) ON DELETE CASCADE
);

DROP TABLE TB_BOOK;

COMMENT ON COLUMN TB_BOOK.BK_NO IS '������';
COMMENT ON COLUMN TB_BOOK.BK_TITLE IS '���ڸ�';
COMMENT ON COLUMN TB_BOOK.BK_AUTHOR IS '����';
COMMENT ON COLUMN TB_BOOK.BK_PRICE IS '���ǻ� ��ȣ';


INSERT INTO TB_BOOK
VALUES(1, '�ǽ�Ƽ', '��', '50,000', 1);

INSERT INTO TB_BOOK 
VALUES(2, '����Ǯ', 'Ŭ��', '40,000', 2);

INSERT INTO TB_BOOK 
VALUES(3, '�ƽ���', '�Ƹ���Ÿ', '20,000', 3);

INSERT INTO TB_BOOK 
VALUES(4, '��Ʈ��', '�׸���', '60,000', 1);


INSERT INTO TB_BOOK 
VALUES(5, 'ÿ��', '��üƼ��', '60,000', 1);

SELECT * FROM TB_BOOK;

--5�� ������ ���� ������ �߰��ϱ�

/*
    3. ȸ���� ���� �����͸� ������� ȸ�� ���̺�(TB_MEMBER)
    �÷��� : MEMBER_NO(ȸ����ȣ) -- �⺻Ű(MEMBER_PK)
            MEMBER_ID(���̵�) -- �ߺ�����(MEMBER_UQ_ID)
            MEMBER_PWD(��й�ȣ) -- NOT NULL(MEMBER_NN_PWD)
            MEMBER_NAME(ȸ����) -- NOT NULL(MEMBER_NN_NAME)
            GENDER(����) -- M�Ǵ� F�� �Էµǵ��� ����(MEMBER_CK_GEN)
            ADDRESS(�ּ�) -- �������Ǿ���
            PHONE(����ó)-- �������Ǿ���
            STATUS(Ż�𿩺�) -- �⺻���� N���� ����, �׸��� N�Ǵ� Y�� �Էµǵ��� �������� ����(MEMBER_CK_STA)
            ENROLL_DATE(������) -- �⺻������ SYSDATE, NOT NULL ��������(MEMBER_NN_EN)
*/
--5�� ������ ���� ������ �߰��ϱ�

CREATE TABLE TB_MEMBER(
    MEMBER_NO NUMBER CONSTRAINT MEMBER_PK PRIMARY KEY,
    MEMBER_ID VARCHAR2(20) CONSTRAINT MEMBER_UQ_ID NOT NULL UNIQUE,
    MEMBER_PWD VARCHAR2(20) CONSTRAINT MEMBER_NN_PWD NOT NULL,
    MEMBER_NAME CHAR(5)CONSTRAINT MEMBER_NN_NAME NOT NULL,
    GENDER CHAR(1) CONSTRAINT MEMBER_CK_GEN CHECK(GENDER IN ('M','F')),
    ADDRESS CHAR(50),
    PHONE VARCHAR2(13), 
    STATUS CHAR(3) DEFAULT 'N' CONSTRAINT MEMBER_CK_STA CHECK(STATUS IN ('Y', 'N')),
    ENROLL_DATE DATE DEFAULT SYSDATE CONSTRAINT MEMBER_NN_EN NOT NULL    
);


COMMENT ON COLUMN TB_MEMBER.MEMBER_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN TB_MEMBER.MEMBER_ID IS '���̵�';
COMMENT ON COLUMN TB_MEMBER.MEMBER_PWD IS '��й�ȣ';
COMMENT ON COLUMN TB_MEMBER.MEMBER_ IS 'ȸ����';
COMMENT ON COLUMN TB_MEMBER.GENDER IS '����';
COMMENT ON COLUMN TB_MEMBER.ADDRESS IS '�ּ�';
COMMENT ON COLUMN TB_MEMBER.PHONE IS '����ó';
COMMENT ON COLUMN TB_MEMBER.STATUS IS 'Ż�𿩺�';
COMMENT ON COLUMN TB_MEMBER.ENROLL_DATE IS '������';

INSERT INTO TB_MEMBER VALUES();
INSERT INTO TB_MEMBER VALUES();
INSERT INTO TB_MEMBER VALUES();
INSERT INTO TB_MEMBER VALUES();
INSERT INTO TB_MEMBER VALUES();

/*
    4.� ȸ���� � ������ �뿩�ߴ����� ���� �뿩��� ���̺�(TB_RENT)
    �÷��� : RENT_NO(�뿩��ȣ)-- �⺻Ű(RENT_PK)
            RENT_MEM_NO(�뿩ȸ����ȣ)-- �ܷ�Ű(RENT_FK_MEM) TB_MEMBER�� �����ϵ���(�� : ��) ���� 
                                        �̶� �θ� ������ ������ �ڽĵ����� ���� NULL�� �ǵ��� ���� ON DELETE SET NULL
            RENT_BOOK_NO(�뿩������ȣ)-- �ܷ�Ű(RENT_FK_BOOK) TB_BOOK�� �����ϵ���
                                        �̶� �θ� ������ ������ �ڽĵ����� ���� NULL�� �ǵ��� ���� ON DELETE SET NULL
            RENT_DATE(�뿩��) -- �⺻�� SYSDATE
*/


CREATE TABLE TB_RENT(
    RENT_NO NUMBER CONSTRAINT RENT_PK PRIMARY KEY,
    RENT_MEM_NO NUMBER,
    RENT_BOOK_NO NUMBER,
    RENT_DATE DATE DEFAULT SYSDATE,
    CONSTRAINT RENT_ FK_MEM FOREIGN KEY(RENT_MEM_NO) REFERENCE TB_MEMBER ON DELETE SET NULL,
    CONSTRAINT RENT_ FK_BOOK FOREIGN (RENT_MEM_NO) REFERENCE TB_BOOK ON DELETE SET NULL
);



--3�� ������ ���� ������ �߰��ϱ�
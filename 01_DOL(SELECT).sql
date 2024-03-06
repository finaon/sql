/*
    <SELECT>
    SELECT �������� ���� ���� FROM ���̺�;
    SELECT (*) �Ǵ� �÷�1, �÷�2, �÷�3... FROM���̺�,
*/

--��� ����� ������ ������
SELECT * FROM EMPLOYEE;

--��� ����� �̸�, �ֹε�Ϲ�ȣ, �ڵ�����ȣ
SELECT EMP_NAME, EMP_NO, PHONE
FROM EMPLOYEE;

---------------------------------�ǽ�-------------------------
--JOB���̺��� ���޸� �÷��� ��ȸ
SELECT JOB_NAME FROM JOB;


--DEPARTMENT ���̺��� ��� �÷� ��ȸ

SELECT * FROM DEPARTMENT;

--DEPARTMENT ���̺��� �μ��ڵ�, �μ��� ��ȸ

SELECT DEPT_ID, DEPT_TITLE FROM DEPARTMENT;

--employee ���̺��� �����, �̸���, ��ȭ��ȣ, �Ի���, �޿� ��ȸ

SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE, SALARY FROM EMPLOYEE;

--<�÷����� ���� �������>
--SELECT�� �÷��� �ۼ��κп� ��������� �� �� �ִ�.

--EMPLOYEE���̺��� �����, ����� ����(SALARY * 12)�� ��ȸ
SELECT EMP_NAME, SALARY *12
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� �����, �޿�, ���ʽ�, ����, ���ʽ����� ���� ��ȸ(�޿� + (�޿� + ���ʽ�)) *12

SELECT EMP_NAME, SALARY, BONUS, SALARY *12, (SALARY + (SALARY + BONUS)) * 12
FROM EMPLOYEE;
-- ������� �����߿� NULL�����Ͱ� ���ԵǾ� �ִٸ� ������ ������� NULL

-- �����, �Ի���, �ٹ��ϼ��� ��ȸ
-- ����ð� - �Ի��� = �ٹ��� �ð� 
--DATE - DATE => ����� ������ 1�� ǥ�ð� �ȴ�.
--�ڵ� ����� ��¥�� ǥ���ϴ� ��� : SYSDATE [��/��/��/��/��/��]
SELECT EMP_NAME, HIRE_DATE, SYSDATE-HIRE_DATE
FROM EMPLOYEE;


SELECT SYSDATE FROM DUAL;
-- DUAL : ����Ŭ���� �������ִ� �������� ���̺�(���̵�����)

/*
    <�÷��� ��Ī �����ϱ�>
    ��������� �ϰԵǸ� �÷����� ������������. �̶� �÷��� ��Ī�� �ο��ؼ� ����ϰ� ������ �� �ִ�.
    [ǥ����]
    �÷��� ��Ī / �÷��� as ��Ī / �÷��� "��Ī" / �÷��� as "��Ī"
*/

SELECT EMP_NAME �����, SALARY AS �޿�, BONUS "���ʽ�", SALARY * 12 AS "����(��)",
       (SALARY + (SALARY + BONUS)) * 12 AS "�Ѽҵ�"
FROM EMPLOYEE;

/*
    <���ͷ�> 
    ���Ƿ� ������ ���ڿ�('')
    ��ȸ�� ���(RESULT SET)�� ��� �࿡ �ݺ������� ���
*/


--EMPLOYEE ���̺��� ���, �����, �޿�
SELECT EMP_ID, EMP_NAME, SALARY ||'��', '��' AS "����"
FROM EMPLOYEE;

/*
    <���Ῥ���� : || >
    ���� �÷������� ��ġ �ϳ��� �÷�ó�� ���� �� �� �ִ�. 
*/

--���, �̸�, �޿��� �ϳ��� �÷����� ��ȸ
SELECT EMP_ID || EMP_NAME || SALARY
FROM EMPLOYEE;

--EMPLOYEE ���̺��� ��� ����� ������ ��ȸ�Ѵ�.
-- ������ ���� ����� �������� ����϶�
-- XX�� ������ XX���Դϴ�.

SELECT EMP_NAME || '�� ������' || SALARY || '���Դϴ�.' AS "�޿�" 
FROM EMPLOYEE;

/*
    <DISTINCT>
    �ߺ����� - �÷��� ǥ�õ� ������ �ѹ����� ��ȸ�ϰ��� �� �� ���
*/

--EMPLOYEE �����ڵ� ��ȸ
SELECT DISTINCT JOB_CODE
FROM EMPLOYEE;

--EMPLOYEE �μ��ڵ带 ��ȸ(�ߺ�����)
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE;

--SELECT DISTINCT JOD_CODE, DISTINCT DEPT_CODE
--��ó�� �ۼ��ϸ� ������ �߻��Ѵ�. DISTINCT�� �ѹ��� ����� �����ϴ�.
SELECT DISTINCT JOB_CODE, DEPT_CODE
--��ó�� ���� (JOB_CODE, DEPT_CODE)�� ������ ��� �ߺ��� �����Ѵ�.
FROM EMPLOYEE;
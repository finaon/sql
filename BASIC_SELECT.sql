

--1.�а� �̸� �迭  ǥ���Ͻÿ�

SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT;


--2. �а��� �а� ���� ���

SELECT DEPARTMENT_NAME|| '�� ������ ' || CAPACITY || '�Դϴ�.'
FROM TB_DEPARTMENT;

--3. '������а�' �� �ٴϴ� ���л� �� ���� �������� ���л��� ã�ƴ޶�� ��û�� ���Դ�.
--   �����ΰ�?(�����а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� ã�Ƴ����� ����)

SELECT STUDENT_NAME
FROM TB_STUDENT 
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '������а�'
      AND SUBSTR(STUDENT_SSN, 8, 1) IN ('2','4')
      AND SUBSTR(ABSENCE_YN, 1,1) = 'Y';

--4. ���������� ���� ���� ��� ��ü�� ���� ã�� �̸��� �Խ��ϰ��� �Ѵ�.
-- �״���ڵ��� �й��� ������ ���� �� ����ڵ��� ã�� ������ SQL ������ �ۼ��Ͻÿ�

SELECT STUDENT_NAME
FROM TB_STUDENT
--A513079, A513090, A513091, A513110, A513119
WHERE STUDENT_NO IN ('A513079','A513090','A513091','A513110','A513119')
ORDER BY STUDENT_NO DESC;

--5. �Է������� 20�� �̻� 30�� ������ �а����� �а� �̸��� ����� ����Ͻÿ�.

SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY BETWEEN 20 AND 30;

--6. 
SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;

--7.
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE DEPARTMENT_NO IS NULL;

--8.
SELECT CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

--9.
SELECT CATEGORY
FROM TB_DEPARTMENT
GROUP BY CATEGORY;

--10.
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE SUBSTR(STUDENT_ADDRESS, 1, 2) = '����'
    AND TO_CHAR(ENTRANCE_DATE, 'YY') = '02'
    AND ;
    

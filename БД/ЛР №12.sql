--1 �������
--����� ������� ����������

set nocount on
if  exists (select * from  SYS.OBJECTS        -- ������� X ����?
	        where OBJECT_ID= object_id(N'DBO.X') )	            
drop table Y;           
declare @c int, @flag char = 'r', @i INT = 10;           -- commit ��� rollback?

SET IMPLICIT_TRANSACTIONS  ON   -- �����. ����� ������� ����������

CREATE table Y(X int);                         -- ������ ���������� 
	WHILE @i != 0
	BEGIN
		INSERT INTO Y VALUES (CAST(RAND() * 1000 AS INT));
		SET @i = @i - 1;
	END;
	set @c = (select count(*) from Y);
	print '���������� ����� � ������� Y: ' + cast( @c as varchar(2));
	if @flag = 'c'  commit;                   -- ���������� ����������: �������� 
	        else   rollback;                  -- ���������� ����������: �����  
    SET IMPLICIT_TRANSACTIONS  OFF   -- ������. ����� ������� ����������
	
if  exists (select * from  SYS.OBJECTS       -- ������� Y ����?
	        where OBJECT_ID= object_id(N'DBO.Y') )
print '������� Y ����';  
    else print '������� Y ���'
GO;

--2 �������
--����������� ����������
USE TMPAN_UNIVER;
SET NOCOUNT ON;

SELECT * FROM AUDITORIUM WHERE AUDITORIUM = '210';

BEGIN TRY
	BEGIN TRAN
		DELETE AUDITORIUM WHERE AUDITORIUM = '210';
		INSERT AUDITORIUM VALUES ('210', '��', 80, '210');
		THROW 5000, 'ERROR', 1; --������ ��� ������������� � ���� catch � ������ ����������
	COMMIT TRAN
END TRY
BEGIN CATCH
	print(CAST(ERROR_NUMBER() AS NVARCHAR) + ': ' + ERROR_MESSAGE());
	IF @@TRANCOUNT > 0 ROLLBACK TRAN;
END CATCH;

SELECT * FROM AUDITORIUM WHERE AUDITORIUM = '210';

--���������� � �������� ���������
DELETE AUDITORIUM WHERE AUDITORIUM = '210';
INSERT AUDITORIUM VALUES ('210', NULL, 1, '210');
GO;

--3 �������
--������������ SAVE TRAN

SELECT * FROM AUDITORIUM;
DECLARE @POINT VARCHAR(2);
BEGIN TRY
	BEGIN TRAN
		DELETE AUDITORIUM WHERE AUDITORIUM = '210';
		SET @POINT = 'P1'; SAVE TRAN @POINT;
		INSERT AUDITORIUM VALUES ('210', '��', 80, '210');
		THROW 5000, 'ERROR', 1; --������ ��� ������������� � ���� catch � ������ ����������
		SET @POINT = 'P2'; SAVE TRAN @POINT;
		INSERT AUDITORIUM VALUES ('220', '��', 100, '220');
		COMMIT TRAN;
	COMMIT TRAN
END TRY
BEGIN CATCH
	print(CAST(ERROR_NUMBER() AS NVARCHAR) + ': ' + ERROR_MESSAGE());
	IF @@TRANCOUNT > 0 
	BEGIN
		print('CHECKPOINT: ' + @POINT);
		ROLLBACK TRAN @POINT;
		COMMIT TRAN;
	END
END CATCH;
SELECT * FROM AUDITORIUM; --210 ��������� ������ ���

--���������� � �������� ���������
INSERT AUDITORIUM VALUES ('210', NULL, 1, '210');
GO;

--4 �������
--����������������, ���������������, ��������� ������

USE TMPAN_UNIVER;
SET NOCOUNT ON;

BEGIN TRAN
	DECLARE @I INT = 10;
	WHILE @I != 0
	BEGIN
		DECLARE @NUM CHAR(20) = CAST(FLOOR(RAND() * 100) AS CHAR(20));
		INSERT AUDITORIUM VALUES (@NUM, NULL, 1, @NUM);
		SET @I = @I - 1;
	END;
ROLLBACK;

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRAN
	DECLARE @SELECT1 INT,
			@SELECT2 INT;
	SET @SELECT1 = (SELECT COUNT(*) FROM AUDITORIUM);
	SET @SELECT2 = (SELECT COUNT(*) FROM AUDITORIUM);
	IF(@SELECT1 = @SELECT2)
		PRINT('������� ���������');
	ELSE
		PRINT('������� �� ���������');
COMMIT;

--5 �������
--READ COMMITTED

USE TMPAN_UNIVER;
SET NOCOUNT ON;

BEGIN TRAN
	DECLARE @I INT = 10;
	WHILE @I != 0
	BEGIN
		DECLARE @NUM CHAR(20) = CAST(FLOOR(RAND() * 100) AS CHAR(20));
		INSERT AUDITORIUM VALUES (@NUM, NULL, 1, @NUM);
		SET @I = @I - 1;
	END;
ROLLBACK;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRAN
	DECLARE @SELECT1 INT,
			@SELECT2 INT;
	SET @SELECT1 = (SELECT COUNT(*) FROM AUDITORIUM);
	SET @SELECT2 = (SELECT COUNT(*) FROM AUDITORIUM);
	IF(@SELECT1 = @SELECT2)
		PRINT('������� ���������');
	ELSE
		PRINT('������� �� ���������');
COMMIT;

--6 �������
--REPEATABLE READ

USE TMPAN_UNIVER;
SET NOCOUNT ON;

BEGIN TRAN
	DECLARE @I INT = 10;
	WHILE @I != 0
	BEGIN
		DECLARE @NUM CHAR(20) = CAST(FLOOR(RAND() * 100) AS CHAR(20));
		INSERT AUDITORIUM VALUES (@NUM, NULL, 1, @NUM);
		SET @I = @I - 1;
	END;
	UPDATE AUDITORIUM SET AUDITORIUM_TYPE = '��' WHERE AUDITORIUM_TYPE IS NULL; --������ ������, ������� ����� ������������, ��� �� ������ ����
																				--������ ��� ������ REPEATABLE READ
ROLLBACK;

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN TRAN
	DECLARE @SELECT1 INT,
			@SELECT2 INT;
	SET @SELECT1 = (SELECT COUNT(*) FROM AUDITORIUM);
	SET @SELECT2 = (SELECT COUNT(*) FROM AUDITORIUM);
	IF(@SELECT1 = @SELECT2)
		PRINT('������� ���������');
	ELSE
		PRINT('������� �� ���������'); --������� �� ������ ���������, ��� ��� ��������� ������ ��������
	SELECT * FROM AUDITORIUM WHERE AUDITORIUM_TYPE IS NULL; --����� ��������� ���� �� ������
COMMIT;

--7 �������
--SERIALIZABLE

USE TMPAN_UNIVER;
SET NOCOUNT ON;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN TRAN
	DECLARE @I INT = 10;
	WHILE @I != 0
	BEGIN
		DECLARE @NUM CHAR(20) = CAST(FLOOR(RAND() * 100) AS CHAR(20));
		INSERT AUDITORIUM VALUES (@NUM, NULL, 1, @NUM);
		SET @I = @I - 1;
	END;
ROLLBACK;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRAN
	DECLARE @SELECT1 INT,
			@SELECT2 INT;
	SET @SELECT1 = (SELECT COUNT(*) FROM AUDITORIUM);
	SET @SELECT2 = (SELECT COUNT(*) FROM AUDITORIUM);
	IF(@SELECT1 = @SELECT2)
		PRINT('������� ���������');
	ELSE
		PRINT('������� �� ���������');
COMMIT;

--8 �������
--��������� ����������

USE TMPAN_UNIVER;
SET NOCOUNT ON;

BEGIN TRAN
	DECLARE @NUM CHAR(20) = CAST(FLOOR(RAND() * 100) AS CHAR(20));
	INSERT AUDITORIUM VALUES (@NUM, NULL, 2, @NUM);
	BEGIN TRAN
		UPDATE AUDITORIUM SET AUDITORIUM_CAPACITY = 3 WHERE AUDITORIUM_CAPACITY = 2;
	COMMIT;
	IF @@TRANCOUNT > 0 ROLLBACK;
SELECT * FROM AUDITORIUM;

--9 �������
--������� ��� X_MyBase
USE An_MyBase;

SELECT * FROM �����;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN TRAN
	INSERT �����(����, �������, [��� �������], ������) VALUES (24, '���', '������', 1200);
	UPDATE ����� SET ���� = 56 WHERE ���� = 24;
	IF @@TRANCOUNT > 0 ROLLBACK;
	ELSE COMMIT;

SELECT * FROM �����;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN TRAN
	DELETE ����� WHERE ���� = 56 OR ���� = 24;
	IF @@TRANCOUNT > 0 ROLLBACK;
	ELSE COMMIT;

SELECT * FROM �����;
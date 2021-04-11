--1 ������� 

DECLARE @ch char(10) = 'Hello',
		@varch varchar(10) = 'World!',
		@date datetime,
		@time time,
		@int int,
		@smallint smallint,
		@tinyint tinyint,
		@numeric numeric(12,5);

SET @date = '12-12-2001';
SELECT @time = CONVERT(varchar(10), GETDATE(), 108);
SELECT @int = 13, @smallint = 3, @tinyint = 2;

SELECT @ch 'ch', @varch 'varch', @date 'date', @time 'time';
print(@int);
print(@smallint);
print(@tinyint);
print(@numeric);
GO

--2 �������
USE TMPAN_UNIVER;
DECLARE @capacity int;
SELECT @capacity =  SUM(AUDITORIUM_CAPACITY) FROM dbo.AUDITORIUM;
IF @capacity > 200
	begin
		DECLARE @count int,
				@lowerAvgCount int;
		SELECT @count = COUNT(*) FROM AUDITORIUM;
		SELECT @lowerAvgCount = COUNT(*) FROM AUDITORIUM WHERE AUDITORIUM_CAPACITY < @capacity / @count;
		SELECT @count '���-�� ���������', @capacity '����� �����������', @capacity / @count '������� �����������', 
			@lowerAvgCount '���������, ������� ������� < ��������', CAST(@lowerAvgCount as real) / CAST(@count as real) * 100 '������� ����� ���������';
	end
ELSE 
	SELECT COUNT(*) [����� ����������� ���������] FROM AUDITORIUM;
GO

--3 �������
print('����� ������������ �����: ' + cast(@@ROWCOUNT as varchar));
print('������ SQL Server: ' + cast(@@VERSION as varchar));
print('��������� ������������� ��������, ����������� �������� �������� �����������: ' + cast(@@SPID as varchar));
print('��� ��������� ������: ' + cast(@@ERROR as varchar));
print('��� �������: ' + cast(@@SERVERNAME as varchar));
print('������� ����������� ���������: ' + cast(@@TRANCOUNT as varchar));
print('�������� ���������� ���������� ����� ��������������� ������: ' + cast(@@FETCH_STATUS as varchar));
print('������� ����������� ������� ���������: ' + cast(@@NESTLEVEL as varchar));
GO

--4 �������

--1 ����������: ������ ������� � ������� �������� �������
DECLARE @z real,
@t real,
@x real;

SELECT @t = 12, @x = 12;

IF @t > @x
BEGIN
    SET @z = power(sin(@t), 2);
    PRINT 'sin^2(t) = ' + cast(@z as nvarchar(50));
END
ELSE IF @t < @x
BEGIN
    SET @z = 4*(@t+@x);
    PRINT '4*(t+x) = ' + cast(@z AS nvarchar(50));
END
ELSE IF @t = @x
BEGIN
    SET @z = 1-exp(@x-2);
    PRINT '1-e^(x-2) = ' + cast(@z AS nvarchar(50));
END
GO

--2 ����������
-- �������������� ������� ��� �������� � ����������� 
DECLARE @fullname nvarchar(50) = '', @shortName nvarchar(50) = '';
DECLARE c_name CURSOR LOCAL FOR SELECT STUDENT.NAME FROM STUDENT;
DECLARE @part1 nvarchar(20) = '', @part2 char = '', @part3 char = '';
DECLARE @tmp TABLE (
	FullName nvarchar(50),
	ShortName nvarchar(20)
);
OPEN c_name;
FETCH  c_name INTO @fullname;

WHILE @@FETCH_STATUS = 0 -- ��������� ��������� �������
BEGIN
    SET @part1 = substring(@fullname, 1, charindex(' ', @fullname));
    SET @part2 = substring(@fullname, charindex(' ', @fullname) + 1 , 1);
    SET @part3 = substring(@fullname, charindex(' ', @fullname, charindex(' ', @fullname) + 1) + 1, 1);    

    SET @shortName = CAST((@part1 + @part2 + '. ' + @part3 + '.') as nvarchar);
	INSERT INTO @tmp VALUES (CAST(@fullname as nvarchar(50)), CAST(@shortName as nvarchar(20)));
    FETCH  c_name INTO @fullname;
END;
CLOSE c_name;

SELECT FullName [������ ���], ShortName [����������� ���] FROM @tmp;

--3 ����������
--����� ���������, � ������� ���� �������� � ��������� ������, � ����������� �� ��������
SELECT NAME ���, BDAY [���� ��������], datediff(year, BDAY, cast(getdate() as date))[�������] FROM STUDENT WHERE month(BDAY) + 1 = month(getdate());

--4 ����������
--����� ��� ������, � ������� �������� ��������� ������ ������� ������� �� ����
DECLARE @examDay nvarchar(15), @examDate date;

SET @examDate =
(SELECT TOP(1) PROGRESS.PDATE
FROM PROGRESS
WHERE PROGRESS.SUBJECT = '����');

SET @examDay = CONVERT(nvarchar(15), datepart(DW,@examDate));
SET @examDay = CASE @examDay
WHEN '1' THEN '��'
WHEN '2' THEN '��'
WHEN '3' THEN '��'
WHEN '4' THEN '��'
WHEN '5' THEN '��'
WHEN '6' THEN '��'
WHEN '7' THEN '��'
END

PRINT '���� ������, ����� ��� �������� �� ����: '+ @examDay;

--5 ������� (����� ������� �������)
--������������������ ����������� IF� ELSE �� ������� ������� ������ ������ ���� ������ �_UNIVER
DECLARE @capacity int;
SELECT @capacity =  SUM(AUDITORIUM_CAPACITY) - 0 FROM dbo.AUDITORIUM;
IF @capacity > 200
	begin
		DECLARE @count int,
				@lowerAvgCount int;
		SELECT @count = COUNT(*) FROM AUDITORIUM;
		SELECT @lowerAvgCount = COUNT(*) FROM AUDITORIUM WHERE AUDITORIUM_CAPACITY < @capacity / @count;
		SELECT @count '���-�� ���������', @capacity '����� �����������', @capacity / @count '������� �����������', 
			@lowerAvgCount '���������, ������� ������� < ��������', CAST(@lowerAvgCount as real) / CAST(@count as real) * 100 '������� ����� ���������';
	end
ELSE 
	SELECT COUNT(*) [����� ����������� ���������] FROM AUDITORIUM;
GO

--6 �������
--����������� ��������, � ������� � ������� CASE ������������� ����-��, ���������� ���������� ���������� ���������� ��� ����� ���������
SELECT 
CASE
	WHEN PROGRESS.NOTE > 7 THEN '������'
	WHEN PROGRESS.NOTE < 7 AND PROGRESS.NOTE >= 5 THEN '�����������������'
	WHEN PROGRESS.NOTE <= 4 THEN '�����'
	ELSE '����� �����'
END [������ ������], COUNT(*) [���-��], GROUPS.FACULTY [���������]
FROM PROGRESS INNER JOIN STUDENT
ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
INNER JOIN GROUPS
ON STUDENT.IDGROUP = GROUPS.IDGROUP
WHERE GROUPS.FACULTY = '����'
GROUP BY
CASE
WHEN PROGRESS.NOTE > 7 THEN '������'
WHEN PROGRESS.NOTE < 7 AND PROGRESS.NOTE >= 5 THEN '�����������������'
WHEN PROGRESS.NOTE <= 4 THEN '�����'
ELSE '����� �����'
END, GROUPS.FACULTY

--7 �������
--������� ��������� ��������� ������� �� ���� �������� � 10 �����, ��������� �� � ������� ����������. ������������ �������� WHILE.
CREATE TABLE #TAB
(
	ID int,
	charI nvarchar(20),
	someDate date
);
GO

DECLARE @i smallint = 10;

WHILE @i > 0
begin
	INSERT INTO #TAB VALUES (@i, cast(rand() as nvarchar(20)), DATEADD(day, (ABS(CHECKSUM(NEWID())) % 65530), 0));
	SET @i = @i - 1;
end
GO

SELECT * FROM #TAB;

--8 �������
print('1');
print('2');
RETURN;
print('3');
GO

--9 �������
BEGIN TRY
INSERT INTO FACULTY(FACULTY, FACULTY_NAME) 
VALUES('12345678910','����'); --����� 11 ��������, � ����� ������ 10
END TRY
BEGIN CATCH
	PRINT 'ERROR_NUMBER=' + CAST(ERROR_NUMBER() AS NVARCHAR(50))
	PRINT 'ERROR_MESSAGE=' + ERROR_MESSAGE()
	PRINT 'ERROR_LINE=' + CAST(ERROR_LINE() AS NVARCHAR(50))
	PRINT 'ERROR_PROCEDURE=' + CAST(ERROR_PROCEDURE() AS NVARCHAR(50))
	PRINT 'ERROR_SEVERITY=' + CAST(ERROR_SEVERITY() AS NVARCHAR(50))
	PRINT 'ERROR_STATE=' + CAST(ERROR_STATE() AS NVARCHAR(50))
END CATCH
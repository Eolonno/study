CREATE TABLE ������ (
	[����� ������] INT IDENTITY(1,1),
	[������������ ������] NVARCHAR(20) NOT NULL,
	[���� �������] REAL NOT NULL,
	[����������] INT NOT NULL,
	[���� ��������] DATE NOT NULL,
	[��������] NVARCHAR(20),
	CONSTRAINT GOODS_PRIMARY_KEY PRIMARY KEY CLUSTERED ([����� ������])
)
GO

CREATE TABLE ���������(
	[������������ �����] NVARCHAR(20) NOT NULL,
	[�����] NVARCHAR(50) NOT NULL,
	[��������� ����] NVARCHAR(15),
	CONSTRAINT COSTOMERS_PRIMARY_KEY PRIMARY KEY CLUSTERED ([������������ �����])
)
GO


USE [��������� �������]
SELECT * FROM [������] WHERE [���� ��������] > '20210101'

SELECT * FROM [������] WHERE [���� �������] BETWEEN 1 AND 100

SELECT [��������] FROM [������] WHERE[������������ ������] = '�������� ���������' 

SELECT * FROM [������] WHERE [��������] = 'IBA Group' ORDER BY [���� ��������]

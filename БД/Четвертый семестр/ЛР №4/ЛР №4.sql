USE master;
DROP database An_MyBase;

CREATE database An_MyBase
on primary 
( name = N'MyBase_mdf', filename = N'D:\�����\��\�� �4\DBFiles\MyBase_mdf.mdf', 
   size = 10240Kb, maxsize=UNLIMITED, filegrowth=1024Kb),
( name = N'MyBase_ndf', filename = N'D:\�����\��\�� �4\DBFiles\MyBase_ndf.ndf', 
   size = 10240KB, maxsize=1Gb, filegrowth=25%),
filegroup FG1
( name = N'MyBase_fg1_1', filename = N'D:\�����\��\�� �4\DBFiles\MyBase_fgq-1.ndf', 
   size = 10240Kb, maxsize=1Gb, filegrowth=25%),
( name = N'MyBase_fg1_2', filename = N'D:\�����\��\�� �4\DBFiles\MyBase_fgq-2.ndf', 
   size = 10240Kb, maxsize=1Gb, filegrowth=25%)
log on
( name = N'MyBase_log', filename=N'D:\�����\��\�� �4\DBFiles\MyBase_log.ldf',       
   size=10240Kb,  maxsize=1Gb, filegrowth=10%)


USE	 An_MyBase
CREATE TABLE �����(
	[��� �����] INT IDENTITY(1,1) NOT NULL,
	[����] INT NOT NULL,
	[�������] NVARCHAR(50) NOT NULL,
	[��� �������] NVARCHAR(20) NOT NULL,
	[������] INT NOT NULL,
	CONSTRAINT COURSE_PRIMARY_KEY PRIMARY KEY CLUSTERED([��� �����])
)
CREATE TABLE ������(
	[����� ������] INT IDENTITY(1,1),
	[�������������] NVARCHAR(20) NOT NULL,
	[���������� ���������] INT NOT NULL,
	[��� �����] INT NOT NULL,
	CONSTRAINT GROUPS_PRIMARY_KEY PRIMARY KEY CLUSTERED([����� ������]),
	FOREIGN KEY ([��� �����])  REFERENCES ����� ([��� �����])
) on FG1

CREATE TABLE �������������(
	[��� �������������] INT IDENTITY(1,1),
	[�������] NVARCHAR(20) NOT NULL,
	[���] NVARCHAR(20) NOT NULL,
	[��������] NVARCHAR(20) NOT NULL,
	[�������] NVARCHAR(13) NOT NULL,
	[����] INT NOT NULL,
	[����� ������] INT NOT NULL,
	CONSTRAINT TEACHERS_PRIMARY_KEY PRIMARY KEY CLUSTERED([��� �������������]),
	FOREIGN KEY ([����� ������])  REFERENCES ������ ([����� ������])
) on FG1

INSERT INTO �����(����, �������, [��� �������], ������)
VALUES
(55, '���', '������', 555),
(55, '���', '������', 1024),
(55, '���', '��������', 673),
(55, '���', '��������', 583)

INSERT INTO ������ (�������������, [���������� ���������], [��� �����])
VALUES
('����', 14, 1),
('����', 10, 1),
('�����', 15, 2),
('�����', 3, 3),
('���', 4, 1),
('������', 12, 4)

INSERT INTO �������������(�������, ���, ��������, �������, ����, [����� ������])
VALUES
('����������', '��������', '����������', '+375298593856', 7, 1),
('�������', '�����', '�������������', '+375292895739', 12, 3),
('������', '�������', '����������', '+375299384025', 3, 1),
('���������', '�����', '����������', '+375299285730', 5, 4),
('�����', '�����', '���������', '+375294948294', 6, 1),
('��������', '�����', '��������', '+375292395849', 23, 1),
('���������', '����', '�������', '+374492983040', 72, 2),
('��������', '���', '����������', '+375292948030', 14, 3),
('������', '�����', '��������', '+375291048545', 23, 4),
('����������', '������', '�����������', '+375294859230', 12, 5),
('���������', '���������', '����������', '+375298328549', 5, 6),
('������', '������', '����������', '+375299593035', 6, 2),
('���������', '������', '���������', '+375293938573', 8, 3),
('���������', '����', '���������', '+375293958494', 13, 4),
('������', '������', '����������', '+375294959034', 12, 5),
('���������', '������', '������������', '+375293929084', 16, 6),
('��������', '�����', '��������', '+375293958493', 17, 2),
('����', '�������', '����������', '+375293857303', 7, 6)


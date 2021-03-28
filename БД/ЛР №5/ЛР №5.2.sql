use TMPAN_UNIVER

create table TIMETABLE (
	BUNCH int,
	AUDITORIUM nvarchar(5),
	LESSONTYPE nvarchar(20),
	LESSON nvarchar(50),
	TEACHER nvarchar(50),
	DAYOFWK nvarchar(50) NOT NULL
)

insert into TIMETABLE values
	(1, '206-1', '��-�', '��', '�������� ��������� ��������', '�������'),
	(2, '236-1', '��', '��', '�������� ������ ��������', '�����������'),
	(3, '301-1', '��-�', '��', '����������� ��������� ��������', '�������'),
	(NULL, '206-1', '��-�', NULL, NULL, '�����������'),
	(NULL, NULL, NULL, NULL, '���������� �������� ����������', '�����������'),
	(NULL, NULL, NULL, NULL, '���������� ������� ��������', '�����������'),
	(1, '206-1', '��-�', '���', '���������� ������� ��������', '�����'),
	(2, '324-1', '��-�', '���', '�������� ��������� ��������', '�����������'),
	(3, '301-1', '��-�', '��', '�������� ������ ��������', '�����'),
	(NULL, NULL, NULL, NULL, '����������� ��������� ��������', '�������'),
	(NULL, NULL, NULL, NULL, '���������� �������� ����������', '�������'),
	(1, '206-1', '��-�', '����', '�������� ��������� ��������', '�����������'),
	(2, '236-1', '��', '��', '���������� �������� ����������', '�������'),
	(3, '301-1', '��-�', '��', '���������� ������� ��������', '�������'),
	(NULL, NULL, NULL, NULL, '����������� ��������� ��������', '�������'),
	(NULL, NULL, NULL, NULL, '�������� ������ ��������', '�������')

select * from TIMETABLE where LESSONTYPE = '��-�' and BUNCH IS NULL
select * from TIMETABLE where BUNCH IS NULL and AUDITORIUM = '206-1' and DAYOFWK = '�����������'
select * from TIMETABLE where TEACHER = '���������� �������� ����������' and BUNCH IS NULL
select * from TIMETABLE




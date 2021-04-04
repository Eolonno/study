use TMPAN_UNIVER

--1 �������
create view �������������
	as select TEACHER [���], TEACHER_NAME [��� �������������], GENDER [���], PULPIT [��� �������] 
	from TEACHER;

select * from �������������

--2 �������
--���������� ������������ ��������� dml ������ ��� � �������, �� ������� ������������ �������������, ���� ������ group by, � ����� ������������ ���������
--������ � ������ from
create view [���������� ������] 
	as select FACULTY.FACULTY_NAME [���������], count(PULPIT.PULPIT_NAME) [���������� ������]
	from FACULTY join PULPIT 
	on FACULTY.FACULTY = PULPIT.FACULTY
	group by FACULTY.FACULTY_NAME;

select * from [���������� ������]

--3 �������
create view ��������� 
	as select AUDITORIUM [���], AUDITORIUM_NAME [������������ ���������]
	from AUDITORIUM
	where AUDITORIUM_TYPE like '��%'

select * from ���������

--�� ����� ����� � ������������� ���������, ��� ��� ��� �� ���������� ��� ����������, ������ ��� �������� ����������� � ������� AUDITORIUM
insert ��������� values ('214-2', '214-2')

--4 �������
create view ����������_���������
	as select AUDITORIUM [���], AUDITORIUM_NAME [������������ ���������]
	from AUDITORIUM
	where AUDITORIUM_TYPE like '��%' with check option

--���������� ���������, ��� ��� �� �� ������������ ������� AUDITORIUM_TYPE, ������� ������ ���������� � �� ��� ������� ������ � ������ �������������.
--����� ��������� ������� ����� �������� ������� AUDITORIUM_TYPE � �������������
insert ����������_��������� (���, [������������ ���������]) values ('123-4', '123-4')

--5 �������
create view ����������
	as select TOP 10 SUBJECT [���], SUBJECT_NAME [������������ ����������], PULPIT [��� �������]
	from SUBJECT
	order by SUBJECT_NAME

select * from ����������

--6 �������
alter view [���������� ������] with SCHEMABINDING
	as select FACULTY.FACULTY_NAME [���������], count(PULPIT.PULPIT_NAME) [���������� ������]
	from dbo.FACULTY join dbo.PULPIT 
	on FACULTY.FACULTY = PULPIT.FACULTY
	group by FACULTY.FACULTY_NAME;

select * from [���������� ������]

--7 �������
use An_MyBase

create view ���������
	as select ������.[����� ������], �������������.�������, �������������.���, �������������.��������, �������������.����, �����.�������, 
		case
		when (�����.������ < 600) then 'Low price'
		when (�����.������ between 600 and 700) then 'Middle price'
		when (�����.������ > 700) then 'High price'
		end [������� ���������]
		from ������ join �������������  on ������.[����� ������] = �������������.[����� ������]
		join ����� on ������.[��� �����] = �����.[��� �����]

select * from ���������

create view �������������xD
	as select ������.[����� ������], �������������.�������, �������������.���, �������������.��������, ������.������������� 
		from �������������, ������ 
		where �������������.[����� ������] = ������.[����� ������] and ������.������������� like '%�%'

select * from �������������xD

--8 �������
use TMPAN_UNIVER

create view [���-�� ������� � ���� ������]
	as select [���� ������], [�����������], [�������], [�����], [��������], [�������], [�������]   
		from (select '���-�� �������' as '���� ������', DAYOFWK, LESSON from TIMETABLE) x
		pivot 
		(
			COUNT(LESSON) for DAYOFWK IN ([�����������], [�������], [�����], [��������], [�������], [�������])
		) pvt

select * from [���-�� ������� � ���� ������]

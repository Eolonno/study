use An_MyBase;

--1 �������
select min(�����.������)[����������� ���� �����],
		max(�����.������)[������������ ���� �����],
		count(�����.������)[���-�� ������],
		sum(�����.������)[����� ��������� ���� ������]
	from �����;

--2 �������
--���������� �� ��������� � �������, ������� ����� � ���������� � ������������ ���������
select �����.[��� �������],
		min(������.[���������� ���������])[����������� ���-�� ���������],
		max(������.[���������� ���������])[������������ ���-�� ���������],
		avg(������.[���������� ���������])[������� ���-�� ���������]
	from ������ join �����
	on ������.[��� �����] = �����.[��� �����]
	group by �����.[��� �������];

--3 �������
--�������� ����� �� ������� ��������� � ������� ���-�� ������ � ������ ���������
select * from (select case when ������ > 700 then 'High price'
				when ������ between 600 and 700 then 'Middle price'
				else 'Low price'
				end [������� ���������], count(*)[����������]
				from ����� group by case
				when ������ > 700 then 'High price'
				when ������ between 600 and 700 then 'Middle price'
				else 'Low price'
				end) as T
	order by case [������� ���������]
	when 'High price' then 1
	when 'Middle price' then 2
	else 3
	end;

--4 �������
--������� ���� �� ������
select ������.[����� ������], ������.�������������, avg(����)[������� ����]
	from ������ inner join ������������� on ������.[����� ������] = �������������.[����� ������]
	group by ������.[����� ������], ������.�������������;

--�� �� �����, �� ������ ��� ���� � ���
select ������.[����� ������], ������.�������������, avg(����)[������� ����]
	from ������ inner join ������������� on ������.[����� ������] = �������������.[����� ������]
	where ������������� in ('���', '����')
	group by ������.[����� ������], ������.�������������;

--5 �������
--ROLLUP
select ������.[����� ������], ������.�������������, avg(����)[������� ����]
	from ������ inner join ������������� on ������.[����� ������] = �������������.[����� ������]
	group by rollup (������.[����� ������], ������.�������������);

--CUBE
select ������.[����� ������], ������.�������������, avg(����)[������� ����]
	from ������ inner join ������������� on ������.[����� ������] = �������������.[����� ������]
	group by cube (������.[����� ������], ������.�������������);

--7 �������
--����� ������ ������ � ������ ������
select �������������.[����� ������], avg(�������������.����)[������� ����]
	from �������������
	where [����� ������] = 1
	group by [����� ������]
UNION
select �������������.[����� ������], avg(�������������.����)[������� ����]
	from �������������
	where [����� ������] = 2
	group by [����� ������]

--8 �������
--INTERSECT
select ������.������������� from ������
intersect select �����.������� from �����

--9 �������
--EXCEPT
select ������.������������� from ������
except select �����.������� from �����

--10 �������
--HAVING
select * from (select �����.[��� �����], COUNT(�������)���������� from ������������� join ������ 
							on �������������.[����� ������] = ������.[����� ������] join �����
							on �����.[��� �����] = ������.[��� �����]
							group by �����.[��� �����]
							having �����.[��� �����] >= 3) as T;

--12 �������
use TMPAN_UNIVER;

--���������� ���-�� ��������� � ������ ������, �� ������ ���������� � ����� � ������������
select * from (select GROUPS.IDGROUP, COUNT(*)[COUNT GROUP] from STUDENT join GROUPS
	on STUDENT.IDGROUP = GROUPS.IDGROUP
	group by GROUPS.IDGROUP) as T,
(select GROUPS.FACULTY, COUNT(*)[COUNT FACULTY] from STUDENT join GROUPS
	on STUDENT.IDGROUP = GROUPS.IDGROUP
	group by GROUPS.FACULTY) as T1,
(select COUNT(*)[COUNT UNIVER] from STUDENT) as T2;

--���������� ���-�� ��������� �� ����� � ��������� ����������� � ��������
select * from
	(select AUDITORIUM_TYPE, COUNT(*)[COUNT] from AUDITORIUM 
		group by AUDITORIUM_TYPE) as S
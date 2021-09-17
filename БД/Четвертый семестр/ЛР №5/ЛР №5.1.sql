use An_MyBase

select ������.[����� ������], �������������.�������, �������������.���, �������������.��������, ������.������������� 
	from ������������� join ������ 
	on �������������.[����� ������] = ������.[����� ������]

select ������.[����� ������], �������������.�������, �������������.���, �������������.��������, ������.������������� 
	from ������������� join ������ 
	on �������������.[����� ������] = ������.[����� ������] and ������.������������� like '%�%'

select ������.[����� ������], �������������.�������, �������������.���, �������������.��������, ������.������������� 
	from �������������, ������ 
	where �������������.[����� ������] = ������.[����� ������]

select ������.[����� ������], �������������.�������, �������������.���, �������������.��������, ������.������������� 
	from �������������, ������ 
	where �������������.[����� ������] = ������.[����� ������] and ������.������������� like '%�%'

select ������.[����� ������], �������������.�������, �������������.���, �������������.��������, �������������.����, �����.�������, 
	case
	when (�����.������ < 600) then 'Low price'
	when (�����.������ between 600 and 700) then 'Middle price'
	when (�����.������ > 700) then 'High price'
	end [������� ���������]
	from ������ join �������������  on ������.[����� ������] = �������������.[����� ������]
	join ����� on ������.[��� �����] = �����.[��� �����]
	order by �������������.�������, �������������.���, �������������.��������

select ������.[����� ������], �������������.�������, �������������.���, �������������.��������, �������������.����, �����.�������, 
	case
	when (�����.������ < 600) then 'Low price'
	when (�����.������ between 600 and 700) then 'Middle price'
	when (�����.������ > 700) then 'High price'
	end [������� ���������]
	from ������ join �������������  on ������.[����� ������] = �������������.[����� ������]
	join ����� on ������.[��� �����] = �����.[��� �����]
	order by 
	(case 
		when(�����.������ < 600) then 3
		when (�����.������ between 600 and 700) then 1
		else 2
		end
	)

--�������� ������� ��� ������������
alter table ������������� alter column ������� nvarchar(20) NULL;
update ������������� set ������� = NULL where ������� = '������'

select ������.[����� ������], isnull(�������������.�������, '***')[�������]
	from ������ left outer join �������������
	on ������.[����� ������] = �������������.[����� ������]

select ������.[����� ������], isnull(�������������.�������, '***')[�������]
	from ������������� right outer join ������
	on ������.[����� ������] = �������������.[����� ������]

--8 �������
create table AUTHORS(
	ID int NOT NULL,
	AUTHOR nvarchar(40)
)

create table BOOKS(
	AUTHORID int NOT NULL,
	BOOK nvarchar(40)
)

insert into BOOKS(BOOK, AUTHORID) values
	('book1', 1),
	('book2', 2),
	('book3', 5),
	('book4', 7)

insert into AUTHORS(AUTHOR, ID) values
	('author1', 1),
	('author2', 8),
	('author3', 2),
	('author4', 12)

select BOOKS.AUTHORID, BOOKS.BOOK
	from BOOKS full outer join AUTHORS
	on AUTHORS.ID = BOOKS.AUTHORID
	where BOOKS.AUTHORID is NOT NULL

select AUTHORS.ID, AUTHORS.AUTHOR
	from BOOKS full outer join AUTHORS
	on AUTHORS.ID = BOOKS.AUTHORID
	where AUTHORS.ID is NOT NULL

select *
	from BOOKS full outer join AUTHORS
	on AUTHORS.ID = BOOKS.AUTHORID

drop table BOOKS
drop table AUTHORS

--9 �������
select ������.[����� ������], �������������.�������, �������������.���, �������������.��������, ������.������������� 
	from ������������� cross join ������ 
	where �������������.[����� ������] = ������.[����� ������]
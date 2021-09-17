CREATE TABLE AUDITORIUM_TYPE 
(
AUDITORIUM_TYPE  varchar(10) PRIMARY KEY,  
AUDITORIUM_TYPENAME  varchar(30)        
);

INSERT INTO AUDITORIUM_TYPE(AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)        
VALUES ('��', '����������');
INSERT INTO AUDITORIUM_TYPE(AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)        
VALUES ('��-�', '������������ �����');
INSERT INTO AUDITORIUM_TYPE(AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)        
VALUES ('��-�', '���������� � ���. ����������');
INSERT INTO AUDITORIUM_TYPE(AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)        
VALUES ('��-X', '���������� �����������');
INSERT INTO AUDITORIUM_TYPE(AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)        
VALUES ('��-��', '����. ������������ �����');

CREATE TABLE AUDITORIUM 
( 
AUDITORIUM   varchar(20)   PRIMARY KEY,              
AUDITORIUM_TYPE varchar(10),  FOREIGN KEY(AUDITORIUM_TYPE) REFERENCES AUDITORIUM_TYPE(AUDITORIUM_TYPE), 
AUDITORIUM_CAPACITY int  DEFAULT 1 CHECK(AUDITORIUM_CAPACITY BETWEEN 1 AND 300),
AUDITORIUM_NAME varchar(50)                                     
);


INSERT INTO  AUDITORIUM(AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)   
VALUES ('206-1', '206-1','��-�', 15);
INSERT INTO  AUDITORIUM(AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)   
VALUES ('301-1', '301-1', '��-�', 15);
INSERT INTO  AUDITORIUM(AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)   
VALUES ('236-1', '236-1', '��', 60);
INSERT INTO  AUDITORIUM(AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)   
VALUES ('313-1', '313-1', '��-�', 60);
INSERT INTO  AUDITORIUM(AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)   
VALUES ('324-1', '324-1', '��-�', 50);
INSERT INTO  AUDITORIUM(AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)   
VALUES ('413-1', '413-1', '��-�', 15);
INSERT INTO  AUDITORIUM(AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)   
VALUES ('423-1', '423-1', '��-�', 90);   
INSERT INTO  AUDITORIUM(AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)   
VALUES ('408-2', '408-2', '��', 90);
INSERT INTO  AUDITORIUM(AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)   
VALUES ('103-4', '103-4', '��', 90);
INSERT INTO  AUDITORIUM(AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)   
VALUES ('105-4', '105-4', '��', 90);   
INSERT INTO  AUDITORIUM(AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)   
VALUES ('107-4', '107-4', '��', 90);  
INSERT INTO  AUDITORIUM(AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)   
VALUES ('110-4', '110-4', '��', 30);   
INSERT INTO  AUDITORIUM(AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)   
VALUES ('111-4', '111-4', '��', 30);
INSERT INTO  AUDITORIUM(AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)   
VALUES ('114-4', '114-4', '��-�', 90 );


CREATE TABLE FACULTY
(  
FACULTY varchar(10) PRIMARY KEY,
FACULTY_NAME varchar(50) DEFAULT '����������'
);


INSERT INTO FACULTY(FACULTY, FACULTY_NAME)
VALUES ('����', '����������� ���� � ����������');
INSERT INTO FACULTY(FACULTY, FACULTY_NAME)
VALUES ('����', '���������� ���������� � �������');
INSERT INTO FACULTY(FACULTY, FACULTY_NAME)
VALUES ('���', '����������������� ���������');
INSERT INTO FACULTY(FACULTY, FACULTY_NAME)
VALUES ('���', '���������-������������� ���������');
INSERT INTO FACULTY(FACULTY, FACULTY_NAME)
VALUES ('����', '���������� � ������� ������ ��������������');
INSERT INTO FACULTY(FACULTY, FACULTY_NAME)
VALUES ('���', '���������� ������������ �������');
INSERT INTO FACULTY(FACULTY, FACULTY_NAME)
VALUES ('��', '��������� �������������� ����������');


CREATE TABLE PULPIT 
( 
PULPIT varchar(20) PRIMARY KEY,
PULPIT_NAME varchar(100), 
FACULTY varchar(10), FOREIGN KEY(FACULTY) REFERENCES FACULTY(FACULTY) 
);


INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES ('����', '�������������� ������ � ����������', '����');
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('������','���������������� ������������ � ������ ��������� �������-��� ', '����');
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('��', '����������� ���������','����');
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('���', '�����������-������������ ���������', '����')  ;         
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('��', '��������������� �����������', '����')    ;                         
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('��', '�����������','���'); 
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('��', '������������','���')  ;  
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('��', '��������������','���')     ;     
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('�����', '���������� � ����������������', '���');                
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('����', '������ ������� � ������������', '���') ;
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('���', '������� � ������������������', '���')        ;      
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('������', '������������ �������������� � ������-��������� �������������', '���');
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('��', '���������� ����', '����');                        
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('�����', '������ ����� � ���������� �������������', '����') ;
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('���', '���������� �������������������� �����������', '����') ;  
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('�����', '���������� � ������� ������� �� ���������', '����')  ;  
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('��', '������������ �����', '���');
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('��������', '���������� ���������������� ������� � ����������� ����-������ ����������', '���');
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('���', '���������� ����������� ���������', '���') ;          
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('�������', '���������� �������������� ������� � ����� ���������� ���������� ', '����');
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('��������', '�����, ���������� ����������������� ����������� � ����-������ ����������� �������', '����');
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('�������', '����� � ��������� ���������� � ���������� �����������', '����');           
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('�����', '��������� � ��������� ���������� �����������', '����') ;                                            
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('����', '������������� ������ � ����������', '���');
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('����', '����������� � ��������� ������������������', '���')  ;
INSERT INTO PULPIT(PULPIT, PULPIT_NAME, FACULTY)
VALUES('������', '����������, �������������� �����, ������� � ������', '���');


CREATE TABLE TEACHER
(   
TEACHER varchar(10)  PRIMARY KEY,
TEACHER_NAME varchar(100), 
GENDER nchar(1) CHECK (GENDER in ('�', '�')),
PULPIT varchar(20) ,FOREIGN KEY(PULPIT) REFERENCES PULPIT(PULPIT) 
);


INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('����', '������ �������� �������������', '�', '����');
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('�����', '�������� ��������� ��������', '�', '����');
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('�����', '���������� ������� ����������', '�', '����');
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('�����', '�������� ������ ��������', '�', '����');
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('���', '����� ��������� ����������', '�', '����');
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('���', '��������� ����� ��������', '�', '����');
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('���', '����� ������� ��������', '�', '����');
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('���', '����� ������� �������������', '�', '����');                  
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('���', '����� ����� �������������',  '�', '����');
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('������', '���������� ��������� �������������', '�','������');
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('���', '��������� ������� �����������', '�', '������') ;                    
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('������', '����������� ��������� ��������', '�', '����');
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('����', '������� ��������� ����������', '�', '����');
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('����', '������ ������ ��������', '�', '��');
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('����', '������� ������ ����������', '�', '������');
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('���', '���������� ������� ��������', '�', '������');
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('������', '���������� �������� ��������', '�', '��');
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('���', '��������� ���� �������������', '�', '��')  ;                   
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('���', '������ ������ ���������� ', '�', '��');                    
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('�����', '��������� �������� ���������', '�', '�����') ;
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('������', '���������� �������� ����������', '�', '��') ;
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('�����', '�������� ������ ����������', '�', '��');
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('���', '����� ������ ��������', '�', '�����');
INSERT INTO TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
VALUES ('����', '������ ������� ���������',  '�', '�������');


CREATE TABLE SUBJECT
(     
SUBJECT varchar(10) PRIMARY KEY, 
SUBJECT_NAME varchar(100) unique,
PULPIT varchar(20), FOREIGN KEY(PULPIT) REFERENCES PULPIT(PULPIT)
);


INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('����', '������� ���������� ������ ������', '����');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('��', '���� ������', '����');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('���', '�������������� ����������', '����');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('����', '������ �������������� � ����������������', '����');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('��', '������������� ������ � ������������ ��������', '����');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('���', '���������������� ������� ����������', '����');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('����', '������������� ������ ��������� ����������', '����');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('���', '�������������� �������������� ������', '����');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('��', '������������ ���������', '����');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('�����', '��������. ������, �������� � �������� �����', '������');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('���', '������������ �������������� �������', '����');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('���', '����������� ��������. ������������', '������');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('��', '���������� ����������', '����');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('��', '�������������� ����������������', '����') ;
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('����', '���������� ������ ���', '����') ;             
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('���', '��������-��������������� ����������������', '����');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('��', '��������� ������������������', '����');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('��', '������������� ������', '����');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('������OO', '�������� ������ ������ � ���� � ���. ������.', '��');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('�������', '������ ������-��������� � ������������� ���������', '������');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('��', '���������� �������� ', '��');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('��', '�����������', '�����');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('��', '������������ �����', '��');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('���', '���������� ��������� �������', '��������');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('���', '������ ��������� ����', '��');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('����', '���������� � ������������ �������������', '�����');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('����', '���������� ���������� �������� ����������', '�������');
INSERT INTO SUBJECT(SUBJECT, SUBJECT_NAME, PULPIT)
VALUES('���',  '���������� ������������', '��������');


--1--
BEGIN
null;
end;

--2--
BEGIN
DBMS_OUTPUT.PUT_LINE('HELLO WORLD');
END;

--3--
DECLARE 
  x number(3):=3;
  y number(3):=0;
  z number(10,2);
BEGIN
  DBMS_OUTPUT.PUT_LINE('x:= '||x||' , y:=' ||y);
  z:=x/y;
  DBMS_OUTPUT.put_line('z:= '||z);
EXCEPTION
  when others
  then dbms_output.put_line('error= '||sqlerrm||' , code '||sqlcode);
END;

--4--
DECLARE 
  x number(3):=3;
  y number(3):=0;
  z number(10,2);
BEGIN
  DBMS_OUTPUT.PUT_LINE('x:= '||x||' , y:=' ||y);
  begin
    z:=x/y;
  EXCEPTION
    when others
    then dbms_output.put_line('error= '||sqlerrm||' , code '||sqlcode);
  end;
  DBMS_OUTPUT.put_line('z:= '||z);
END;

--5--
show parameter plsql_warnings;

select name,value from v$parameter where name='plsql_warnings';

--6--
SELECT keyword FROM v$reserved_words where length=1 and keyword!='A';

--7--
SELECT keyword FROM v$reserved_words where length>2 and keyword!='A' order by keyword;

--8--
show parameter plsql

--9--

DECLARE
  x number(3):=15;--10--
  y number(3):=6;
  z number(10,2);
  r number(5,2):=123.12;--12--
  u number(5,-2):=123.12; --13--
  i binary_float:=456789.123456782345678;--14--
  ii binary_double:=456789.123456782345678;--15--
  uu number(10,2):=5e3;--16--
  b BOOLEAN :=false; --17-- 
BEGIN 
  z:=x/y;
  DBMS_OUTPUT.put_line('z:= '||z);
  DBMS_OUTPUT.put_line('r:= '||r);
  DBMS_OUTPUT.put_line('u:= '||u);
  DBMS_OUTPUT.put_line('i:= '||i);
  DBMS_OUTPUT.put_line('ii:= '||ii);
  DBMS_OUTPUT.put_line('uu:= '||uu);
  
  if b
  then DBMS_OUTPUT.put_line('b:= true');
  else   DBMS_OUTPUT.put_line('b:= false');
  end if;
END;

--18--
DECLARE
  n1 constant number(5):=5;
  c1 constant char(15):='Hello world';
  v1 constant varchar2(15):='Im the greatest';
BEGIN
  v1:='Hello';
EXCEPTION
  when others
    then DBMS_OUTPUT.put_line('error'||v1);
END;
  
--19,20--
DECLARE
  subject1 subject.subject%type;
  pulpit1 pulpit.pulpit%type;
  faculty_rec faculty%rowtype;
BEGIN
  subject1:='���';
  pulpit1:='����';
  faculty_rec.faculty:='����';
  faculty_rec.faculty_name:='��������� ������������� ���� � ����������';
  DBMS_OUTPUT.put_line(subject1);
  DBMS_OUTPUT.put_line(pulpit1);
  DBMS_OUTPUT.put_line(rtrim(faculty_rec.faculty)||':'||faculty_rec.faculty_name);
EXCEPTION
  when others
    then DBMS_OUTPUT.put_line('error= ' ||sqlerrm);
END;

--21,22--
DECLARE 
  x int:=17;
BEGIN
  if 8>x
  then DBMS_OUTPUT.put_line('8>'||x);
  elsif 8=x
   then DBMS_OUTPUT.put_line('8='||x);
  elsif 17>x
    then DBMS_OUTPUT.put_line('17>'||x);
  elsif 17=x
    then DBMS_OUTPUT.put_line('17='||x); 
  else
     DBMS_OUTPUT.put_line('17!='||x);
  end if;
END;  

--23--
DECLARE
  x int:=17;
BEGIN
  CASE
  when 12>x 
    then DBMS_OUTPUT.put_line('12>'||x);
  when x between 13 and 20
    then DBMS_OUTPUT.put_line('13=<'||x||'<=20');
  else
    DBMS_OUTPUT.put_line('not of all');
  END CASE;
END; 


--24,25,26--
DECLARE 
  x int:=0;
BEGIN
  --24--
  loop
    x:=x+1;
    DBMS_OUTPUT.put_line(x);
  exit when x>10;
  end loop;
  --25--
  for k in 1..10
  loop
    DBMS_OUTPUT.put_line(k);
  end loop;
  --26--
  while(x>0)
  loop
    x:=x-1;
    DBMS_OUTPUT.put_line(x);
  end loop;
END;

ALTER DATABASE OPEN
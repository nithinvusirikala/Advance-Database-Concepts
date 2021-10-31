-- Script for Assignment 3

-- Creating database with full name

CREATE DATABASE nnvusiri;

-- Connecting to database 
\c nnvusiri

-- Relation schemas and instances for assignment 2

CREATE TABLE Person(pid integer,
                    pname text,
                    city text,
                    primary key (pid));

CREATE TABLE Company(cname text,
                     headquarter text,
                     primary key (cname));

CREATE TABLE Skill(skill text,
                   primary key (skill));


CREATE TABLE worksFor(pid integer,
                      cname text,
                      salary integer,
                      primary key (pid),
                      foreign key (pid) references Person (pid),
                      foreign key (cname) references Company(cname));


CREATE TABLE companyLocation(cname text,
                             city text,
                             primary key (cname, city),
                             foreign key (cname) references Company (cname));


CREATE TABLE personSkill(pid integer,
                         skill text,
                         primary key (pid, skill),
                         foreign key (pid) references Person (pid) on delete cascade,
                         foreign key (skill) references Skill (skill) on delete cascade);


CREATE TABLE hasManager(eid integer,
                        mid integer,
                        primary key (eid, mid),
                        foreign key (eid) references Person (pid),
                        foreign key (mid) references Person (pid));

CREATE TABLE Knows(pid1 integer,
                   pid2 integer,
                   primary key(pid1, pid2),
                   foreign key (pid1) references Person (pid),
                   foreign key (pid2) references Person (pid));



INSERT INTO Person VALUES
     (1001,'Jean','Cupertino'),
     (1002,'Vidya', 'Cupertino'),
     (1003,'Anna', 'Seattle'),
     (1004,'Qin', 'Seattle'),
     (1005,'Megan', 'MountainView'),
     (1006,'Ryan', 'Chicago'),
     (1007,'Danielle','LosGatos'),
     (1008,'Emma', 'Bloomington'),
     (1009,'Hasan', 'Bloomington'),
     (1010,'Linda', 'Chicago'),
     (1011,'Nick', 'MountainView'),
     (1012,'Eric', 'Cupertino'),
     (1013,'Lisa', 'Indianapolis'), 
     (1014,'Deepa', 'Bloomington'), 
     (1015,'Chris', 'Denver'),
     (1016,'YinYue', 'Chicago'),
     (1017,'Latha', 'LosGatos'),
     (1018,'Arif', 'Bloomington'),
     (1019,'John', 'NewYork');

INSERT INTO Company VALUES
     ('Apple', 'Cupertino'),
     ('Amazon', 'Seattle'),
     ('Google', 'MountainView'),
     ('Netflix', 'LosGatos'),
     ('Microsoft', 'Redmond'),
     ('IBM', 'NewYork'),
     ('ACM', 'NewYork'),
     ('Yahoo', 'Sunnyvale');


INSERT INTO worksFor VALUES
     (1001,'Apple', 65000),
     (1002,'Apple', 45000),
     (1003,'Amazon', 55000),
     (1004,'Amazon', 55000),
     (1005,'Google', 60000),
     (1006,'Amazon', 55000),
     (1007,'Netflix', 50000),
     (1008,'Amazon', 50000),
     (1009,'Apple',60000),
     (1010,'Amazon', 55000),
     (1011,'Google', 70000), 
     (1012,'Apple', 50000),
     (1013,'Yahoo', 55000),
     (1014,'Apple', 50000), 
     (1015,'Amazon', 60000),
     (1016,'Amazon', 55000),
     (1017,'Netflix', 60000),
     (1018,'Apple', 50000),
     (1019,'Microsoft', 50000);

INSERT INTO companyLocation VALUES
   ('Apple', 'Bloomington'),
   ('Amazon', 'Chicago'),
   ('Amazon', 'Denver'),
   ('Amazon', 'Columbus'),
   ('Google', 'NewYork'),
   ('Netflix', 'Indianapolis'),
   ('Netflix', 'Chicago'),
   ('Microsoft', 'Bloomington'),
   ('Apple', 'Cupertino'),
   ('Amazon', 'Seattle'),
   ('Google', 'MountainView'),
   ('Netflix', 'LosGatos'),
   ('Microsoft', 'Redmond'),
   ('IBM', 'NewYork'),
   ('Yahoo', 'Sunnyvale');

INSERT INTO Skill VALUES
   ('Programming'),
   ('AI'),
   ('Networks'),
   ('OperatingSystems'),
   ('Databases');

INSERT INTO personSkill VALUES
 (1001,'Programming'),
 (1001,'AI'),
 (1002,'Programming'),
 (1002,'AI'),
 (1004,'AI'),
 (1004,'Programming'),
 (1005,'AI'),
 (1005,'Programming'),
 (1005,'Networks'),
 (1006,'Programming'),
 (1006,'OperatingSystems'),
 (1007,'OperatingSystems'),
 (1007,'Programming'),
 (1009,'OperatingSystems'),
 (1009,'Networks'),
 (1010,'Networks'),
 (1011,'Networks'),
 (1011,'OperatingSystems'),
 (1011,'AI'),
 (1011,'Programming'),
 (1012,'AI'),
 (1012,'OperatingSystems'),
 (1012,'Programming'),
 (1013,'Programming'),
 (1013,'OperatingSystems'),
 (1013,'Networks'),
 (1014,'OperatingSystems'),
 (1014,'AI'),
 (1014,'Networks'),
 (1015,'Programming'),
 (1015,'AI'),
 (1016,'OperatingSystems'),
 (1016,'AI'),
 (1017,'Networks'),
 (1017,'Programming'),
 (1018,'AI'),
 (1019,'Networks'),
 (1010,'Databases'),
 (1011,'Databases'),
 (1013,'Databases'),
 (1014,'Databases'),
 (1017,'Databases'),
 (1019,'Databases'),
 (1005,'Databases'),
 (1006,'AI'),
 (1009,'Databases');
 

INSERT INTO hasManager VALUES
 (1004, 1003),
 (1006, 1003),
 (1015, 1003),
 (1016, 1004),
 (1016, 1006),
 (1008, 1015),
 (1010, 1008),
 (1013, 1007),
 (1017, 1013),
 (1002, 1001),
 (1009, 1001),
 (1014, 1012),
 (1011, 1005);


INSERT INTO Knows VALUES
 (1011,1009),
 (1007,1016),
 (1011,1010),
 (1003,1004),
 (1006,1004),
 (1002,1014),
 (1009,1005),
 (1018,1009),
 (1007,1017),
 (1017,1019),
 (1019,1013),
 (1016,1015),
 (1001,1012),
 (1015,1011),
 (1019,1006),
 (1013,1002),
 (1018,1004),
 (1013,1007),
 (1014,1006),
 (1004,1014),
 (1001,1014),
 (1010,1013),
 (1010,1014),
 (1004,1019),
 (1018,1007),
 (1014,1005),
 (1015,1018),
 (1014,1017),
 (1013,1018),
 (1007,1008),
 (1005,1015),
 (1017,1014),
 (1015,1002),
 (1018,1013),
 (1018,1010),
 (1001,1008),
 (1012,1011),
 (1002,1015),
 (1007,1013),
 (1008,1007),
 (1004,1002),
 (1015,1005),
 (1009,1013),
 (1004,1012),
 (1002,1011),
 (1004,1013),
 (1008,1001),
 (1008,1019),
 (1019,1008),
 (1001,1019),
 (1019,1001),
 (1004,1003),
 (1006,1003),
 (1015,1003),
 (1016,1004),
 (1016,1006),
 (1008,1015),
 (1010,1008),
 (1017,1013),
 (1002,1001),
 (1009,1001),
 (1011,1005),
 (1014,1012),
 (1010,1002),
 (1010,1012),
 (1010,1018);

\qecho 'Problem 1'
-- Find each pair $(c,n)$ where $c$ is the cnameof a company that pays
-- an average salary between 50000 and 55000 and where $n$ is the number
-- of employees who work for company $c$.
with cnameavg as (select distinct cname from worksfor group by cname having(avg(salary)>=50000 and avg(salary)<=55000))

select w.cname,count(*) from worksfor w natural join cnameavg group by w.cname;

\qecho 'Problem 2'
-- Find the pid and name of each person who lacks at least 4 job skils
-- and who knows at least 4 persons.
with countmissingskills as (select pid,count(*) as cnt from (select pid,skill from person,skill except(select * from personskill)) as a group by pid),
countknowspeople as (select pid1 as pid,count(*) as cnt from knows w group by pid1)
select pid,pname from person p natural join countmissingskills cs where cs.cnt>=4
intersect
select pid,pname from person p natural join countknowspeople kp where kp.cnt>=4; 

\qecho 'Problem 3'
-- Find the pid and name of each person who has fewer than 2 of the
-- combined set of job skills of persons who work for Google.
with googleskills as (select distinct ps.skill as skill from worksfor w natural join personskill ps where w.cname='Google'),
 missingskills as (select pid,count(*) as cnt from (select p.pid,skill from person p,googleskills gs except (select * from personskill)) as a group by pid)

select p.pid,p.pname from 
						(select pid,skill from person p,googleskills gs where (p.pid,gs.skill) in (select * from personskill)) as a 
						natural join person p
						group by p.pid,p.pname having (count(*)<2)
UNION
select p.pid,p.pname from (select pid from missingskills where cnt=(select count(*) from googleskills)) a natural join person p;

\qecho 'Problem 4'
-- Find the cname of each company that employs at least 3 persons and
-- that pays the lowest average salary among such companies.
with companythreeppl as (select cname,count(pid) from worksfor group by cname having (count(pid)>=3)),

avgsalaries as (select w.cname,avg(salary) as avgsal from worksfor w natural join companythreeppl group by w.cname)

select cname from avgsalaries where avgsal = (select min(avgsal) from avgsalaries);

\qecho 'Problem 5'
-- Find each pair $(c_1,c_2)$ of different company cnames such that,
-- among all companies, company $c_2$ pays the closest average salary
--- compared to the average salary paid by company $c_1$.
with avgsalaries as (select w.cname,avg(salary) as avgsal from worksfor w group by w.cname),

differences as (select as1.cname as c1,as2.cname as c2,abs(as1.avgsal-as2.avgsal) as diff from avgsalaries as1,avgsalaries as2 where as1.cname<>as2.cname)

select d1.c1,d1.c2 from differences d1 join (select d.c1,min(diff) as diff from differences d group by d.c1) as dd on dd.c1=d1.c1 and dd.diff=d1.diff order by 1,2;

\qecho 'Problem 6'
--Without using set predicates, find each pid of a person who does not
--know each person who (1) works for Apple and
-- (2) who makes less than 55000.
with appleemp as (select pid from worksfor where cname='Apple' and salary<55000),

knowsmatch as (select k.pid1 from knows k join appleemp a on a.pid=k.pid2  group by k.pid1 having(count(pid2) = (select count(*) from appleemp)))

select pid from person p except (select * from knowsmatch) order by 1;

\qecho 'Problem 7'
-- Without using set predicates, find each pairs $(s_1,s_2)$ of skills
-- such that the set of persons with skill $s_1$ is the same as the set
-- of persons with skill $s_2$.
create or replace function persondiffskill (s1 text, s2 text,cnt bigint) returns BOOLEAN AS
$$
select cnt = (select count(*) from ((select pid from personskill where skill=s1) INTERSECT (select pid from personskill where skill=s2)) a);
$$ language sql;

with personcount as (select skill,count(pid) as cnt from personskill group by skill),

skillcombos as (select pc1.skill s1,pc2.skill s2,pc1.cnt as cnt from personcount pc1 join personcount pc2 on pc1.cnt=pc2.cnt)

select s1,s2 from skillcombos sc where persondiffskill(sc.s1,sc.s2,sc.cnt) order by 1,2;
\qecho 'Problem 8'
-- Find each pairs $(s_1,s_2,n)$ of different skills $s_1$ an $s_2$ and
-- such that (1) the number of persons with skill $s_1$ is the same as
-- the number of persons with skill $s_2$ and (2) where $n$ is the number
-- of such persons associated with $c_1$ and $c_2$.
with personcount as (select skill,count(pid) as cnt from personskill group by skill),

skillcombos as (select pc1.skill s1,pc2.skill s2,pc1.cnt as cnt from personcount pc1 join personcount pc2 on pc1.cnt=pc2.cnt and pc1.skill<>pc2.skill)

select s1,s2,cnt from skillcombos sc order by 3;

\qecho 'Problem 9'
\qecho 'Problem 9a'
create or replace function numberOfSkills(c text)
returns table (pid integer, salary int, numberOfSkills bigint) as
$$
select w.pid,w.salary,count(ps.skill) from worksfor w natural join personskill ps where cname=c group by w.pid,w.salary
UNION
select w.pid,w.salary,0 from worksfor w where cname=c and pid not in (select pid from personskill);
$$ language sql;
\qecho 'Problem 9b'
select * from numberOfskills('Apple') order by 3;
select * from numberOfskills('Amazon') order by 3;
select * from numberOfskills('ACM') order by 3;
\qecho 'Problem 9c'
create or replace function countskills(id int) returns bigint AS
$$
select count(*) from personskill where pid=id;
$$ language sql;

create or replace function numberOfSkills(c text)
returns table (pid integer, salary int, numberOfSkills bigint) as
$$
select pid,salary,countskills(pid) from worksfor where cname=c;
$$ language sql;
\qecho 'Problem 9d'
select * from numberOfskills('Apple') order by 3;
select * from numberOfskills('Amazon') order by 3;
select * from numberOfskills('ACM') order by 3;
\qecho 'Problem 9e'
with companywise as
(select cname,(numberOfskills(cname)).* from company),

companymax AS
(select cname,max(numberofskills) as numberofskills from companywise group by cname)

select cw.cname,cw.pid from companywise cw natural join companymax cm where cw.salary>50000;
-- Using the function {\tt numberOfSkills} but without using set
-- predicates, write the following query: ``{\it Find each pair $(c,p)$
-- where $c$ is the name of a company and where $p$ is the pid of a
-- person who (1) works for company $c$, (2) makes more than 50000 and
-- (3) has the most job skills among all the employees who work for
-- company $c$}."


\qecho 'Problem 10'
CREATE TABLE P
	(COEFFICIENT INT,
	DEGREE INT);
	
CREATE TABLE Q
	(COEFFICIENT INT,
	DEGREE INT);
	
INSERT INTO P VALUES (2,2), (-5,1),(5,0);
	
INSERT INTO Q VALUES (4,4),(3,3),(1,2),(-1,1);
\qecho 'Polynomial P = 2x^2 - 5x + 5'
\qecho 'Polynomial Q = 4x^4 + 3x^3 + x^2 -x'

\qecho 'P'
select * from P;

\qecho 'Q'
select * from Q;


\qecho 'Problem 10a'
create or replace function multiplyPolynomials(p1 text, p2 text) 
returns table(coefficient INTEGER, degree integer) 
as 
$$ 
BEGIN 
RETURN QUERY 
EXECUTE 'SELECT CAST(SUM(P.COEFFICIENT*Q.COEFFICIENT) AS INT) AS coefficient,CAST((P.DEGREE+Q.DEGREE) AS INT) AS degree FROM ' ||p1|| ' AS P,' ||p2|| ' AS Q GROUP BY (P.DEGREE+Q.DEGREE) ORDER BY 2 DESC;'; 
END; 
$$ language plpgsql;
\qecho 'Problem 10b.i'

SELECT * FROM multiplypolynomials('P','Q');

\qecho 'Problem 10b.ii'
SELECT * FROM multiplypolynomials('P','P');
\qecho 'Problem 10b.iii'
select * from multiplypolynomials('P','multiplypolynomials($$Q$$,$$P$$)');
-- Connect to default database
\c postgres

-- Drop database created for this assignment
DROP DATABASE nnvusiri;






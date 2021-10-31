-- Script for Assignment 2

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
 (1019,'Networks');

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
 (1014,1012);



create table tree(parent integer,
                  child integer);

insert into tree values
 (1,2),
 (1,3),
 (1,4),
 (2,5),
 (2,6),
 (3,7),
 (5,8),
 (8,9),
 (8,10),
 (8,11),
 (7,12),
 (7,13),
 (12,14),
 (14,15);


\qecho 'Problem 1'

-- Consider the query “Find the pid and name of each person who works
-- for Google and who has a higher salary than some other person who he
-- or she knows and who also works for Google.”

-- (a) Formulate this query in SQL by only using the EXISTS or NOT EXISTS set predicates.
select pid,pname from person p 
where exists (select 1 from worksfor w1 
				where w1.pid=p.pid 
				and w1.pid=p.pid 
				and w1.cname='Google' 
				and exists (select 1 from knows k where 
				k.pid1=w1.pid and exists (select 1 from worksfor w2 
															where k.pid2=w2.pid 
															and w2.cname='Google' 
															and w2.salary<w1.salary)));


-- (b) Formulate this query in SQL by only using the IN, NOT IN, SOME,
-- or ALL set membership predicates.
select p.pid, p.pname from person p where 
		p.pid in (select w1.pid from worksfor w1 where 
					w1.cname='Google' 
					and w1.pid in 
								(select k.pid1 from knows k where 
								k.pid2 in 
											(select w2.pid from worksfor w2 WHERE
											 w2.cname='Google'))
					and w1.salary>some (select w3.salary from worksfor w3 WHERE
											 w3.cname='Google'));

-- (c) Formulate this query in SQL without using set predicates.
select p.pid, p.pname from person p,worksFor w, knows k,worksFor w2
 where p.pid=w.pid and w.cname='Google' and 
w.pid=k.pid1 and k.pid2=w2.pid and w2.cname='Google' and w2.salary<w.salary;



\qecho 'Problem 2'

-- Consider the query “Find the cname of each company with headquarter in
-- Cupertino, but that is not located in Indianapolis, along with the
-- pid, name, and salary of each person who works for that company and
-- who has the next-to-lowest salary at that company.

-- (a) Formulate this query in SQL by only using the EXISTS or NOT EXISTS
-- set predicates. You can not use the set operations INTERSECT, UNION,
-- and EXCEPT.
with cnamecuper as 
(select cname from company c where headquarter='Cupertino' and exists (select 1 from companylocation cl where c.cname=cl.cname and cl.city<>'Indianapolis')),



notlowest as (select distinct w1.cname,w1.salary from worksfor w1 where exists (select 1 from worksfor w2 where w1.cname=w2.cname and w2.salary<w1.salary)),

secondlowestsalary as 
(select w1.cname,w1.salary from notlowest w1 where not exists (select 1 from notlowest w2 where w1.cname=w2.cname and w2.salary<w1.salary)),

employees as 
(select w.cname,w.pid,w.salary from worksfor w where exists (select 1 from cnamecuper c 
																	where c.cname=w.cname) 
												and exists (select 1 from secondlowestsalary s where w.cname=s.cname and w.salary=s.salary))
												
select e.cname,p.pid,p.pname,e.salary from person p, employees e where e.pid=p.pid;	

-- (b) Formulate this query in SQL by only using the IN, NOT IN, SOME, or
-- ALL set membership predicates. You can not use the set oper- ations
-- INTERSECT, UNION, and EXCEPT.
with cnamecuper as 
(select cname from company c where headquarter='Cupertino' and c.cname in (select cl.cname from companylocation cl where cl.city<>'Indianapolis')),


notlowest as (select distinct w1.cname,w1.salary from worksfor w1,worksfor w2 where w1.cname=w2.cname and w2.salary<w1.salary),

notsecondlowest as (select distinct w1.cname,w1.salary from notlowest w1,notlowest w2 where w1.cname=w2.cname and w2.salary<w1.salary),

secondlowestsalary as (select nl.cname,nl.salary from notlowest nl where (nl.cname,nl.salary) not in (select nsl.cname,nsl.salary from notsecondlowest nsl)),

employees as 
(select w.cname,w.pid,w.salary from worksfor w where w.cname in (select c.cname from cnamecuper c) 
																	 
												and (w.cname,w.salary) in (select s.cname,s.salary from secondlowestsalary s))
												
select distinct e.cname,p.pid,p.pname,e.salary from person p, employees e where p.pid in (select distinct e2.pid from employees e2);

-- (c) Formulate this query in SQL without using set predicates.
with cnamecuper as 
(select c.cname from company c,companyLocation cl where cl.cname=c.cname and c.headquarter='Cupertino' and cl.city<>'Indianapolis'),

notlowest as (select distinct w1.cname,w1.salary from worksfor w1,worksfor w2 where w1.cname=w2.cname and w2.salary<w1.salary),

notsecondlowest as (select distinct w1.cname,w1.salary from notlowest w1,notlowest w2 where w1.cname=w2.cname and w2.salary<w1.salary),

secondlowestsalary as ((select nl.cname,nl.salary from notlowest nl) except (select nsl.cname,nsl.salary from notsecondlowest nsl))


select distinct w.cname, p.pid, p.pname, w.salary from person p,worksfor w,cnamecuper c,secondlowestsalary sls where 
w.cname=c.cname and 
p.pid=w.pid and 
w.cname=sls.cname and 
w.salary=sls.salary;

\qecho 'Problem 3'

-- Consider the query “Find each (c, p) pair where c is the cname of a 
-- company and p is the pid of a person who works for that company and 
-- who is known by all other persons who work for that company.

-- (a) Formulate this query in SQL by only using the EXISTS or NOT EXISTS set predicates. 
-- You can not use the set operations INTERSECT, UNION, and EXCEPT.
with possiblecombinations as 
(select distinct w1.cname,w1.pid,w2.pid as pid2 from worksfor w1, worksfor w2 where w1.cname=w2.cname and w1.pid<>w2.pid)

,knowssamecompany AS
(select w1.cname,w1.pid,k.pid2 from worksfor w1, knows k where exists (select 1 from worksFor w2 where w1.pid=k.pid1 and w2.pid=k.pid2 and w1.cname=w2.cname))

,excludecombi as
(select pc.cname,pc.pid2 as pid from possiblecombinations pc where not exists (select 1 from knowssamecompany ksc where pc.cname=ksc.cname and pc.pid=ksc.pid and pc.pid2=ksc.pid2))

select distinct w.cname,w.pid from worksfor w where not exists (select 1 from excludecombi ec where w.cname=ec.cname and w.pid=ec.pid);


-- (b) Formulate this query in SQL by only using the IN, NOT IN, SOME, or ALL set membership predicates. 
-- You can not use the set oper- ations INTERSECT, UNION, and EXCEPT.
with possiblecombinations as 
(select distinct w1.cname,w1.pid,w2.pid as pid2 from worksfor w1, worksfor w2 where w1.cname=w2.cname and w1.pid<>w2.pid)

,knowssamecompany AS
(select distinct w1.cname,w1.pid,k.pid2 from worksfor w1, knows k,worksfor w2 where w1.pid=k.pid1 and (k.pid2,w1.cname) in (select w2.pid,w2.cname from worksFor w2))

,excludecombi as
	(select pc.cname,pc.pid2 as pid from possiblecombinations pc where (pc.pid,pc.pid2) not in (select pid,pid2 from knowssamecompany ksc))

select distinct w.cname,w.pid from worksfor w where (w.cname,w.pid) not in (select ec.cname,ec.pid from excludecombi ec) order by 1;


-- (c) Formulate this query in SQL without using set predicates.
with possiblecombinations as 
(select distinct w1.cname,w1.pid,w2.pid as pid2 from worksfor w1, worksfor w2 where w1.cname=w2.cname and w1.pid<>w2.pid)

,knowssamecompany AS
(select w1.cname,w1.pid,k.pid2 from worksfor w1, knows k,worksfor w2 where w1.pid=k.pid1 and w2.pid=k.pid2 and w1.cname=w2.cname)

,excludecombi as
(select pc.cname,pc.pid,pc.pid2 from possiblecombinations pc except (select cname,pid,pid2 from knowssamecompany ksc ))

select distinct w.cname,w.pid from worksfor w except (select distinct cname,pid2 from excludecombi ec);


\qecho 'Problem 4'

-- Consider the query “Find each skill that is not a jobskill of any person
-- who works for Yahoo or for Netflix.

-- (a) Formulate this query in SQL using subqueries and set predicates. 
-- You can not use the set operations INTERSECT, UNION, and EXCEPT.
with skillsyahnet as
(select skill from personskill where pid in (select pid from worksfor w where w.cname='Netflix' or w.cname='Yahoo'))

select skill from skill s where s.skill not in (select skill from skillsyahnet);

-- (b) Formulate this query in SQL without using predicates.
with skillsyahnet as
(select skill from personskill ps, worksfor w where w.pid=ps.pid and (w.cname='Netflix' or w.cname='Yahoo'))

select skill from skill except (select skill from skillsyahnet);

\qecho 'Problem 5'

--  Consider the query “Find the pid and name of each person who
--  manages all but 1 person who work for Google.


-- (a) Formulate this query in SQL using subqueries and set predicates. 
-- You can not use the set operations INTERSECT, UNION, and EXCEPT.
with googleemployees as
(select pid from worksfor where cname='Google'),


mngrofgglemp as
(select distinct hm.mid from hasmanager hm,worksfor w1 where w1.pid=hm.eid and w1.cname='Google'),

mngremployee as
(select distinct hm.mid,w1.pid from hasmanager hm,worksfor w1 where w1.pid=hm.eid and w1.cname='Google'),

combinations as
(select mg.mid,ge.pid from mngrofgglemp mg, googleemployees ge),

notmanager as
(select c.mid from combinations c where (c.mid,c.pid) not in (select me.mid,me.pid from mngremployee me))

select mid as pid,pname from mngrofgglemp a,person p where p.pid=a.mid and mid not in (select mid from notmanager where mid not in (select mid from mngrofgglemp));

-- (b) Formulate this query in SQL without using set predicates.
with googleemployees as
(select pid from worksfor where cname='Google'),


mngrofgglemp as
(select distinct hm.mid from hasmanager hm where exists (select 1 from worksfor w1 where w1.pid=hm.eid and w1.cname='Google')),

mngremployee as
(select distinct hm.mid,w1.pid from hasmanager hm,worksfor w1 where w1.pid=hm.eid and w1.cname='Google'),

combinations as
(select mg.mid,ge.pid from mngrofgglemp mg, googleemployees ge),

notmanager as
(select mid from ((select c.mid,c.pid from combinations c) except (select me.mid,me.pid from mngremployee me)) a)

select mid as pid,pname from (select mid from mngrofgglemp except ((select mid from notmanager) except (select mid from mngrofgglemp))) a,person p where p.pid=a.mid ;



\qecho 'Problem 6'
-- Problem 1 in RA SQL2
 select p.pid,p.pname from person p 
 natural join worksfor w1
 join knows k on k.pid1=w1.pid
 join worksfor w2 on k.pid2=w2.pid 
 where w1.cname='Google'
 and w2.cname='Google'
 and w2.salary<w1.salary;

\qecho 'Problem 7'
-- Problem 2 in RA SQL
with cnamecuper as 
	(select distinct c.cname from company c natural join companylocation cl where c.headquarter='Cupertino' and cl.city<>'Indianapolis'),
notlowest AS
	(select distinct w1.cname,w1.salary from worksfor w1 join worksfor w2 on w1.cname=w2.cname and w2.salary<w1.salary),
notsecondlowest AS
	(select nl1.cname, nl1.salary from notlowest nl1 join notlowest nl2 on nl1.cname=nl2.cname and nl1.salary>nl2.salary),
secondlowestsalary AS
	(select nl.cname,nl.salary from notlowest nl except (select nsl.cname,nsl.salary from notsecondlowest nsl))

select w.cname,p.pid,p.pname,w.salary from person p 
join worksfor w on p.pid=w.pid 
join secondlowestsalary sls on w.cname=sls.cname and w.salary=sls.salary 
join cnamecuper cc on w.cname=cc.cname;

\qecho 'Problem 8'
-- Problem 3 in RA SQL
with possiblecombinations AS
	(select w1.cname as cname,w1.pid as pid, w2.pid as pid2 from worksfor w1 join worksfor w2 on w1.cname=w2.cname and w1.pid<>w2.pid),
	
knowssamecompany AS
	(select w1.cname,w1.pid,k.pid2 from worksfor w1 join knows k on w1.pid=k.pid1 join worksfor w2 on w2.pid=k.pid2 and w1.cname=w2.cname),
	
excludecombi AS
	(select pc.cname,pc.pid,pc.pid2 from possiblecombinations pc except(select cname,pid,pid2 from knowssamecompany))

select w.cname,w.pid from worksfor w except (select excl.cname,excl.pid2 from excludecombi excl) order by 1;

\qecho 'Problem 9'
-- Problem 4 in RA SQL
with skillsyahnet AS
	(select skill from personskill ps natural join worksfor w where (w.cname='Yahoo' or w.cname='Netflix'))

select skill from skill except (select skill from skillsyahnet);

\qecho 'Problem 10'
-- Problem 5 in RA SQL
with googleemployees AS
	(select pid from worksfor w where w.cname='Google'),
	
mngrofgglemp AS
	(select hm.mid from hasmanager hm join (select pid from worksfor w where w.cname='Google') as w on w.pid=hm.eid),

mngremployee as 
	(select hm.mid, w.pid from hasmanager hm join (select pid from worksfor w where w.cname='Google') as w on w.pid=hm.eid) ,

combinations AS
	(select * from mngrofgglemp cross join googleemployees),
	
notmanager as
	(select mid from combinations except (select mid from mngrofgglemp))

select p.pid,p.pname from person p join (select mgg.mid from mngrofgglemp mgg except (select nm.mid from notmanager nm except (select mgg2.mid from mngrofgglemp mgg2))) a on a.mid=p.pid;

\qecho 'Problem 16'

-- Create a view {\tt Triangle} that contains each triple of pids of different persons $(p_1,p_2,p_3)$
-- that mutually know each other.   
CREATE VIEW TRIANGLE AS 
select p1.pid AS P1,p2.pid AS P2,p3.pid AS P3 
from person p1,person p2,person p3 
where p1.pid<>p2.pid 
and p2.pid<>p3.pid 
and p1.pid<>p3.pid 
and exists (select 1 from knows k where k.pid1=p1.pid and k.pid2 = p2.pid)
and exists (select 1 from knows k where k.pid1=p1.pid and k.pid2 = p3.pid)
and exists (select 1 from knows k where k.pid1=p2.pid and k.pid2 = p1.pid)
and exists (select 1 from knows k where k.pid1=p2.pid and k.pid2 = p3.pid)
and exists (select 1 from knows k where k.pid1=p3.pid and k.pid2 = p1.pid)
and exists (select 1 from knows k where k.pid1=p3.pid and k.pid2 = p2.pid);
-- Then test your view.
SELECT * FROM TRIANGLE;

\qecho 'Problem 17'


-- Define a parameterized view SalaryBelow(cname text, salary integer) that returns, 
-- for a given company identified by cname and a given salary value, 
-- the subrelation of Person of persons who work for company cname and whose salary is strictly below salary.
CREATE FUNCTION SalaryBelow(cn text,sl integer)
RETURNS TABLE(pid integer, pname text,city text) AS 
$$
SELECT p.pid,p.pname,p.city from person p, worksfor w where p.pid=w.pid and w.cname=cn and w.salary<sl
$$
LANGUAGE SQL;
-- Test your view for the parameter values (’IBM’,60000), (’IBM’,50000), and (’Apple’,65000).
select * from SalaryBelow('IBM',60000);
select * from SalaryBelow('IBM',50000);
select * from SalaryBelow('Apple',65000);

\qecho 'Problem 18'

-- Define a parameterized view KnowsPersonAtCompany(p integer, c text) that returns
-- for a person with pid p the subrelation of Person of persons who p knows and 
-- who work for the company with cname c.
CREATE FUNCTION KnowsPersonAtCompany(p integer,c text)
RETURNS TABLE (pid integer, pname text,city text) AS 
$$ 
SELECT pp.pid,pp.pname,pp.city from person pp 
join knows k on k.pid2=pp.pid 
join worksfor w on w.pid=pp.pid 
where w.cname=c and k.pid1=p 
$$ LANGUAGE SQL;
-- Test you view for the parameters (1001, ‘Amazon’), (1001,‘Apple’), and (1015,‘Netflix’).
select * from KnowsPersonAtCompany(1001,'Amazon');
select * from KnowsPersonAtCompany(1001,'Apple');
select * from KnowsPersonAtCompany(1015,'Netflix');

\qecho 'Problem 19'

-- Define a parameterized view KnownByPersonAtCompany(p integer, c text)
-- that returns the subrelation of Person of persons who know the person
-- with pid p and who work for the company with cname c.  
CREATE FUNCTION KnownByPersonAtCompany(p integer,c text)
RETURNS TABLE (pid integer, pname text,city text) AS 
$$ 
SELECT pp.pid,pp.pname,pp.city from person pp 
join knows k on k.pid1=pp.pid 
join worksfor w on w.pid=pp.pid 
where w.cname=c and k.pid2=p 
$$ LANGUAGE SQL;
-- Test your view for the parameters (1001, ‘Amazon’), (1001,‘Apple’),
-- and (1015,‘Netflix’).
select * from KnownByPersonAtCompany(1001,'Amazon');
select * from KnownByPersonAtCompany(1001,'Apple');
select * from KnownByPersonAtCompany(1015,'Netflix');

\qecho 'Problem 20'

-- Let Tree(parent : integer, child : integer) be a rooted parent-child tree. 
-- So a pair (n,m) in Tree indicates that node n is a parent of node m. 

-- The sameGeneration(n1, n2) binary relation is inductively defined using the following two rules:
--  If n is a node in T , then the pair (n, n) is in the sameGeneration relation. (Base rule)

--   If $n_1$ is the parent of $m_1$ in $Tree$ and $n_2$ is the parent of
--   $m_2$ in $Tree$ and $(n_1,n_2)$ is a pair in the {\tt sameGeneration}
--   relation then $(m_1,m_2)$ is a pair in the {\tt sameGeneration}
--   relation. ({\bf Inductive Rule})

-- Write a \blue{recursive view} for the {\tt sameGeneration} relation.
CREATE RECURSIVE VIEW SameGeneration(n1, n2) AS
   (

		 
	  SELECT NO1.Parent,NO2.Parent FROM 
	  (SELECT DISTINCT Parent FROM TREE UNION SELECT DISTINCT Child FROM TREE) NO1,
	  (SELECT DISTINCT Parent FROM TREE UNION SELECT DISTINCT Child  FROM TREE) NO2 WHERE NO1.Parent=NO2.Parent

      UNION

      SELECT  T1.Child,T2.Child 
	  FROM TREE T1,TREE T2,SameGeneration SG
	  WHERE T1.Parent=SG.N1 AND T2.Parent=SG.N2
	 
    
   );
-- Test your view.
SELECT * FROM SameGeneration order by 1,2;



-- Connect to default database
\c postgres

-- Drop database created for this assignment
DROP DATABASE nnvusiri;






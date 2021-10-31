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

\qecho 'Problem 6'

-- Consider the query ``Find the cname and headquarter of
-- each company that employs persons who earns less than 55000 and who do
-- not live in Bloomington.''

-- A possible way to write this query in Pure SQL is 
\qecho 'Given Question'
select c.cname, c.headquarter
from   company c
where  c.cname in (select w.cname
                   from   worksfor w
                   where  w.salary < 55000 and 
                          w.pid = SOME (select p.pid
                                        from   person p
                                        where  p.city <> 'Bloomington'));

-- Using the Pure SQL to RA SQL translation algorithm, translate this
-- Pure SQL query to an equivalent RA SQL query.  Show the translation
-- steps you used to obtain your solution.


\qecho 'translating IN'

select distinct q.cname,q.headquarter from (select c.cname, c.headquarter
from company c, worksfor w 
				  where w.cname=c.cname and w.salary < 55000 and
				  w.pid = SOME (select p.pid
								from person p
								where p.city <> 'Bloomington'))q;

\qecho 'translating SOME'

select distinct q.cname,q.headquarter from (select c.cname, c.headquarter
from company c, worksfor w , person p
				  where w.cname=c.cname and w.salary < 55000 and w.pid=p.pid and p.city <>'Bloomington')q;
				  
\qecho 'moving constant filters to WHERE'

select distinct q.cname,q.headquarter from (select c.cname, c.headquarter
from company c, (select * from worksfor  where salary<55000) w, (select * from person where city <>'Bloomington') p 
				  where w.cname=c.cname and w.pid=p.pid) q;
				  
\qecho 'applying joins'

select distinct q.cname,q.headquarter from (select c.cname, c.headquarter
from company c natural join (select * from worksfor  where salary<55000) w
natural join (select * from person where city <>'Bloomington') p ) q;



\qecho 'Problem 7'

-- Consider the query ``Find the pid of each person who has
-- all-but-one job skill."

-- A possible way to write this query in Pure SQL is

\qecho 'Given Question'
select p.pid
from   person p
where  exists (select 1
               from   skill s
               where  (p.pid, s.skill) not in (select ps.pid, ps.skill 
                                               from   personSkill ps)) and
        not exists (select 1
                    from   skill s1, skill s2
                    where  s1.skill <> s2.skill and
                           (p.pid, s1.skill) not in (select ps.pid, ps.skill 
                                                     from   personSkill ps) and
                           (p.pid, s2.skill) not in (select ps.pid, ps.skill 
                                                     from   personSkill ps));

-- Using the Pure SQL to RA SQL translation algorithm, translate this
-- Pure SQL query to an equivalent RA SQL query.  Show the translation
-- steps you used to obtain your solution.

\qecho 'Translating AND in WHERE to INTERSECT'

select q.pid from (
	(select p.pid
	from person p
	where exists (select 1
				  from skill s
				  where (p.pid, s.skill) not in (select ps.pid, ps.skill
												from personSkill ps))) 
	intersect 
	
	(select p.pid from person p
	where not exists (select 1
					  from skill s1, skill s2
					  where s1.skill <> s2.skill and
					  (p.pid, s1.skill) not in (select ps.pid, ps.skill
												from personSkill ps) and
					  (p.pid, s2.skill) not in (select ps.pid, ps.skill
												from personSkill ps)))
) q;

\qecho 'Translating EXISTS'


select q.pid from (
	(
	select p.pid
	from person p, skill s where (p.pid,s.skill) not in (select ps.pid, ps.skill
												from personSkill ps)
	)
	INTERSECT
	(select p.pid from person p
	where not exists (select 1
					  from skill s1, skill s2
					  where s1.skill <> s2.skill and
					  (p.pid, s1.skill) not in (select ps.pid, ps.skill
												from personSkill ps) and
					  (p.pid, s2.skill) not in (select ps.pid, ps.skill
												from personSkill ps)))


)q;

\qecho 'Translating NOT EXISTS'

select q.pid from (
	(
	select p.pid
	from person p, skill s 
	where (p.pid,s.skill) not in (select ps.pid, ps.skill
												from personSkill ps)
	)
	INTERSECT
	(
	select p2.pid 
	from person p2
	except
	select p.pid 
	from person p,skill s1,skill s2 
	where s1.skill <> s2.skill and 
	(p.pid,s1.skill) not in (select ps.pid, ps.skill
												from personSkill ps) AND
	(p.pid, s2.skill) not in (select ps.pid, ps.skill
												from personSkill ps))
		


)q;

\qecho 'Translating NOT IN in the first part'

select q.pid from (
	(
	select distinct pid from (select distinct p2.pid,s2.skill
	from person p2,skill s2
	except 
	select distinct p.pid,s.skill
	from person p,skill s,personSkill ps 
	where p.pid=ps.pid and s.skill=ps.skill) pp
	)
	INTERSECT
	(
	select p2.pid 
	from person p2
	except
	select p.pid 
	from person p,skill s1,skill s2 
	where s1.skill <> s2.skill and 
	(p.pid,s1.skill) not in (select ps.pid, ps.skill
												from personSkill ps) AND
	(p.pid, s2.skill) not in (select ps.pid, ps.skill
												from personSkill ps))
		
)q;

\qecho 'Translation NOT IN in the second part'
with F as (select p.pid,s1.skill as s1skill,s2.skill as s2skill from person p,skill s1,skill s2 where s1.skill<>s2.skill)

select distinct q.pid from (
	(
	select pid from 
		(select  p2.pid,s2.skill
		from person p2,skill s2
		
		except 
		
		select p.pid,s.skill
		from person p,skill s,personSkill ps 
		where p.pid=ps.pid and s.skill=ps.skill) pp
	)
	
	INTERSECT
	
	(
			select p2.pid 
			from person p2
			
			except
			(
			select  pid from (
		
									(select  * from F 
									except 
									select  F.* from F,personSkill ps where F.pid=ps.pid and F.s1skill=ps.skill)
								
									intersect 
			
									(select  * from F 
									except 
									select  F.* from F,personSkill ps where F.pid=ps.pid and F.s2skill=ps.skill)
									) qq	
			)
	)
)q;


\qecho 'Translating to JOINS'
with F as (select p.pid,s1.skill as s1skill,s2.skill as s2skill from person p
cross join skill s1
cross join skill s2 
where s1.skill<>s2.skill)

select distinct q.pid from (
	(
	select pid from 
		(select  p2.pid,s2.skill
		from person p2 cross join skill s2
		
		except 
		
		select  p.pid,s.skill
		from person p
		cross join skill s
		join personSkill ps on p.pid = ps.pid and s.skill=ps.skill
		) pp
	)
	
	INTERSECT
	
	(
			select p2.pid 
			from person p2
			
			except
			(
			select  pid from (
		
									(select  * from F 
									except 
									select  F.* from F join personSkill ps on F.pid=ps.pid and F.s1skill=ps.skill)
								
									intersect 
			
									(select  * from F 
									except 
									select  F.* from F join personSkill ps on F.pid=ps.pid and F.s2skill=ps.skill)
									) qq	
			)
	)
)q;

\qecho 'Problem 8'

-- Consider the query ``Find the pid and name of each person who
-- works for a company located in Bloomington but who does not knows any
-- person who lives in Chicago.''

 
-- A possible way to write this query in Pure SQL is
\qecho 'Given Question'
select p.pid, p.pname
from   person p
where  exists (select 1
               from   worksFor w, companyLocation c
               where  p.pid = w.pid and w.cname = c.cname and c.city = 'Bloomington') and
       p.pid not in (select k.pid1
                     from   knows k
                     where  exists (select 1
                                    from   person p
                                    where  k.pid2 = p.pid and  p.city = 'Chicago'));

-- Using the Pure SQL to RA SQL translation algorithm, translate this
-- Pure SQL query to an equivalent RA SQL query.  Show the translation
-- steps you used to obtain your solution.

\qecho 'AND to INTERSECT'


select q.pid, q.pname from(
(select p.pid,p.pname,p.city 
from person p
where exists (select 1
			  from worksFor w, companyLocation c
			  where p.pid = w.pid and w.cname = c.cname and c.city = 'Bloomington'))

intersect 

(select p.pid,p.pname,p.city from
person p where
p.pid not in (select k.pid1
			  from knows k
			  where exists (select 1
							from person p
							where k.pid2 = p.pid and p.city = 'Chicago')
			 )
)
) q;


\qecho 'Translation of EXISTS'
			  

select q.pid, q.pname from(
(select p.pid,p.pname,p.city
from person p, worksFor w, companyLocation c
			  where p.pid = w.pid and w.cname = c.cname and c.city = 'Bloomington')

intersect 

(select p.pid,p.pname,p.city from
person p where
p.pid not in (select k.pid1
			  from knows k
			  where exists (select 1
							from person p
							where k.pid2 = p.pid and p.city = 'Chicago')
			 )
)
) q;

\qecho 'EXISTS in Second'

select q.pid, q.pname from(
(select p.pid,p.pname,p.city
from person p, worksFor w, companyLocation c
			  where p.pid = w.pid and w.cname = c.cname and c.city = 'Bloomington')

intersect 

(select p.pid,p.pname,p.city from
person p where
p.pid not in (select k.pid1
			  from knows k, person p
			  where k.pid2 = p.pid and p.city = 'Chicago')
			 )

) q;

\qecho 'NOT IN Second'

select q.pid, q.pname from(
(select p.pid,p.pname,p.city
from person p, worksFor w, companyLocation c
			  where p.pid = w.pid and w.cname = c.cname and c.city = 'Bloomington')

intersect 

(select p.pid,p.pname,p.city from
person p 

EXCEPT 

select p.pid,p.pname,p.city from person p,knows k, person p2
where p.pid=k.pid1 and k.pid2 = p2.pid and p2.city = 'Chicago')

) q;

\qecho 'Constants to FILTERS'

select q.pid, q.pname from(
(select p.pid,p.pname,p.city
from person p, worksFor w, (select * from companyLocation where city ='Bloomington') c
			  where p.pid = w.pid and w.cname = c.cname)

intersect 

(select p.pid,p.pname,p.city from
person p 

EXCEPT 

select p.pid,p.pname,p.city from person p,knows k, (select * from person where city='Chicago') p2
where p.pid=k.pid1 and k.pid2 = p2.pid)

) q;

\qecho 'Translating to Joins'

select q.pid, q.pname from(
(select p.pid,p.pname,p.city
from person p
natural join worksFor w 
join (select * from companyLocation where city ='Bloomington') c ON
c.cname=w.cname)
			  
intersect 

(select p.pid,p.pname,p.city from
person p 

EXCEPT 

select p.pid,p.pname,p.city from person p
join knows k on p.pid=k.pid1
join (select * from person where city='Chicago') p2 on 
k.pid2 = p2.pid
)

) q;


\qecho 'Problem 9'

-- Consider the query ''Find the cname and headquarter of each company
-- that (1) employs at least one person and (2) whose workers who make
-- at most 70000 have both the programming and AI skills.”
\qecho 'Given Question'
select c.cname, c.headquarter
from   company c
where  exists (select 1 from worksfor w where w.cname = c.cname) and
       not exists (select 1
                   from   worksfor w
                   where  w.cname = c.cname and w.salary <= 70000 and
                          (w.pid not in (select ps.pid from personskill ps where skill = 'Programming') or
                           w.pid not in (select ps.pid from personskill ps where skill = 'AI')));


\qecho 'AND to INTERSECT'				   
				   
select q.cname,q.headquarter from (
(select c.cname,c.headquarter
from company c 
where exists (select 1 
			  from worksfor w 
			  where w.cname = c.cname))

intersect 
(select c.cname,c.headquarter from company c
where not exists (select 1
				  from worksfor w
				  where w.cname = c.cname and w.salary <= 70000 and
				  (w.pid not in (select ps.pid from personskill ps where skill = 'Programming') or
				   w.pid not in (select ps.pid from personskill ps where skill = 'AI'))))) q;

\qecho 'EXISTS and NOT EXISTS INSIDE WHERE'
select q.cname,q.headquarter from (
(select c.cname,c.headquarter
from company c,worksfor w 
			  where w.cname = c.cname)

intersect 
(select c.cname,c.headquarter from company c
except 
select c.cname,c.headquarter from company c, worksfor w
				  where w.cname = c.cname and w.salary <= 70000 and
				  (w.pid not in (select ps.pid from personskill ps where skill = 'Programming') or
				   w.pid not in (select ps.pid from personskill ps where skill = 'AI')))) q;
				   
				   
\qecho 'AND TO INTERSECT'
select q.cname,q.headquarter from (
	   (select c.cname,c.headquarter
		from company c,worksfor w 
	    where w.cname = c.cname)

		intersect 
		
		(select c.cname,c.headquarter from company c
		 except 
		 select pp.cname,pp.headquarter from 
										(select w.cname as wname,w.salary,w.pid,c.cname,c.headquarter from company c, worksfor w
										 where w.cname = c.cname and w.salary <= 70000 
 
										 intersect 
 
										 select w.cname as wname,w.salary,w.pid,c.cname,c.headquarter from company c, worksfor w
										 where w.cname = c.cname and
										 (w.pid not in (select ps.pid from personskill ps where skill = 'Programming') or
										  w.pid not in (select ps.pid from personskill ps where skill = 'AI'))
										 ) pp )) q;


\qecho 'Using Anti Left Distribution Rule' 

select q.cname,q.headquarter from (
	   (select c.cname,c.headquarter
		from company c,worksfor w 
	    where w.cname = c.cname)

		intersect 
		
		(select c.cname,c.headquarter from company c
		 except 
		 select pp.cname,pp.headquarter from 
										(select w.cname as wname,w.salary,w.pid,c.cname,c.headquarter from company c, worksfor w
										 where w.cname = c.cname and w.salary <= 70000 
 
										 intersect 
 
										 select w.cname as wname,w.salary,w.pid,c.cname,c.headquarter from company c, worksfor w
										 where w.cname = c.cname 
										 
										 except 
										 
										 (	
													select w.cname as wname,w.salary,w.pid,c.cname,c.headquarter from company c, worksfor w, personSkill ps
													where w.cname = c.cname and  ps.pid=w.pid and skill = 'Programming'
													
													intersect 
										
													select w.cname as wname,w.salary,w.pid,c.cname,c.headquarter from company c, worksfor w, personSkill ps
													where w.cname = c.cname and  ps.pid=w.pid and skill = 'AI'
										)
										) pp )) q;


\qecho 'Doing A intersect B = A if A is subset of B, and also moving filters of constants inside from'

select q.cname,q.headquarter from (
	   (select c.cname,c.headquarter
		from company c,worksfor w 
	    where w.cname = c.cname)

		intersect 
		
		(select c.cname,c.headquarter from company c
		 except 
		 select pp.cname,pp.headquarter from 
										(select w.cname as wname,w.salary,w.pid,c.cname,c.headquarter from company c, (select * from worksfor w where w.salary<=70000) w
										 where w.cname = c.cname 
 										 
										 except 
										 
										 (	
													select w.cname as wname,w.salary,w.pid,c.cname,c.headquarter from company c, worksfor w, (select * from personSkill ps where skill='Programming') ps
													where w.cname = c.cname and  ps.pid=w.pid
													
													intersect 
										
													select w.cname as wname,w.salary,w.pid,c.cname,c.headquarter from company c, worksfor w, (select * from personSkill ps where skill='AI') ps
													where w.cname = c.cname and  ps.pid=w.pid
										)
										) pp )) q;



\qecho 'JOINS'

select q.cname,q.headquarter from (
	   (select c.cname,c.headquarter
		from company c natural join worksfor w 
	    )

		intersect 
		
		(select c.cname,c.headquarter from company c
		 except 
		 select pp.cname,pp.headquarter from 
										(select w.cname as wname,w.salary,w.pid,c.cname,c.headquarter from company c natural join (select * from worksfor w where w.salary<=70000) w
										
										except 
										 
										 (	
													select w.cname as wname,w.salary,w.pid,c.cname,c.headquarter from company c
													natural join worksfor w natural join (select * from personSkill ps where skill='Programming') ps
													
													intersect 
										
													select w.cname as wname,w.salary,w.pid,c.cname,c.headquarter from company c
													natural join worksfor w natural join (select * from personSkill ps where skill='AI') ps
										
										) )pp )) q;

\qecho 'Problem 10'

-- Consider the following Pure SQL query.

select p.pid, exists (select 1
                      from   hasManager hm1, hasManager hm2
                      where  hm1.mid = p.pid and hm2.mid = p.pid and
                             hm1.eid <> hm2.eid)
from   Person p;

-- This query returns a pair (p,t) if p is the pid of a person who
-- manages at least two persons and returns the pair (p,f) otherwise.

-- Using the insights gained from Problem 2, translate
-- this Pure SQL query to an equivalent RA SQL query.

\qecho 'Translate exists and taking a union of pid which are True and pid which are false'

(select pid , true from person p, hasmanager hm1,hasmanager hm2 where hm1.mid=p.pid and hm2.mid=p.pid and hm1.eid<>hm2.eid) union 
(select pid, false from (select pid from person p except (select p.pid from person p,hasmanager hm1,hasmanager hm2 where hm1.mid=p.pid and hm2.mid=p.pid and hm1.eid<>hm2.eid)) qq) order by 1;

\qecho 'joins'

(select pid , true from 
(select * from person p
join hasmanager hm1 on p.pid=hm1.mid
join hasmanager hm2 on p.pid = hm2.mid and hm1.eid<>hm2.eid) as pp) 
union 
(select pid, false from 
(select p.* from person p 
	except 
		(select p.* from person p
		 join hasmanager hm1 on hm1.mid=p.pid
		 join hasmanager hm2 on hm2.mid=p.pid and hm1.eid<>hm2.eid)) qq) order by 1;




-- Connect to default database
\c postgres

-- Drop database created for this assignment
DROP DATABASE nnvusiri;






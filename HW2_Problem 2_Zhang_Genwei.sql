-- Create all the relations and populate them!
DROP TABLE Author;
CREATE TABLE Author (
        aid NUMBER(1), 
        aname VARCHAR2(20), 
        age NUMBER (2),
        number_of_publication NUMBER(2));
        
Insert all
into Author (aid, aname, age, number_of_publication) values (1, 'Morgan', 60, 26)
into Author (aid, aname, age, number_of_publication) values (2, 'Cruz', 38, 8)
into Author (aid, aname, age, number_of_publication) values (3, 'Adams', 30, 5)
into Author (aid, aname, age, number_of_publication) values (4, 'Perry', 65, 24)
into Author (aid, aname, age, number_of_publication) values (5, 'Derek', 50, 10)
into Author (aid, aname, age, number_of_publication) values (6, 'Derek', 32, 4)
into Author (aid, aname, age, number_of_publication) values (7, 'Lewis', 70, 20)
into Author (aid, aname, age, number_of_publication) values (8, 'Alice', 47, 7)
select * from dual;


DROP TABLE Translator;
CREATE TABLE Translator (
        aid NUMBER(3), 
        aname VARCHAR2(20), 
        salary NUMBER (5));
        
Insert all
into Translator(aid, aname, salary) values (101, 'Mark', 58000)
into Translator(aid, aname, salary) values (102, 'Black', 25000)
into Translator(aid, aname, salary) values (103, 'Ed', 30000)
into Translator(aid, aname, salary) values (104, 'Mark', 82000)
select * from dual;


DROP TABLE Book;
CREATE TABLE Book (
        btitle VARCHAR2(20),
        category VARCHAR2(20),
        edition NUMBER(2), 
        release_year number(4), 
        tid NUMBER (3));
        
Insert all
into Book (btitle, category, edition, release_year, tid) values ('Jurassic Park', 'Novel', 8, 1984, 101)
into Book (btitle, category, edition, release_year, tid) values ('The Power of Habit', 'Business', 10, 2001, 102)
into Book (btitle, category, edition, release_year, tid) values ('Heidi', 'Children', 9, 1960, 104)
into Book (btitle, category, edition, release_year, tid) values ('Anna Karenina', 'Novel', 20, 1994, 103)
into Book (btitle, category, edition, release_year, tid) values ('War and Peace', 'Novel', 17, 1968, 104)
into Book (btitle, category, edition, release_year, tid) values ('The Lion King', 'Children',5, 1990, 103)
into Book (btitle, category, edition, release_year, tid) values ('Rich Dad', 'Business', 9, 1997, 103)
into Book (btitle, category, edition, release_year, tid) values ('The Goal', 'Business', 14, 1963, 103)
into Book (btitle, category, edition, release_year, tid) values ('Rework', 'Business', 6, 2003, 102)
into Book (btitle, category, edition, release_year, tid) values ('Beautiful Mind', 'Phycology', 3, 1979, 102)

select * from dual;

DROP TABLE written;
CREATE TABLE written (
        aid number(1),
        btitle VARCHAR2(20));
        
Insert all
into written (aid, btitle) values (4, 'Jurassic Park')
into written (aid, btitle) values (7, 'The Goal')
into written (aid, btitle) values (1, 'Heidi')
into written (aid, btitle) values (8, 'Rework')
into written (aid, btitle) values (5, 'Rework')
into written (aid, btitle) values (1, 'Anna Karenina')
into written (aid, btitle) values (2, 'Rework')
into written (aid, btitle) values (3, 'The Lion King')
into written (aid, btitle) values (4, 'Rich Dad')
into written (aid, btitle) values (8, 'The Power of Habit')
select * from dual;

DROP TABLE Customer;
CREATE TABLE Customer (
        cid number(3),
        cname VARCHAR2(20),
        Number_of_order number(2),
        level_ VARCHAR2(20));
Insert All
into Customer(cid, cname, Number_of_order, level_) values (200, 'John', 10, 'Children')
into Customer(cid, cname, Number_of_order, level_) values (201, 'Emily', 7, 'Adult')
into Customer(cid, cname, Number_of_order, level_) values (202, 'Ashely', 19, 'Adult')
into Customer(cid, cname, Number_of_order, level_) values (203, 'Edward', 3, 'Children')
into Customer(cid, cname, Number_of_order, level_) values (204, 'Wu', 12, 'Adult')
select * from dual;

DROP TABLE Purchased;
CREATE TABLE Purchased (
        cid number(3),
        btitle VARCHAR2(20));
Insert All
into Purchased (cid, btitle) values (200, 'Anna Karenina')
into Purchased (cid, btitle) values (204, 'Heidi')
into Purchased (cid, btitle) values (203, 'War and peace')
into Purchased (cid, btitle) values (204, 'Rework')
into Purchased (cid, btitle) values (201, 'Anna Karenina')
into Purchased (cid, btitle) values (204, 'The Lion King')
into Purchased (cid, btitle) values (200, 'The Lion King')
into Purchased (cid, btitle) values (202, 'War and peace')
select * from dual;

-- question 2
select level_,cname 
from customer
where cid in( select cid 
            from purchased
            where btitle in ( select btitle
                         from written
                         where aid in (select aid
                                    from author
                                    where aname='Adams')));
                                    
-- question 3
select category,btitle 
from Book
where release_year in (select release_year 
                            from Book
                            where tid in (select aid
                                        from Translator 
                                        where aname='Mark')
                                and edition>10);
                                
-- question 4
select aname 
from Author
where aid in (select aid
            from written 
            where btitle in(  select btitle
                                from written
                                group by btitle
                                having count(btitle)>2));
                
--question 5
select aname
from Translator
where aid in ( select tid
                from Book 
                where Book.BTITLE in (select btitle 
                                 from written
                                 group by btitle
                                 having count(btitle)>2));

                           
--question 6
select category
from Book
group by category
having (count(distinct tid)
        =2);
        
--question 7 
select aid, aname
from Author
where aid in (select aid, btitle
              from Written
              group by aid
              having count(aid)=2 and btitle in  (select category, btitle 
                                                  from Book T, Book S
                                                  where T.category=S.category));
                                                

--question 8 
select category, avg(edition)
from Book
group by category;

--question 9
update translator
set salary=salary* 1.1
where aid in(select tid
                from Book
                where btitle='Beautiful Mind');


--question 10

delete from customer
where level_='Children';
                                    
                            



        

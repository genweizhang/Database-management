--Task 4. Create all the tables 
Drop table client;
Create table client (
                    SSN number (10),
                    cname varchar2 (20),
                    birth_date Date,
                    race varchar2 (20),
                    gender varchar2 (20),
                    profession varchar2 (30),
                    mailing_address varchar2 (50),
                    email_address varchar2 (50),
                    home_cell_phone varchar2 (20),
                    work_cell_phone varchar2 (20),
                    existence_on_list varchar2 (20),
                    name_of_doctor varchar2 (20),
                    phone_of_doctor varchar2 (20),
                    name_of_attorney varchar2 (20),
                    phone_of_attorney varchar2 (20),
                    date_assigned Date);

Drop table volunteer;
Create table volunteer (
                    SSN number (10),
                    vname varchar2 (20),
                    birth_date Date,
                    race varchar2 (20),
                    gender varchar2 (20),
                    profession varchar2 (30),
                    mailing_address varchar2 (50),
                    email_address varchar2 (30),
                    home_cell_phone varchar2 (20),
                    work_cell_phone varchar2 (20),
                    existence_on_list varchar2 (20),
                    date_joined Date,
                    date_of_training_course Date,
                    loc_of_training_course varchar2 (20));
                    
Drop table employee;
Create table employee (
                    SSN number (10),
                    ename varchar2 (20),
                    birth_date Date,
                    race varchar2 (20),
                    gender varchar2 (20),
                    profession varchar2 (30),
                    mailing_address varchar2 (50),
                    email_address varchar2 (50),
                    home_cell_phone varchar2 (20),
                    work_cell_phone varchar2 (20),
                    existence_on_list varchar2 (20),
                    salary number (15),
                    marital_status varchar2 (20),
                    hire_date Date);
                    
Drop table donor;
Create table donor (
                    SSN number (10),
                    dname varchar2 (20),
                    birth_date Date,
                    race varchar2 (20),
                    gender varchar2 (20),
                    profession varchar2 (30),
                    mailing_address varchar2 (50),
                    email_address varchar2 (50),
                    home_cell_phone varchar2 (20),
                    work_cell_phone varchar2 (20),
                    existence_on_list varchar2 (20),
                    donation_date Date,
                    donation_amount number (20),
                    donation_type varchar2 (20),
                    anonymous_wish varchar2 (20),
                    name_of_campaign varchar2 (50));
                    
Drop table emergency_contact;
Create table emergency_contact (
                    SSN number (10),
                    emergency_name varchar2 (30),
                    contact_info varchar2 (50),
                    relationship varchar2 (20));
                    
Drop table affiliation;
Create table affiliation (
                    SSN number (10),
                    oname varchar2 (60),
                    mailing_address varchar2 (50),
                    phone_number varchar2 (20),
                    contact_person varchar2 (20));
                
Drop table organization_donation;
Create table organization_donation (
                    oname varchar2 (60),
                    donation_date Date,
                    donation_amount number (10),
                    phone_number varchar2 (20),
                    contact_person varchar2 (20));
                    
Drop table business_organization;
Create table business_organization (
                    oname varchar2 (60),
                    otype varchar2 (50),
                    osize number (20),
                    website varchar2 (30));
                    
Drop table church_organization;
Create table church_organization (
                    oname varchar2 (60),
                    religious_affiliation varchar2 (50));
                    
Drop table client_needs;
Create table client_needs (
                           SSN number (10),
                           visiting varchar2 (30),
                           shopping varchar2 (30),
                           housekeeping varchar2 (30),
                           transportation varchar2 (30),
                           yard_work varchar2 (30),
                           food varchar2 (30),
                           importance_visiting varchar2 (10),
                           importance_shopping varchar2 (10),
                           importance_housekeeping varchar2 (10),
                           importance_transportation varchar2 (10),
                           importance_year_work varchar2 (10),
                           importance_food varchar2 (10));
                           
Drop table client_insurance;
Create table client_insurance (
                           SSN number (10),
                           policy_ID varchar2 (20),
                           provider_ID varchar2 (20),
                           provider_address varchar2 (50),
                           intype varchar2 (20));
                           
Drop table team;
Create table team (
                    tname varchar2 (30),
                    ttype varchar2 (30),
                    date_formation Date);
                    
Drop table contains;
Create table contains (
                       tname varchar2 (30),
                       SSN number (10),
                       hours_worked number(10));
                    
Drop table leader;
Create table leader (
                     tname varchar2 (30),
                     SSN number (10));
                     
Drop table cares_for;
Create table cares_for (
                        tname varchar2 (30),
                        SSN number (10));
                        
Drop table active_status;
Create table active_status (
                            SSN number (10),
                            tname varchar2 (30),
                            status varchar2 (10));
                    
Drop table report;
Create table report (
                    tname varchar2 (30),
                    SSN number (10),
                    report_date Date,
                    report_content varchar2 (1000));
                    
Drop table expense;
Create table expense (
                      SSN number (10),
                      expense_name varchar2 (30),
                      expense_date Date,
                      expense_amount number (10),
                      expense_description varchar2 (200));

Drop table sponsor;
Create table sponsor (
                      tname varchar2 (30),
                      oname varchar2 (60));
                      
Drop table donate_check;
Create table donate_check (
                           SSN number (10),
                           check_number number (30));
                           
Drop table donate_card;
Create table donate_card (
                          SSN number (10),
                          card_number number (30),
                          card_type varchar2 (20),
                          card_exp_date Date);
                          

--Task 5

--Query 1
-- insert a new team

insert into team (tname, ttype, date_formation) values ('Better-life', 'non-profit', '01-Nov-2017');

--insert two more team 'Thriving' and 'Faster and faster'.
insert into team (tname, ttype, date_formation) values ('Thriving', 'profit', '01-Nov-2010');
insert into team (tname, ttype, date_formation) values ('Faster and faster', 'non-profit', '01-Jan-2017');

--Query 2
--insert a new client
insert into client (SSN, cname, birth_date,race,gender,profession ,mailing_address,
                    email_address,home_cell_phone, work_cell_phone, existence_on_list, name_of_doctor, 
                    phone_of_doctor,name_of_attorney, phone_of_attorney,date_assigned)
                    values (123456789, 'Jack', '01-Jan-1980','European','male','teacher','101 Asp Ave, Norman', 
                    'jack@ou.edu','405-8888888','405-6666666','on list','Thomas', '405-1234567','Kim','918-1234567',
                    '01-Jan-2017');
                    
--associate the new client 'Jack' with the team 'Better-life'
insert into cares_for (tname, SSN) values ((select tname from team where tname='Better-life'), 
                                            (select SSN from client where cname='Jack')); 
                                            
--insert a new client
insert into client (SSN, cname, birth_date,race,gender,profession ,mailing_address,
                    email_address,home_cell_phone, work_cell_phone, existence_on_list, name_of_doctor, 
                    phone_of_doctor,name_of_attorney, phone_of_attorney,date_assigned)
                    values (100000009, 'Vardhan', '01-Jan-1992','Indian','male','student','010 Asp Ave, Norman', 
                    'Vardhan@ou.edu','405-8866888','405-8866666','on list','Thema', '405-1224567','Kimy','918-2234567',
                    '01-Feb-2017');
                    
--associate the new client 'Vardhan' with the team 'Better-life'
insert into cares_for (tname, SSN) values ((select tname from team where tname='Better-life'), 
                                            (select SSN from client where cname='Vardhan')); 
                                            
--associate the client 'Jack' with the team 'Faster and faster'
insert into cares_for (tname, SSN) values ((select tname from team where tname='Faster and faster'), 
                                            (select SSN from client where cname='Jack')); 
                                            
--insert two clients Jack and vardhan's needs and insurance
insert into client_insurance (SSN,policy_ID,provider_ID,provider_address,intype) values
                              ((select SSN from client where cname='Jack'),'1-23456789','#1234','lincoln street','lifelong');
                              
insert into client_needs  (SSN,visiting ,shopping,housekeeping,transportation,yard_work ,food, 
                           importance_visiting,importance_shopping,importance_housekeeping ,
                           importance_transportation ,importance_year_work ,importance_food)
                           values
                           ((select SSN from client where cname='Jack'),'','','','','','','2','3','4','4','5','10');
insert into client_needs  (SSN,visiting ,shopping,housekeeping,transportation,yard_work ,food, 
                           importance_visiting,importance_shopping,importance_housekeeping ,
                           importance_transportation ,importance_year_work ,importance_food)
                           values
                           ((select SSN from client where cname='Vardhan'),'','','','','','','2','3','4','4','5','10');                           
                                            
--Query 3
--insert a new volunteer
insert into volunteer (SSN, vname, birth_date,race,gender,profession ,mailing_address,
                    email_address,home_cell_phone, work_cell_phone, existence_on_list, date_joined, 
                    date_of_training_course,LOC_OF_TRAINING_COURSE)
                    values (121212121, 'John', '12-Dec-1985','American','male','student','111 Asp Ave, Norman', 
                    'john@ou.edu','405-7878787','405-6767676','on list','11-Jan-2017', '01-May-2017','Moore');
                    
--associate the volunteer 'John' with the team 'Better-life'
insert into contains (tname, SSN, hours_worked) values ((select tname from team where tname='Better-life'),
                                                        (select SSN from volunteer where vname='John'),100);
                                                        
--insert several more volunteers and associate with team 'Thriving', 'Faster and faster'.
insert all
into volunteer (SSN, vname, birth_date,race,gender,profession ,mailing_address,
                    email_address,home_cell_phone, work_cell_phone, existence_on_list, date_joined, 
                    date_of_training_course,LOC_OF_TRAINING_COURSE)
                    values (121212122, 'Jim', '12-Dec-1985','Latin','male','student','1110 Asp Ave, Norman', 
                    'jim@ou.edu','405-1878787','405-5767676','on list','21-Mar-2010', '01-Feb-2010','Moore')
into volunteer (SSN, vname, birth_date,race,gender,profession ,mailing_address,
                    email_address,home_cell_phone, work_cell_phone, existence_on_list, date_joined, 
                    date_of_training_course,LOC_OF_TRAINING_COURSE)
                    values (121212123, 'Donald', '12-Feb-1986','American','male','student','1111 Asp Ave, Norman', 
                    'donald@ou.edu','405-2878787','405-4767676','on list','11-Jan-2017', '01-May-2016','Moore')
into volunteer (SSN, vname, birth_date,race,gender,profession ,mailing_address,
                    email_address,home_cell_phone, work_cell_phone, existence_on_list, date_joined, 
                    date_of_training_course,LOC_OF_TRAINING_COURSE)
                    values (121212124, 'Kegan', '12-Dec-1995','American','male','student','1112 Asp Ave, Norman', 
                    'kegan@ou.edu','405-3878787','405-3767676','on list','10-Jan-2017', '01-May-2016','Moore')
into volunteer (SSN, vname, birth_date,race,gender,profession ,mailing_address,
                    email_address,home_cell_phone, work_cell_phone, existence_on_list, date_joined, 
                    date_of_training_course,LOC_OF_TRAINING_COURSE)
                    values (121212125, 'Megan', '01-Dec-1965','American','female','professor','1113 Asp Ave, Norman', 
                    'megan@ou.edu','405-4878787','405-2767676','on list','01-Jan-2007', '01-May-2005','OKC')
select * from dual;

insert all
into contains (tname, SSN, hours_worked) values ((select tname from team where tname='Thriving'),
                                                        (select SSN from volunteer where vname='Jim'),10)
into contains (tname, SSN, hours_worked) values ((select tname from team where tname='Faster and faster'),
                                                        (select SSN from volunteer where vname='Donald'),20)
into contains (tname, SSN, hours_worked) values ((select tname from team where tname='Faster and faster'),
                                                        (select SSN from volunteer where vname='Kegan'),5)
into contains (tname, SSN, hours_worked) values ((select tname from team where tname='Faster and faster'),
                                                        (select SSN from volunteer where vname='Megan'),1000)
select * from dual;

 
 
                                                    
--Query 4
--insert the hour a volunteer worked for 'Better-life'.
insert into contains(tname, SSN, hours_worked) values ('Better-life', 987654321,200);


--Query 5
--insert a new employee 
insert into employee (SSN, ename, birth_date,race,gender,profession ,mailing_address,
                    email_address,home_cell_phone, work_cell_phone, existence_on_list, salary, 
                    marital_status,hire_date)
                    values (123213123, 'Jang', '01-Dec-1988','Asian','male','Manager','101 Berry Ave, Norman', 
                    'jang@ou.edu','405-7978787','405-6867676','on list',54000, 'single','01-Oct-2016');
                    
--associate Jang with 'Better-life' in the report table.
insert into report (tname, SSN, report_date, report_content) 
                    values ('Better-life',(select SSN from employee where ename='Jang'),'05-Oct-2017','xxxxxx');
                    
insert all
into employee (SSN, ename, birth_date,race,gender,profession ,mailing_address,
                    email_address,home_cell_phone, work_cell_phone, existence_on_list, salary, 
                    marital_status,hire_date)
                    values (222222222, 'Lee', '02-Dec-1988','Asian','female','Manager','1012 Berry Ave, Norman', 
                    'lee@ou.edu','405-1978787','405-1867676','on list',84000, 'single','01-Oct-2016')
into employee (SSN, ename, birth_date,race,gender,profession ,mailing_address,
                    email_address,home_cell_phone, work_cell_phone, existence_on_list, salary, 
                    marital_status,hire_date)
                    values (222222223, 'Zhang', '03-Dec-1988','Asian','male','Businessman','1013 Berry Ave, Norman', 
                    'zhang@ou.edu','405-2978787','405-2867676','on list',74000, 'single','05-Oct-2016')
into employee (SSN, ename, birth_date,race,gender,profession ,mailing_address,
                    email_address,home_cell_phone, work_cell_phone, existence_on_list, salary, 
                    marital_status,hire_date)
                    values (222222224, 'Denger', '04-Dec-1988','European','male','accounting','1014 Berry Ave, Norman', 
                    'denger@ou.edu','405-3978787','405-3867676','on list',60000, 'married','01-Oct-2016')                    
into employee (SSN, ename, birth_date,race,gender,profession ,mailing_address,
                    email_address,home_cell_phone, work_cell_phone, existence_on_list, salary, 
                    marital_status,hire_date)
                    values (222222225, 'Jean', '05-Dec-1988','American','female','Graphing','1015 Berry Ave, Norman', 
                    'jean@ou.edu','405-4978787','405-4867676','on list',70000, 'single','09-Oct-2016')
into employee (SSN, ename, birth_date,race,gender,profession ,mailing_address,
                    email_address,home_cell_phone, work_cell_phone, existence_on_list, salary, 
                    marital_status,hire_date)
                    values (222222226, 'Kelord', '06-Dec-1988','Latin','male','Math','1016 Berry Ave, Norman', 
                    'kelord@ou.edu','405-5978787','405-5867676','on list',34000, 'single','01-Oct-2016')
Select * from dual;
                
--associate them with 'Better-life', 'Thriving','Faster and faster' in the report table.
insert all
into report (tname, SSN, report_date, report_content) 
                    values ('Thriving',(select SSN from employee where ename='Jang'),'06-Oct-2017','xxxxxx')
into report (tname, SSN, report_date, report_content) 
                    values ('Faster and faster',(select SSN from employee where ename='Lee'),'06-Oct-2017','xxxxxx')
select * from dual;

                    
--Query 6
--insert an expense charged by an employee
insert into expense (SSN, expense_name, expense_date, expense_amount, expense_description)
                     values (222222222,'food fee','10-Oct-2017','50','group lunch food fee');

--insert four more employee expenses for retrieve purpose. 
insert all
into expense (SSN, expense_name, expense_date, expense_amount, expense_description)
                     values (222222223,'food fee','20-Oct-2017','40','group lunch food fee')
into expense (SSN, expense_name, expense_date, expense_amount, expense_description)
                     values (222222224,'food fee','30-Oct-2017','15','group lunch food fee')
into expense (SSN, expense_name, expense_date, expense_amount, expense_description)
                     values (222222225,'food fee','10-Sep-2017','30','group lunch food fee')
into expense (SSN, expense_name, expense_date, expense_amount, expense_description)
                     values (222222226,'food fee','01-Nov-2017','20','group lunch food fee')
select * from dual;

                    
--Query 7
--insert a new organization
insert into organization_donation (oname, donation_date, donation_amount, phone_number, contact_person) 
                                    values ('Green environment Inc','','','405-882-1234','David'); 
--associate the new inserted organization with 'Better-life' team
insert into sponsor (tname, oname) values ('Better-life', (select oname from organization_donation where
                                            oname='Green environment Inc'));
--insert another organization
insert into organization_donation (oname, donation_date, donation_amount, phone_number, contact_person) 
                                    values ('ABA Inc','','','405-882-4321','Enna'); 
  
--associate the new inserted organization with 'Faster and faster' team
insert into sponsor (tname, oname) values ('Faster and faster', (select oname from organization_donation where
                                            oname='ABA Inc'));                                            
--Query 8
--insert a new donor 
insert into donor (SSN, dname, birth_date,race,gender,profession ,mailing_address,
                    email_address,home_cell_phone, work_cell_phone, existence_on_list, donation_date, 
                    donation_amount,donation_type, anonymous_wish, name_of_campaign)
                    values (999999999, 'Angela', '04-Jun-1988','Asian','female','singer','101 grey Ave, ok', 
                    'angela@gmail.com','405-7373737','405-6868686','on list','30-Dec-2016',20000,'check', 'Yes','Angel');

--insert another two donors who are also employees
insert all
into donor (SSN, dname, birth_date,race,gender,profession ,mailing_address,
                    email_address,home_cell_phone, work_cell_phone, existence_on_list, donation_date, 
                    donation_amount,donation_type, anonymous_wish, name_of_campaign)
                    values (222222222, 'Lee', '02-Dec-1988','Asian','female','Manager','1012 Berry Ave, Norman', 
                    'lee@ou.edu','405-1978787','405-1867676','on list','25-Sep-2017', 30000,'check','No','Help')
into donor (SSN, dname, birth_date,race,gender,profession ,mailing_address,
                    email_address,home_cell_phone, work_cell_phone, existence_on_list, donation_date, 
                    donation_amount,donation_type, anonymous_wish, name_of_campaign)
                    values (222222223, 'Zhang', '03-Dec-1988','Asian','male','Businessman','1013 Berry Ave, Norman', 
                    'zhang@ou.edu','405-2978787','405-2867676','on list','25-Sep-2017', 50000,'card','Yes','Help')
select * from dual;


--assoicate with three donations
insert all 
into donate_check (SSN, check_number) values ((select SSN from donor where dname='Angela'), 719785462)
into donate_check (SSN, check_number) values ((select SSN from donor where dname='Angela'), 719785463)
into donate_card (SSN, card_number, card_type, card_exp_date) values ((select SSN from donor where dname='Angela'),
                                                                    1111222233334444, 'VISA','31-Dec-2022')
select * from dual;

--Query 9
--insert a new organization and associate with three donations
insert all
into organization_donation (oname, donation_date, donation_amount, phone_number, contact_person) 
                                    values ('PP Auto','01-Apr-2016',5000,'405-882-4321','Deanny')
into organization_donation (oname, donation_date, donation_amount, phone_number, contact_person) 
                                    values ('PP Auto','01-Jul-2016',8000,'405-882-4321','Deanny')
into organization_donation (oname, donation_date, donation_amount, phone_number, contact_person) 
                                    values ('PP Auto','01-Nov-2016',10000,'405-882-4321','Deanny')
select * from dual;
                                    
--Query 10
--retrieve the name and phone number of of the doctor of client 'Jack'.

select name_of_doctor, phone_of_doctor
from client
where cname='Jack';

--Query 11
--retrieve the employee expense within October 2017 and sort it based on the expense amount.
select *
from expense
where expense_date between '01-Oct-2017' and '31-Oct-2017'
order by expense_amount;

--Query 12
--retrieve the list of volunteer that are member of the team that cares for 'Jack'.

select *
from volunteer
where SSN in (select SSN 
              from contains
              where tname in (select tname
                              from cares_for
                              where SSN in (select SSN from client where cname='Jack')));
                              
--Query 13
--retrieve the the names and contacts info of the clients
select *
from client
where SSN in (select SSN
              from cares_for
              where tname in (select tname
                              from sponsor
                              where REGEXP_LIKE(UPPER(TRIM(oname)),'^[B-K]')))
order by cname;

--Query 14
--retrieve the name and total amount donated by donors (also employee)
select dname, donation_amount, anonymous_wish
from donor
where SSN in (select SSN
                from employee)
order by donation_amount;


--Query 15
--retrieve the name and associated contact info of volunteers
select vname, mailing_address, email_address, home_cell_phone, work_cell_phone
from volunteer
where date_joined between '01-Mar-2017' and '30-Jun-2017' and SSN in (select SSN from contains); 

--Query 16
--Increase the salary by 10% of all empolyees to whom more than one team must report
update employee
set salary=salary* 1.1
where SSN in (select SSN
                from report
                group by SSN
                having count (SSN)>=2);
                
--Query 17
--Delete all clients who do not have health insurance
Delete from client
where SSN in (select SSN 
             from client_needs
                where importance_transportation<='5') and SSN not in (select SSN from client_insurance); 

                
--Query 18
--import a data file from file team_data


Load DATA
infile 'User/Genwei/Desktop/DBMS/team_data.txt'
  into table team
     fields terminated by ','
                  ( tname varchar2 (30),
                    ttype varchar2 (30),
                    date_formation Date)
                    
sqlldr roger/roger control=team_Data.ctl 

 
--Query 19
--Export a data file

Spool '/User/Genwei/Desktop/DBMS/output.csv'
select *
from client, employee, volunteer, donor
where existence_on_list='on_list';
spool off


--Query 20
--Quit
exit I sqlplus <zhan1300/HTri8Fx6>@SID @<Project_Genwei_Zhang.sql);



                    
                    
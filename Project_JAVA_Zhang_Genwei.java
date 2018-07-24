import java.sql.*;
import java.io.*;
class 	Project_Genwei{
	public static void main (String[] args) {
		// load a databases driver
		String sourceURL="jdbc:oracle:thin:@//oracle.cs.ou.edu:1521/pdborcl.cs.ou.edu";
		try {
				Class.forName("oracle.jdbc.OracleDriver");
		}
		catch (Exception x) {
				System.out.println("Unable to load the driver class!");
		}
		// create an oracle JDBC connection.
		try {
			Connection Project_Genwei=DriverManager.getConnection
					(sourceURL,"zhan1300", "HTri8Fx6");
			// create a JDBC statement object
			Statement stmt=Project_Genwei.createStatement();
			// execute the SQL statements within Task 5, Query 1-9.
			
			String sqlCreate;
			sqlCreate= "--Query 1\n" + 
					"-- insert a new team\n" + 
					"\n" + 
					"insert into team (tname, ttype, date_formation) values ('Better-life', 'non-profit', '01-Nov-2017')\n" + 
					"\n" + 
					"--insert two more team 'Thriving' and 'Faster and faster'.\n" + 
					"insert into team (tname, ttype, date_formation) values ('Thriving', 'profit', '01-Nov-2010')\n" + 
					"insert into team (tname, ttype, date_formation) values ('Faster and faster', 'non-profit', '01-Jan-2017')\n" + 
					"\n" + 
					"--Query 2\n" + 
					"--insert a new client\n" + 
					"insert into client (SSN, cname, birth_date,race,gender,profession ,mailing_address,\n" + 
					"                    email_address,home_cell_phone, work_cell_phone, existence_on_list, name_of_doctor, \n" + 
					"                    phone_of_doctor,name_of_attorney, phone_of_attorney,date_assigned)\n" + 
					"                    values (123456789, 'Jack', '01-Jan-1980','European','male','teacher','101 Asp Ave, Norman', \n" + 
					"                    'jack@ou.edu','405-8888888','405-6666666','on list','Thomas', '405-1234567','Kim','918-1234567',\n" + 
					"                    '01-Jan-2017')\n" + 
					"                    \n" + 
					"--associate the new client 'Jack' with the team 'Better-life'\n" + 
					"insert into cares_for (tname, SSN) values ((select tname from team where tname='Better-life'), \n" + 
					"                                            (select SSN from client where cname='Jack')) \n" + 
					"                                            \n" + 
					"--insert a new client\n" + 
					"insert into client (SSN, cname, birth_date,race,gender,profession ,mailing_address,\n" + 
					"                    email_address,home_cell_phone, work_cell_phone, existence_on_list, name_of_doctor, \n" + 
					"                    phone_of_doctor,name_of_attorney, phone_of_attorney,date_assigned)\n" + 
					"                    values (100000009, 'Vardhan', '01-Jan-1992','Indian','male','student','010 Asp Ave, Norman', \n" + 
					"                    'Vardhan@ou.edu','405-8866888','405-8866666','on list','Thema', '405-1224567','Kimy','918-2234567',\n" + 
					"                    '01-Feb-2017')\n" + 
					"                    \n" + 
					"--associate the new client 'Vardhan' with the team 'Better-life'\n" + 
					"insert into cares_for (tname, SSN) values ((select tname from team where tname='Better-life'), \n" + 
					"                                            (select SSN from client where cname='Vardhan')) \n" + 
					"                                            \n" + 
					"--associate the client 'Jack' with the team 'Faster and faster'\n" + 
					"insert into cares_for (tname, SSN) values ((select tname from team where tname='Faster and faster'), \n" + 
					"                                            (select SSN from client where cname='Jack')) \n" + 
					"                                            \n" + 
					"--insert two clients Jack and vardhan's needs and insurance\n" + 
					"insert into client_insurance (SSN,policy_ID,provider_ID,provider_address,intype) values\n" + 
					"                              ((select SSN from client where cname='Jack'),'1-23456789','#1234','lincoln street','lifelong')\n" + 
					"                              \n" + 
					"insert into client_needs  (SSN,visiting ,shopping,housekeeping,transportation,yard_work ,food, \n" + 
					"                           importance_visiting,importance_shopping,importance_housekeeping ,\n" + 
					"                           importance_transportation ,importance_year_work ,importance_food)\n" + 
					"                           values\n" + 
					"                           ((select SSN from client where cname='Jack'),'','','','','','','2','3','4','4','5','10')\n" + 
					"insert into client_needs  (SSN,visiting ,shopping,housekeeping,transportation,yard_work ,food, \n" + 
					"                           importance_visiting,importance_shopping,importance_housekeeping ,\n" + 
					"                           importance_transportation ,importance_year_work ,importance_food)\n" + 
					"                           values\n" + 
					"                           ((select SSN from client where cname='Vardhan'),'','','','','','','2','3','4','4','5','10')                           \n" + 
					"                                            \n" + 
					"--Query 3\n" + 
					"--insert a new volunteer\n" + 
					"insert into volunteer (SSN, vname, birth_date,race,gender,profession ,mailing_address,\n" + 
					"                    email_address,home_cell_phone, work_cell_phone, existence_on_list, date_joined, \n" + 
					"                    date_of_training_course,LOC_OF_TRAINING_COURSE)\n" + 
					"                    values (121212121, 'John', '12-Dec-1985','American','male','student','111 Asp Ave, Norman', \n" + 
					"                    'john@ou.edu','405-7878787','405-6767676','on list','11-Jan-2017', '01-May-2017','Moore')\n" + 
					"                    \n" + 
					"--associate the volunteer 'John' with the team 'Better-life'\n" + 
					"insert into contains (tname, SSN, hours_worked) values ((select tname from team where tname='Better-life'),\n" + 
					"                                                        (select SSN from volunteer where vname='John'),100)\n" + 
					"                                                        \n" + 
					"--insert several more volunteers and associate with team 'Thriving', 'Faster and faster'.\n" + 
					"insert all\n" + 
					"into volunteer (SSN, vname, birth_date,race,gender,profession ,mailing_address,\n" + 
					"                    email_address,home_cell_phone, work_cell_phone, existence_on_list, date_joined, \n" + 
					"                    date_of_training_course,LOC_OF_TRAINING_COURSE)\n" + 
					"                    values (121212122, 'Jim', '12-Dec-1985','Latin','male','student','1110 Asp Ave, Norman', \n" + 
					"                    'jim@ou.edu','405-1878787','405-5767676','on list','21-Mar-2010', '01-Feb-2010','Moore')\n" + 
					"into volunteer (SSN, vname, birth_date,race,gender,profession ,mailing_address,\n" + 
					"                    email_address,home_cell_phone, work_cell_phone, existence_on_list, date_joined, \n" + 
					"                    date_of_training_course,LOC_OF_TRAINING_COURSE)\n" + 
					"                    values (121212123, 'Donald', '12-Feb-1986','American','male','student','1111 Asp Ave, Norman', \n" + 
					"                    'donald@ou.edu','405-2878787','405-4767676','on list','11-Jan-2017', '01-May-2016','Moore')\n" + 
					"into volunteer (SSN, vname, birth_date,race,gender,profession ,mailing_address,\n" + 
					"                    email_address,home_cell_phone, work_cell_phone, existence_on_list, date_joined, \n" + 
					"                    date_of_training_course,LOC_OF_TRAINING_COURSE)\n" + 
					"                    values (121212124, 'Kegan', '12-Dec-1995','American','male','student','1112 Asp Ave, Norman', \n" + 
					"                    'kegan@ou.edu','405-3878787','405-3767676','on list','10-Jan-2017', '01-May-2016','Moore')\n" + 
					"into volunteer (SSN, vname, birth_date,race,gender,profession ,mailing_address,\n" + 
					"                    email_address,home_cell_phone, work_cell_phone, existence_on_list, date_joined, \n" + 
					"                    date_of_training_course,LOC_OF_TRAINING_COURSE)\n" + 
					"                    values (121212125, 'Megan', '01-Dec-1965','American','female','professor','1113 Asp Ave, Norman', \n" + 
					"                    'megan@ou.edu','405-4878787','405-2767676','on list','01-Jan-2007', '01-May-2005','OKC')\n" + 
					"select * from dual\n" + 
					"\n" + 
					"insert all\n" + 
					"into contains (tname, SSN, hours_worked) values ((select tname from team where tname='Thriving'),\n" + 
					"                                                        (select SSN from volunteer where vname='Jim'),10)\n" + 
					"into contains (tname, SSN, hours_worked) values ((select tname from team where tname='Faster and faster'),\n" + 
					"                                                        (select SSN from volunteer where vname='Donald'),20)\n" + 
					"into contains (tname, SSN, hours_worked) values ((select tname from team where tname='Faster and faster'),\n" + 
					"                                                        (select SSN from volunteer where vname='Kegan'),5)\n" + 
					"into contains (tname, SSN, hours_worked) values ((select tname from team where tname='Faster and faster'),\n" + 
					"                                                        (select SSN from volunteer where vname='Megan'),1000)\n" + 
					"select * from dual\n" + 
					"\n" + 
					" \n" + 
					" \n" + 
					"                                                    \n" + 
					"--Query 4\n" + 
					"--insert the hour a volunteer worked for 'Better-life'.\n" + 
					"insert into contains(tname, SSN, hours_worked) values ('Better-life', 987654321,200)\n" + 
					"\n" + 
					"\n" + 
					"--Query 5\n" + 
					"--insert a new employee \n" + 
					"insert into employee (SSN, ename, birth_date,race,gender,profession ,mailing_address,\n" + 
					"                    email_address,home_cell_phone, work_cell_phone, existence_on_list, salary, \n" + 
					"                    marital_status,hire_date)\n" + 
					"                    values (123213123, 'Jang', '01-Dec-1988','Asian','male','Manager','101 Berry Ave, Norman', \n" + 
					"                    'jang@ou.edu','405-7978787','405-6867676','on list',54000, 'single','01-Oct-2016')\n" + 
					"                    \n" + 
					"--associate Jang with 'Better-life' in the report table.\n" + 
					"insert into report (tname, SSN, report_date, report_content) \n" + 
					"                    values ('Better-life',(select SSN from employee where ename='Jang'),'05-Oct-2017','xxxxxx')\n" + 
					"                    \n" + 
					"insert all\n" + 
					"into employee (SSN, ename, birth_date,race,gender,profession ,mailing_address,\n" + 
					"                    email_address,home_cell_phone, work_cell_phone, existence_on_list, salary, \n" + 
					"                    marital_status,hire_date)\n" + 
					"                    values (222222222, 'Lee', '02-Dec-1988','Asian','female','Manager','1012 Berry Ave, Norman', \n" + 
					"                    'lee@ou.edu','405-1978787','405-1867676','on list',84000, 'single','01-Oct-2016')\n" + 
					"into employee (SSN, ename, birth_date,race,gender,profession ,mailing_address,\n" + 
					"                    email_address,home_cell_phone, work_cell_phone, existence_on_list, salary, \n" + 
					"                    marital_status,hire_date)\n" + 
					"                    values (222222223, 'Zhang', '03-Dec-1988','Asian','male','Businessman','1013 Berry Ave, Norman', \n" + 
					"                    'zhang@ou.edu','405-2978787','405-2867676','on list',74000, 'single','05-Oct-2016')\n" + 
					"into employee (SSN, ename, birth_date,race,gender,profession ,mailing_address,\n" + 
					"                    email_address,home_cell_phone, work_cell_phone, existence_on_list, salary, \n" + 
					"                    marital_status,hire_date)\n" + 
					"                    values (222222224, 'Denger', '04-Dec-1988','European','male','accounting','1014 Berry Ave, Norman', \n" + 
					"                    'denger@ou.edu','405-3978787','405-3867676','on list',60000, 'married','01-Oct-2016')                    \n" + 
					"into employee (SSN, ename, birth_date,race,gender,profession ,mailing_address,\n" + 
					"                    email_address,home_cell_phone, work_cell_phone, existence_on_list, salary, \n" + 
					"                    marital_status,hire_date)\n" + 
					"                    values (222222225, 'Jean', '05-Dec-1988','American','female','Graphing','1015 Berry Ave, Norman', \n" + 
					"                    'jean@ou.edu','405-4978787','405-4867676','on list',70000, 'single','09-Oct-2016')\n" + 
					"into employee (SSN, ename, birth_date,race,gender,profession ,mailing_address,\n" + 
					"                    email_address,home_cell_phone, work_cell_phone, existence_on_list, salary, \n" + 
					"                    marital_status,hire_date)\n" + 
					"                    values (222222226, 'Kelord', '06-Dec-1988','Latin','male','Math','1016 Berry Ave, Norman', \n" + 
					"                    'kelord@ou.edu','405-5978787','405-5867676','on list',34000, 'single','01-Oct-2016')\n" + 
					"Select * from dual\n" + 
					"                \n" + 
					"--associate them with 'Better-life', 'Thriving','Faster and faster' in the report table.\n" + 
					"insert all\n" + 
					"into report (tname, SSN, report_date, report_content) \n" + 
					"                    values ('Thriving',(select SSN from employee where ename='Jang'),'06-Oct-2017','xxxxxx')\n" + 
					"into report (tname, SSN, report_date, report_content) \n" + 
					"                    values ('Faster and faster',(select SSN from employee where ename='Lee'),'06-Oct-2017','xxxxxx')\n" + 
					"select * from dual\n" + 
					"\n" + 
					"                    \n" + 
					"--Query 6\n" + 
					"--insert an expense charged by an employee\n" + 
					"insert into expense (SSN, expense_name, expense_date, expense_amount, expense_description)\n" + 
					"                     values (222222222,'food fee','10-Oct-2017','50','group lunch food fee')\n" + 
					"\n" + 
					"--insert four more employee expenses for retrieve purpose. \n" + 
					"insert all\n" + 
					"into expense (SSN, expense_name, expense_date, expense_amount, expense_description)\n" + 
					"                     values (222222223,'food fee','20-Oct-2017','40','group lunch food fee')\n" + 
					"into expense (SSN, expense_name, expense_date, expense_amount, expense_description)\n" + 
					"                     values (222222224,'food fee','30-Oct-2017','15','group lunch food fee')\n" + 
					"into expense (SSN, expense_name, expense_date, expense_amount, expense_description)\n" + 
					"                     values (222222225,'food fee','10-Sep-2017','30','group lunch food fee')\n" + 
					"into expense (SSN, expense_name, expense_date, expense_amount, expense_description)\n" + 
					"                     values (222222226,'food fee','01-Nov-2017','20','group lunch food fee')\n" + 
					"select * from dual\n" + 
					"\n" + 
					"                    \n" + 
					"--Query 7\n" + 
					"--insert a new organization\n" + 
					"insert into organization_donation (oname, donation_date, donation_amount, phone_number, contact_person) \n" + 
					"                                    values ('Green environment Inc','','','405-882-1234','David') \n" + 
					"--associate the new inserted organization with 'Better-life' team\n" + 
					"insert into sponsor (tname, oname) values ('Better-life', (select oname from organization_donation where\n" + 
					"                                            oname='Green environment Inc'))\n" + 
					"--insert another organization\n" + 
					"insert into organization_donation (oname, donation_date, donation_amount, phone_number, contact_person) \n" + 
					"                                    values ('ABA Inc','','','405-882-4321','Enna') \n" + 
					"  \n" + 
					"--associate the new inserted organization with 'Faster and faster' team\n" + 
					"insert into sponsor (tname, oname) values ('Faster and faster', (select oname from organization_donation where\n" + 
					"                                            oname='ABA Inc'))                                            \n" + 
					"--Query 8\n" + 
					"--insert a new donor \n" + 
					"insert into donor (SSN, dname, birth_date,race,gender,profession ,mailing_address,\n" + 
					"                    email_address,home_cell_phone, work_cell_phone, existence_on_list, donation_date, \n" + 
					"                    donation_amount,donation_type, anonymous_wish, name_of_campaign)\n" + 
					"                    values (999999999, 'Angela', '04-Jun-1988','Asian','female','singer','101 grey Ave, ok', \n" + 
					"                    'angela@gmail.com','405-7373737','405-6868686','on list','30-Dec-2016',20000,'check', 'Yes','Angel')\n" + 
					"\n" + 
					"--insert another two donors who are also employees\n" + 
					"insert all\n" + 
					"into donor (SSN, dname, birth_date,race,gender,profession ,mailing_address,\n" + 
					"                    email_address,home_cell_phone, work_cell_phone, existence_on_list, donation_date, \n" + 
					"                    donation_amount,donation_type, anonymous_wish, name_of_campaign)\n" + 
					"                    values (222222222, 'Lee', '02-Dec-1988','Asian','female','Manager','1012 Berry Ave, Norman', \n" + 
					"                    'lee@ou.edu','405-1978787','405-1867676','on list','25-Sep-2017', 30000,'check','No','Help')\n" + 
					"into donor (SSN, dname, birth_date,race,gender,profession ,mailing_address,\n" + 
					"                    email_address,home_cell_phone, work_cell_phone, existence_on_list, donation_date, \n" + 
					"                    donation_amount,donation_type, anonymous_wish, name_of_campaign)\n" + 
					"                    values (222222223, 'Zhang', '03-Dec-1988','Asian','male','Businessman','1013 Berry Ave, Norman', \n" + 
					"                    'zhang@ou.edu','405-2978787','405-2867676','on list','25-Sep-2017', 50000,'card','Yes','Help')\n" + 
					"select * from dual\n" + 
					"\n" + 
					"\n" + 
					"--assoicate with three donations\n" + 
					"insert all \n" + 
					"into donate_check (SSN, check_number) values ((select SSN from donor where dname='Angela'), 719785462)\n" + 
					"into donate_check (SSN, check_number) values ((select SSN from donor where dname='Angela'), 719785463)\n" + 
					"into donate_card (SSN, card_number, card_type, card_exp_date) values ((select SSN from donor where dname='Angela'),\n" + 
					"                                                                    1111222233334444, 'VISA','31-Dec-2022')\n" + 
					"select * from dual\n" + 
					"\n" + 
					"--Query 9\n" + 
					"--insert a new organization and associate with three donations\n" + 
					"insert all\n" + 
					"into organization_donation (oname, donation_date, donation_amount, phone_number, contact_person) \n" + 
					"                                    values ('PP Auto','01-Apr-2016',5000,'405-882-4321','Deanny')\n" + 
					"into organization_donation (oname, donation_date, donation_amount, phone_number, contact_person) \n" + 
					"                                    values ('PP Auto','01-Jul-2016',8000,'405-882-4321','Deanny')\n" + 
					"into organization_donation (oname, donation_date, donation_amount, phone_number, contact_person) \n" + 
					"                                    values ('PP Auto','01-Nov-2016',10000,'405-882-4321','Deanny')\n" + 
					"select * from dual\n";
			
			try {
				stmt.executeUpdate(sqlCreate);
			}
			catch (SQLException ex) {
					System.err.println("SQLException:"+ex.getMessage());
			}
			
			
			// Query 10-17 results display
			
			System.out.println("Query 10");
			ResultSet rset10=stmt.executeQuery("select name_of_doctor, phone_of_doctor from client where cname='Jack'");
			System.out.println("Name of Doctor    Phone of Doctor");
			while (rset10.next())
				System.out.println(rset10.getString(1)+"    "+rset10.getString(2));
			
			System.out.println("Query 11");
			ResultSet rset11=stmt.executeQuery("select *\n" + 
					"from expense\n" + 
					"where expense_date between '01-Oct-2017' and '31-Oct-2017'\n" + 
					"order by expense_amount");
			System.out.println("SSN          name             date             amount          description");
			while (rset11.next())
				System.out.println(rset11.getString(1)+"    "+rset11.getString(2)+"    "+rset11.getString(3)+"    "
						+ ""+rset11.getString(4)+"    "+rset11.getString(5));
			
			System.out.println("Query 12");
			ResultSet rset12=stmt.executeQuery("select *\n" + 
					"from volunteer\n" + 
					"where SSN in (select SSN \n" + 
					"              from contains\n" + 
					"              where tname in (select tname\n" + 
					"                              from cares_for\n" + 
					"                              where SSN in (select SSN from client where cname='Jack')))");
			while (rset12.next())
				System.out.println(rset12.getString(1)+"    "+rset12.getString(2)+"    "+rset12.getString(3)+"    "
						+ ""+rset12.getString(4)+"    "+rset12.getString(5)+"    "+rset12.getString(6)+"    "+rset12.getString(7)+"    "
								+ ""+rset12.getString(8)+"    "+rset12.getString(9)+"    "+rset12.getString(10)+"    "+rset12.getString(11)+"    "
										+ ""+rset12.getString(12)+"    "+rset12.getString(13)+"    "+rset12.getString(14));
			
			System.out.println("Query 13");
			ResultSet rset13=stmt.executeQuery("select *\n" + 
					"from client\n" + 
					"where SSN in (select SSN\n" + 
					"              from cares_for\n" + 
					"              where tname in (select tname\n" + 
					"                              from sponsor\n" + 
					"                              where REGEXP_LIKE(UPPER(TRIM(oname)),'^[B-K]')))\n" + 
					"order by cname");
			while (rset13.next())
				System.out.println(rset13.getString(1)+"    "+rset13.getString(2)+"    "+rset13.getString(3)+"    "
						+ ""+rset13.getString(4)+"    "+rset13.getString(5)+"    "+rset13.getString(6)+"    "+rset13.getString(7)+"    "
								+ ""+rset13.getString(8)+"    "+rset13.getString(9)+"    "+rset13.getString(10)+"    "+rset13.getString(11)+"    "
										+ ""+rset13.getString(12)+"    "+rset13.getString(13)+"    "+rset13.getString(14)+"    "
												+ "  "+rset13.getString(15)+"    "+rset13.getString(16));
			System.out.println("Query 14");
			ResultSet rset14=stmt.executeQuery("select dname, donation_amount, anonymous_wish\n" + 
					"from donor\n" + 
					"where SSN in (select SSN\n" + 
					"                from employee)\n" + 
					"order by donation_amount");
			while (rset14.next())
				System.out.println(rset14.getString(1)+"    "+rset14.getString(2)+"    "+rset14.getString(3));
			
			System.out.println("Query 15");
			ResultSet rset15=stmt.executeQuery("select vname, mailing_address, email_address, home_cell_phone, work_cell_phone\n" + 
					"from volunteer\n" + 
					"where date_joined between '01-Mar-2017' and '30-Jun-2017' and SSN in (select SSN from contains)");
			while (rset15.next())
				System.out.println(rset15.getString(1)+"    "+rset15.getString(2)+"    "+rset15.getString(3)+"    "
						+ ""+rset15.getString(4)+"    "+rset15.getString(5));
			
			System.out.println("Query 16 completed");
			stmt.executeUpdate("update employee\n" + 
					"set salary=salary* 1.1\n" + 
					"where SSN in (select SSN\n" + 
					"                from report\n" + 
					"                group by SSN\n" + 
					"                having count (SSN)>=2)");
			
			System.out.println("Query 17 completed");
			stmt.executeUpdate("Delete from client\n" + 
					"where SSN in (select SSN \n" + 
					"             from client_needs\n" + 
					"                where importance_transportation<='5') and SSN not in (select SSN from client_insurance)");
			
			Project_Genwei.close();
		}
		
		
			catch (Exception e) {
					System.out.println(e.getMessage());
					System.out.println("Exception occurred in executing the statement");
			}
			
		}
	}		


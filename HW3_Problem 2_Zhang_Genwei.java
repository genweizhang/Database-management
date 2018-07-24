import java.sql.*;
import java.io.*;
class HW3{
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
			Connection HW3=DriverManager.getConnection
					(sourceURL,"zhan1300", "HTri8Fx6");
			// create a JDBC statement object
			Statement stmt=HW3.createStatement();
			// execute the SQL statements with the statement object
		
			// call the procedures from PL/SQL
			CallableStatement pstmtadd=HW3.prepareCall("{call HW3_ORACLE.add(?,?,?)}"); // call the add customer procedure
			CallableStatement pstmtupdate=HW3.prepareCall("{call HW3_ORACLE.increase_salary(?)}"); // call the update salary procedure
			//pstmtadd.executeUpdate();
			//pstmtupdate.executeUpdate();
			pstmtadd.close();
			pstmtupdate.close();
			
			// display the info of all customers and all translators using the JDBC resultSet
			ResultSet rset0=stmt.executeQuery("select * from customer");
			System.out.println("cid    cname  #_of_order  level");
			while (rset0.next())
				System.out.println(rset0.getString(1)+"    "+rset0.getString(2)+"   "+rset0.getString(3)+ "   "+
									rset0.getString(4));
			System.out.println(" ");
			ResultSet rset=stmt.executeQuery("select * from translator");
			System.out.println("aid    aname  salary");
			while (rset.next())
				System.out.println(rset.getString(1)+"    "+rset.getString(2)+"   "+rset.getString(3));
			HW3.close();
		}
		
		
			catch (Exception e) {
					System.out.println(e.getMessage());
					System.out.println("Exception occurred in executing the statement");
			}
			
		}
	}		


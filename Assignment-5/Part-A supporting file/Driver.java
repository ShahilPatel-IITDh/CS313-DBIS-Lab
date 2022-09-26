package jdbc_demo;

import java.sql.*;
public class Driver {

	public static void main(String[] args) {
		try {
			//Get connection
			Connection myConn=DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","password");
			Statement myS=myConn.createStatement();
			//Query
			ResultSet resultSet = myS.executeQuery("SELECT * FROM student");			//Display
			while(resultSet.next()) {
				System.out.println(resultSet.getString("ID")+"  "+resultSet.getString("name"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	/*public void listDepartments(Statement stmt)
	{
		// Write the code for Q2

	}

	public void listDepartments(PreparedStatement stmt)
	{
		// Write the code for Q3

	}*/

}

package jdbc_demo;

import java.sql.*;

import java.util.Scanner;

public class Driver {
	
	public void listDepartments(Statement statement_2)
	{
	  try
	  {
		 ResultSet rs = statement_2.executeQuery("WITH student_dept(Department, Student_Count) AS (SELECT dept_name, count(ID) FROM student GROUP BY dept_name)"
		 		+ "SELECT Department, Student_Count, Instructor_Count "
		 		+ "FROM student_dept NATURAL JOIN (SELECT dept_name AS Department, count(ID) AS Instructor_Count FROM instructor GROUP BY dept_name) AS instructor_dept "
		 		+ "ORDER BY Department asc");
	  System.out.println("");
	  System.out.println("Department"+" "+"Students"+" "+"Instructors");		 
	  while(rs.next()){
		  System.out.println(rs.getString("Department")+ "        "+rs.getString("Student_Count") +"      "+rs.getString("Instructor_Count"));
	  	}
	  }catch(Exception e){
		  e.printStackTrace();
	  }
	}
	
	public void listDepartments(PreparedStatement statement_3)
	{
		try (Scanner sc = new Scanner(System.in))
		{

            System.out.println("");
			System.out.println("Enter building name:");
            String prepare = sc.nextLine();
            statement_3.setString(1, prepare);
            ResultSet resultSet = statement_3.executeQuery();
            
            System.out.print("room_number: ");
            while(resultSet.next()){
				System.out.print(resultSet.getString("room_number"));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}


	public static void main(String[] args) {
		try {
			//Get connection
			Connection myConn=DriverManager.getConnection("jdbc:mysql://localhost:3306/university","universityDB0039","Password");
			Statement myS=myConn.createStatement();
			ResultSet resultSet = myS.executeQuery("SELECT * FROM student");		
			//Display
			
			while(resultSet.next()) {
				System.out.println(resultSet.getString("ID")+"  "+resultSet.getString("name"));
			}
			
			Statement statement_2= myConn.createStatement();
			Driver driver_2 = new Driver();
			driver_2.listDepartments(statement_2);
			
			PreparedStatement statement_3 = myConn.prepareStatement("select distinct room_number from classroom natural join section where capacity > 30 and not semester "
					+ "in ('Autumn') and not year in (2022) and building = ?");
			Driver driver_3 = new Driver();
			driver_3.listDepartments(statement_3);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
}

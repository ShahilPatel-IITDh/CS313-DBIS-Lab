


import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public StudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
	
		//getting input values from jsp page
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String dept_name = request.getParameter("dept_name");
		int tot_cred = Integer.parseInt(request.getParameter("tot_cred"));


		Connection con = null;
 		String url = "jdbc:mysql://localhost:3306/university"; //MySQL URL and followed by the database name
 		String username = "root"; //MySQL username
 		String password = "123456"; //MySQL password
		
		Class.forName("org.mysql.Driver");
		con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
 		System.out.println("Printing connection object "+con);

		//Prepared Statement to add student data
		PreparedStatement st = con .prepareStatement("insert into student values(?, ?,?,?)");
 		st.setString(1,id);
		st.setString(2,name);
		st.setString(3,dept_name);
		st.setInt(4,tot_cred);
		int result=st.executeUpdate();

		//Checks if insert is successful.If yes,then redirects to Result.jsp page 
		if(result>0)
		{
			
			RequestDispatcher rd = request.getRequestDispatcher("Result.jsp");
			rd.forward(request, response);
		}

		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}

	
	}


}



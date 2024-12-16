package sample;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/CustomerRegister")
public class CustomerRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("userName");
        String email = request.getParameter("email");
        String confirm_password = request.getParameter("userConfirmPassword");
       String address=request.getParameter("Address");
       int phone=Integer.parseInt(request.getParameter("Phone"));
		
		
		  try { 
		  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/interior_design","root", ""); 
		  String query ="INSERT INTO cust_login (email, password ,name,address,phone) VALUES (?, ?,?,?,?)";
		  PreparedStatement stmt = conn.prepareStatement(query);
		  stmt.setString(1,email);
		  stmt.setString(2, confirm_password); 
		  stmt.setString(3,name); 
		  stmt.setString(4,address);
		  stmt.setInt(5,phone);
		  int rowsInserted = stmt.executeUpdate(); 
		  if (rowsInserted > 0) {
		  System.out.println("A new row has been inserted to cust_login table."); 
		  //Alert box message 
		  String message ="customer account is created successfully for " + name;
		  // Redirect tovendor_landing.html with alert box message
		  PrintWriter out = response.getWriter(); 
		  out.println("<script type=\"text/javascript\">");
		  out.println("alert('" + message + "');");
		  out.println("location='customer.html';");
		  out.println("</script>"); } 
		  } 
		  catch (SQLException ex) {
			  ex.printStackTrace();
		  }
		 
	
	}

}

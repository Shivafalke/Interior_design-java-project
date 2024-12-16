package sample;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/UserResponseServlet")
public class UserResponseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String msg = request.getParameter("Message");
	
		try { 
			  // Insert the form data into the database 	
			  Connection conn =DriverManager.getConnection("jdbc:mysql://localhost/interior_design", "root","");
		  PreparedStatement stmt = conn.prepareStatement("INSERT INTO user_response ( name, email, subject, message) VALUES (?, ?, ?, ?)");
		  stmt.setString(1, name);
		  stmt.setString(2, email);
		  stmt.setString(3,subject);
		  stmt.setString(4, msg);
		  
		  int rowsInserted=stmt.executeUpdate();
		 
		  if (rowsInserted > 0) {
			  String message = " Thank you for your response..."+name;
			    // Redirect to vendor_landing.html with alert box message
			  response.setContentType("text/html");
			  PrintWriter out1 = response.getWriter();
			  out1.println("<html><head>");
			  out1.println("<script type=\"text/javascript\">");
			  out1.println("alert('" + message + "');");
			  out1.println("location='contact.html';");
			  out1.println("</script>");
			  out1.println("</head><body></body></html>");


		  }
		  conn.close();
		  stmt.close(); 
		  } catch(Exception e)
		  {
			  e.printStackTrace(); 
		  }
		 
	}

}

package sample;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/Vendorformcontactus")
public class Vendorformcontactus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* HttpSession sessions = request.getSession(); */
		/*
		 * String vendorId=(String) request.getAttribute("venid"); String
		 * vendorName=(String) request.getAttribute("venname");
		 */
		
		/*
		 * String vendorId = request.getParameter("vendorid"); String vendorName =
		 * request.getParameter("vendorname");
		 */

		
		String vendorIdStr =request.getParameter("venid");
		int vendorId = Integer.parseInt(vendorIdStr);
		//String vendorName = (String) request.getSession().getAttribute("vendorname");
		String vendorName= request.getParameter("venname");
		
	
	
		
		System.out.println(vendorId);
		System.out.println(vendorName);
		// Get the form data from the request
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String interest = request.getParameter("interest");
		
		
		  try { 
			  // Insert the form data into the database 	
			  Connection conn =DriverManager.getConnection("jdbc:mysql://localhost/interior_design", "root","");
		  PreparedStatement stmt = conn.prepareStatement("INSERT INTO vendor_form_submissions (vendor_id, vendor_name, name, email, phone, interest) VALUES (?, ?, ?, ?, ?, ?)");
		  stmt.setInt(1, vendorId);
		  stmt.setString(2, vendorName);
		  stmt.setString(3,name);
		  stmt.setString(4, email);
		  stmt.setString(5, phone);
		  stmt.setString(6,interest);
		  int rowsInserted=stmt.executeUpdate();
		 
		  if (rowsInserted > 0) {
			  String message = name + " We will contact you soon....Thank you ";
			    // Redirect to vendor_landing.html with alert box message
			  response.setContentType("text/html");
			  PrintWriter out1 = response.getWriter();
			  out1.println("<html><head>");
			  out1.println("<script type=\"text/javascript\">");
			  out1.println("alert('" + message + "');");
			  out1.println("location='Customer/customer_dashboard.jsp';");
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

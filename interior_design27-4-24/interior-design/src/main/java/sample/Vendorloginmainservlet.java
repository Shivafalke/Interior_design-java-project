package sample;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


/*@WebServlet("/Vendorloginmainservlet")*/
public class Vendorloginmainservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get the values from the login form
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				
				// Set up a PrintWriter to output HTML to the response
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				
				// Connect to the database
				Connection conn = null;
				PreparedStatement stmt = null;
				ResultSet rs = null;
				
				
				try {
					Class.forName("com.mysql.jdbc.Driver");
					String url = "jdbc:mysql://localhost:3306/interior_design";
					String user = "root";
					String pass = "";
					conn = DriverManager.getConnection(url, user, pass);
					
					// Prepare the SQL statement
					String sql = "SELECT id,name FROM vendor_login WHERE email = ? AND password = ?";
					stmt = conn.prepareStatement(sql);
					stmt.setString(1, email);
					stmt.setString(2, password);
					
					// Execute the SQL statement
					rs = stmt.executeQuery();
					 
				
					
					// Check if the email and password match a record in the database
					if (rs.next()) {
						
						 int vendorId = rs.getInt("id");
						 String vendor_name=rs.getString("name");
				             HttpSession session = request.getSession();
				             	session.setMaxInactiveInterval(30000000);
								session.setAttribute("vendorid",vendorId);
								session.setAttribute("vendorname", vendor_name);
								session.setAttribute("isLoggedIn", true);
								
						// If the email and password match, redirect to the vendor dashboard page
						
						response.sendRedirect("vendor_dashboard.jsp");
					} else {
						// If the email and password do not match, display an error message
						 out.println("<script>");
						  out.println("alert('Login Failed. The email and password combination is incorrect. Please try again.');");
						  out.println("window.location.href='vendor_landing.html';");
						  out.println("</script>");
					}
					
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					// Close the database resources
					try {
						if (rs != null) {
							rs.close();
						}
						if (stmt != null) {
							stmt.close();
						}
						if (conn != null) {
							conn.close();
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
		
	}

	}
}

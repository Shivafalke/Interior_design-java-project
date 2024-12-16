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


@WebServlet("/HomeVisit")
public class HomeVisit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String name = request.getParameter("name");
	        String address = request.getParameter("address");
	        String email = request.getParameter("email");
	        String contact = request.getParameter("contact");
	        String vendor = request.getParameter("vendor");
	        String interest = request.getParameter("interest");

	        // Database connection parameters
	        String url = "jdbc:mysql://localhost:3306/interior_design";
	        String username = "root";
	        String password = "";

	        try {
	            // Load the JDBC driver
	            Class.forName("com.mysql.jdbc.Driver");

	            // Create a database connection
	            Connection conn = DriverManager.getConnection(url, username, password);

	            // Prepare the SQL statement for inserting the details into the homevisit table
	            String sql = "INSERT INTO homevisit (name, address, email, contact, vendor_id, interest) VALUES (?, ?, ?, ?, ?, ?)";
	            PreparedStatement statement = conn.prepareStatement(sql);
	            statement.setString(1, name);
	            statement.setString(2, address);
	            statement.setString(3, email);
	            statement.setString(4, contact);
	            statement.setString(5, vendor);
	            statement.setString(6, interest);

	            // Execute the SQL statement
	            int rowsInserted = statement.executeUpdate();
	            statement.close();
	            conn.close();

	            if (rowsInserted > 0) {
	            	response.setContentType("text/html");
	                PrintWriter out = response.getWriter();	                
	                String message = "Vendor will contact you soon...";

	                // Redirect to vendor_landing.html with alert box message
	               
	                out.println("<script type=\"text/javascript\">");
	                out.println("alert('" + message + "');");
	                out.println("location='Customer/customer_dashboard.jsp';");
	                out.println("</script>");
	            } else {
	                // Redirect to the dashboard with error message
	            	System.out.println("some error occured in homevisit");
	                response.sendRedirect("Customer/customer_dashboard.jsp");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            // Redirect to the dashboard with error message
	            response.sendRedirect("Customer/customer_dashboard.jsp");
	        }
	    }
		
		
	}



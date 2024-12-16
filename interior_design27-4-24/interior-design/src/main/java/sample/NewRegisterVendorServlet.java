package sample;

//Import required packages
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/NewRegisterVendorServlet")
public class NewRegisterVendorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

public void doPost(HttpServletRequest request, HttpServletResponse response)
   throws ServletException, IOException {
   
   // Set response content type
   response.setContentType("text/html");
   
   // Get the form data
   String companyName = request.getParameter("company_name");
   String email = request.getParameter("email");
   String phone = request.getParameter("phone");
   String address = request.getParameter("address");
   String[] category = request.getParameterValues("category[]");		   
   String categoryString = "";
   for (int i = 0; i < category.length; i++) {
     if (i > 0) {
       categoryString += ",";
     }
     categoryString += category[i];
   }
   String city = request.getParameter("city");
   String state = request.getParameter("state");
   String zipCode = request.getParameter("zip_code");
   String description = request.getParameter("description");

   // Database credentials
   String username = "root";
   String password = "";
   String dbUrl = "jdbc:mysql://localhost:3306/interior_design";

   // Initialize variables for database connection
   Connection conn = null;
   Statement stmt = null;
   int rowsAffected = 0;
   PrintWriter out = response.getWriter();

   try {
      // Register JDBC driver
      Class.forName("com.mysql.jdbc.Driver");

      // Open a connection
      conn = DriverManager.getConnection(dbUrl, username, password);

      // Execute a query
      String sql = "INSERT INTO new_vendors " +
    		  "(name, email, phone, address, category, city, state, zip_code, description, status) " +
    		  "VALUES " +
    		  "('" + companyName + "','" + email + "', '" + phone + "', '" + address + "','" + categoryString + "', '" + city + "', '" + state + "', '" + zipCode + "', '" + description + "', 'pending')";
 

      stmt = conn.createStatement();
      rowsAffected = stmt.executeUpdate(sql);

      // Display success message using JavaScript alert
      if (rowsAffected > 0) {
         out.println("<script type=\"text/javascript\">");
         out.println("alert('Vendor request successfully sent..!');");
         out.println("window.location.href = 'Vendor/vendor_landing.html';");
         out.println("</script>");
      } else {
         out.println("<script type=\"text/javascript\">");
         out.println("alert('Request failed. Please try again later.');");
         out.println("window.location.href = 'new_vendor_registration_form.jsp';");
         out.println("</script>");
      }

   } catch(SQLException se) {
      // Handle errors for JDBC
      se.printStackTrace();
   } catch(Exception e) {
      // Handle errors for Class.forName
      e.printStackTrace();
   } finally {
      // Finally block used to close resources
      try {
         if(stmt != null)
            conn.close();
      } catch(SQLException se) {
      } // Do nothing
      try {
         if(conn != null)
            conn.close();
      } catch(SQLException se) {
         se.printStackTrace();
      } // End finally try
   } // End try

}
}


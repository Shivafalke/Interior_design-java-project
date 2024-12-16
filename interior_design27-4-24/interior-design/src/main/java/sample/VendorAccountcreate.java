package sample;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.Statement;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
/*@WebServlet("/VendorAccountcreate")*/
public class VendorAccountcreate extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 response.setContentType("text/html;charset=UTF-8");

	        // Get the values entered by the user
		  	String city = request.getParameter("city");
	        String name = request.getParameter("name");
	        String email = request.getParameter("email");
	        String confirm_password = request.getParameter("confirm_password");
	        String[] category = request.getParameterValues("category[]");		   
	        String categoryString = "";
	        for (int i = 0; i < category.length; i++) {
	          if (i > 0) {
	            categoryString += ",";
	          }
	          categoryString += category[i];
	        }
	        
	        Part filePart = request.getPart("profileImage");
	        byte[] profileImg = null;
	        
	        if (filePart != null && filePart.getSize() > 0) {
	        	 InputStream fileInputStream = filePart.getInputStream();
	            profileImg  = fileInputStream.readAllBytes();
	        }
	         
	        // Check if the vendor's name has been approved
	        String status = "";
	        try {
	            // Load the database driver
	            Class.forName("com.mysql.cj.jdbc.Driver");

	            // Connect to the database
	            String url = "jdbc:mysql://localhost:3306/interior_design";
	            String username = "root";
	            String password = "";
	            Connection con = DriverManager.getConnection(url, username, password);

	            // Prepare the SQL statement to retrieve the vendor's status
	            String sql = "SELECT status FROM new_vendors WHERE name = ?";
	            PreparedStatement ps = con.prepareStatement(sql);
	            ps.setString(1, name);

	            // Execute the query and get the result
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                status = rs.getString("status");
	            }

	            // Close the database connection
	            con.close();
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	        }

	        // If the vendor's name has been approved, allow them to register
	        if (status.equalsIgnoreCase("approved")) {
	        	 
	        	try {
	        	    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/interior_design", "root", "");
	        	    String insertVendorQuery = "INSERT INTO vendor_login (email, password, name, category, city, profile_img) VALUES (?, ?, ?, ?, ?, ?)";

	        	    // Create a prepared statement for inserting into vendor_login table and specifying to return the generated keys
	        	    PreparedStatement vendorStmt = conn.prepareStatement(insertVendorQuery, Statement.RETURN_GENERATED_KEYS);
	        	    vendorStmt.setString(1, email);
	        	    vendorStmt.setString(2, confirm_password);
	        	    vendorStmt.setString(3, name);
	        	    vendorStmt.setString(4, categoryString);
	        	    vendorStmt.setString(5, city);
	        	    vendorStmt.setBytes(6, profileImg);

	        	    int rowsInserted = vendorStmt.executeUpdate();

	        	    if (rowsInserted > 0) {
	        	        // Retrieve the generated keys (IDs)
	        	        ResultSet generatedKeys = vendorStmt.getGeneratedKeys();
	        	        if (generatedKeys.next()) {
	        	            int vendorId = generatedKeys.getInt(1);

	        	            // Insert the vendor ID into new_vendors table
	        	            String insertNewVendorQuery ="UPDATE new_vendors SET vendor_id = ? WHERE email = ?";
	        	            PreparedStatement newVendorStmt = conn.prepareStatement(insertNewVendorQuery);
	        	            newVendorStmt.setInt(1, vendorId);
	        	            newVendorStmt.setString(2, email);
	        	            

	        	            int newVendorRowsInserted = newVendorStmt.executeUpdate();

	        	            if (newVendorRowsInserted > 0) {
	        	                System.out.println("A new row has been inserted to vendor_login and new_vendors table.");

	        	                // Alert box message
	        	                String message = "Vendor account is created successfully for " + name;

	        	                // Redirect to vendor_landing.html with alert box message
	        	                PrintWriter out = response.getWriter();
	        	                out.println("<script type=\"text/javascript\">");
	        	                out.println("alert('" + message + "');");
	        	                out.println("location='Vendor/vendor_landing.html';");
	        	                out.println("</script>");
	        	            }
	        	        }
	        	    }
	        	} catch (SQLException ex) {
	        	    ex.printStackTrace();
	        	}
	        }

	        // If the vendor's name is still pending, show a message indicating so
	        else if (status.equalsIgnoreCase("pending")) {
	        	PrintWriter out = response.getWriter();
	        	String message = "Sorry, Your Request is Pending Approval. Your account will be created after your request is approved.";
	            out.println("<script>alert('" + message + "');window.location.href='Vendor/vendor_landing.html';</script>");
	        }
	        else if (status.equalsIgnoreCase("rejected")) {
	        	PrintWriter out = response.getWriter();
	        	String message = "Your Request is rejected make a new vendor request or contact administrator";
	            out.println("<script>alert('" + message + "');window.location.href='Vendor/vendor_landing.html';</script>");
	        }
	        // If the vendor's name is not found or not approved, show an error message
	        else {
	            PrintWriter out = response.getWriter();
	            String message = "You have not generated a request..! first make the request";
	            out.println("<script>alert('" + message + "');window.location.href='Vendor/vendor_landing.html';</script>");
	        }
	
	
	
	
	
	}

}

package sample;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
@WebServlet("/UpdateCustomerDetails")
public class UpdateCustomerDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
    private static final String DB_CONNECTION_URL = "jdbc:mysql://localhost:3306/interior_design";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int custId = (Integer) request.getSession().getAttribute("customerId");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        
        
        
        Part filePart = request.getPart("profileImage");
        byte[] profileImg = null;
        
        if (filePart != null && filePart.getSize() > 0) {
        	 InputStream fileInputStream = filePart.getInputStream();
            profileImg  = fileInputStream.readAllBytes();
        }
        
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = DriverManager.getConnection(DB_CONNECTION_URL, DB_USER, DB_PASSWORD);
            
            // Update vendor_login table
            String updateLoginQuery = "UPDATE cust_login SET email = ?, password = ?,phone = ?, address = ?  WHERE id = ?";
            stmt = conn.prepareStatement(updateLoginQuery);
            stmt.setString(1, email);
            stmt.setString(2, password);
            stmt.setString(3,phone);
            stmt.setString(4, address);
            stmt.setInt(5, custId);
            stmt.executeUpdate();
            

            
            // Update profile image
            if (profileImg != null) {
                String updateProfileImageQuery = "UPDATE cust_login SET profile_image = ? WHERE id = ?";
                stmt = conn.prepareStatement(updateProfileImageQuery);
                stmt.setBytes(1, profileImg);
                stmt.setInt(2, custId);
                stmt.executeUpdate();
            }
            
            // Close the statement
            stmt.close();
            
            // Prompt and redirect
            String message = "Details updated successfully!";
            String redirectURL = "Customer/customer_dashboard.jsp";
            String alertScript = "window.alert('" + message + "'); window.location.href = '" + redirectURL + "';";
            response.getWriter().println("<script>" + alertScript + "</script>");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the connection
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
	
}

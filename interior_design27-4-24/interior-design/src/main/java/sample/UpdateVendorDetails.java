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
@WebServlet("/UpdateVendorDetails")
public class UpdateVendorDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
    private static final String DB_CONNECTION_URL = "jdbc:mysql://localhost:3306/interior_design";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String vname = (String) request.getSession().getAttribute("vendorname");
		int vendorId = (Integer) request.getSession().getAttribute("vendorid");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        
        
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
            String updateLoginQuery = "UPDATE vendor_login SET email = ?, password = ?, city = ? WHERE id = ?";
            stmt = conn.prepareStatement(updateLoginQuery);
            stmt.setString(1, email);
            stmt.setString(2, password);
            stmt.setString(3, city);
            stmt.setInt(4, vendorId);
            stmt.executeUpdate();
            
            // Update new_vendors table
            String updateVendorsQuery = "UPDATE new_vendors SET phone = ?, address = ?  WHERE vendor_id = ?";
            stmt = conn.prepareStatement(updateVendorsQuery);
            stmt.setString(1, phone);
            stmt.setString(2, address);            
            stmt.setInt(3, vendorId);
            stmt.executeUpdate();
            
            // Update profile image
            if (profileImg != null) {
                String updateProfileImageQuery = "UPDATE vendor_login SET profile_img = ? WHERE id = ?";
                stmt = conn.prepareStatement(updateProfileImageQuery);
                stmt.setBytes(1, profileImg);
                stmt.setInt(2, vendorId);
                stmt.executeUpdate();
            }
            
            // Close the statement
            stmt.close();
            
            // Prompt and redirect
            String message = "Details updated successfully!";
            String redirectURL = "Vendor/vendor_dashboard.jsp";
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



package sample;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteImgVendor")
public class DeleteImgVendor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String name = request.getParameter("name");
	        int myi = (Integer)request.getSession().getAttribute("i");
	        
	        if(myi==1) {
		        // Call the deleteImage method of ImageDAO class to delete the image from the database
				/* new ImageDAOvendor().deleteImageInterior(name); */
	        	  try {
	  	            Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/interior_design", "root", "");
	  	            PreparedStatement stmt = conn.prepareStatement("DELETE FROM vendor_interior_images WHERE title = ? AND vendor_id = ?");
	  	            HttpSession session = (HttpSession) request.getSession();
	  	            int vendorId = (Integer)session.getAttribute("vendorid");
	  	            stmt.setString(1, name);
	  	            stmt.setInt(2, vendorId);
	  	            stmt.executeUpdate();
	  	        } catch (SQLException e) {
	  	            e.printStackTrace();
	  	        }
		        // Redirect the user to the home page
		        response.sendRedirect(request.getContextPath() + "/vendor-update-interior.jsp");
	        }
	        else if(myi==2) {
	        	  try {
		  	            Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/interior_design", "root", "");
		  	            PreparedStatement stmt = conn.prepareStatement("DELETE FROM vendor_kitchen_images WHERE title = ? AND vendor_id = ?");
		  	            HttpSession session = (HttpSession) request.getSession();
		  	            int vendorId = (Integer)session.getAttribute("vendorid");
		  	            stmt.setString(1, name);
		  	            stmt.setInt(2, vendorId);
		  	            stmt.executeUpdate();
		  	        } catch (SQLException e) {
		  	            e.printStackTrace();
		  	        }
	        	response.sendRedirect(request.getContextPath() + "/vendor-update-kitchen.jsp");
	        }
	        else if(myi==3) {
	        	  try {
		  	            Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/interior_design", "root", "");
		  	            PreparedStatement stmt = conn.prepareStatement("DELETE FROM vendor_bedroom_images WHERE title = ? AND vendor_id = ?");
		  	            HttpSession session = (HttpSession) request.getSession();
		  	            int vendorId = (Integer)session.getAttribute("vendorid");
		  	            stmt.setString(1, name);
		  	            stmt.setInt(2, vendorId);
		  	            stmt.executeUpdate();
		  	        } catch (SQLException e) {
		  	            e.printStackTrace();
		  	        }
	        	response.sendRedirect(request.getContextPath() + "/vendor-update-bedroom.jsp");
	        }
	        else if(myi==4) {
	        	  try {
		  	            Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/interior_design", "root", "");
		  	            PreparedStatement stmt = conn.prepareStatement("DELETE FROM vendor_garden_images WHERE title = ? AND vendor_id = ?");
		  	            HttpSession session = (HttpSession) request.getSession();
		  	            int vendorId = (Integer)session.getAttribute("vendorid");
		  	            stmt.setString(1, name);
		  	            stmt.setInt(2, vendorId);
		  	            stmt.executeUpdate();
		  	        } catch (SQLException e) {
		  	            e.printStackTrace();
		  	        }
	        	response.sendRedirect(request.getContextPath() + "/vendor-update-garden.jsp");
	        }
	      
	
	}

}

package sample;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Base64;

import org.apache.catalina.connector.Response;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/AddImageVendorInterior")
@MultipartConfig

public class AddImageVendorInterior extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	
	/*
	 * protected void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { // TODO Auto-generatedmethod
	 * stub
	 * response.getWriter().append("Served at: ").append(request.getContextPath());
	 * }
	 */
	
	private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
    private static final String DB_CONNECTION_URL = "jdbc:mysql://localhost:3306/interior_design";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";
    private static final String INSERT_IMAGE_QUERY = "INSERT INTO vendor_interior_images (vendor_id ,title, image_data) VALUES (?, ?, ?)";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		int v_id = (Integer)session.getAttribute("vendorid");
		
		
		Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        System.out.println("Selected Image File Name : " + fileName);
        
        // Storing the uploaded image into a byte array
        InputStream fileInputStream = filePart.getInputStream();
        byte[] imageData = fileInputStream.readAllBytes();
        
        // Storing the image data into MySQL database
        Connection dbConnection = null;
        PreparedStatement statement = null;
        try {
            // Load the MySQL driver
            Class.forName(DB_DRIVER);

            // Establish a database connection
            dbConnection = DriverManager.getConnection(DB_CONNECTION_URL, DB_USER, DB_PASSWORD);

            // Create a prepared statement to insert the image data into the database
            statement = dbConnection.prepareStatement(INSERT_IMAGE_QUERY);
            statement.setInt(1, v_id);
            statement.setString(2, request.getParameter("title"));
            statement.setBytes(3, imageData);
            statement.executeUpdate();
            
            String imageFilePath = "data:image/png;base64," + Base64.getEncoder().encodeToString(imageData);
            request.getSession().setAttribute("imageFilePath", imageFilePath);
            request.getSession().setAttribute("imageTitle", request.getParameter("title"));
            
			response.sendRedirect("furniture.jsp"); 
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the database resources
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (dbConnection != null) {
                try {
                    dbConnection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    
	}

}

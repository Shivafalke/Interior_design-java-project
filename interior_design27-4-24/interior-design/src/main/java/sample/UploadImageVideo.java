package sample;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;


@WebServlet("/UploadImageVideo")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class UploadImageVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "uploads";   
   
	/*
	 * protected void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException {
	 * response.getWriter().append("Served at: ").append(request.getContextPath());
	 * }
	 */
	private static final String DB_URL = "jdbc:mysql://localhost:3306/interior_design";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";
    int rowsAffected = 0;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		int vid = (Integer)session.getAttribute("vendorid");
		  String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
		  System.out.println(uploadPath);
	        File uploadDir = new File(uploadPath);
	        if (!uploadDir.exists()) {
	            uploadDir.mkdir();
	        }

	        String description = request.getParameter("description");
	        List<Part> fileParts = (List<Part>) request.getParts();

	        for (Part part : fileParts) {
	            String fileName = extractFileName(part);
	            System.out.println(fileName);

	            // Save the file to the upload directory
	            part.write(uploadPath + File.separator + fileName);
	            PrintWriter out=response.getWriter();
	            // Store the file information in the database
	            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {

		            String query = "INSERT INTO files (file_name, description, vendor_id) VALUES (?, ?, ?)";
		            PreparedStatement statement = conn.prepareStatement(query);
		            statement.setString(1, fileName);
		            statement.setString(2, description);
		            statement.setInt(3,vid);
		            rowsAffected=statement.executeUpdate();
		            if (rowsAffected > 0) {
		                out.println("<script type=\"text/javascript\">");
		                out.println("alert('File uploaded..!');");
		                out.println("window.location.href = 'Vendor/image_or_video_for_customer.jsp';");
		                out.println("</script>");
		             } else {
		                out.println("<script type=\"text/javascript\">");
		                out.println("alert('uploading failed. Please try again later.');");
		                out.println("window.location.href = 'Vendor/image_or_video_for_customer.jsp';");
		                out.println("</script>");
		             }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
	        }

	    }

	    // Extracts the file name from the content-disposition header of the part
	    private String extractFileName(Part part) {
	        String contentDisp = part.getHeader("content-disposition");
	        String[] items = contentDisp.split(";");
	        for (String item : items) {
	            if (item.trim().startsWith("filename")) {
	                return item.substring(item.indexOf("=") + 2, item.length() - 1);
	            }
	        }
	        return "";
	    }
	    





	}



package sample;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet("/ApproveRequestServlet")
public class ApproveRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		  int id = Integer.parseInt(request.getParameter("id"));

	        try {
	            // Connect to the database
	            Class.forName("com.mysql.jdbc.Driver");
	            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/interior_design", "root", "");

	            // Update the status of the request to 'approved'
	            String query = "UPDATE new_vendors SET status = ? WHERE id = ?";
	            PreparedStatement stmt = conn.prepareStatement(query);
	            stmt.setString(1, "approved");
	            stmt.setInt(2, id);
	            stmt.executeUpdate();

	            // Close the database connection	
	            stmt.close();
	            conn.close();

	            // Redirect back to the vendor requests page
	            response.sendRedirect("vendor-status.jsp");

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	

	
	}

}

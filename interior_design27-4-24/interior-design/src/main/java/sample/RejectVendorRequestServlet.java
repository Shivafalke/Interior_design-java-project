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


@WebServlet("/RejectVendorRequestServlet")
public class RejectVendorRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 int id = Integer.parseInt(request.getParameter("id"));
        try {
            // Load the database driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            String url = "jdbc:mysql://localhost:3306/interior_design";
            String username = "root";
            String password = "";
            Connection con = DriverManager.getConnection(url, username, password);

            // Prepare the SQL statement to update the vendor's status to "rejected"
            String sql = "UPDATE new_vendors SET status = 'rejected' WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            // Execute the update statement
            int rowsUpdated = ps.executeUpdate();

            // Close the database connection
            con.close();

            // Check if the update was successful
            if (rowsUpdated > 0) {
            	System.out.println("request is rejected for id:"+id);
                // Redirect the user to a success page
                response.sendRedirect("vendor-status.jsp");
            } else {
            	System.out.println("No request rejected....");

                // Redirect the user to an error page
                response.sendRedirect("vendor-status.jsp");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Redirect the user to an error page
            response.sendRedirect("vendor-status.jsp");
        }
	
	}

}

package sample;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/submit-rating")
public class SubmitRatingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form data
        HttpSession session = request.getSession();
    	 int cust_id =(Integer)session.getAttribute("customerId");
		String cust_name=(String)session.getAttribute("customerName");  
        int rating = Integer.parseInt(request.getParameter("rate"));
        String comment = request.getParameter("comment");

        // Insert data into database
        String dbURL = "jdbc:mysql://localhost:3306/interior_design";
        String dbUsername = "root";
        String dbPassword = "";
        try (Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword)) {
            String sql = "INSERT INTO ratings (rating, comment,customerId,customerName) VALUES (?, ?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, rating);
            statement.setString(2, comment);
            statement.setInt(3, cust_id);
            statement.setString(4, cust_name);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        PrintWriter out=response.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Thank you for you review...!');");
        out.println("window.location.href = 'Customer/customer_dashboard.jsp';");
        out.println("</script>");
    }
}

package sample;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		
		try{
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/interior_design","root","");
			PreparedStatement ps=con.prepareStatement("select email from admin where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, pass);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
//				RequestDispatcher rd=request.getRequestDispatcher("Admin/admin_dashboard.jsp");
//				rd.forward(request, response);
				response.sendRedirect("Admin/admin_dashboard.jsp"); 
			}
			else {
				out.println("<script>");
				  out.println("alert('Login Failed. The email and password combination is incorrect. Please try again.');");
				  out.println("window.location.href='Admin.html';");
				  out.println("</script>");
			}
			
			//out.print("<h1>connected to db</h1>");
			//out.print("welcome");
		}catch(Exception e)
		{
			e.printStackTrace();
			out.print("not connected");
		}
	
	}

}

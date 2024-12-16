package sample;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/VendorDesigns")
public class VendorDesigns extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String category = request.getParameter("category");
		if(category.equals("interior"))
		{	
			response.sendRedirect("vendor-for-user-interior.jsp?value=interior");  
		}
		else if(category.equals("kitchen")) 
		{
			response.sendRedirect("vendor-for-user-interior.jsp?value=kitchen");  

		}
		else if(category.equals("bedroom")) 
		{
			response.sendRedirect("vendor-for-user-interior.jsp?value=bedroom");  

		}
		else if(category.equals("garden")) 
		{
			response.sendRedirect("vendor-for-user-interior.jsp?value=garden");  

		}
		
	}

}

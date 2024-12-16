package sample;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 HttpSession session = request.getSession(false);

	        // Invalidate the session if it exists
	        if (session != null) {
	        	
	            session.invalidate();
	            
	        }
	        int value=1;
	        request.getSession().setAttribute("val", value);
	        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
            response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
            response.setDateHeader("Expires", 0);
            response.sendRedirect("index.jsp");
	        // Redirect the user to the login page
	        
	    
	
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(false);

	        // Invalidate the session if it exists
	        if (session != null) {
	            session.invalidate();
	        }
	        // Set response headers to prevent caching
			/*
			 * response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			 * // HTTP 1.1 response.setHeader("Pragma", "no-cache"); // HTTP 1.0
			 * response.setHeader("Expires", "0"); // Proxies
			 */	        int value=1;
			 request.getSession().setAttribute("val", value);
	        // Redirect the user to the login page
	        response.sendRedirect("index.jsp");
	}

}

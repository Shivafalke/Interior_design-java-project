package sample;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteImage")
public class DeleteImage extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the ID of the image to be deleted from the request parameter
        String name = request.getParameter("name");
        int myi = (Integer)request.getSession().getAttribute("i");
        
        if(myi==1) {
	        // Call the deleteImage method of ImageDAO class to delete the image from the database
	        new ImageDAO().deleteImage(name);
	        // Redirect the user to the home page
	        response.sendRedirect(request.getContextPath() + "/update-interior.jsp");
        }
        else if(myi==2) {
        	new ImageDAO().deleteImagekitchen(name);
        	response.sendRedirect(request.getContextPath() + "/update-kitchen.jsp");
        }
        else if(myi==3) {
        	new ImageDAO().deleteImagebedroom(name);
        	response.sendRedirect(request.getContextPath() + "/update-bedroom.jsp");
        }
        else if(myi==4) {
        	new ImageDAO().deleteImagegarden(name);
        	response.sendRedirect(request.getContextPath() + "/update-garden.jsp");
        }
        
        
    }

}

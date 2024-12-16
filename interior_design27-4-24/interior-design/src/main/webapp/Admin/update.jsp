<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%
    // Get the content from the textarea
    String content = request.getParameter("content");

    // Define the file path where the content will be saved
    String filePath = application.getRealPath("/") + "text_info.txt";

    try {
        // Create a FileWriter object to write the content to the file
        FileWriter writer = new FileWriter(filePath);

        // Write the content to the file
        writer.write(content);

        // Close the FileWriter object
        writer.close();

        // Output a success message
        out.println("Content saved to file successfully!");
        %>
        <script>alert("Content saved to file successfully!");
        window.location.replace("about-us-section.jsp");</script>
        
        <% 
        
    } catch (IOException e) {
        // Output an error message if an exception occurs
        out.println("Error saving content to file: " + e.getMessage());
    }
%>
<br><br>

<a href="about-us-section.jsp"><input type="submit" value="update again"></input></a>

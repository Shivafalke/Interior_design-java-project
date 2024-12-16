<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import = "java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	class Content{
		public void update(){
	    String content = request.getParameter("content");
	    String file = request.getParameter("file");
	    String contentFile = "../" + file + ".html";
	    String result = "";
	    try {
	        PrintWriter writer = new PrintWriter(contentFile, "UTF-8");
	        writer.println(content);
	        writer.close();
	        result = "{\"status\":\"success\"}";
	        request.setAttribute("success", file + " content is successfully updated");
	    } catch (IOException e) {
	        result = "{\"status\":\"error\", \"message\":\"" + e.getMessage() + "\"}";
	    }
    	try{
    		out.print(result);
    		}
    	catch(Exception e){
    		e.printStackTrace();
    		}
    
	}
}
%>
<%
    Content content = new Content();
    String action = request.getParameter("f");
    if (action == null) {
        action = "none";
    } else {
        action = action.toLowerCase();
    }
   
    switch (action) {
        case "update":
            content.update();
            out.print("content updated");
            break;
        default:
            // Do nothing
    }
%>



</body>
</html>
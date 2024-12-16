<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.io.*" %>
<%@ page import ="java.nio.file.Files" %>
<%@ page import ="java.nio.file.Paths" %>
<%@ page import ="org.jsoup.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update About Us</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">



<link rel="stylesheet" href="style.css">


<!-- Bootstrap JS (jQuery and Popper.js are required for Bootstrap) -->
<script src="https://requirejs.org/docs/release/2.3.5/minified/require.js"></script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.3.6/require.js"></script> -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
<script src="js/common.js" type="text/javascript"></script> 
 
 </head>
<body>
<!-- <form action="AboutUsServlet" method="post">
    <label for="content">Content:</label>
    <textarea id="content" name="content" rows="10" cols="50"></textarea>
    <input type="submit" value="Update">
</form>
 -->
 <div class="col-lg-12">
	<div class="card card-outline card-primary">
		<div class="card-header">
			<h5 class="card-title">About</h5>
		</div>
		<div class="card-body">
			<form id="about_c" action="update.jsp" method="post">
				<div class="form-group">
					<input type="hidden" name="file" value="about">
					<label for="" class="control-label">About Content</label>
		             <textarea name="content" id="" cols="30" rows="10" class="form-control summernote">

<%
String filePath = application.getRealPath("/") + "text_info.txt";
File file = new File(filePath);
if (file.isFile()) {
    String pcontent = new String(Files.readAllBytes(Paths.get(filePath)));
    /* org.jsoup.nodes.Document doc = org.jsoup.Jsoup.parse(pcontent);
    String Content = doc.select("p").text(); */ 
    out.print(pcontent);

    /* response.sendRedirect("content.jsp"); */
}
%>




</textarea>
				</div>
			</form>
		</div>
		<div class="card-footer">
			<button class="btn btn-primary btn-sm" form="about_c">Update </button>
			<a href="admin_dashboard.jsp"><button class="btn btn-primary btn-sm">dashboard</button></a>
			
		</div>
	</div>
</div>

 <%-- <script>
$(document).ready(function(){
    $('#about_c').submit(function(e){
        e.preventDefault();
        start_loader();
        $.ajax({
            url: "<%= request.getContextPath() %>/content.jsp?f=update",
            method: "GET",
            data: $(this).serialize(),
            error: function(err){
                alert_toast("An error occurred", "error");
                console.log(err);
            },
            success: function(resp){
                if(resp != undefined){
                    resp = JSON.parse(resp);
                    if(resp.status == "success"){
                        location.reload();
                    }else{
                        alert_toast("An error occurred", "error");
                        console.log(resp);
                        end_loader();
                    }
                }
            }
        });
    });
    $('.summernote').summernote({
        height: 200,
        toolbar: [
            [ "style", [ "style" ] ],
            [ "font", [ "bold", "italic", "underline", "strikethrough", "superscript", "subscript", "clear"] ],
            [ "fontname", [ "fontname" ] ],
            [ "fontsize", [ "fontsize" ] ],
            [ "color", [ "color" ] ],
            [ "para", [ "ol", "ul", "paragraph", "height" ] ],
            [ "table", [ "table" ] ],
            [ "view", [ "undo", "redo", "fullscreen", "codeview", "help" ] ]
        ]
    });
});
</script>  --%>

</body>
</html>
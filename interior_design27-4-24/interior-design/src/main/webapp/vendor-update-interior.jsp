<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.http.Part" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.util.List" %>

<%@ page import="sample.ImageDAOvendor" %>
<%@ page import="sample.MyImage" %>

<!DOCTYPE html>
<html>
<head>
    <title>Image Gallery</title>
    <!-- Add Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <style>
        body {
            background-color: #e9f5fe;
        }

        section {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
        }

        h1 {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container my-5">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <h1 class="text-center mb-4">Upload Image</h1>
                <form action="AddImageVendorInterior" method="post" enctype="multipart/form-data">
                     <div class="form-group">
                        <label for="title">Title:</label>
                        <input type="text" name="title" class="form-control" required>
                    </div> 
                    
                    <div class="form-group">
                        <label for="file">Image:</label>
                        <input type="file" name="file" class="form-control-file" required>
                    </div>
                    
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Upload</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <section style="padding-top: 70px; padding-bottom: 70px;"> 
        <div class="container">
            <div class="row pt-3">
                <% 
  	            int Vendorid = (Integer)session.getAttribute("vendorid");
                // Get the list of all images from the database using ImageDAO class
                List<MyImage> images = new ImageDAOvendor().getAllImagesDataInterior(Vendorid);

                // Iterate through the list of images and display them
                for (MyImage image : images) {
                    // Get the base64-encoded string of the image
                    String base64Image = Base64.getEncoder().encodeToString(image.getData());
                %>
                <div class="col-sm-4 mb-3">
                    <div class="card">
                        <img class="card-img-top" src="data:image/jpeg;base64,<%=base64Image%>" style="height: 200px; width: 300px;">
                        <div class="card-body">
                            <h5 class="card-title"><%=image.getTitle()%></h5>
                            <form action="DeleteImgVendor" method="post">
                            	<%
									int i = 1;
									session.setAttribute("i", i);
								%>
                                <input type="hidden" name="name" value="<%=image.getTitle()%>">
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </form>
                        </div>
                    </div>
                </div>

                <% } %>
            </div>
        </div>
    </section>

    <!-- Add Bootstrap JS CDN -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper-base.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/bundle.umd.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	
</body>
</html>
    

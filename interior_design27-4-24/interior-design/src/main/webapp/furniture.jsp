<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.http.Part" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.util.List" %>

<%@ page import="sample.ImageDAO" %>
<%@ page import="sample.ImageDAOvendor" %>
<%@ page import="sample.MyImage" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Furniture</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
  .carousel-inner img {
      width: 100%;
      height: 100%;
  }

#custCarousel .carousel-indicators {
    position: static;
    margin-top:20px;
}

#custCarousel .carousel-indicators > li {
  width:100px;
}

 #custCarousel .carousel-indicators li img {
    display: block;
    opacity: 0.5;
 }

  #custCarousel .carousel-indicators li.active img {
    opacity: 1;
  }

  #custCarousel .carousel-indicators li:hover img {
    opacity: 0.75;
  }

  .carousel-item img{

    width:80%;
  }
    </style>
</head>
<body>
    <div class="py-1 bg-primary">
    	<div class="container">
    		<div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
	    		<div class="col-lg-12 d-block">
		    		<div class="row d-flex">
		    			<div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
						    <span class="text">+91 7887698338</span>
					    </div>
					    <div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
						    <span class="text">samadhan@gmail.com</span>
					    </div>
					    <!-- <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
						    <span class="text">3-5 Business days delivery &amp; Free Returns</span>
					    </div> -->
				    </div>
			    </div>
		    </div>
		  </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.jsp">Home Decoretor</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item active"><a href="index.jsp" class="nav-link">Home</a></li>
	          <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Categories</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="index.jsp">Furniture</a>
                <a class="dropdown-item" href="index.jsp">Kitchen</a>
                <a class="dropdown-item" href="index.jsp">Interior</a>
				<a class="dropdown-item" href="index.jsp">Garden</a>
              </div>
            </li>
	          <li class="nav-item"><a href="About.jsp" class="nav-link">About</a></li>
	          <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
	          <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
			  <!-- <button class="btn btn-success" style="height: 50px; width: 100px;"><a href="login.html" style="color: #fff;">Log in</a></button>
			  <button class="btn btn-success" style="height: 50px; width: 100px;"><a href="register.html" style="color: #fff;">Register</a></button> -->
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->  

    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div id="custCarousel" class="carousel slide" data-ride="carousel" align="center">
            <!-- slides -->
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="images/home29.jpg" alt="Hills" style="height: 500px; width: 900px;">
              </div>
    
              <div class="carousel-item">
                <img src="images/home30.jpg" alt="Hills" style="height: 500px; width: 900px;">
              </div>
    
              <div class="carousel-item">
                <img src="images/home31.jpg" alt="Hills" style="height: 500px; width: 900px;">
              </div>
    
              <div class="carousel-item">
                <img src="images/home32.jpg" alt="Hills" style="height: 500px; width: 900px;">
              </div>
            </div>
    
            <!-- Left right -->
            <a class="carousel-control-prev" href="#custCarousel" data-slide="prev">
              <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#custCarousel" data-slide="next">
              <span class="carousel-control-next-icon"></span>
            </a>
    
            <!-- Thumbnails -->
            <ol class="carousel-indicators list-inline">
              <li class="list-inline-item active">
                <a id="carousel-selector-0" class="selected" data-slide-to="0" data-target="#custCarousel">
                  <img src="images/home29.jpg" class="img-fluid">
                </a>
              </li>
    
              <li class="list-inline-item">
                <a id="carousel-selector-1" data-slide-to="1" data-target="#custCarousel">
                  <img src="images/home30.jpg" class="img-fluid">
                </a>
              </li>
    
              <li class="list-inline-item">
                <a id="carousel-selector-2" data-slide-to="2" data-target="#custCarousel">
                  <img src="images/home31.jpg"  class="img-fluid">
                </a>
              </li>
    
               <li class="list-inline-item">
                <a id="carousel-selector-2" data-slide-to="3" data-target="#custCarousel">
                  <img src="images/home32.jpg"  class="img-fluid">
                </a>
              </li>
             </ol>
          </div>
        </div>
      </div>
    </div>
  <%--   <% 
  try {
        // Connect to the database
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/interior_design", "root", "");

        // Execute the query to retrieve the images
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT data FROM images where name='sofa'");
		
        // Loop through the result set and display the images
        if(rs.next()) {
        	 // Retrieve the image data
            Blob blob = rs.getBlob("data");
            byte[] imageData = blob.getBytes(1, (int)blob.length());

            // Encode the image data as a Base64 string
            String base64Image = Base64.getEncoder().encodeToString(imageData);
         	
      %>
    <section style="padding-top: 100px; padding-bottom: 100px;">
      <h1 class="text-center">Impressive Collection For Your Dream Home</h1>
      <div class="container">
        <div class="row pt-3">
          <div class="col-sm-4">
          	<c:forEach var="image" items="${images}">
            <img src="images/${image.filename}" alt="Uploaded Image" style="height: 200px; width: 300px;">
            <h3 class="text-center">Sofa Set</h3>
          </div>
             
    	
      <div class="col-sm-4">
        <img src="data:image/jpeg;base64,<%=base64Image%>" style="height: 200px; width: 300px;">
        <h3 class="text-center">Sofa Set</h3>
      	</div>
       </div>
		<%
		}
		 // Close the database connection
	    rs.close();
	    stmt.close();
	    con.close();
		} catch (SQLException e)
           {	e.printStackTrace();	}
			
			%>         
         
          <div class="col-sm-4">
            <img src="images/home24.jpg" style="height: 200px; width: 300px;">
            <h3 class="text-center">Bed</h3>
          </div>
          <div class="col-sm-4">
            <img src="images/home25.jpg" style="height: 200px; width: 300px;">
            <h3 class="text-center">Dining Table</h3>
          </div>
        </div>
        <div class="row pt-3">
          <div class="col-sm-4">
            <img src="images/home26.jpg" style="height: 200px; width: 300px;">
            <h3 class="text-center">Shoe Rack</h3>
          </div>
          <div class="col-sm-4">
            <img src="images/home27.jpg" style="height: 200px; width: 300px;">
            <h3 class="text-center">TV Units</h3>
          </div>
          <div class="col-sm-4">
            <img src="images/home28.jpg" style="height: 200px; width: 300px;">
            <h3 class="text-center">Study Table</h3>
          </div>
        </div>
      </div>
    </section> --%>


<section style="padding-top: 100px; padding-bottom: 100px;">
  <h1 class="text-center">Impressive Collection For Your Dream Home</h1>
  <div class="container">
    <div class="row pt-3">
      <% 
        // Get the list of all images from the database using ImageDAO class
        List<MyImage> images = new ImageDAO().getAllImagesData();
        
        // Iterate through the list of images and display them
        for (MyImage image : images) {
          // Get the base64-encoded string of the image
          String base64Image = Base64.getEncoder().encodeToString(image.getData());
      %>
      <div class="col-sm-4">
      	<img src="data:image/jpeg;base64,<%=base64Image%>" style="height: 200px; width: 300px;">
      	
        <%-- <img src="base64,<%=base64Image%>" style="height: 200px; width: 300px;"> --%>
        <h3 class="text-center"><%=image.getTitle()%></h3>
      </div>
      <% } %>
       <% 
        // Get the list of all images from the database using ImageDAO class
        List<MyImage> imagess = new ImageDAOvendor().getAllImagesDataInterior();
        
        // Iterate through the list of images and display them
        for (MyImage image : imagess) {
          // Get the base64-encoded string of the image
          String base64Image = Base64.getEncoder().encodeToString(image.getData());
      %>
      <div class="col-sm-4">
      	<img src="data:image/jpeg;base64,<%=base64Image%>" style="height: 200px; width: 300px;">
      	
        <h3 class="text-center"><%=image.getTitle()%></h3>
      </div>
      <% } %>
    </div>
  </div>
</section>

    <section>
      <div class="container" style="padding-bottom: 100px;">
        <h1 class="text-center text-danger"><b>We've Got Your Style</b></h1>
        <h6 class="text-center text-secondary">Your home is a reflection of you. Nail your aesthetic with products our stylists love and recommend</h6>
          <div class="row pt-5">
            <div class="col-md-4">
              <div class="card" style="width: 18rem;">
                <img class="card-img-top" src="images/home33.jpg" alt="Card image cap">
                <div class="card-body">
                  <p class="card-text text-center">MODERN</p>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card" style="width: 18rem;">
                <img class="card-img-top" src="images/home34.jpg" alt="Card image cap">
                <div class="card-body">
                  <p class="card-text text-center">TRADITIONAL</p>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card" style="width: 18rem;">
                <img class="card-img-top" src="images/home35.jpg" alt="Card image cap">
                <div class="card-body">
                  <p class="card-text text-center">INDUSTRIAL</p>
                </div>
              </div>
            </div>
          </div>
      </div>
    </section>

    <section style="padding-bottom: 100px;">
      <div class="container">
        <h1 class="text-center text-secondary">GALLERY</h1>
          <div class="row pt-5">
            <div class="col-sm-3">
              <img src="images/home36.jpg" class="img-fluid" style="height: 300px;">
            </div>
            <div class="col-sm-3">
              <img src="images/home37.jpg" class="img-fluid" style="height: 300px;">
            </div>
            <div class="col-sm-3">
              <img src="images/home38.jpg" class="img-fluid" style="height: 300px;">
            </div>
            <div class="col-sm-3">
              <img src="images/home39.jpg" class="img-fluid" style="height: 300px;">
            </div>
          </div>
          <div class="row pt-3">
            <div class="col-sm-3">
              <img src="images/home40.jpg" class="img-fluid" style="height: 300px;">
            </div>
            <div class="col-sm-3">
              <img src="images/home41.jpg" class="img-fluid" style="height: 300px;">
            </div>
            <div class="col-sm-3">
              <img src="images/home42.jpg" class="img-fluid" style="height: 300px;">
            </div>
            <div class="col-sm-3">
              <img src="images/home43.jpg" class="img-fluid" style="height: 300px;">
            </div>
          </div>
          <div class="row pt-3">
            <div class="col-sm-3">
              <img src="images/home44.jpg" class="img-fluid" style="height: 300px;">
            </div>
            <div class="col-sm-3">
              <img src="images/home45.jpg" class="img-fluid" style="height: 300px;">
            </div>
            <div class="col-sm-3">
              <img src="images/home46.jpg" class="img-fluid" style="height: 300px;">
            </div>
            <div class="col-sm-3">
              <img src="images/home47.jpg" class="img-fluid" style="height: 300px;">
            </div>
          </div>
      </div>
    </section>

    <footer class="ftco-footer ftco-section">
      <div class="container">
      	<div class="row">
      		<div class="mouse">
						<a href="#" class="mouse-icon">
							<div class="mouse-wheel"><span class="ion-ios-arrow-up"></span></div>
						</a>
					</div>
      	</div>
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Home Decorator</h2>
              <p>A home is what you make it! so turn your houseinto a home with the veriety of decorative terms of homely decor.</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">Menu</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">Home</a></li>
                <li><a href="#" class="py-2 d-block">About</a></li>
                <li><a href="#" class="py-2 d-block">Blog</a></li>
                <li><a href="#" class="py-2 d-block">Contact Us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-4">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Help</h2>
              <div class="d-flex">
	              <ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
	                <li><a href="#" class="py-2 d-block">Terms &amp; Conditions</a></li>
	                <li><a href="#" class="py-2 d-block">Privacy Policy</a></li>
	              </ul>
	              <ul class="list-unstyled">
	                <li><a href="#" class="py-2 d-block">FAQs</a></li>
	                <li><a href="#" class="py-2 d-block">Contact</a></li>
	              </ul>
	            </div>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">Contact the company we will information provides us!</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+91 7887698338</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text"> samadhan@gmail.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <!-- <p><Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
						 Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
						</p> -->
          </div>
        </div>
      </div>
    </footer>




<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
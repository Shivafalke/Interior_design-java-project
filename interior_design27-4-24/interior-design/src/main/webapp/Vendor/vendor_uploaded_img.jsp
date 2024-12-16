<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Base64" %>
<%@ page import="java.sql.*" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vendor designs</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.15.5/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.15.5/dist/sweetalert2.all.min.js"></script>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

<!-- Custom CSS -->
<style>
  body {
    font-family: 'Montserrat', sans-serif;
    background-color: #f7f7f7;
  }
  section {
    background-color: #fff;
    box-shadow: 0px 0px 10px #888;
    padding: 50px 0px;
  }
  h1 {
    color: #333;
    font-size: 3rem;
    text-align: center;
    margin-bottom: 50px;
  }
  img {
    display: block;
    margin: 0 auto;
  }
  h3 {
    text-align: center;
    margin-top: 20px;
  }
  
  .contact-section {
      background-color: #212529;
    }
    
    .form-control {
     
      border-radius: 10px;
    }
    
    label {
	    border-radius: 10px;
	    font-weight: bold;
    }
    
    .btn-primary {
      background-color: #007bff;
      border-color: #007bff;
      border-radius: 10px;
      
    }
    
    .btn-primary:hover {
      background-color: #0069d9;
      border-color: #0062cc;
    }
    
    .text-white {
      color: #fff;
    }
    .contact-form {
	  position: absolute;
	  top: 50%;
	  right: 10%;
	  transform: translate(0, -50%);
	}
    .contact-form form {
	  width: 80%;
	  margin: 0 auto;
	}
    
</style>
</head>
<body>
<%
String vendorId = request.getParameter("vendorid");
String vendorname = request.getParameter("vendorname");
Integer cust_id = (Integer) session.getAttribute("customerId");

/* HttpSession sessions = request.getSession(); */
/* request.setAttribute("venid",vendorId);
request.setAttribute("venname",vendorname); */
%>



  <nav class="navbar navbar-expand-lg navbar-dark bg-dark d-flex justify-content-center">
    <a class="navbar-brand" href="#"><%= vendorname %> Designs</a>
  </nav>

<section style="padding-top: 100px; padding-bottom: 100px;">
  <h1 class="text-center">Impressive Collection For Your Dream Home</h1>
  <div class="container">
    <div class="row pt-3">
    
    <%
// Retrieve the vendor ID from the request parameter

// Set up database connection
String url = "jdbc:mysql://localhost:3306/interior_design";
String username = "root";
String password = "";
Connection conn = DriverManager.getConnection(url, username, password);

// Retrieve image data and title from four different tables using JOIN query
String query = "(SELECT image_data, title FROM vendor_interior_images WHERE vendor_id = ?) "
             + "UNION "
             + "(SELECT image_data, title FROM vendor_bedroom_images WHERE vendor_id = ?) "
             + "UNION "
             + "(SELECT image_data, title FROM vendor_kitchen_images WHERE vendor_id = ?) "
             + "UNION "
             + "(SELECT image_data, title FROM vendor_garden_images WHERE vendor_id = ?)";
PreparedStatement stmt = conn.prepareStatement(query);
stmt.setString(1, vendorId);
stmt.setString(2, vendorId);
stmt.setString(3, vendorId);
stmt.setString(4, vendorId);
ResultSet rs = stmt.executeQuery();

if (!rs.isBeforeFirst()) {
    %>
    <div class="col-sm-12">
        <h3 class="text-center">No interior designs are uploaded yet</h3>
    </div>
    <%
} else {
// Loop through the result set and display images and titles
while (rs.next()) {
    // Retrieve the image data and convert it to Base64 encoded string
    byte[] imageData = rs.getBytes("image_data");
    String base64Image = Base64.getEncoder().encodeToString(imageData);

    // Retrieve the image title
    String title = rs.getString("title");

    // Display the image and title
    %>
      
      <div class="col-sm-4">
      	<img src="data:image/jpeg;base64,<%=base64Image%>" style="height: 200px; width: 300px;">
      	
        <h3 class="text-center"><%=title%></h3>
      </div>
      <% 
}
}

// Clean up database connection
rs.close();
stmt.close();
conn.close();
%>
      
    </div>
  </div>
</section>
 
<section class="ftco-section contact-section bg-light">
      <div class="container">
      	<div class="row d-flex mb-5 contact-info">
          <div class="w-100"></div>
          <div class="col-md-4 d-flex">
          	<div class="info bg-white p-4">
	            <p><span>Address:</span> Home Business</p>
	          </div>
          </div>
          <div class="col-md-4 d-flex">
          	<div class="info bg-white p-4">
	            <p><span>Phone:</span> <a href="tel://7900157376">+91 790017376</a></p>
	          </div>
          </div>
          <div class="col-md-4 d-flex">
          	<div class="info bg-white p-4">
	            <p><span>Email:</span> <a href="mailto:jejurkar2000@gmail.com">jejurkar2000@gmail.com</a></p>
	          </div>
          </div>

        </div>
        <div class="row block-9">
          <div class="col-md-6 order-md-last d-flex">
            <form action="${pageContext.request.contextPath}/Vendorformcontactus" method="get" class="bg-white p-5 contact-form" >
            <input type="hidden" name="venid" value="${param.vendorid}">
  			<input type="hidden" name="venname" value="${param.vendorname}">
          <div class="form-group">
            <label for="name" class="text-dark">Name:</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required>
          </div>
          <div class="form-group">
            <label for="email" class="text-dark">Email address:</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
          </div>
          <div class="form-group">
            <label for="contact" class="text-dark">Contact number:</label>
            <input type="text" class="form-control" id="contact" name="phone" placeholder="Enter your phone number" required>
          </div>
          <div class="form-group">
            <label for="interest" class="text-dark">Interest:</label>
            <select class="form-control rounded p-2" id="interest" name="interest">
              <option>Interior</option>
              <option>Bedroom</option>
              <option>Kitchen</option>
              <option>Garden</option>
            </select>
          </div>
          
             
              <div class="form-group">
              <%if(cust_id != null){ %>
                <input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
               
                <% }else{ %>
               	 <a href="../customer.html">
                 	<button type="button" class="btn btn-primary py-3 px-5">login to send message</button>
                 </a>
                <% }%>
              </div>
            </form>
          
          </div>

          <div class="col-md-6 d-flex">
          	<!-- <div id="map" class="bg-white"> -->
              <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d239962.83697186882!2d73.6633947197378!3d19.990908031117453!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bddd290b09914b3%3A0xcb07845d9d28215c!2sNashik%2C%20Maharashtra!5e0!3m2!1sen!2sin!4v1655396083868!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
          </div>
        </div>
      
    </section>



</body>
</html>
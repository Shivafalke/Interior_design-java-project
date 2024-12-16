<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="sample.VendorPOJO" %>
<%@ page import="java.util.List" %>
<%@ page import="sample.Customer" %>
<%@ page import="sample.VendorDetails" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Dashboard</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<%
int cid = (Integer)session.getAttribute("customerId");
String c_name = (String)session.getAttribute("customerName");

VendorDetails vendorDetails = new VendorDetails();

Customer cust = vendorDetails.getCustomerDetails(cid);

byte[] profileImage =cust.getProfileimg();
String PI = "";
if (profileImage != null) {
    PI = Base64.getEncoder().encodeToString(profileImage);
}
%>

    <style>
	  /* .navbar {
		  height: 50px;
		  display: flex;
		  justify-content: space-between;
		  align-items: center;
		  padding: 0 20px;
		 color: white !important;
		}  */
		    

        body {
  
		  font-family: 'Montserrat', sans-serif;
		  background-color: #f8f9fa;
		  height: 100%;
		  margin: 0;
		  padding: 0;
		  overflow: hidden;
		}

		.card {
    			background-color: #f8f9fa; /* replace with your page's background color */
    			width: 700px;
 				height: 300px;
			}

        h1, h4 {
			  font-weight: bold;
			  text-align: center;
			  font-size: 36px;
			}


		/*form {
			  display: flex;
			  flex-direction: column;
			  align-items: center;
			  margin-top: 2rem;
			  margin-bottom: 2rem;
			  padding: 20px;
			  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			} */


        .inputBox {
            margin-top: 1rem;
            margin-bottom: 1rem;
            display: inline-block;
            
  			margin-right: 5%;
            flex-direction: column;
            align-items: center;
        }

		   label {
		  font-weight: bold;
		  font-size: 18px;
		  color: #333;
		}



        ul {
            margin-top: 2rem;
            margin-bottom: 2rem;
            list-style-type: none;
            padding: 0;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        li {
		  margin: 1rem;
		  background-color: #fff;
		  border: none;
		  border-radius: 5px;
		  padding: 0.5rem 1rem;
		  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}


		 @media (min-width: 576px) 
		 {
		            form 
		            {
		                flex-direction: row;
		            }
		
		           
		 }            
        
		 @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
		
		/* html,body{
		  display: grid;
		  height: 100%;
		  place-items: center;
		  text-align: center;
		  background: #000;
		} */
		.container{
		  position: relative;
		  width: 400px;
		  background: #111;
		  padding: 20px 30px;
		  border: 1px solid #444;
		  border-radius: 5px;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		  flex-direction: column;
		}
		.container .post{
		  display: none;
		}
		.container .text{
		  font-size: 25px;
		  color: #666;
		  font-weight: 500;
		}
		.container .edit {
		  position: absolute;
		  right: 10px;
		  top: 5px;
		  font-size: 20px;
		  color: #007bff;
		  font-weight: 500;
		  cursor: pointer;
		  transition: color 0.3s ease;
		}
		.container .edit:hover {
		  color: #0056b3;
		}
		.container .star-widget input{
		  display: none;
		}
		.star-widget label{
		  font-size: 40px;
		  color: #444;
		  padding: 10px;
		  float: right;
		  transition: all 0.2s ease;
		}
		input:not(:checked) ~ label:hover,
		input:not(:checked) ~ label:hover ~ label{
		  color: #fd4;
		}
		input:checked ~ label{
		  color: #fd4;
		}
		input#rate-5:checked ~ label{
		  color: #fe7;
		  text-shadow: 0 0 20px #952;
		}
		
		.container form{
		  display: none;
		}
		input:checked ~ form{
		  display: block;
		}
		#call header{
		  width: 100%;
		  font-size: 25px;
		  color: #fe7;
		  font-weight: 500;
		  margin: 5px 0 20px 0;
		  text-align: center;
		  transition: all 0.2s ease;
		}
		#call .textarea{
		  height: 100px;
		  width: 100%;
		  overflow: hidden;
		}
		#call .textarea textarea{
		  height: 100%;
		  width: 100%;
		  outline: none;
		  color: #eee;
		  border: 1px solid #333;
		  background: #222;
		  padding: 10px;
		  font-size: 17px;
		  resize: none;
		}
		.textarea textarea:focus{
		  border-color: #444;
		}
		#call .btn{
		  height: 45px;
		  width: 100%;
		  margin: 15px 0;
		}
		#call .btn button{
		  height: 100%;
		  width: 100%;
		  border: 1px solid #444;
		  outline: none;
		  background: #222;
		  color: #999;
		  font-size: 17px;
		  font-weight: 500;
		  text-transform: uppercase;
		  cursor: pointer;
		  transition: all 0.3s ease;
		}
		#call .btn button:hover{
		  background: #1b1b1b;
		}
		.navbar-nav .rounded-circle {
			  width: 35px;
			  height: 35px;
			  object-fit: cover;
			}
    </style>
    <script>
  function openHomeVisitModal() {
    $('#addHomeVisitModal').modal('show');
  }
</script>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="customer_dashboard.jsp">Customer Dashboard</a>
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
    
   
		<a class="navbar-brand"><%=c_name %></a>
      	
      	  <%
				if (PI.isEmpty()) {
				%> 
          <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" class="rounded-circle">
           <%
				} else {
				%>
				<img src="data:image/jpeg;base64,<%=PI%>" class="rounded-circle"> 
				
				<%
				}
				%>
    	
    	<div class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="UpdateCustDetails.jsp">Edit Profile</a>
          <!-- <a class="dropdown-item" href="#">Option 2</a> -->
        </div>
      </div>
      
      <a class="nav-item nav-link" href="customer_dashboard.jsp">Home <span class="sr-only">(current)</span></a>
      <a class="nav-item nav-link" href="vendor_images_videos.jsp">Designs <span class="sr-only">(current)</span></a>
      <button type="button" class="btn btn-danger my-2 my-sm-0" onclick="openHomeVisitModal()">Home Visit</button>
     <!--  <button class="btn btn-success my-2 my-sm-0" type="submit">Logout</button> -->
      
    </div>
  		</div>
  			<!-- <form class="form-inline" method="post" action="../logout.jsp"> -->
           	<form class="form-inline" method="post" action="${pageContext.request.contextPath}/Logout"> 
           		<button class="btn btn-success my-2 my-sm-0" type="submit">Logout</button>      		
           		
				<!-- <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Logout</button>-->      		
			</form>
</nav>




<div class="modal fade" id="addHomeVisitModal" tabindex="-1" role="dialog" aria-labelledby="addHomeVisitModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addHomeVisitModalLabel">Make Home Visit</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="post" action="${pageContext.request.contextPath}/HomeVisit">
          <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="name" required>
          </div>
          <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" class="form-control" id="address" name="address" required>
          </div>
          <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" name="email" required>
          </div>
          <div class="form-group">
            <label for="contact">Contact Number:</label>
            <input type="tel" class="form-control" id="contact" name="contact" required>
          </div>
          <div class="form-group">
            <label for="vendor">Vendors:</label>
            <select class="form-control" id="vendor" name="vendor">
              <%
  // Define the database connection parameters
  String url = "jdbc:mysql://localhost:3306/interior_design";
  String username = "root";
  String password = "";

  try {
    // Load the JDBC driver
    Class.forName("com.mysql.jdbc.Driver");

    // Create a database connection
    Connection conn = DriverManager.getConnection(url, username, password);

    // Create a statement to execute the SQL query
    Statement stmt = conn.createStatement();

    // Execute the query to fetch vendor data
    String sql = "SELECT id, name FROM vendor_login";
    ResultSet rs = stmt.executeQuery(sql);

    // Generate the option tags for the dropdown using fetched data
    while (rs.next()) {
      int vendorId = rs.getInt("id");
      String vendorName = rs.getString("name");
%>
      <option value="<%= vendorId %>"><%= vendorName %></option>
<%
    }

    // Close the result set, statement, and connection
    rs.close();
    stmt.close();
    conn.close();
  } catch (Exception e) {
    e.printStackTrace();
  }
%>
            </select>
          </div>
          <div class="form-group">
            <label for="interest">Interest:</label>
            <select class="form-control" id="interest" name="interest">
              <option value="interior">Interior</option>
              <option value="bedroom">Bedroom</option>
              <option value="kitchen">Kitchen</option>
              <option value="garden">Garden</option>
              <option value="whole_home">Whole Home</option>
            </select>
          </div>
          <button type="submit" class="btn btn-primary">Submit</button>
        </form>
      </div>
    </div>
  </div>
</div>










  <div>
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card">
                <div class="card-header"><%-- <%= __("Search for vendors:") %> --%></div>

                <div class="card-body">
                    <form method="get" id="search-form">

							<div class="inputBox">
							<label for="category">Select category:</label>
				             <select name="category" id="category" class="custom-select custom-select-sm">
				                <option selected>All categories</option>
				                <option value="bedroom">Bedroom</option>
				                <option value="kitchen">Kitchen</option>
				                <option value="garden">Garden</option>
				                <option value="home interior">Home Interior</option>
				            </select>
                            
                        </div>



							<div class="inputBox">
						    <label for="city">City</label>
						    <select name="city" id="city" class="custom-select custom-select-sm">
									<option selected>Select a city</option>
									<option value="Mumbai">Mumbai</option>
									<option value="Pune">Pune</option>
									<option value="Nagpur">Nagpur</option>
									<option value="Thane">Thane</option>
									<option value="Nashik">Nashik</option>
									<option value="kalyan">Kalyan</option>
									<option value="surat">Surat</option>
									<!-- Add more cities here as per your requirement -->
						    </select>
						</div>



							<button type="submit" class="btn btn-primary" onclick="searchVendors()">Search</button>
                    </form>

                    <h2 class="mt-5"><%-- <%= __("Search Results") %> --%></h2>

                    <%
                    int cust_id =(Integer)session.getAttribute("customerId");

					String cust_name=(String)session.getAttribute("customerName");    		
                    
     response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0"); 

    // Get search parameters from the URL
    String category = request.getParameter("category");
    String city = request.getParameter("city");

    // Search for vendors based on the parameters
    List<VendorPOJO> vendors = VendorPOJO.search(category, city);

    // Display the results
    if (vendors != null && !vendors.isEmpty()) {
%> 
    <h4>Results:</h4>
   
    <ul>
     <%
        for (VendorPOJO vendor : vendors) {
        	
    %>
             <!-- <input type="hidden" name="vendorid" value="">
            <input type="hidden" name="vendorname" value=""> -->
         <a href="${pageContext.request.contextPath}/Vendor/vendor_uploaded_img.jsp?vendorid=<%= vendor.getId() %>&vendorname=<%= vendor.getName() %>&cust_id=<%= cust_id%>" class="list-group-item list-group-item-action" style="max-width:100px"><%= vendor.getName() %></a>

           
            
    <%
        }
    %> 
    
    </ul>
 <%
    } else {
%> 
    <center><p>No vendors found.</p></center>
 <%
    }
%>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- <div class="inputBox">
    <label for="rating">Rating:</label>
    <div class="rating">
        <input type="radio" name="rating" value="1"><i></i>
        <input type="radio" name="rating" value="2"><i></i>
        <input type="radio" name="rating" value="3"><i></i>
        <input type="radio" name="rating" value="4"><i></i>
        <input type="radio" name="rating" value="5"><i></i>
    </div>
</div> -->

<script>
function searchVendors() {
    // Get the search parameters from the form
    var category = document.getElementById("category").value;
    var city = document.getElementById("city").value;

    // Create a new XMLHttpRequest object
    var xhr = new XMLHttpRequest();

    // Set up the callback function for when the request is complete
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            // Get the search results from the response
            var results = xhr.responseText;

            // Display the search results in the div element
            document.getElementById("search-results").innerHTML = results;
        }
    };

    // Open the XMLHttpRequest object and make the request
    xhr.open("GET", "${pageContext.request.contextPath}/Vendor/searchVendors.jsp?category=" + category + "&city=" + city, true);
    xhr.send();
}

</script>

<!-- <script>
$(document).ready(function() {
    $('.rating input').on('change', function() {
        var rating = $(this).val();
        var vendorId = // get the vendor ID from the server-side code
        $.ajax({
            url: 'saveRating.jsp',
            type: 'POST',
            data: { rating: rating, vendorId: vendorId },
            success: function(data) {
                // handle success
            },
            error: function() {
                // handle error
            }
        });
    });
});
</script> -->
<br>
<br>
<br>
<form action="${pageContext.request.contextPath}/submit-rating" method="post" id="call">
<div class="container">
      <div class="post">
        <div class="text">Thanks for rating us!</div>
        <div class="edit">EDIT</div>
      </div>
       
      <div class="star-widget">
      	
        <input type="radio" name="rate" id="rate-5" value="5">
        <label for="rate-5" class="fas fa-star"></label>
        <input type="radio" name="rate" id="rate-4" value="4">
        <label for="rate-4" class="fas fa-star"></label>
        <input type="radio" name="rate" id="rate-3" value="3">
        <label for="rate-3" class="fas fa-star"></label>
        <input type="radio" name="rate" id="rate-2" value="2">
        <label for="rate-2" class="fas fa-star"></label>
        <input type="radio" name="rate" id="rate-1" value="1">
        <label for="rate-1" class="fas fa-star"></label>
       
          <header></header>
          <div class="textarea">
            <textarea cols="30" placeholder="Describe your experience.." name="comment"></textarea>
          </div>
          <div class="btn" id="btnnn">
            <button type="submit">Post</button>
          </div>
        
      </div>
    </div>
    </form>
    <script>
      const btn = document.querySelector("button");
      const post = document.querySelector(".post");
      const widget = document.querySelector(".star-widget");
      const editBtn = document.querySelector(".edit");
      btn.onclick = ()=>{
        widget.style.display = "none";
        post.style.display = "block";
        editBtn.onclick = ()=>{
          widget.style.display = "block";
          post.style.display = "none";
        }
        return false;
      }
    </script>
    
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Custom script -->
<script src="js/custom.js"></script>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

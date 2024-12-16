<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%-- <%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %> --%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="sample.Vendor" %>
<%@ page import="sample.VendorDetails" %>
<%@ page import="sample.HomeVisitPOJO" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>


<%
int vid = (Integer)session.getAttribute("vendorid");
String vname = (String)session.getAttribute("vendorname");

VendorDetails vendorDetails = new VendorDetails();

Vendor vendor = vendorDetails.getVendorDetails(vid);

byte[] profileImage =vendor.getProfileimg();
String PI = "";
if (profileImage != null) {
    PI = Base64.getEncoder().encodeToString(profileImage);
}
else{
	System.out.print("no profile");
}
%>

<!DOCTYPE html>
<html>
  <head>
<!--   <script>
    if (!sessionStorage.getItem("isLoggedIn")) {
        window.location.href = "vendor_dashboard.jsp";
    } else {
        sessionStorage.removeItem("isLoggedIn");
    }
</script> -->

  
    <title>Vendor Dashboard</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <style>
    	
      /* Custom CSS */
      body {
        background-color: #f1f1f1;
        font-family: Arial, sans-serif;
      }
      h1 {
        color: #343a40;
        text-align: center;
        margin-top: 50px;
      }
      p {
        font-size: 20px;
        color: #343a40;
        text-align: center;
        margin-top: 30px;
      }
      ul:not(.samadhan) {
        list-style: none;
        text-align: center;
        margin-top: 50px;
      }
      li:not(.samadhan) {
        margin-bottom: 10px;
      }
      a:not(.samadhan) {
        display: inline-block;
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        border-radius: 5px;
        text-decoration: none;
        transition: all 0.2s ease-in-out;
      }
      a:hover:not(.samadhan) {
        background-color: #0069d9;
      }
      .container {
        margin-top: 100px;
        text-align: center;
      }
      .row {
        margin-bottom: 50px;
      }
      .card {
        border-radius: 5px;
        border: none;
        transition: all 0.2s ease-in-out;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
      }
      .card:hover {
        transform: translateY(-5px);
        box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
      }
      .card-header {
        background-color: #007bff;
        color: #fff;
        border-radius: 5px 5px 0px 0px;
        padding: 20px;
      }
      .card-body {
        padding: 20px;
        text-align: center;
      }
      .btn {
        padding: 10px 20px;
        border-radius: 5px;
        text-decoration: none;
        transition: all 0.2s ease-in-out;
      }
      .btn-primary {
        background-color: #007bff;
        color: #fff;
        border: none;
      }
      .btn-primary:hover {
        background-color: #0069d9;
        color: #fff;
        border: none;
      }

		
	.navbar {
	  padding-top: 0.5rem;
	  padding-bottom: 0.5rem;
	  height: 60px;	  
	}
	
	.navbar-toggler {
	  margin-top: 0.25rem;
	  margin-bottom: 0.25rem;
	}
	
	.navbar-collapse {
	  margin-top: 0.25rem;
	  margin-bottom: 0.25rem;
	}
	
	.navbar-nav .nav-link {
	  padding-top: 0.25rem;
	  padding-bottom: 0.25rem;
	  height: 80px;
	  line-height: 6;			  
	}
	
	.navbar-nav .rounded-circle {
	  width: 35px;
	  height: 35px;
	  object-fit: cover;
	}

    </style>
   
  </head>
  
  <body>

<nav class="navbar navbar-dark bg-dark navbar-expand-sm">

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-list-4" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  <div class="collapse navbar-collapse" id="navbar-list-4">
    <ul class="navbar-nav samadhan">
    	<li class="nav-item samadhan">
        <a class="nav-link samadhan" style="color:white;">Dashboard</a>
     	 </li>
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle samadhan" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropd ownMenuLink">
          <a class="dropdown-item samadhan" href="update-profile-vendor.jsp">Edit Profile</a>
          <a class="dropdown-item samadhan" href="<%=request.getContextPath()%>/Logout">Log Out</a>
        </div>
      </li> 
      <li class="nav-item samadhan">
        <a class="nav-link samadhan" style="color:white;"><%= vname%></a>
      </li>
      <li class="nav-item">
        <a class="nav-link samadhan" href="#">Home</a>
      </li>
    
    </ul>
  </div>
</nav>
 
       <%-- <center>
      <a href="" class="btn-custom">Update Profile</a>
    </center> --%>		
    <div class="container">   	
      <p>These are available interior designs</p>
      <div class="row">
        <div class="col-md-3">
          <div class="card">
            <div class="card-header">
              <h5>Interior</h5>
            </div>
            <div class="card-body">
              <p>Upload your designs for home interior</p>
              <a href="#" class="btn btn-primary" onclick="redirectToPage('option1')">Manage Interior</a>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card">
            <div class="card-header">
            <h5>Kitchen</h5>
</div>
<div class="card-body">
<p>Upload your designs for kitchen</p>
<a href="#" class="btn btn-primary" onclick="redirectToPage('option2')">Manage kitchen Designs</a>
</div>
</div>
</div>
<div class="col-md-3">
<div class="card">
<div class="card-header">
<h5>Bedroom</h5>
</div>
<div class="card-body">
<p>Upload your designs for bedroom</p>
<a href="#" class="btn btn-primary" onclick="redirectToPage('option3')">Manage Bedroom Designs</a>
</div>
</div>
</div>
<div class="col-md-3">
<div class="card">
<div class="card-header">
<h5>Garden</h5>
</div>
<div class="card-body">
<p>Upload your designs for garden</p>
<a href="#" class="btn btn-primary" onclick="redirectToPage('option4')">Manage Garden Structure</a>
</div>
</div>
</div>
</div>
</div>

<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rss = null;
String sql = "SELECT name,phone,interest,email FROM vendor_form_submissions WHERE vendor_id = ?";
List<Map<String, String>> inquiries = new ArrayList<Map<String, String>>();
try {
  Class.forName("com.mysql.jdbc.Driver");
  String url = "jdbc:mysql://localhost:3306/interior_design";
  String dbUsername = "root";
  String dbPassword = "";
  conn = DriverManager.getConnection(url, dbUsername, dbPassword);
  pstmt = conn.prepareStatement(sql);
  pstmt.setInt(1, vid);
  rss = pstmt.executeQuery();
  while (rss.next()) {
    Map<String, String> inquiry = new HashMap<String, String>();
    inquiry.put("name", rss.getString("name"));
    inquiry.put("phone", rss.getString("phone"));
    inquiry.put("interest", rss.getString("interest"));
    inquiry.put("email", rss.getString("email"));
    inquiries.add(inquiry);
  }
} catch (ClassNotFoundException cnfe) {
  cnfe.printStackTrace();
} catch (SQLException sqle) {
  sqle.printStackTrace();
} finally {
  if (rss != null) {
    try {
      rss.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
  if (pstmt != null) {
    try {
      pstmt.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
  if (conn != null) {
    try {
      conn.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
}
%>

<div class="container">
  <div class="row">
    <div class="col">
      <center>
        <a href="${pageContext.request.contextPath}/Admin/manage-reviews.jsp">Click here to see reviews</a>
      </center>
    </div>
    <div class="col">
      <center>
		<button type="button" class="btn btn-success" data-toggle="modal" data-target="#homeVisitModal">home visit requests</button> 
	  </center>
    </div>
    <div class="col">
      <center>
        <a href="image_or_video_for_customer.jsp">Manage customer designs</a>       
      </center>
    </div>
  </div>
</div>





<%
    // Define the database connection parameters
    String url = "jdbc:mysql://localhost:3306/interior_design";
    String username = "root";
    String password = "";

    // Create a list to store the home visit data
    List<HomeVisitPOJO> homeVisits = new ArrayList<>();

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Create a database connection
        Connection connn = DriverManager.getConnection(url, username, password);
		
        // Execute the query to fetch home visit data
        String sqll = "SELECT name, address, email, contact, interest FROM homevisit where vendor_id= ?";
        // Create a statement to execute the SQL query
        PreparedStatement stmtt = connn.prepareStatement(sqll);
		stmtt.setInt(1,vid);
       
       
        ResultSet rs = stmtt.executeQuery();

        // Iterate over the result set and populate the homeVisits list
        while (rs.next()) {
            String name = rs.getString("name");
            String address = rs.getString("address");
            String email = rs.getString("email");
            String contact = rs.getString("contact");
            String interest = rs.getString("interest");

            HomeVisitPOJO homeVisit = new HomeVisitPOJO(name, address, email, contact, interest);
            homeVisits.add(homeVisit);
        }

        // Close the result set, statement, and connection
        rs.close();
        stmtt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<div class="modal fade" id="homeVisitModal" tabindex="-1" role="dialog" aria-labelledby="homeVisitModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="homeVisitModalLabel">Home Visit Data</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Address</th>
                                <th>Email</th>
                                <th>Contact</th>
                                <th>Interest</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%-- Iterate over the home visit data and display it in the table --%>
                            <% if (!homeVisits.isEmpty()) { %>
                                <% for (HomeVisitPOJO homeVisit : homeVisits) { %>
                                    <tr>
                                        <td><%= homeVisit.getName() %></td>
                                        <td><%= homeVisit.getAddress() %></td>
                                        <td><%= homeVisit.getEmail() %></td>
                                        <td><%= homeVisit.getContact() %></td>
                                        <td><%= homeVisit.getInterest() %></td>
                                    </tr>
                                <% } %>
                            <% } else { %>
                                <tr>
                                    <td colspan="5">No home visit data available</td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
    
    
    


<p>Here are your inquiries:</p>
      <table class="table table-striped">
  <thead>
    <tr>
      <th>Name</th>
      <th>Phone</th>
      <th>Interest</th>
      <th>Email</th>
      <th>Contact</th>
    </tr>
  </thead>
  <tbody>
    <% for (Map<String, String> inquiry : inquiries) { %>
    <tr>
      <td><%= inquiry.get("name") %></td>
      <td><%= inquiry.get("phone") %></td>
      <td><%= inquiry.get("interest") %></td>
      <td><%= inquiry.get("email") %></td>
      <td><a href="#" class="btn-custom">Contact</a></td>
    </tr>
    <% } %>
  </tbody>
</table>



<script>
  function redirectToPage(option) {
    switch (option) {
      case 'option1':
        window.location.href = '/interior-design/vendor-update-interior.jsp';
        break;
      case 'option2':
        window.location.href = '/interior-design/vendor-update-kitchen.jsp';
        break;
      case 'option3':
        window.location.href = '/interior-design/vendor-update-bedroom.jsp';
        break;
      case 'option4':
        window.location.href = '/interior-design/vendor-update-garden.jsp';
        break;
      default:
        break;
    }
  }
</script>


  </body>
</html> 

 
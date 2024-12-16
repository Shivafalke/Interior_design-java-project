<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sample.Vendor1,java.util.*" %>
<%@ page import="sample.VendorDetails" %>
<%
String query = request.getParameter("query");
VendorDetails vd = new VendorDetails();

// Perform the database query to fetch matching vendors
// Replace this code with your actual database query logic
List<Vendor1> vendors = vd.performSearchQuery(query);
%>

<% for (Vendor1 vendor : vendors) { %>
  <div class="vendor-profile card mb-3">
    <div class="row no-gutters">
      <div class="col-md-3">
        <% byte[] profileImage = vendor.getProfileimg();
        String profileImageBase64 = "";
        if (profileImage != null) {
          profileImageBase64 = Base64.getEncoder().encodeToString(profileImage);
        }
        if (profileImageBase64.isEmpty()) { %>
          <img class="profile-image card-img" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
            alt="No Profile">
        <% } else { %>
          <img class="profile-image card-img" src="data:image/jpeg;base64,<%= profileImageBase64 %>" alt="Profile Image">
        <% } %>
      </div>
      <div class="col-md-9">
        <div class="card-body">
          <% int vid = vendor.getId(); %>
          <h5 class="card-title"><%= vendor.getName() %></h5>
          <p class="card-text">Category: <%= vendor.getCategory() %></p>
          <p class="card-text">City: <%= vendor.getCity() %></p>
          <button class="btn btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/Vendor/vendor_uploaded_img.jsp?vendorid=<%= vendor.getId() %>&vendorname=<%= vendor.getName() %>'">View Profile</button>
          <!-- Add more vendor profile details here -->
        </div>
      </div>
    </div>
  </div>
<% } %>

<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="sample.Vendor1,java.util.*" %>
<%@ page import="sample.VendorDetails" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vendor Search Results</title>
<!-- Add CSS links for styling -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
  /* Add custom styles here */
  .vendor-profile {
    /* Add vendor profile styles */
  }
  .profile-image {
    /* Add profile image styles */
  }
  	 body {
    background-color: #3A3B3C; /* Replace with desired color */
  }
   
</style>
</head>
<body>
<%
// Retrieve the search query parameter
String query = request.getParameter("query");
VendorDetails vd = new VendorDetails();
session.setAttribute("value", "1");

// Perform the database query to fetch matching vendors
// Replace this code with your actual database query logic
List<Vendor1> vendors = vd.performSearchQuery(query);

%>

<div class="container">
  <h1 style="color: white">Vendors - <%= query %></h1>

  <% for (Vendor1 vendor : vendors) {
    byte[] profileImage = vendor.getProfileimg();
    String profileImageBase64 = "";
    if (profileImage != null) {
      profileImageBase64 = Base64.getEncoder().encodeToString(profileImage);
    }
  %>
    <div class="vendor-profile card mb-3">
      <div class="row no-gutters">
        <div class="col-md-3">
          <%
          if (profileImageBase64.isEmpty()) {
          %>
          <img class="profile-image card-img" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
            alt="No Profile">
          <%
          } else {
          %>
          <img class="profile-image card-img" src="data:image/jpeg;base64,<%= profileImageBase64 %>" alt="Profile Image">
          <%
          }
          %>
        </div>
        <div class="col-md-9">
          <div class="card-body">
          	<%int vid =vendor.getId(); %>
            <h5 class="card-title"><%= vendor.getName() %></h5>
            <p class="card-text">Category: <%= vendor.getCategory() %></p>
            <p class="card-text">City: <%= vendor.getCity() %></p>
			<button class="btn btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/Vendor/vendor_uploaded_img.jsp?vendorid=<%= vendor.getId() %>&vendorname=<%= vendor.getName() %>'">View Profile</button>
            <!-- Add more vendor profile details here -->
          </div>
        </div>
      </div>
    </div>
  <% } %>

 
</div>

<!-- Add JS scripts if needed -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
 --%>
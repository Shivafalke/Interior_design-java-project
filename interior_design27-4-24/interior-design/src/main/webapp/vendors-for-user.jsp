<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Vendor List</title>
	<!-- Add Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- Add custom CSS -->
	<style>
		body {
			background-image: url("spacejoy-9M66C_w_ToM-unsplash.jpg");
			background-repeat: no-repeat;
			background-size: cover;
			background-position: center;
			color: #ffffff;
		}
		h1,h3 {
			text-align: center;
			margin-top: 50px;
		}
		.vendor-list {
			margin-top: 50px;
			text-align: center;
		}
		.container {
 			 height: 100vh;
			}
		.vendor-name {
			margin: 10px;
			padding: 10px;
			background-color: #ffffff;
			border-radius: 5px;
			display: inline-block;
			font-size: 20px;
			font-weight: bold;
			cursor: pointer;
			transition: all 0.3s ease;
		}
		.vendor-name:hover {
			background-color: #dddddd;
			box-shadow: 2px 2px 5px #888888;
		}
	</style>
</head>
<body>
	<div class="container">
		<h1>Vendors</h1>
		<h3>Check Designs</h3>
		
		<div class="vendor-list">
				<%
				// Set up database connection
				String url = "jdbc:mysql://localhost:3306/interior_design";
				String username = "root";
				String password = "";
				Connection conn = DriverManager.getConnection(url, username, password);
				
				// Retrieve vendor names from database
				String query = "SELECT name,id FROM vendor_login";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				
				// Display vendor names on page
				while (rs.next()) {
					String vendorName = rs.getString("name");
					int v_id=rs.getInt("id");
					out.println("<a href=\"Vendor/vendor_uploaded_img.jsp?vendorid=" + v_id + "&vendorname=" + vendorName + "\">" + 
						"<div class=\"vendor-name\">" + vendorName + "</div>" +
					"</a>");
				}
				
				// Clean up database connection
				rs.close();
				stmt.close();
				conn.close();
			%>
		</div>
		
	</div>
	
	<!-- Add Bootstrap JS -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
    
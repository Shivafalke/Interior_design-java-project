<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>All Inquiries</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<style>
		/* Custom CSS */
		body {
			background-color: #f8f9fa; 
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
		table {
			margin-top: 50px;
			margin-bottom: 50px;
			border-collapse: collapse;
			width: 80%;
			margin: 0 auto;
		}
		th, td {
			padding: 8px;
			text-align: left;
			border-bottom: 1px solid #ddd;
		}
		th {
			background-color: #007bff;
			color: white;
		}
		.btn-custom {
			display: inline-block;
			padding: 10px 20px;
			background-color: grey;
			color: #fff;
			border-radius: 5px;
			text-decoration: none;
			transition: all 0.2s ease-in-out;
		}
		.btn-custom:hover {
			background-color: #0069d9;
		}
	</style>
</head>
<body>
	<div class="container">
		<h1>All Inquiries</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Vendor Name</th>
					<th>Inquiry Name</th>
					<th>Phone</th>
					<th>Interest</th>
					<th>Email</th>
					<th>Contact</th>
				</tr>
			</thead>
			<tbody>
				<%
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = "SELECT vendor_name,name,email,phone,interest from vendor_form_submissions";
					try {
						Class.forName("com.mysql.jdbc.Driver");
						String url = "jdbc:mysql://localhost:3306/interior_design";
						String dbUsername = "root";
						String dbPassword = "";
						conn = DriverManager.getConnection(url, dbUsername, dbPassword);
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						while (rs.next()) {
				%>
				<tr>
					<td><%= rs.getString("vendor_name") %></td>
					<td><%= rs.getString("name") %></td>
					<td><%= rs.getString("phone") %></td>
					<td><%= rs.getString("interest") %></td>
					<td><%= rs.getString("email") %></td>
					<td><a href="#" class="btn-custom">Contact</a></td>
					</tr>
				<%
						}
					} catch (SQLException e) {
						e.printStackTrace();
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					} finally {
						try {
							if (rs != null) {
								rs.close();
							}
							if (pstmt != null) {
								pstmt.close();
							}
							if (conn != null) {
								conn.close();
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>
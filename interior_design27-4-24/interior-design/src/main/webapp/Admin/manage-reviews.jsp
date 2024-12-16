<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>

	<title>Manage Reviews</title>
	<%
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/interior_design", "root", "");
			stmt = con.createStatement();
			rs = stmt.executeQuery("SELECT * FROM ratings");
			while (rs.next()) {
				int id = rs.getInt("id");
				int rating = rs.getInt("rating");
				String comment = rs.getString("comment");
				String customerId = rs.getString("customerId");
				String customerName = rs.getString("customerName");
	%>
	<style>
		.review {
			margin-bottom: 20px;
			border: 1px solid #ccc;
			padding: 10px;
		}
		.rating-bar {
			background-color: #f2f2f2;
			height: 20px;
			border-radius: 10px;
			overflow: hidden;
		}
		.rating-bar-fill {
			background-color: #4caf50;
			height: 100%;
			width: <%=(rating * 20)%>%;
		}
		.rating-bar-container {
			display: flex;
			align-items: center;
			font-size: 16px;
		}
		.rating-bar {
			display: inline-block;
			position: relative;
			width: 100px;
			height: 20px;
			background-color: #ddd;
			margin-right: 10px;
		}
		.bar {
			position: absolute;
			top: 0;
			left: 0;
			height: 100%;
			background-color: #f9ca24;
		}
		.rating-value {
			font-weight: bold;
		}
	</style>
</head>
<body>
<!-- 	<h1>Manage Reviews</h1> -->
	
	<div class="review">
		<p><strong><%=customerName%></strong> (Customer ID: <%=customerId%>)</p>
		<div class="rating-bar">
			<div class="rating-bar-fill" style="width: <%=rating*20%>%"></div>
		</div>
		<p><%=comment%></p>
	</div>
	<%
			}
		} catch (ClassNotFoundException e) {
			out.println("Class not found: " + e.getMessage());
		} catch (SQLException e) {
			out.println("SQL Exception: " + e.getMessage());
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				out.println("SQL Exception: " + e.getMessage());
			}
		}
	%>
</body>
</html>
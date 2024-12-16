<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
    <title>Customers</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
    	body {
			    
			    background-size: cover;
			    font-family: 'Open Sans', sans-serif;
			    font-size: 16px;
			    line-height: 1.5;
			    color: #333333;
			}
    	
        table {
            border-collapse: collapse;
            width: 90%;
            border-radius: 5px;
    		overflow: hidden;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        th {
            background-color: #343a40;
            color: white;
        }
		 .btn {
            border-radius: 5px;
            overflow: hidden;
        }

        .btn- button {
            border: none;
            outline: none;
            padding: 10px 20px;
            
            font-size: 18px;
            cursor: pointer;
        }

        .btn button:hover {
            background-color: white;
            color: black;
        }

        .btn button.active {
            background-color: #28a745;
            color: white;
        }
        .btn {
            border-radius: 5px;
            margin-right: 5px;
          	
        }
    

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        body {
            font-size: medium;
        }
    </style>
</head>
<body>
<%
    // Define the database connection variables
    Connection conn = null;
	PrintWriter oup = response.getWriter();
    Statement stmt = null;
    ResultSet rs = null;
    String query = "SELECT id,name,email FROM cust_login";
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/interior_design", "root", "");
        stmt = conn.createStatement();
        rs = stmt.executeQuery(query);

        // Check if the ResultSet object is not null
        if (rs != null) {
            %>
            <div class="container mt-3">
                <center><h1>Customers</h1></center>
                <hr>
                <table>
                    <tr>
                        <th>Name</th>
                        
                        <th>Email</th>
                        <th>Action</th>
                    </tr>
                    <%
                    while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getString("name") %></td>
                        
                        <td><%= rs.getString("email") %></td>
                        
                        <td>
                        <div class="btn">
                             
                            <button onclick="DeleteCust('<%= rs.getInt("id") %>')" class="btn btn-danger">Delete</button> 
                           </div>
                        </td>
                    </tr>
                    <% } %>
                </table>
            </div>
            <%
        } else {
            // Handle the case when no data is retrieved
        	PrintWriter out1 = response.getWriter();
            String message="No customers found at this movement..!";
            out1.println("<script>alert('" + message + "');window.location.href='Admin/admin_dashboard.jsp';</script>");
        }
    } catch (Exception e) {
        // Print the exception stack trace to the console
        e.printStackTrace();
    } finally {
        // Close the database connection objects
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();}%>
<script>
    function DeleteCust(id) {
        window.location.href = "DeleteCustServlet?id=" + id;
    }

    
</script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>


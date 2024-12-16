<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>
<!DOCTYPE html>
<html>
<head>
    <title>New Vendor Requests</title>
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
            width: 100%;
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
		 .btn-group {
            border-radius: 5px;
            overflow: hidden;
        }

        .btn-group button {
            border: none;
            outline: none;
            padding: 10px 20px;
            
            font-size: 18px;
            cursor: pointer;
        }

        .btn-group button:hover {
            background-color: white;
            color: black;
        }

        .btn-group button.active {
            background-color: #28a745;
            color: white;
        }
        .btn {
            border-radius: 5px;
            margin-right: 5px;
          	
        }
    
        .btn-group-success {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-group-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        body {
            font-size: medium;
        }
    </style>
</head>
<body>
<br>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <center><div class="btn-group">
             <button onclick="openModal()" class="btn btn-info">All Vendors</button>
 </div>
  <div class="btn-group">
             <button onclick="openModal1()" class="btn btn-info">All Customers</button>
 </div></center>
 
<%
    // Define the database connection variables
    Connection conn = null;
	PrintWriter oup = response.getWriter();
    Statement stmt = null;
    ResultSet rs = null;
    ResultSet rs2 = null;
    ResultSet rs3 = null;
    String query = "SELECT * FROM new_vendors where status='pending' OR status IS NULL";
    
    String query2 = "SELECT * FROM new_vendors";
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/interior_design", "root", "");
        stmt = conn.createStatement();
        rs2=stmt.executeQuery(query2);
        rs = stmt.executeQuery(query);

        // Check if the ResultSet object is not null
        if (rs != null) {
            %>
            <div class="container mt-3">
                <center><h1>New Vendor Requests</h1></center>
                <hr>
                <table>
                    <tr>
                        <th>Name</th>
                        <th>Address</th>
                        <th>City</th>
                        <th>State</th>
                        <th>Zip Code</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Description</th>
                        <th>Category</th>
                        <!-- <th>Status</th> -->
                        <th>Action</th>
                    </tr>
                    <%
                    while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("address") %></td>
                        <td><%= rs.getString("city") %></td>
                        <td><%= rs.getString("state") %></td>
                        <td><%= rs.getString("zip_code") %></td>
                        <td><%= rs.getString("phone") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getString("description") %></td>
                        <td><%= rs.getString("category") %></td>
                        <%-- <td><%= rs.getString("status") %></td> --%>
                        <td>
                        <div class="btn-group">
                             <button onclick="approveRequest('<%= rs.getInt("id") %>')" class="btn btn-success">Approve</button>
                            <button onclick="rejectRequest('<%= rs.getInt("id") %>')" class="btn btn-danger">Reject</button> 
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
            String message="No requests found at this movement..!";
            out1.println("<script>alert('" + message + "');window.location.href='Admin/admin_dashboard.jsp';</script>");
        }
    } catch (Exception e) {
        // Print the exception stack trace to the console
        e.printStackTrace();
    } 
        %>
        
<!--      for vendors   -->   
   <div id="detailsModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Vendor Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <% try {

        stmt = conn.createStatement();
        rs2=stmt.executeQuery(query2);
       

        // Check if the ResultSet object is not null
        if (rs2 != null) {
            %>
            <div class="container mt-3">
            <div class="table-responsive"> <!-- Add this wrapper div -->
                <table class="table"> <!-- Add the "table" class -->
                    <tr>
                        <th>Name</th>
                        <th>Address</th>
                        <th>City</th>
                        <th>State</th>
                        <th>Zip Code</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Description</th>
                        <th>Category</th>
                        <th>status</th>
                        <!-- <th>Status</th> -->
                    </tr>
                    <% while (rs2.next()) { %>
                    <tr>
                        <td><%= rs2.getString("name") %></td>
                        <td><%= rs2.getString("address") %></td>
                        <td><%= rs2.getString("city") %></td>
                        <td><%= rs2.getString("state") %></td>
                        <td><%= rs2.getString("zip_code") %></td>
                        <td><%= rs2.getString("phone") %></td>
                        <td><%= rs2.getString("email") %></td>
                        <td><%= rs2.getString("description") %></td>
                        <td><%= rs2.getString("category") %></td>
                         <td><%= rs2.getString("status") %></td>
                        <td></td>
                    </tr>
                    <% } %>
                </table>
            </div>
        </div>
        
            <%
        } else {
            // Handle the case when no data is retrieved
        	PrintWriter out1 = response.getWriter();
            String message="No Vendors";
            out1.println(message);
        }
    } catch (Exception e) {
        // Print the exception stack trace to the console
        e.printStackTrace();
    }
        %>
          
        </div>
    </div>
</div>
</div>



<!-- for customers -->
<div id="detailsModal1" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Customer Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <% String query3 = "SELECT * FROM cust_login"; try {
                    
                    stmt = conn.createStatement();
                    rs3 = stmt.executeQuery(query3);

                    // Check if the ResultSet object is not null
                    if (rs3 != null) {
                        %>
                        <div class="container mt-3">
                            <div class="table-responsive"> <!-- Add this wrapper div -->
                                <table class="table"> <!-- Add the "table" class -->
                                    <tr>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Address</th>
                                        
                                        <th>Phone</th>
                                    </tr>
                                    <% while (rs3.next()) { %>
                                    <tr>
                                        <td><%= rs3.getString("name") %></td>
                                        <td><%= rs3.getString("email") %></td>
                                        <td><%= rs3.getString("address") %></td>
                                        
                                        <td><%= rs3.getString("phone") %></td>
                                    </tr>
                                    <% } %>
                                </table>
                            </div>
                        </div>
                        <%
                    } else {
                        // Handle the case when no data is retrieved
                        PrintWriter out1 = response.getWriter();
                        String message = "No customers";
                        out1.println(message);
                    }
                } catch (Exception e) {
                    // Print the exception stack trace to the console
                    e.printStackTrace();
                }
                %>
            </div>
        </div>
    </div>
</div>



<script>
    function approveRequest(id) {
        window.location.href = "ApproveRequestServlet?id=" + id;
    }

    function rejectRequest(id) {
        window.location.href = "RejectVendorRequestServlet?id="+ id;
    }

 function openModal() {
	    // Show the modal
	    $("#detailsModal").modal("show");
	}
 function openModal1() {
	    // Show the modal
	    $("#detailsModal1").modal("show");
	}
</script> 


<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>


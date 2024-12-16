<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="sample.VendorPOJO" %>
<%@ page import="java.util.List" %>
<%
    // Get search parameters from the URL
    String category = request.getParameter("category");
    String city = request.getParameter("city");

    // Search for vendors based on the parameters
    List<VendorPOJO> vendors = VendorPOJO.search(category, city);

    // Display the results
    if (vendors != null && !vendors.isEmpty()) {
%> 
    <h2>Results:</h2>
    <ul>
     <%
        for (VendorPOJO vendor : vendors) {
    %>
            <li><%= vendor.getName() %></li>
    <%
        }
    %> 
    </ul>
 <%
    } else {
%> 
    <p>No vendors found.</p>
 <%
    }
%>
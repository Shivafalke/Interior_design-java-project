package sample;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class VendorDetails {
	 private static final String DB_URL = "jdbc:mysql://localhost:3306/interior_design";
	    private static final String DB_USERNAME = "root";
	    private static final String DB_PASSWORD = "";
	    
	    public Vendor getVendorDetails(int VendorId) {
	        Vendor vendor = null;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultSet = null;

	        try {
	            // Create a database connection
	            connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

	            // Prepare the SQL statement to retrieve user details
	            String query ="SELECT vl.city, vl.email, vl.password, vl.profile_img, nv.phone, nv.address " +
	                       "FROM vendor_login vl " +
	                       "JOIN new_vendors nv ON vl.id = nv.vendor_id " +
	                       "WHERE vl.id = ? AND nv.status = 'approved'";
	            statement = connection.prepareStatement(query);
	            statement.setInt(1, VendorId);

	            // Execute the query
	            resultSet = statement.executeQuery();

	            // If a user with the given ID exists, retrieve the details
	            if (resultSet.next()) {
	                vendor = new Vendor();
	                vendor.setEmail(resultSet.getString("email"));
	                vendor.setPassword(resultSet.getString("password"));
	                vendor.setCity(resultSet.getString("city"));					
					vendor.setPhone(resultSet.getString("phone"));
					vendor.setAddress(resultSet.getString("address"));
					
					if(resultSet.getBytes("profile_img")!=null) {
					vendor.setProfileimg(resultSet.getBytes("profile_img"));
	               
	                } else {
	                    vendor.setProfileImageText("No profile");
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            // Handle any errors that occurred during the database operations
	        } finally {
	            // Close the database resources
	            if (resultSet != null) {
	                try {
	                    resultSet.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
	            if (statement != null) {
	                try {
	                    statement.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
	            if (connection != null) {
	                try {
	                    connection.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
	        }

	        return vendor;
	    }
	    
	    public Customer getCustomerDetails(int CustomerId) {
	        Customer cust = null;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultSet = null;

	        try {
	            // Create a database connection
	            connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

	            // Prepare the SQL statement to retrieve user details
	            String query ="select email,password,phone,address,profile_image from cust_login where id=?";
	            statement = connection.prepareStatement(query);
	            statement.setInt(1, CustomerId);

	            // Execute the query
	            resultSet = statement.executeQuery();

	            // If a user with the given ID exists, retrieve the details
	            if (resultSet.next()) {
	                cust = new Customer();
	                cust.setEmail(resultSet.getString("email"));
	                cust.setPassword(resultSet.getString("password"));					
	                cust.setPhone(resultSet.getString("phone"));
	                cust.setAddress(resultSet.getString("address"));
					
					if(resultSet.getBytes("profile_image")!=null) {
					cust.setProfileimg(resultSet.getBytes("profile_image"));
	               
	                } else {
	                	cust.setProfileImageText("No profile");
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            // Handle any errors that occurred during the database operations
	        } finally {
	            // Close the database resources
	            if (resultSet != null) {
	                try {
	                    resultSet.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
	            if (statement != null) {
	                try {
	                    statement.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
	            if (connection != null) {
	                try {
	                    connection.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
	        }

	        return cust;
	    }
	
	    public List<Vendor1> performSearchQuery(String query) {
	        List<Vendor1> vendors = new ArrayList<>();

	        try {
	            // Create a connection to the database
	            Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

	            // Prepare the SQL query
	            String sql = "SELECT * FROM vendor_login WHERE city LIKE ?";
	            PreparedStatement stmt = conn.prepareStatement(sql);

	            // Set the search query parameter
	            stmt.setString(1, "%" + query + "%");

	            // Execute the query and retrieve the results
	            ResultSet rs = stmt.executeQuery();

	            // Process the results
	            while (rs.next()) {
	                Vendor1 vendor = new Vendor1();
	                
	                vendor.setName(rs.getString("name"));
	                vendor.setCategory(rs.getString("category"));
	                vendor.setCity(rs.getString("city"));
	                vendor.setId(rs.getInt("id"));
	                vendor.setProfileimg(rs.getBytes("profile_img"));
	                // Set other vendor properties as needed
	                vendors.add(vendor);
	            }

	            // Close the resources
	            rs.close();
	            stmt.close();
	            conn.close();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }

	        return vendors;
	    }
	
}

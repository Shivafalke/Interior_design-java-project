package sample;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class VendorPOJO {
	
		private int id;
	


		public void setId(int id) {
			this.id = id;
		}


		public void setName(String name) {
			this.name = name;
		}


		public void setCategory(String category) {
			this.category = category;
		}


		public void setCity(String city) {
			this.city = city;
		}

		private String name;
	    private String category;
	    private String city;
	    

	    public VendorPOJO() {
			super();
		}


		public VendorPOJO(int id,String name, String category, String city) {
			 this.id = id; 
	        this.name = name;
	        this.category = category;
	        this.city = city;
	    }

		
		  public int getId() {
			  return id;
			  }
		 

	    public String getName() {
	        return name;
	    }

	    public String getCategory() {
	        return category;
	    }

	    public String getCity() {
	        return city;
	    }
	  

	    public static List<VendorPOJO> search(String category, String city) {
	        List<VendorPOJO> vendors = new ArrayList<VendorPOJO>();
	        Connection conn = null;
	        PreparedStatement stmt = null;
	        ResultSet rs = null;
	        try {
	            // Establish database connection
	            Class.forName("com.mysql.jdbc.Driver");
	            String url = "jdbc:mysql://localhost/interior_design";
	            String user = "root";
	            String password = "";
	            conn = DriverManager.getConnection(url, user, password);
	            
	            // Prepare the SQL statement
	            String sql = "SELECT * FROM vendor_login WHERE category LIKE ? AND city = ?";            

	            stmt = conn.prepareStatement(sql);
	            stmt.setString(1,  "%" + category + "%");
	            stmt.setString(2, city);
	            
	            // Execute the query and get the result set
	            rs = stmt.executeQuery();
	            
	            // Loop through the result set and create Vendor objects
	            while (rs.next()) {
					
					int id = rs.getInt("id");
				  	String name = rs.getString("name");
	                String categoryResult = rs.getString("category");
	                String cityResult = rs.getString("city");
	                VendorPOJO vendor = new VendorPOJO(id,name, categoryResult, cityResult);
	                vendors.add(vendor);
	            }
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            // Close the resources
	            try {
	                if (rs != null) rs.close();
	                if (stmt != null) stmt.close();
	                if (conn != null) conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        return vendors;
	    }
	    
	   
	}



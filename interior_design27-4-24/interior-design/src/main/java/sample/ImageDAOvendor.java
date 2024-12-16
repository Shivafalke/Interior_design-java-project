package sample;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpSession;

public class ImageDAOvendor {
	  private Connection connection;

	    public ImageDAOvendor() {
	        try {
	            // Get a database connection from your connection pool
	            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/interior_design", "root", "");
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    public void deleteImageInterior(String nm) {
	        try {
	            Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/interior_design", "root", "");
	            PreparedStatement stmt = conn.prepareStatement("DELETE FROM vendor_interior_images WHERE title = ?");
	            stmt.setString(1, nm);
	            stmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    public void deleteImagekitchen(String nm) {
	        try {
	            Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/interior_design", "root", "");
	            PreparedStatement stmt = conn.prepareStatement("DELETE FROM kitchen_images WHERE name = ?");
	            stmt.setString(1, nm);
	            stmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    public void deleteImagegarden(String nm) {
	        try {
	            Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/interior_design", "root", "");
	            PreparedStatement stmt = conn.prepareStatement("DELETE FROM garden_images WHERE name = ?");
	            stmt.setString(1, nm);
	            stmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    public void deleteImagebedroom(String nm) {
	        try {
	            Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/interior_design", "root", "");
	            PreparedStatement stmt = conn.prepareStatement("DELETE FROM bedroom_images WHERE name = ?");
	            stmt.setString(1, nm);
	            stmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	   
	    
	    public List<MyImage> getAllImagesDatakitchen() {
	        List<MyImage> images = new ArrayList<MyImage>();
	        try {
	            // Prepare the SQL query to retrieve only the "data" column from images
	            String sql = "SELECT data,name FROM kitchen_images";
	            PreparedStatement stmt = connection.prepareStatement(sql);
	            
	            // Execute the query and get the results
	            ResultSet rs = stmt.executeQuery();
	            
	            // Iterate through the results and add each image to the list
	            while (rs.next()) {
	                MyImage image = new MyImage();
	                image.setData(rs.getBytes("data"));
	                image.setTitle(rs.getString("name"));
	                images.add(image);
	            }
	            
	            // Close the result set and statement
	            rs.close();
	            stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return images;
	    }
	    
	    public List<MyImage> getAllImagesDatabedroom() {
	        List<MyImage> images = new ArrayList<MyImage>();
	        try {
	            // Prepare the SQL query to retrieve only the "data" column from images
	            String sql = "SELECT data,name FROM bedroom_images";
	            PreparedStatement stmt = connection.prepareStatement(sql);
	            
	            // Execute the query and get the results
	            ResultSet rs = stmt.executeQuery();
	            
	            // Iterate through the results and add each image to the list
	            while (rs.next()) {
	                MyImage image = new MyImage();
	                image.setData(rs.getBytes("data"));
	                image.setTitle(rs.getString("name"));
	                images.add(image);
	            }
	            
	            // Close the result set and statement
	            rs.close();
	            stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return images;
	    }
	    
	    public List<MyImage> getAllImagesDatagarden() {
	        List<MyImage> images = new ArrayList<MyImage>();
	        try {
	            // Prepare the SQL query to retrieve only the "data" column from images
	            String sql = "SELECT data,name FROM garden_images";
	            PreparedStatement stmt = connection.prepareStatement(sql);
	            
	            // Execute the query and get the results
	            ResultSet rs = stmt.executeQuery();
	            
	            // Iterate through the results and add each image to the list
	            while (rs.next()) {
	                MyImage image = new MyImage();
	                image.setData(rs.getBytes("data"));
	                image.setTitle(rs.getString("name"));
	                images.add(image);
	            }
	            
	            // Close the result set and statement
	            rs.close();
	            stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return images;
	    }
	    
	    
	    //---------------------------------------------for vendors-----------------------------------------------------------------
	    
	    public List<MyImage> getAllImagesDataInterior(int vendorId) {
	           
	        List<MyImage> images = new ArrayList<MyImage>();
	        try {
	        	String sql = "SELECT title, image_data FROM vendor_interior_images WHERE vendor_id = ?";
	            PreparedStatement stmt = connection.prepareStatement(sql);
	            stmt.setInt(1, vendorId);
	            
	            // Execute the query and get the results
	            ResultSet rs = stmt.executeQuery();
	            
	            // Iterate through the results and add each image to the list
	            while (rs.next()) {
	                MyImage image = new MyImage();
	                image.setData(rs.getBytes("image_data"));
	                image.setTitle(rs.getString("title"));
	                images.add(image);
	            }
	            
	            // Close the result set and statement
	            rs.close();
	            stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return images;
	    }
	    
	    public List<MyImage> getAllImagesDataInterior() {
	           
	        List<MyImage> images = new ArrayList<MyImage>();
	        try {
	        	String sql = "SELECT title, image_data FROM vendor_interior_images";
	            PreparedStatement stmt = connection.prepareStatement(sql);
	          
	            
	            // Execute the query and get the results
	            ResultSet rs = stmt.executeQuery();
	            
	            // Iterate through the results and add each image to the list
	            while (rs.next()) {
	                MyImage image = new MyImage();
	                image.setData(rs.getBytes("image_data"));
	                image.setTitle(rs.getString("title"));
	                images.add(image);
	            }
	            
	            // Close the result set and statement
	            rs.close();
	            stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return images;
	    }
	    
	    public List<MyImage> getAllImagesDatakitchenVendors(int vendorId) {
	        List<MyImage> images = new ArrayList<MyImage>();
	        try {
	            // Prepare the SQL query to retrieve only the "data" column from images
	            String sql = "SELECT title, image_data FROM vendor_kitchen_images WHERE vendor_id = ?";
	            PreparedStatement stmt = connection.prepareStatement(sql);
	            stmt.setInt(1, vendorId);
	            // Execute the query and get the results
	            ResultSet rs = stmt.executeQuery();
	            
	            // Iterate through the results and add each image to the list
	            while (rs.next()) {
	                MyImage image = new MyImage();
	                image.setData(rs.getBytes("image_data"));
	                image.setTitle(rs.getString("title"));
	                images.add(image);
	            }
	            
	            // Close the result set and statement
	            rs.close();
	            stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return images;
	    }
	    public List<MyImage> getAllImagesDatakitchenVendors() {
	        List<MyImage> images = new ArrayList<MyImage>();
	        try {
	            // Prepare the SQL query to retrieve only the "data" column from images
	            String sql = "SELECT title, image_data FROM vendor_kitchen_images";
	            PreparedStatement stmt = connection.prepareStatement(sql);
	            
	            // Execute the query and get the results
	            ResultSet rs = stmt.executeQuery();
	            
	            // Iterate through the results and add each image to the list
	            while (rs.next()) {
	                MyImage image = new MyImage();
	                image.setData(rs.getBytes("image_data"));
	                image.setTitle(rs.getString("title"));
	                images.add(image);
	            }
	            
	            // Close the result set and statement
	            rs.close();
	            stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return images;
	    }
	    
	    
	    public List<MyImage> getAllImagesDataVendorBedroom(int vendorId) {
	           
	        List<MyImage> images = new ArrayList<MyImage>();
	        try {
	        	String sql = "SELECT title, image_data FROM vendor_bedroom_images WHERE vendor_id = ?";
	            PreparedStatement stmt = connection.prepareStatement(sql);
	            stmt.setInt(1, vendorId);
	            
	            // Execute the query and get the results
	            ResultSet rs = stmt.executeQuery();
	            
	            // Iterate through the results and add each image to the list
	            while (rs.next()) {
	                MyImage image = new MyImage();
	                image.setData(rs.getBytes("image_data"));
	                image.setTitle(rs.getString("title"));
	                images.add(image);
	            }
	            
	            // Close the result set and statement
	            rs.close();
	            stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return images;
	    }
	    
	    public List<MyImage> getAllImagesDataVendorBedroom() {
	           
	        List<MyImage> images = new ArrayList<MyImage>();
	        try {
	        	String sql = "SELECT title, image_data FROM vendor_bedroom_images";
	            PreparedStatement stmt = connection.prepareStatement(sql);
	          
	            
	            // Execute the query and get the results
	            ResultSet rs = stmt.executeQuery();
	            
	            // Iterate through the results and add each image to the list
	            while (rs.next()) {
	                MyImage image = new MyImage();
	                image.setData(rs.getBytes("image_data"));
	                image.setTitle(rs.getString("title"));
	                images.add(image);
	            }
	            
	            // Close the result set and statement
	            rs.close();
	            stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return images;
	    }
	    
	    
	    public List<MyImage> getAllImagesDataVendorGarden(int vendorId) {
	           
	        List<MyImage> images = new ArrayList<MyImage>();
	        try {
	        	String sql = "SELECT title, image_data FROM vendor_garden_images WHERE vendor_id = ?";
	            PreparedStatement stmt = connection.prepareStatement(sql);
	            stmt.setInt(1, vendorId);
	            
	            // Execute the query and get the results
	            ResultSet rs = stmt.executeQuery();
	            
	            // Iterate through the results and add each image to the list
	            while (rs.next()) {
	                MyImage image = new MyImage();
	                image.setData(rs.getBytes("image_data"));
	                image.setTitle(rs.getString("title"));
	                images.add(image);
	            }
	            
	            // Close the result set and statement
	            rs.close();
	            stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return images;
	    }
	    
	    public List<MyImage> getAllImagesDataVendorGarden() {
	           
	        List<MyImage> images = new ArrayList<MyImage>();
	        try {
	        	String sql = "SELECT title, image_data FROM vendor_garden_images";
	            PreparedStatement stmt = connection.prepareStatement(sql);
	          
	            
	            // Execute the query and get the results
	            ResultSet rs = stmt.executeQuery();
	            
	            // Iterate through the results and add each image to the list
	            while (rs.next()) {
	                MyImage image = new MyImage();
	                image.setData(rs.getBytes("image_data"));
	                image.setTitle(rs.getString("title"));
	                images.add(image);
	            }
	            
	            // Close the result set and statement
	            rs.close();
	            stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return images;
	    }
}

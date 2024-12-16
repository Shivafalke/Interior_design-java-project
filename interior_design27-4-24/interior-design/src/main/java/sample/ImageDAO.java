package sample;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.MyImage;
public class ImageDAO {
    private Connection connection;

    public ImageDAO() {
        try {
            // Get a database connection from your connection pool
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/interior_design", "root", "");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void deleteImage(String nm) {
        try {
            Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/interior_design", "root", "");
            PreparedStatement stmt = conn.prepareStatement("DELETE FROM images WHERE name = ?");
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





    public List<MyImage> getAllImagesData() {
        List<MyImage> images = new ArrayList<MyImage>();
        try {
            // Prepare the SQL query to retrieve only the "data" column from images
            String sql = "SELECT data,name FROM images";
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
    
}
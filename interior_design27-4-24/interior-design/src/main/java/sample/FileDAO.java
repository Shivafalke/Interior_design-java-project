package sample;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FileDAO {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/interior_design";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    public List<FileInfo> getAllFiles() {
        List<FileInfo> files = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String query = "SELECT f.file_name, f.description, f.vendor_id, v.name " +
                           "FROM files f " +
                           "JOIN vendor_login v ON f.vendor_id = v.id";
            PreparedStatement statement = conn.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String fileName = resultSet.getString("file_name");
                String description = resultSet.getString("description");
                int vendorId = resultSet.getInt("vendor_id");
                String vendorName = resultSet.getString("name");

                FileInfo fileInfo = new FileInfo(fileName, description, vendorId, vendorName);
                files.add(fileInfo);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return files;
    }
    
}


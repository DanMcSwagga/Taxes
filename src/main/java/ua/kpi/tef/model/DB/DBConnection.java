package ua.kpi.tef.model.DB;
import java.sql.*;

public class DBConnection {

    private static final String HOST = "jdbc:mysql://localhost:3306/taxes";
    private static final String USERNAME= "root";
    private static final String PASSWORD = "ZXnJ5xCk";

    private Connection connection;

    public DBConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(HOST, USERNAME, PASSWORD);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        return connection;
    }
}
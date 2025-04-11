package com.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DataBaseJDBC {
    // Подключение к базе данных website
    private static final String USERDB_URL = "jdbc:mysql://localhost:3306/website1";
    private static final String USERDB_USER = "root";
    private static final String USERDB_PASSWORD = "admin";

    // Подключение к базе данных library
    private static final String LIBRARY_URL = "jdbc:mysql://localhost:3306/library";
    private static final String LIBRARY_USER = "root";
    private static final String LIBRARY_PASSWORD = "admin";

    public static Connection getUserDBConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(USERDB_URL, USERDB_USER, USERDB_PASSWORD);
    }

    public static Connection getLibraryDBConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(LIBRARY_URL, LIBRARY_USER, LIBRARY_PASSWORD);
    }

    public static String checkUserAndGetRole(String name, String pass) {
        String query = "SELECT role FROM users WHERE name = ? AND pass = ?";
        try (Connection conn = getUserDBConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, name);
            stmt.setString(2, pass);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getString("role");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Регистрация пользователя
    public static boolean registerUser(String name, String pass) {
        String query = "INSERT INTO users (name, pass, role) VALUES (?, ?, 'USER')";
        try (Connection conn = getUserDBConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, name);
            stmt.setString(2, pass);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static ResultSet getAllUsers() throws Exception {
        String query = "SELECT * FROM users";
        Connection conn = getUserDBConnection();
        PreparedStatement stmt = conn.prepareStatement(query);
        return stmt.executeQuery();
    }

    public static ResultSet getAllReaders() throws Exception {
        String query = "SELECT * FROM readers";
        Connection conn = getLibraryDBConnection();
        PreparedStatement stmt = conn.prepareStatement(query);
        return stmt.executeQuery();
    }

    public static ResultSet printUsersTable() throws Exception {
        String query = "SELECT * FROM users";
        Connection conn = getUserDBConnection();
        PreparedStatement stmt = conn.prepareStatement(query);
        return stmt.executeQuery();
    }
}
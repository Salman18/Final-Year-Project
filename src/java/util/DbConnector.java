package com.util;



/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.*;

/**
 *
 * @author sabari
 */
public class DbConnector {
    // System.out.println("MySQL Connect Example.");

    public static Connection getConnection() {
        Connection conn = null;
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "abevod";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "root";
        try {
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url + dbName, userName, password);
            System.out.println("Connected to the database");
            //conn.close();
            //System.out.println("Disconnected from database");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
    
    public static void main(String arg[]){
        DbConnector.getConnection();
    }
}

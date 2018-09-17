package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DbConn {
    static Connection connection = null;
    static Statement statement = null;
    
    public static Statement connect() throws Exception {
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "rohan";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "";
        try {
            Class.forName(driver).newInstance();
            connection = DriverManager.getConnection(url + dbName, userName, password);
            statement = connection.createStatement();
        } catch (Exception e) {
            System.out.println("Ex : "+e.toString());
        }
        return statement;
    }
}
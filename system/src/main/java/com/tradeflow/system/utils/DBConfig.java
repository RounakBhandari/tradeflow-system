package com.tradeflow.system.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
	
	private static final String DBURL = "jdbc:mysql://localhost:3306/tradeflow_system";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "";
	
	public static Connection getConnection() {
		Connection dbconn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            dbconn = DriverManager.getConnection(DBURL, USERNAME, PASSWORD);
            System.out.println("DB Connection Success");
		} catch (Exception e) {
			System.out.println("DB Connection Failed");
			e.printStackTrace();
		}
		return dbconn;
	}
	
}

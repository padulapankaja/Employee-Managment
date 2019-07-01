/**
 * 
 */
package com.oop.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @author Amoda,IT18130508
 *
 */

public class DBConnectionUtil {

	private static Connection connection;

	// This works according to singleton pattern
	private DBConnectionUtil() {
	}
	
	public static Connection getDBConnection() throws ClassNotFoundException, SQLException {
		/*
		 * This create new connection objects when connection is closed or it is
		 * null
		 */
		if (connection == null || connection.isClosed()) {

			Class.forName("com.mysql.cj.jdbc.Driver");
			//Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/emc";
			String uname = "root";
			String pwd = "admin";
			
			
			connection = DriverManager.getConnection(url, uname, pwd );
		}
		return connection;
	}
}

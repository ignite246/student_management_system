package sms.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Logger;

public class DBConnection {
	
	Logger logger = Logger.getLogger("DBConnection");

	private static Connection conn = null;

	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sms", "root", "root");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}
}

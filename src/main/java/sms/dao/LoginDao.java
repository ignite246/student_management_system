package sms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import sms.db.DBConnection;

public class LoginDao {

	private static Connection conn = null;

	public LoginDao() {
		conn = DBConnection.getConnection();
	}

	public String isValidUserDao(String username, String password) {
		String firstname = null;
		try {
			String query = "select firstname from `sms_user` where username = ? and password = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);

			System.out.println("ps :: " + ps.toString());

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				firstname = rs.getString("firstname");
				break;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return firstname;
	}
}

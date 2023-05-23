package sms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import sms.db.DBConnection;
import sms.entities.Student;

public class StudentDao {

	private Connection conn;

	public StudentDao() {
		conn = DBConnection.getConnection();
	}

	public int addStudentDao(Student student) {
		int rowInserted = 0;
		try {
			String query = "insert into sms_students(firstname,lastname,degree,phone,username,password) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, student.getFirstname());
			ps.setString(2, student.getLastname());
			ps.setString(3, student.getDegree());
			ps.setString(4, student.getPhone());
			ps.setString(5, student.getUsername());
			ps.setString(6, student.getPassword());
			rowInserted = ps.executeUpdate();
			if (rowInserted > 0) {
				System.out.println(rowInserted + " row inserted successfully");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return rowInserted;
	}

	public int deleteStudentDao(int studentId) {

		int rowDeleted = 0;
		try {
			String query = "delete from sms_students where student_id = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, studentId);
			rowDeleted = ps.executeUpdate();
			if (rowDeleted > 0) {
				System.out.println(rowDeleted + " row deleted successfully");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rowDeleted;
	}
	
	public int updateStudentDao(Student student, int studentId) {
		int rowUpdated = 0;
		try {
			String query = "update sms_students set firstname=?,lastname=?,degree=?,phone=?,username=?,password=?,lastUpdatedOn=now() where student_id=? ";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, student.getFirstname());
			ps.setString(2, student.getLastname());
			ps.setString(3, student.getDegree());
			ps.setString(4, student.getPhone());
			ps.setString(5, student.getUsername());
			ps.setString(6, student.getPassword());
			ps.setInt(7, studentId);
			rowUpdated = ps.executeUpdate();
			if (rowUpdated > 0) {
				System.out.println(rowUpdated + " row updated successfully");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rowUpdated;
	}
	
	public int markAttendanceDao(int studentId) {
		int rowUpdated = 0;
		try {
			String query = "update sms_students set attendance = attendance+1 where student_id = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, studentId);
			rowUpdated = ps.executeUpdate();
			if (rowUpdated > 0) {
				System.out.println(rowUpdated + " row updated successfully .ie attendance marked");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rowUpdated;
	}
	
   public int getCountOfTotalStudentsDao() {
	   int count = 0;
		try {
			String query = "select count(*) as count from sms_students";
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("Count : "+count);
		return count;
   }
}

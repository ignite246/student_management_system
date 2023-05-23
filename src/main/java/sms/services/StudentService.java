package sms.services;

import sms.dao.StudentDao;
import sms.entities.Student;

public class StudentService {

	private StudentDao studentDao;
	
	public StudentService(){
		studentDao = new StudentDao();
	}
	public int addStudentService(Student student) {
		return studentDao.addStudentDao(student);
	}
	
	public int deleteStudentService(int studentId) {
		return studentDao.deleteStudentDao(studentId);
	}
	
	public int updateStudentService(Student student, int studentId) {
		return studentDao.updateStudentDao(student, studentId);
	}
	
	public int markAttendanceService(int studentId) {
		return studentDao.markAttendanceDao(studentId);
	}
	
	public int getCountOfStudentsService() {
		return studentDao.getCountOfTotalStudentsDao();
	}
}

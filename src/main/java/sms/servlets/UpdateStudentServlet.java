package sms.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sms.entities.Student;
import sms.services.StudentService;

public class UpdateStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private StudentService obj;
    public UpdateStudentServlet() {
    	 obj = new StudentService();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int studentId = Integer.parseInt(request.getParameter("studentId"));
		System.out.println("Id "+studentId);
		String fname = request.getParameter("firstname").trim();
		String lname = request.getParameter("lastname").trim();
		String degree = request.getParameter("degree").trim();
		String phone = request.getParameter("phone").trim();
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		
		Student student = new Student(fname,lname,degree,phone,username,password);
		
		System.out.println(student.toString());
		
		int rowUpdated = obj.updateStudentService(student,studentId);
		System.out.println("Record Updated succsefully - Redirecting to all student page-");
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/allStudents.jsp");
		dispatcher.forward(request,response);
		
	}

}

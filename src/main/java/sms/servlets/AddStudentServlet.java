package sms.servlets;

import java.io.IOException;


import sms.entities.Student;
import sms.services.StudentService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private StudentService obj ;
    public AddStudentServlet() {
       obj = new StudentService(); 
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String fname = request.getParameter("firstname").trim();
		String lname = request.getParameter("lastname").trim();
		String degree = request.getParameter("degree").trim();
		String phone = request.getParameter("phone").trim();
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		
		Student student = new Student(fname,lname,degree,phone,username,password);
		
		System.out.println(student.toString());
		
		int rowInserted = obj.addStudentService(student);
		if(rowInserted>0) {
			System.out.println("New Record added successfully - Redirecting to all student page-");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/allStudents.jsp");
			dispatcher.forward(request,response);
		}
		else {
			System.out.println("Failed to add a record - Redirecting to add Student page-");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/addStudent.jsp");
			dispatcher.forward(request,response);
		}
		
		
	}

}

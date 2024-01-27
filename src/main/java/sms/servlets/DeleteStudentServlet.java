package sms.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sms.services.StudentService;

public class DeleteStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private StudentService obj;
    public DeleteStudentServlet() {
       obj = new StudentService();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int studentId = Integer.parseInt(request.getParameter("st_id"));
		
		int rowDeleted = obj.deleteStudentService(studentId);
		if(rowDeleted>0) {
			System.out.println("Record deleted successfully - Redirecting to all student page-");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/allStudents.jsp");
			dispatcher.forward(request,response);
		}
		else {
			
		}
	}

}

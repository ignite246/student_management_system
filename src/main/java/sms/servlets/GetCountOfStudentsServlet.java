package sms.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sms.services.StudentService;

public class GetCountOfStudentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StudentService obj ;
    public GetCountOfStudentsServlet() {
    	 obj = new StudentService(); 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int count = obj.getCountOfStudentsService();
		response.getWriter().print(count);
	}

}

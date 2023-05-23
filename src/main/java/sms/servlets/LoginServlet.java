package sms.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sms.services.LoginService;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	boolean validUser = false;
	LoginService obj = null;
	
	public LoginServlet(){
		obj = new LoginService();
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		
		System.out.println("Username : "+username+"\nPassword : "+password);
		
	    String firstname = obj.isValidUserService(username, password);
		if(firstname!=null) {
			System.out.println(firstname+" Valid User - Redirecting to admin page-");
			HttpSession session = request.getSession();
			session.setAttribute("firstname", firstname);
			session.setAttribute("errorMessage", "");
			response.sendRedirect("admin.jsp");
		}else {
			System.out.println("InValid User - Redirecting to login page-");
			HttpSession session = request.getSession();
			session.setAttribute("errorMessage", "Invalid User or Wrong Creds !!");
			session.setAttribute("firstname", null);
			response.sendRedirect("home.jsp");
		}
		
	}

}

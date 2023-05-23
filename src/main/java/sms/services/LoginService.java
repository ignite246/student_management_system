package sms.services;

import sms.dao.LoginDao;

public class LoginService {
	
	private LoginDao dao;
	
	public LoginService() {
	 dao = new LoginDao();
	}
	
	public String isValidUserService(String username, String password) {
		return dao.isValidUserDao(username, password);
		
	}
}

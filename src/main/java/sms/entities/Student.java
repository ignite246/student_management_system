package sms.entities;

public class Student {

	private String firstname;
	private String lastname;
	private String phone;
	private String degree;
	private String username;
	private String password;
	
	

	public Student(String firstname, String lastname, String degree, String phone, String username, String password) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.phone = phone;
		this.degree = degree;
		this.username = username;
		this.password = password;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Student [firstname=" + firstname + ", lastname=" + lastname + ", phone=" + phone + ", degree=" + degree
				+ ", username=" + username + ", password=" + password + "]";
	}
	
	

}

<%@ page import="sms.db.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	if (session.getAttribute("firstname") != null) {
		firstname = (String) session.getAttribute("firstname");
	} else {
		response.sendRedirect("home.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/css.jsp"%>
<title>Update Student</title>
</head>
<body>
	<section id="our_navbar">
		<%@include file="components/navbar.jsp"%>
	</section>

	<%
		int studentId = Integer.parseInt(request.getParameter("st_id"));
		Connection conn = DBConnection.getConnection();
		String query = "select * from sms_students where student_id = ?";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setInt(1, studentId);
		ResultSet rs = ps.executeQuery();
	%>
	<div class=" container">
		<div class="row mt-4">
			<%
				while (rs.next()) {
					int st_id = rs.getInt("student_id");
					String fName = rs.getString("firstname");
					String lName = rs.getString("lastname");
					String phone = rs.getString("phone");
					String degree = rs.getString("degree");
					String username = rs.getString("username");
					String password = rs.getString("password");
			%>
			<div
				class="col-xs-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-6 offset-lg-3">
				<div class="card">
					<div class="card-header">
						<h2>Update the required details</h2>
					</div>
					<div class="card-body">
						<form action="UpdateStudentServlet" method="POST">
							<div>
								<input hidden type="number" id="studentId" name="studentId"
									value="<%=st_id%>">
							</div>
							<div class="mb-2">
								<label for="firstname" class="form-label">Firstname</label> <input
									type="text" class="form-control" id="firstname"
									name="firstname" value="<%=fName%>" required>
							</div>
							<div class="mb-2">
								<label for="lastname" class="form-label">Lastname</label> <input
									type="text" class="form-control" id="lastname" name="lastname"
									value="<%=lName%>" required>
							</div>
							<div class="mb-2">
								<label for="degree" class="form-label">Degree</label> <input
									type="text" class="form-control" id="degree" name="degree"
									value="<%=degree%>" required>
							</div>
							<div class="mb-2">
								<label for="phone" class="form-label">Phone</label> <input
									type="number" class="form-control" id="phone" name="phone"
									value="<%=phone%>" required>
							</div>

							<div class="mb-2">
								<label for="username" class="form-label">Username</label> <input
									type="text" class="form-control" id="username" name="username"
									value="<%=username%>" required>
							</div>

							<div class="mb-2">
								<label for="password" class="form-label">Password</label> <input
									type="password" class="form-control" id="password"
									name="password" value="<%=password%>" required>
							</div>

							<div class="container text-center">
								<button type="submit" class="btn btn-primary myShadow">Update</button>
								<a class="btn btn-secondary myShadow" href="allStudents.jsp">Cancel</a>
							</div>
						</form>
					</div>
				</div>
			</div>

			<%
				}
			%>

		</div>
	</div>


</body>
<%@include file="components/script.jsp"%>
</html>
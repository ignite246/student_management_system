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
<style>
tr {
	background-color: rgb(238, 192, 240);
}
</style>

<title>All Students</title>
</head>

<body>

	<section id="our_navbar">
		<%@include file="components/navbar.jsp"%>
	</section>

	<section id="all_student_data">
		<%
			try {
				Connection conn = DBConnection.getConnection();
				String query = "select * from sms_students order by student_id asc";
				PreparedStatement ps = conn.prepareStatement(query, ResultSet.TYPE_SCROLL_SENSITIVE,
						ResultSet.CONCUR_UPDATABLE);
				ResultSet rs = ps.executeQuery(); //System.out.print("RS next : "+rs.next());
		%>
		<div class=" container">
			<div class="row mt-4">

				<%
					if (rs.next()) {
							rs.beforeFirst();
							int count = 0;
							while (rs.next()) {
								int st_id = rs.getInt("student_id");
								String fName = rs.getString("firstname");
								String lName = rs.getString("lastname");
								String phone = rs.getString("phone");
								String degree = rs.getString("degree");
								String username = rs.getString("username");
								String password = rs.getString("password");
								int attendance = rs.getInt("attendance");
								String createdOn = rs.getString("createdOn");
								String lastUpdatedOn = rs.getString("lastUpdatedOn");
				%>


				<div class=" col-xs-12 col-sm-12 col-md-6 col-lg-4">
					<div class="card mt-3 m-0">
						<div class="card-header text-center bg-secondary">
							<h3 class="myShadow">
								<span><%=++count%>.</span>
								<span class="fname"> <%=fName%>
								</span> <span class="lname"> <%=lName%>
								</span>
							</h3>
						</div>
						<div class="card-body p-0">
							<table class="table table-responsive table-bordered">
								<tbody>
									<tr>
										<th>Student ID</th>
										<td><%=st_id%></td>
									</tr>
									<tr>
										<th>Degree</th>
										<td><%=degree%></td>
									</tr>
									<tr>
										<th>Phone</th>
										<td><%=phone%></td>
									</tr>
									<tr>
										<th>Username</th>
										<td><%=username%></td>
									</tr>
									<tr>
										<th>Password</th>
										<td><%=password%></td>
									</tr>
									<tr>
										<th>Attendance</th>
										<td>
											<div class="row">
												<div class="col-6 text-danger container-fluid">

													<button class="btn btn-md btn-danger px-4">
														<b> <%=attendance%>
														</b>
													</button>

												</div>
												<div class="col-6 container-fluid">
													<a href="MarkAttendanceServlet?st_id=<%=st_id%>"
														class="btn btn-md btn-primary px-3">M.A</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th>Created On</th>
										<td><%=createdOn%></td>
									</tr>
									<tr>
										<th>Last Updated On</th>
										<td><%=lastUpdatedOn%></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="card-footer">
							<div class="container text-center">
								<a href="updateStudent.jsp?st_id=<%=st_id%>"><button
										class="btn btn-md btn-warning myShadow">Update</button></a> <a
									href="DeleteStudentServlet?st_id=<%=st_id%>"><button
										class="btn btn-md btn-danger myShadow">Delete</button></a>
							</div>
						</div>
					</div>
				</div>

				<%
					}
						} else {
				%>
				<div class="jumbotron jumbotron-fluid bg-info text-white">
					<div class="container">
						<h1 class="display-4">No Data Available</h1>
						<p class="lead">Add some student details to proceed !!</p>
					</div>
				</div>
				<%
					}
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
			</div>

		</div>
	</section>
</body>
<%@include file="components/script.jsp"%>

</html>
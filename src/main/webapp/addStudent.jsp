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
<title>Registration</title>
</head>

<body>
	<section id="our_navbar">
		<%@include file="components/navbar.jsp"%>
	</section>

	<section id="add_student">
		<div class="row mt-3">
			<div
				class="col-xs-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-6 offset-lg-3">
				<div class="card">
					<div class="card-header">
						<h2>Fill all details</h2>
					</div>
					<div class="card-body">
						<form action="AddStudentServlet" method="POST">
							<div class="mb-2">
								<label for="firstname" class="form-label">Firstname</label> <input
									type="text" class="form-control" id="firstname"
									name="firstname" required>
							</div>
							<div class="mb-2">
								<label for="lastname" class="form-label">Lastname</label> <input
									type="text" class="form-control" id="lastname" name="lastname" required>
							</div>
							<div class="mb-2">
								<label for="degree" class="form-label">Degree</label> <input
									type="text" class="form-control" id="degree" name="degree" required>
							</div>
							<div class="mb-2">
								<label for="phone" class="form-label">Phone</label> <input
									type="number" class="form-control" id="phone" name="phone" required>
							</div>

							<div class="mb-2">
								<label for="username" class="form-label">Username</label> <input
									type="text" class="form-control" id="username" name="username" required>
							</div>

							<div class="mb-2">
								<label for="password" class="form-label">Password</label> <input
									type="password" class="form-control" id="password"
									name="password" required>
							</div>

							<div class="container text-center">
								<button type="submit" class="btn btn-primary myShadow">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>


</body>

</html>
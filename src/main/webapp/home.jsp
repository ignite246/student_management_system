<%!String errorMsg = "";%>
<%
	if (session.getAttribute("errorMessage") != null) {
		errorMsg = session.getAttribute("errorMessage").toString();
	} else {
		errorMsg = "";
	}
%>

<!doctype html>
<html lang="en">

<head>
<%@include file="components/css.jsp"%>
<title>Welcome - SMS</title>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark p-3">
		<div class="container-fluid text-primary">
			<h2 class="text-center">Student Management System - SMS</h2>
		</div>
	</nav>
	<div class="container bg-danger">
		<h3><%=errorMsg%></h3>
	</div>
	<section id="our_login">
		<div class="container my-5">
			<div class="row">
				<div class="col-md-6 bg-primary">
					<div class="container text-center m-4">
						<img src="images/sms.png" class="img-fluid mt-4"
							alt="Project Logo">
					</div>
				</div>
				<div class="col-md-6 bg-success">
					<div class="card m-5">
						<div class="card-header bg-secondary text-center">
							<h2>Kindly login to proceed !!</h2>
						</div>
						<div class="card-body m-3">
							<form action="LoginServlet" method="POST">
								<div class="mb-3">
									<label for="username" class="form-label">Username</label> <input
										type="text" class="form-control" id="username" name="username"
										value="ranij">
								</div>
								<div class="mb-3">
									<label for="password" class="form-label">Password</label> <input
										type="password" class="form-control" id="password"
										name="password" value="password">
								</div>
								<button type="submit" class="btn btn-lg btn-primary">Login</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="our_footer"></section>

</body>
<%@include file="components/script.jsp"%>

</html>
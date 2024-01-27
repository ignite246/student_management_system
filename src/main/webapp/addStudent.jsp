<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<% if (session.getAttribute("firstname") !=null) { firstname=(String) session.getAttribute("firstname"); } else {
		response.sendRedirect("home.jsp"); } %>
		<!DOCTYPE html>
		<html>

		<head>
			<%@include file="components/css.jsp" %>
				<title>Registration</title>
		</head>

		<body>
			<section id="our_navbar">
				<%@include file="components/navbar.jsp" %>
			</section>

			<section id="add_student">
				<div class="row mt-3">
					<div class="col-xs-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-6 offset-lg-3">
						<div class="card">
							<div class="card-header">
								<h2>Fill all details</h2>
							</div>
							<div class="card-body">
								<div action="AddStudentServlet">
									<div class="row g-3">
										<div class="col">
											<div class="mb-2">
												<label for="firstname" class="form-label">Firstname</label>
												<input type="text" class="form-control" id="firstname" name="firstname"
													required>
											</div>
										</div>

										<div class="col">
											<div class="mb-2">
												<label for="lastname" class="form-label">Lastname</label>
												<input type="text" class="form-control" id="lastname" name="lastname"
													required>
											</div>
										</div>
									</div>


									<div class="row g-3">
										<div class="col">
											<div class="mb-2">
												<label for="degree" class="form-label">Degree</label>
												<select class="form-select" name="degree" id="degree" required>
													<option value="">Select</option>
													<option value="MCA">MCA</option>
													<option value="BCA">BCA</option>
													<option value="MSc">M.Sc.</option>

												</select>
											</div>
										</div>

										<div class="col">
											<div class="mb-2">
												<label for="phone" class="form-label">Phone</label>
												<input type="number" class="form-control" id="phone" name="phone"
													placeholder="Phone number must be of 10 Digits only" required>
											</div>
										</div>
									</div>


									<!---->

									<div class="row g-3">
										<div class="col">
											<div class="mb-2">
												<label for="username" class="form-label">Username</label> <input
													type="text" class="form-control" id="username" name="username"
													required>
											</div>
										</div>

										<div class="col">
											<div class="mb-2">
												<label for="password" class="form-label">Password</label>
												<input type="password" class="form-control" id="password"
													name="password"
													placeholder="Create a strong password of length in between 7 to 15"
													required>
											</div>
										</div>
									</div>

									<div class="container text-center">
										<button type="button" class="btn btn-primary myShadow"
											onClick="submitAddStudentForm()">Submit</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>


		</body>
		<%@include file="components/script.jsp" %>
			<script>
				console.log("==== JS Starts ====");
				function submitAddStudentForm() {
					console.log("===> submitAddStudentForm()====> called");
					let firstname = $("#firstname").val();
					let lastname = $("#lastname").val();
					let degree = $("#degree").val();
					let phone = $("#phone").val();
					let username = $("#username").val();
					let password = $("#password").val();

					console.log(firstname, lastname, degree, phone, username, password);
					if (firstname == "" || firstname.trim() == "" || firstname.trim().length < 4) {
						alert("Firstname must be of length 3 minimum !!");
					}
					else if (lastname == "" || lastname.trim() == "" || lastname.trim().length < 4) {
						alert("Lastname must be of length 3 minimum !!");
					}
					else if (phone.length > 10 || phone.length < 10) {
						alert("Invalid phone number !!");
					}
					else if (password.length < 7 || password.length > 15) {
						alert("Invalid password, length should be 7 to 15 only !!");
					}
					else {
						$.ajax({
							url: "AddStudentServlet",
							type: "POST",
							data: {
								"firstname": firstname,
								"lastname": lastname,
								"degree": degree,
								"phone": phone,
								"username": username,
								"password": password
							},
							success: function (data) {
								alert("Student added successfully");
							},
							error: function (error) {
								console.log(error);
							}
						});
					}
				}
			</script>

		</html>
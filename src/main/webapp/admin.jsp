<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	if(session.getAttribute("firstname")!=null){
    	firstname = (String)session.getAttribute("firstname");
	}
	else{
		response.sendRedirect("home.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/css.jsp"%>
<title>Welcome - Admin</title>
</head>

<body onload='getData()'>
	<section id="our_navbar">
		<%@include file="components/navbar.jsp"%>
	</section>

	<section id="admin_page">
		<div class="container">
			<div class="row mt-5">
				<div class="col-xs-12 col-md-6 bg-primary">
					<div class="container text-center m-4">
						<img src="images/sms.png" class="img-fluid mt-4"
							alt="Project Logo">
					</div>
				</div>
				<div class="col-xs-12 col-md-6 bg-success">
					<div class="card m-3">
						<div class="card-header text-center">
							<h2 class="text-danger">Welcome <span class="text-success text-uppercase"><%=firstname%> </span>!!</h2>
						</div>
						<div class="card-body">
							<div class="row">
								<!-- Count of Students -->
								<div class="col-md-6 text-center mb-2">
									<div class="card action_card_1">
										<div class="card-body">
											<h2 id="totalStudent">251</h2>
										</div>
										<div class="card-footer d-grid p-0">
											<h4 class="text-uppercase">Total Students</h4>
										</div>
									</div>
								</div>
								<!-- Add a student here -->
								<div class="col-md-6 text-center mb-2">
									<div class="card action_card_2">
										<div class="card-body">
											<h2>12</h2>
										</div>
										<div class="card-footer d-grid p-0">
											<h4 class="text-uppercase">Total Teachers</h4>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
<%@include file="components/script.jsp"%>
<script>
 function getData(){
	 console.log("----------");
	 $.ajax({
		 url : "GetCountOfStudentsServlet",
		 type : "GET",
		 success : function(data){
			 $('#totalStudent').text(data);
		 },
		 error : function(error){
			 console.log(error);
		 }
	 });
 }
</script>
</html>
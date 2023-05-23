<%! String firstname = "Default"; %> 
<nav class="navbar navbar-expand-lg navbar-dark bg-dark p-3">
	<div class="container-fluid">
		<a class="navbar-brand text-primary btn btn-md btn-outline-info" href="https://www.google.com/search?q=ignite246.github.io">Student Management
			System</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item mx-1"><a
					class="nav-link btn btn-md btn-outline-secondary"
					href="admin.jsp">Home</a></li>
				<li class="nav-item mx-1"><a
					class="nav-link btn btn-md btn-outline-success"
					href="addStudent.jsp">Add Student</a></li>
				<li class="nav-item mx-1"><a
					class="nav-link btn btn-md btn-outline-primary"
					href="allStudents.jsp">See Students</a></li>
				<li class="nav-item mx-1"><a
					class="nav-link btn btn-md btn-outline-warning" href="#"><b>Admin</b>-<%=firstname%></a>
				</li>
				<li class="nav-item mx-1"><a
					class="nav-link btn btn-md btn-outline-danger" href="LogoutServlet">Logout</a></li>
			</ul>
			<form class="d-flex">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>
		</div>
	</div>
</nav>
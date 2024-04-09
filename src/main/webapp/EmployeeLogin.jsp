<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>

<meta charset="utf-8" />
<title>Login | OrderOrbit</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="Premium Multipurpose Admin & Dashboard Template"
	name="description" />
<meta content="Themesbrand" name="author" />
<!-- App favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">

<!-- Bootstrap Css -->
<link href="assets/css/bootstrap.min.css" id="bootstrap-style"
	rel="stylesheet" type="text/css" />
<!-- Icons Css -->
<link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<!-- App Css-->
<link href="assets/css/app.min.css" id="app-style" rel="stylesheet"
	type="text/css" />

</head>

<body>
	<div class="account-pages my-5 pt-sm-5">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-8 col-lg-6 col-xl-5">
					<div class="card overflow-hidden">
						<div class="bg-primary bg-soft">
							<div class="row">
								<div class="col-7">
									<div class="text-primary p-4">
										<h5 class="text-primary">Welcome Back !</h5>
										<p>Login to continue to OrderOrbit.</p>
									</div>
								</div>
								<div class="col-5 align-self-end">
									<img src="assets/images/profile-img.png" alt=""
										class="img-fluid">
								</div>
							</div>
						</div>
						<div class="card-body pt-0">
							<div class="p-2">
								<%
								String err = (String) session.getAttribute("error");
								if (err != null) {
								%>
								<p style="color: red; display: flex; justify-content: center"><%=err%></p>
								<%
								session.removeAttribute("error");
								}
								%>
								
								<form class="form-horizontal" action="EmployeeLogin"
									method="post">
									<div class="mb-3">
										<label for="empRole" class="form-label">Are you a?</label> <select
											class="form-control" id="empRole" name="empRole"
											placeholder="Select your Role" required>
											<option value="Manager">Manager</option>
											<option value="Wait Staff">Wait Staff</option>
											<option value="Kitchen Staff">Kitchen Staff</option>
										</select>
										<div class="invalid-feedback">Please select your role</div>
									</div>

									<div class="mb-3">
										<label for="empEmail" class="form-label">Email</label> <input
											type="email" class="form-control" id="empEmail"
											name="empEmail" placeholder="Enter Email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" required>
									</div>

									<div class="mb-3">
										<label class="form-label">Password</label>
										<div class="input-group auth-pass-inputgroup">
											<input type="Password" class="form-control"
												placeholder="Enter password" name="empPassword"
												aria-label="Password" aria-describedby="password-addon" autocomplete="new-password">
											<button class="btn btn-light " type="button"
												id="password-addon">
												<i class="mdi mdi-eye-outline"></i>
											</button>
										</div>
									</div>

									<div class="mt-3 d-grid">
										<button class="btn btn-primary waves-effect waves-light"
											type="submit">Log In</button>
									</div>
								</form>
							</div>

						</div>
					</div>
					<div class="mt-5 text-center">

						<div>
						
							<p>
								Don't have an account ? <a href="EmployeeRegister.jsp"
									class="fw-medium text-primary"> Signup now </a>
							</p>
							<p>
								©
								<script>
									document.write(new Date().getFullYear())
								</script>
								OrderOrbit. Crafted with <i class="mdi mdi-heart text-danger"></i>
								by OrderOrbit
							</p>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- end account-pages -->

	<!-- JAVASCRIPT -->
	<script src="assets/libs/jquery/jquery.min.js"></script>
	<script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/libs/metismenu/metisMenu.min.js"></script>
	<script src="assets/libs/simplebar/simplebar.min.js"></script>
	<script src="assets/libs/node-waves/waves.min.js"></script>

	<!-- App js -->
	<script src="assets/js/app.js"></script>
</body>

<!-- Mirrored from themesbrand.com/skote/layouts/auth-login.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 21 Dec 2021 09:38:12 GMT -->
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>

<meta charset="utf-8" />
<title>Register | OrderOrbit</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="Premium Multipurpose Admin & Dashboard Template"
	name="description" />
<meta content="Themesbrand" name="author" />

<link rel="shortcut icon" href="assets/images/favicon.ico">


<link href="assets/css/bootstrap.min.css" id="bootstrap-style"
	rel="stylesheet" type="text/css" />

<link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />

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

										<p>Welcome To OrderOrbit</p>
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
								<form class="needs-validation" novalidate action="EmployeeRegister"
									method="post">

									<div class="mb-3">
										<label for="empRole" class="form-label">Are you a?</label> <select
											class="form-control" id="empRole" name="empRole" placeholder="Select your Role"required>
											<option value="Wait Staff">Wait Staff</option>
											<option value="Kitchen Staff">Kitchen Staff</option>
										</select>
										<div class="invalid-feedback">Please Select Your Role</div>
									</div>


									<div class="mb-3">
										<label for="empEmail" class="form-label">Email</label> <input
											type="email" class="form-control" id="empEmail"
											name="empEmail" placeholder="Enter email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" required>
										<div class="invalid-feedback">Please Enter Email</div>
									</div>

									<div class="mb-3">
										<label for="empName" class="form-label">Employee Name</label> <input
											type="text" class="form-control" id="empName"
											name="empName" placeholder="Enter name" pattern="[A-Za-z\s]+" title="Only Alphabets are allowed"required>
										<div class="invalid-feedback">Only Alphabets are allowed</div>
									</div>

									<div class="mb-3">
										<label for="empPassword" class="form-label">Password</label>
										 <input type="password" class="form-control" id="empPassword" placeholder="Password" name="empPassword" autocomplete="new-password" 
    pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
    title="Must contain at least one number, one uppercase and one lowercase letter, and be at least 8 characters long." required>
										<div class="invalid-feedback">Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters</div>
									</div>

									<div class="mt-4 d-grid">
										<button class="btn btn-primary waves-effect waves-light"
											type="submit">Register</button>
									</div>
									<div class="mt-4 text-center">
										<p class="mb-0">
											By registering you agree to the OrderOrbit <a href="#"
												class="text-primary">Terms of Use</a>
										</p>
									</div>
								</form>
							</div>

						</div>
					</div>
					<div class="mt-5 text-center">

						<div>
							<p>
								Already have an account ? <a href="EmployeeLogin.jsp"
									class="fw-medium text-primary"> Login</a>
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

	
	<script src="assets/libs/jquery/jquery.min.js"></script>
	<script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/libs/metismenu/metisMenu.min.js"></script>
	<script src="assets/libs/simplebar/simplebar.min.js"></script>
	<script src="assets/libs/node-waves/waves.min.js"></script>

	
	<script src="assets/js/pages/validation.init.js"></script>

	
	<script src="assets/js/app.js"></script>

</body>

</html>
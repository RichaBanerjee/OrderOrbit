<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.orderorbit.model.Orders"%>
<%@ page import="com.orderorbit.model.MenuItem"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<title>Edit Status | OrderOrbit</title>
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

<body data-sidebar="dark">

	<!-- <body data-layout="horizontal" data-topbar="dark"> -->

	<!-- Begin page -->
	<div id="layout-wrapper">


		<header id="page-topbar">
			<div class="navbar-header">
				<div class="d-flex">
					<!-- LOGO -->
					<div class="navbar-brand-box">
						<a href="StaffDashboard.jsp" class="logo logo-dark"> <span
							class="logo-sm"> <img src="assets/images/logo.svg" alt=""
								height="22">
						</span> <span class="logo-lg"> <img
								src="assets/images/logo-dark.png" alt="" height="17">
						</span>
						</a> <a href="StaffDashboard.jsp" class="logo logo-light"> <span
							class="logo-sm"> <img src="assets/images/logo-light.svg"
								alt="" height="22">
						</span> <span class="logo-lg"> <img src="assets/images/logo2.png"
								alt="" height="50">
						</span>
						</a>
					</div>

					<button type="button"
						class="btn btn-sm px-3 font-size-16 header-item waves-effect"
						id="vertical-menu-btn">
						<i class="fa fa-fw fa-bars"></i>
					</button>




					<div class="d-flex">

						<div class="dropdown d-inline-block d-lg-none ms-2">
							<button type="button"
								class="btn header-item noti-icon waves-effect"
								id="page-header-search-dropdown" data-bs-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">
								<i class="mdi mdi-magnify"></i>
							</button>
							<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
								aria-labelledby="page-header-search-dropdown">

								<form class="p-3">
									<div class="form-group m-0">
										<div class="input-group">
											<input type="text" class="form-control"
												placeholder="Search ..." aria-label="Recipient's username">
											<div class="input-group-append">
												<button class="btn btn-primary" type="submit">
													<i class="mdi mdi-magnify"></i>
												</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>

						<div class="dropdown d-none d-lg-inline-block ms-1">
							<button type="button"
								class="btn header-item noti-icon waves-effect"
								data-bs-toggle="fullscreen">
								<i class="bx bx-fullscreen"></i>
							</button>
						</div>


						<div class="dropdown d-inline-block">
							<button type="button" class="btn header-item waves-effect"
								id="page-header-user-dropdown" data-bs-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">
								<h4 class="d-none d-xl-inline-block ms-1">Welcome <%=session.getAttribute("employee_name")%></h4>
								<i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
							</button>
							<div class="dropdown-menu dropdown-menu-end">
								<!-- item-->
								<div class="dropdown-divider"></div>
								<a class="dropdown-item text-danger" href="logout"><i
									class="bx bx-power-off font-size-16 align-middle me-1 text-danger"></i>
									<span>Logout</span></a>
							</div>
						</div>



					</div>
				</div>
		</header>

		<!-- ========== Left Sidebar Start ========== -->
		<div class="vertical-menu">

			<div data-simplebar class="h-100">

				<!--- Sidemenu -->
				<div id="sidebar-menu">
					<!-- Left Menu Start -->
					<ul class="metismenu list-unstyled" id="side-menu">
						<li><a href="javascript: void(0);"
							class="has-arrow waves-effect"> <span>Actions</span>
						</a>
							<ul class="sub-menu" aria-expanded="false">
								<li><a href="PendingOrderDetails"> View Pending Orders</a></li>
							</ul></li>


					</ul>
				</div>
				<!-- Sidebar -->
			</div>
		</div>
		<!-- Left Sidebar End -->



		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<!-- ============================================================== -->
		<div class="main-content">

			<div class="page-content">
				<div class="container-fluid">

					<!-- start page title -->
					<div class="row">
						<div class="col-12">
							<div
								class="page-title-box d-sm-flex align-items-center justify-content-between">
								<h4 class="mb-sm-0 font-size-18">Dashboard</h4>

							</div>
						</div>
					</div>
					<!-- end page title -->
				</div>
				<!-- end row -->




				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title mb-4">Edit Order Status</h4>
								<form method="post" action="EditOrderStatus">
									  <% 
        Orders orderToBeEdited = (Orders) request.getAttribute("order_to_be_edited");
        if (orderToBeEdited != null) {
    %>
    
									<div class="mb-3 row">
										<label for="example-text-input"
											class="col-md-2 col-form-label">Order Id</label>
										<div class="col-md-10">
											<input class="form-control" type="text" name="order_id"
												id="order_id"
												value="<%=orderToBeEdited.getOrderId() %>" readonly>
				
										</div>
									</div>
									<div class="mb-3 row">
										<label for="example-search-input"
											class="col-md-2 col-form-label">Placed By</label>
										<div class="col-md-10">
											<input class="form-control" type="text" name="customer_name"
												id="customer_name"  value="<%= orderToBeEdited.getCustomer().getCustomerName() %>"readonly>
												<input type="hidden" name="customer_id" value="<%= orderToBeEdited.getCustomer().getCustomerId() %>" >
										</div>
									</div>
									<div class="mb-3 row">
										<label for="example-search-input"
											class="col-md-2 col-form-label">Order Date</label>
										<div class="col-md-10">
											<input class="form-control" type="date" name="order_date"
												id="order_date" value="<%= orderToBeEdited.getOrderDate() %>" readonly>
										</div>
									</div>
									
									<div class="mb-3 row">
										<label for="example-search-input"
											class="col-md-2 col-form-label">Total Amount</label>
										<div class="col-md-10">
											<input class="form-control" type="number" name="total_amount"
												id="total_amount" value="<%= orderToBeEdited.getTotalAmount() %>"readonly>
										</div>
									</div>
									
									<div class="mb-3 row">
										<label class="col-md-2 col-form-label">Order Picked Up?</label>
										<div class="col-md-10">
											<select name="is_picked" class="form-select">
												<option value="<%= orderToBeEdited.getIsPicked()%>"><%= orderToBeEdited.getIsPicked()%></option>
												<option value="Yes">Yes</option>
												<option value="No">No</option>
											</select>
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-md-2 col-form-label">Order Status</label>
										<div class="col-md-10">
											<select name="order_status" class="form-select">
												<option value="<%= orderToBeEdited.getOrderStatus()%>"><%=  orderToBeEdited.getOrderStatus() %></option>
												<option value="Order Placed">Order Placed</option>
												<option value="Order Prepared">Order Prepared</option>
											</select>
										</div>
									</div>

									<div class="mb-3 row">
										<div class="col-md-12">
											<input class="form-control" type="submit" value="Update"
												style="color: red">
										</div>
									</div>
									<% } %>

								</form>
								<!-- end table-responsive -->
							</div>
						</div>
					</div>
				</div>
				<!-- end row -->
			</div>
			<!-- container-fluid -->
		</div>
		<!-- End Page-content -->

		<!-- Transaction Modal -->
		<div class="modal fade transaction-detailModal" tabindex="-1"
			role="dialog" aria-labelledby="transaction-detailModalLabel"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="transaction-detailModalLabel">Order
							Details</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p class="mb-2">
							Product id: <span class="text-primary">#SK2540</span>
						</p>
						<p class="mb-4">
							Billing Name: <span class="text-primary">Neal Matthews</span>
						</p>

						<div class="table-responsive">
							<table class="table align-middle table-nowrap">
								<thead>
									<tr>
										<th scope="col">Product</th>
										<th scope="col">Product Name</th>
										<th scope="col">Price</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">
											<div>
												<img src="assets/images/product/img-7.png" alt=""
													class="avatar-sm">
											</div>
										</th>
										<td>
											<div>
												<h5 class="text-truncate font-size-14">Wireless
													Headphone (Black)</h5>
												<p class="text-muted mb-0">$ 225 x 1</p>
											</div>
										</td>
										<td>$ 255</td>
									</tr>
									<tr>
										<th scope="row">
											<div>
												<img src="assets/images/product/img-4.png" alt=""
													class="avatar-sm">
											</div>
										</th>
										<td>
											<div>
												<h5 class="text-truncate font-size-14">Phone patterned
													cases</h5>
												<p class="text-muted mb-0">$ 145 x 1</p>
											</div>
										</td>
										<td>$ 145</td>
									</tr>
									<tr>
										<td colspan="2">
											<h6 class="m-0 text-right">Sub Total:</h6>
										</td>
										<td>$ 400</td>
									</tr>
									<tr>
										<td colspan="2">
											<h6 class="m-0 text-right">Shipping:</h6>
										</td>
										<td>Free</td>
									</tr>
									<tr>
										<td colspan="2">
											<h6 class="m-0 text-right">Total:</h6>
										</td>
										<td>$ 400</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- end modal -->



		<footer class="footer">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">
						<script>
							document.write(new Date().getFullYear())
						</script>
						© OrderOrbit.
					</div>
					<div class="col-sm-6">
						<div class="text-sm-end d-none d-sm-block">Design & Develop
							by OrderOrbit</div>
					</div>
				</div>
			</div>
		</footer>
	</div>
	<!-- end main content-->

	</div>
	<!-- END layout-wrapper -->

	<!-- Right Sidebar -->
	<div class="right-bar">
		<div data-simplebar class="h-100">
			<div class="rightbar-title d-flex align-items-center px-3 py-4">

				<h5 class="m-0 me-2">Settings</h5>

				<a href="javascript:void(0);" class="right-bar-toggle ms-auto">
					<i class="mdi mdi-close noti-icon"></i>
				</a>
			</div>

			<!-- Settings -->




		</div>
		<!-- end slimscroll-menu-->
	</div>
	<!-- /Right-bar -->

	<!-- Right bar overlay-->
	<div class="rightbar-overlay"></div>

	<!-- JAVASCRIPT -->
	<script src="assets/libs/jquery/jquery.min.js"></script>
	<script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/libs/metismenu/metisMenu.min.js"></script>
	<script src="assets/libs/simplebar/simplebar.min.js"></script>
	<script src="assets/libs/node-waves/waves.min.js"></script>

	<!-- apexcharts -->
	<script src="assets/libs/apexcharts/apexcharts.min.js"></script>

	<!-- dashboard init -->
	<script src="assets/js/pages/dashboard.init.js"></script>

	<!-- App js -->
	<script src="assets/js/app.js"></script>
		<script>
    // Function to prevent navigation back to the previous page
    function preventBack() {
        window.history.forward();
    }

    // Call the preventBack function when the page loads
    preventBack();

    // Attach an event listener to the window's load event
    window.onload = function () {
        // Disable navigation back to the previous page
        setTimeout("preventBack()", 0);

        // Attach an event listener to the window's popstate event
        window.addEventListener('popstate', function (event) {
            // Check if the user has logged out
            if (document.referrer.includes("logout")) {
                // Redirect the user to the login page
                window.location.replace("EmployeeLogin.jsp");
            } else {
                // Replace the current state in the history with the login page
                history.replaceState(null, null, "EmployeeLogin.jsp");
            }
        });
    };

    // Continuously monitor navigation attempts
    setInterval(function () {
        // Check if the user has logged out
        if (document.referrer.includes("logout")) {
            // Redirect the user to the login page
            window.location.replace("EmployeeLogin.jsp");
        }
    }, 50);
</script>
</body>

</html>
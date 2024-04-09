<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.orderorbit.model.Cart"%>
<%@page import="com.orderorbit.model.Orders"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Order Orbit Orders</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<link href="User_Frontend_Files\img\Order_Orbit_Final_Logo.jpg"
	rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="User_Frontend_Files/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="User_Frontend_Files/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="User_Frontend_Files/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="User_Frontend_Files/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="User_Frontend_Files/css/style.css" rel="stylesheet">

<style>
body {
	font-family: 'Nunito', sans-serif;
}

.table {
	border-radius: 10px;
	overflow: hidden;
}

.table th, .table td {
	border: none;
}

.table-hover tbody tr:hover {
        background-color: rgba(211, 211, 211, 0.1); /* Updated color for hover */
        color: black; /* White text on hover */
   		 cursor: pointer;
    }
/*#tr:hover {
    background-color: #e0ebeb;
    font-weight: bold;
    cursor: pointer;
}

#tr:hover td {
    background-color: transparent; 
}
*/

.table .total-row {
	background-color: #fff3cd; /* Yellow background for the total row */
}

.btn-back {
	margin-bottom: 20px;
}

.btn-place-order, .btn-remove {
	border-radius: 20px; /* Rounded border for buttons */
	color: #fff;
	transition: all 0.3s ease;
	/* Smooth transition for button color change */
}

.btn-remove {
	background-color: #ff6363; /* Red color for remove button */
	border-color: #ff6363;
}

.btn-remove:hover {
	background-color: #ff4545; /* Darker red on hover */
	border-color: #ff4545;
}

.btn-place-order {
	background-color: #55b55b; /* Green color for place order button */
	border-color: #55b55b;
}

.btn-place-order:hover {
	background-color: #45a045; /* Darker green on hover */
	border-color: #45a045;
}

.btn-remove i, .btn-place-order i {
	margin-right: 5px; /* Add some space between button text and icon */
}

.total-row {
	font-weight: bold;
}
</style>

</head>

<body>
	<%
						Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");			
					int cartsize=0;
					if (cart != null && !cart.isEmpty()) {
							
					cartsize = cart.size();
					}
						%>
	<div class="container-xxl bg-white p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->


		<div class="container-xxl position-relative p-0">
			<nav
				class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
				<a href="" class="navbar-brand p-0">
					<h1 class="text-primary m-0">
						Order <i class="fa fa-utensils me-3"></i>Orbit
					</h1> <!-- <img src="img/logo.png" alt="Logo"> -->
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
					<span class="fa fa-bars"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse"
					style="font-family: 'Heebo', 'sans-serif';">
					<div class="navbar-nav ms-auto py-0 pe-4">
						<a href="Home.jsp" class="nav-item nav-link">Home</a> <a
							href="UserDashboard.jsp" class="nav-item nav-link">Menu</a>
						<a class="nav-item nav-link" href="Cart.jsp"><span
							class="badge badge-pill badge-danger"> <%= cartsize %></span><i
							class='fa fa-shopping-cart'></i></a> <a href="ViewPastOrder" class="nav-item nav-link active">Orders</a> <a class="nav-link"
							href="logoutcustomer">Logout</a>
					</div>
				</div>


			</nav>

			<div class="container-xxl py-5 bg-dark hero-header mb-5">
				<div class="container text-center my-5 pt-5 pb-4">
					<h1 class="display-3 text-white mb-3 animated slideInDown">Your
						Past Orders</h1>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb justify-content-center text-uppercase">
							<li class="breadcrumb-item"><a href="Home.jsp">Home</a></li>
							<li class="breadcrumb-item text-white active" aria-current="page"><a
								href="ViewPastOrder.jsp">Orders</a></li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
		<!-- Navbar & Hero End -->


		<div class="container">

			<div class="table-responsive">
				<table class="table table-hover table-bordered">
					<thead class="bg-primary text-white">
						<tr>
							<th>Order ID</th>
							<th>Order Date</th>
							<th>Order Status</th>
							<th>Total Amount</th>

						</tr>
					</thead>
					<tbody>
						<% 
    List<Orders> pastOrders = (List<Orders>) session.getAttribute("past_orders");
    if (pastOrders != null && !pastOrders.isEmpty()) {
        for (Orders order : pastOrders) {
%>
						<tr class='clickable-row' data-order-id="<%= order.getOrderId() %>" id="tr">
							<td><%= order.getOrderId() %></td>
							<td><%= order.getOrderDate() %></td>
							<td><%= order.getOrderStatus() %></td>
							<td><%= order.getTotalAmount() %></td>
						</tr>
						<% 
        }
    } else { 
%>
						<tr>
							<td colspan="3">You Have No Order History.</td>
						</tr>
						<% 
    } 
%>


					</tbody>
				</table>
			</div>

		</div>

		<!-- Footer Start -->
		<div
			class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn"
			data-wow-delay="0.1s">
			<div class="container py-5">
				<div class="row g-5">
					<div class="col-lg-3 col-md-6">
						<h4
							class="section-title ff-secondary text-start text-primary fw-normal mb-4">Order
							Orbit</h4>
						<a class="btn btn-link" href="#">About Us</a> <a
							class="btn btn-link" href="#">Contact Us</a> <a
							class="btn btn-link" href="#">Privacy Policy</a> <a
							class="btn btn-link" href="#">Terms & Condition</a>
					</div>
					<div class="col-lg-3 col-md-6">
						<h4
							class="section-title ff-secondary text-start text-primary fw-normal mb-4">Contact</h4>
						<p class="mb-2">
							<i class="fa fa-map-marker-alt me-3"></i>Deer circle, Prahalad
							Nagar, Ahmedabad
						</p>
						<p class="mb-2">
							<i class="fa fa-phone-alt me-3"></i>+91 8742075730
						</p>
						<p class="mb-2">
							<i class="fa fa-envelope me-3"></i>orderorbit03@gmail.com
						</p>
						<div class="d-flex pt-2">
							<a class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-youtube"></i></a> <a
								class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-linkedin-in"></i></a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<h4
							class="section-title ff-secondary text-start text-primary fw-normal mb-4">Opening</h4>
						<h5 class="text-light fw-normal">Monday - Saturday</h5>
						<p>09AM - 09PM</p>
						<h5 class="text-light fw-normal">Sunday</h5>
						<p>10AM - 10PM</p>
					</div>
					<div class="col-lg-3 col-md-6">
						<h4
							class="section-title ff-secondary text-start text-primary fw-normal mb-4">Newsletter</h4>
						<p>Please write your reviews Here.</p>
						<div class="position-relative mx-auto text-center"
							style="max-width: 400px;">
							<a href="mailto:orderorbit03@gmail.com">
								<button type="button" class="btn btn-primary py-2 mt-2"
									style="margin-left: auto; margin-right: auto;">Send
									Mail</button>
							</a>
						</div>
					</div>

				</div>
			</div>
			<div class="container">
				<div class="copyright">
					<div class="row">
						<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
							&copy; <a class="border-bottom" href="#">Order Orbit</a>, All
							Right Reserved. Designed By <a class="border-bottom" href="">Order
								Orbit Team</a><br> <br>
						</div>
						<div class="col-md-6 text-center text-md-end">
							<div class="footer-menu">
								<a href="">Home</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer End -->



		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>
	</div>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="User_Frontend_Files/lib/wow/wow.min.js"></script>
	<script src="User_Frontend_Files/lib/easing/easing.min.js"></script>
	<script src="User_Frontend_Files/lib/waypoints/waypoints.min.js"></script>
	<script src="User_Frontend_Files/lib/counterup/counterup.min.js"></script>
	<script src="User_Frontend_Files/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="User_Frontend_Files/lib/tempusdominus/js/moment.min.js"></script>
	<script
		src="User_Frontend_Files/lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script
		src="User_Frontend_Files/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="User_Frontend_Files/js/main.js"></script>
	<script>
    // Store scroll position before form submission
    function storeFormData() {
        sessionStorage.setItem('scrollPosition', window.scrollY);
    }

    // Scroll to stored position after page reloads
    document.addEventListener('DOMContentLoaded', function() {
        var scrollPosition = sessionStorage.getItem('scrollPosition');

        if (scrollPosition) {
            window.scrollTo(0, scrollPosition);
            sessionStorage.removeItem('scrollPosition'); // Remove stored position after using it
        }
    });
</script>

<script>
    document.addEventListener('DOMContentLoaded', (event) => {
        document.querySelectorAll('.clickable-row').forEach(row => {
            row.addEventListener('click', function() {
                var orderId = this.getAttribute('data-order-id');
                window.location.href = '/orderorbit/CustomerOrderDetails.jsp?order_Id=' + orderId;
            });
        });
    });
</script>

<!--  <script>
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
            // Redirect the user to the login page
            window.location.replace("CustomerLogin.jsp");
        });

        // Replace the current state in the history with the login page
        history.replaceState(null, null, "CustomerLogin.jsp");
    };

    // Continuously monitor navigation attempts
    setInterval(function () {
        if (window.location.hash == "#") {
            window.location.hash = "";
        }
    }, 50);
</script>-->

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
            if (document.referrer.includes("logoutcustomer")) {
                // Redirect the user to the login page
                window.location.replace("CustomerLogin.jsp");
            } else {
                // Replace the current state in the history with the login page
                history.replaceState(null, null, "CustomerLogin.jsp");
            }
        });
    };

    // Continuously monitor navigation attempts
    setInterval(function () {
        // Check if the user has logged out
        if (document.referrer.includes("logoutcustomer")) {
            // Redirect the user to the login page
            window.location.replace("CustomerLogin.jsp");
        }
    }, 50);
</script>


</body>

</html>
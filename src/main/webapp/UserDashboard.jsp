<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.orderorbit.model.MenuItem"%>
<%@page import="com.orderorbit.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Order Orbit Menu</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">


<link href="User_Frontend_Files\img\Order_Orbit_Final_Logo.jpg" rel="icon">

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
    /* Add to Cart Button */
    .btn-add-to-cart {
        background-color: #f0ad4e;
        color: #fff;
        border: none;
        padding: 8px 12px;
        font-size: 14px;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .btn-add-to-cart:hover {
        background-color: #ec971f;
    }

    /* Quantity Input */
    .quantity-input {
        width: 60px;
        padding: 6px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
        margin-right: 8px;
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


		<!-- Navbar & Hero Start -->
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
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<div class="navbar-nav ms-auto py-0 pe-4">
						<a href="Home.jsp" class="nav-item nav-link">Home</a> <a
							href="UserDashboard.jsp" class="nav-item nav-link active">Menu</a>
						<a class="nav-item nav-link" href="Cart.jsp"><span
							class="badge badge-pill badge-danger"> <%= cartsize %></span><i
							class='fa fa-shopping-cart'></i></a>
							<a href="ViewPastOrder" class="nav-item nav-link">Orders</a><a class="nav-link"
							href="logoutcustomer">Logout</a>
					</div>	
				</div>


			</nav>

			<div class="container-xxl py-5 bg-dark hero-header mb-5">
				<div class="container text-center my-5 pt-5 pb-4">
					<h1 class="display-3 text-white mb-3 animated slideInDown">Food
						Menu</h1>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb justify-content-center text-uppercase">
							<li class="breadcrumb-item"><a href="Home.jsp">Home</a></li>
							<li class="breadcrumb-item text-white active" aria-current="page">Menu</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
		<!-- Navbar & Hero End -->


		<!-- Menu Start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
            <h5 class="section-title ff-secondary text-center text-primary fw-normal">Food Menu</h5>
            <h1 class="mb-5">All Items</h1>
        </div>
        <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
            <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                <li class="nav-item">
                    <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3" data-bs-toggle="pill" href="#tab-1">
                        <i class="fa fa-coffee fa-2x text-primary"></i>
                        <div class="ps-3">
                            <small class="text-body">Popular</small>
                            <h6 class="mt-n1 mb-0">Appetizer</h6>
                        </div>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill" href="#tab-2">
                        <i class="fa fa-hamburger fa-2x text-primary"></i>
                        <div class="ps-3">
                            <small class="text-body">Special</small>
                            <h6 class="mt-n1 mb-0">Main Course</h6>
                        </div>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-3">
                        <i class="fa fa-utensils fa-2x text-primary"></i>
                        <div class="ps-3">
                            <small class="text-body">Lovely</small>
                            <h6 class="mt-n1 mb-0">Dessert</h6>
                        </div>
                    </a>
                </li>
            </ul>

            <!-- Tab Content -->
            <div class="tab-content">
                <!-- Appetizer Tab -->
                <div id="tab-1" class="tab-pane fade show active">
                    <div class="row g-4">
                        <% 
                            List<MenuItem> appetizerItemList = (List<MenuItem>) session.getAttribute("appetizerItemList");
                            if (appetizerItemList != null && !appetizerItemList.isEmpty()) {
                                for (MenuItem item : appetizerItemList) {
                        %>
                        <div class="col-lg-6">
                            <!-- Appetizer Item -->
                            <div class="d-flex align-items-center">
                                <img class="flex-shrink-0 img-fluid rounded" src="uploadImages/<%= (String)item.getItem_image() %>" alt="<%= item.getItemName() %> Image" style="width: 80px;">
                                <div class="w-100 d-flex flex-column text-start ps-4">
                                    <h5 class="d-flex justify-content-between border-bottom pb-2">
                                        <span><%=item.getItemName()%></span> 
                                        <span class="text-primary">₹<%=item.getItemPrice()%></span>
                                    </h5>
                                    <small class="fst-italic"><%=item.getCategory().getCategoryDescription()%></small>
                                    <form action="addToCart" method="post" class="mt-3" onsubmit="storeFormData('#tab-1')">
                                        <input type="hidden" name="itemId" value="<%=item.getItemId()%>">
                                        <input type="hidden" name="itemName" value="<%=item.getItemName()%>">
                                        <input type="hidden" name="itemPrice" value="<%=item.getItemPrice()%>">
                                        <input type="number" name="quantity" value="1" min="1" class="form-control quantity-input" style="width: 80px;">
                                        <button type="submit" class="btn btn-warning mt-2 btn-add-to-cart">Add to Cart</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <% 
                                }
                            } else {
                        %>
                        <p>No Items Available</p>
                        <% } %>
                    </div>
                </div>

                <!-- Main Course Tab -->
                <div id="tab-2" class="tab-pane fade">
                    <div class="row g-4">
                        <% 
                            List<MenuItem> mainCourseItemList = (List<MenuItem>) session.getAttribute("mainCourseItemList");
                            if (mainCourseItemList != null && !mainCourseItemList.isEmpty()) {
                                for (MenuItem item : mainCourseItemList) {
                        %>
                        <div class="col-lg-6">
                            <!-- Main Course Item -->
                            <div class="d-flex align-items-center">
                                <img class="flex-shrink-0 img-fluid rounded" src="uploadImages/<%= (String)item.getItem_image() %>" alt="<%= item.getItemName() %> Image" style="width: 80px;">
                                <div class="w-100 d-flex flex-column text-start ps-4">
                                    <h5 class="d-flex justify-content-between border-bottom pb-2">
                                        <span><%=item.getItemName()%></span> 
                                        <span class="text-primary">₹<%=item.getItemPrice()%></span>
                                    </h5>
                                    <small class="fst-italic"><%=item.getCategory().getCategoryDescription()%></small>
                                    <form action="addToCart" method="post" class="mt-3" onsubmit="storeFormData('#tab-2')">
                                        <input type="hidden" name="itemId" value="<%=item.getItemId()%>">
                                        <input type="hidden" name="itemName" value="<%=item.getItemName()%>">
                                        <input type="hidden" name="itemPrice" value="<%=item.getItemPrice()%>">
                                        <input type="number" name="quantity" value="1" min="1" class="form-control quantity-input" style="width: 80px;">
                                        <button type="submit" class="btn btn-warning mt-2 btn-add-to-cart">Add to Cart</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <% 
                                }
                            } else {
                        %>
                        <p>No Items Available</p>
                        <% } %>
                    </div>
                </div>

                <!-- Dessert Tab -->
                <div id="tab-3" class="tab-pane fade">
                    <div class="row g-4">
                        <% 
                            List<MenuItem> dessertItemList = (List<MenuItem>) session.getAttribute("dessertItemList");
                            if (dessertItemList != null && !dessertItemList.isEmpty()) {
                                for (MenuItem item : dessertItemList) {
                        %>
                        <div class="col-lg-6">
                            <!-- Dessert Item -->
                            <div class="d-flex align-items-center">
                                <img class="flex-shrink-0 img-fluid rounded" src="uploadImages/<%= (String)item.getItem_image() %>" alt="<%= item.getItemName() %> Image" style="width: 80px;">
                                <div class="w-100 d-flex flex-column text-start ps-4">
                                <h5 class="d-flex justify-content-between border-bottom pb-2">
                                    <span><%=item.getItemName()%></span> 
                                    <span class="text-primary">₹<%=item.getItemPrice()%></span>
                                </h5>
                                <small class="fst-italic"><%=item.getCategory().getCategoryDescription()%></small>
                                <form action="addToCart" method="post" class="mt-3" onsubmit="storeFormData('#tab-3')">
                                    <input type="hidden" name="itemId" value="<%=item.getItemId()%>">
                                    <input type="hidden" name="itemName" value="<%=item.getItemName()%>">
                                    <input type="hidden" name="itemPrice" value="<%=item.getItemPrice()%>">
                                    <input type="number" name="quantity" value="1" min="1" class="form-control quantity-input" style="width: 80px;">
                                    <button type="submit" class="btn btn-warning mt-2 btn-add-to-cart">Add to Cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <% 
                            }
                        } else {
                    %>
                    <p>No Items Available</p>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!-- Menu End -->

		
					<!-- Menu End -->


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
								Orbit Team</a><br>
							<br>
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
					<a href="#"
						class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
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
				<script
					src="User_Frontend_Files/lib/owlcarousel/owl.carousel.min.js"></script>
				<script src="User_Frontend_Files/lib/tempusdominus/js/moment.min.js"></script>
				<script
					src="User_Frontend_Files/lib/tempusdominus/js/moment-timezone.min.js"></script>
				<script
					src="User_Frontend_Files/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

				<!-- Template Javascript -->
				<script src="User_Frontend_Files/js/main.js"></script>
 <script>
    // Store scroll position and active tab before form submission
    function storeFormData(tabId) {
        sessionStorage.setItem('scrollPosition', window.scrollY);
        sessionStorage.setItem('activeTab', tabId);
    }

    // Scroll to stored position and activate tab after page reloads
    document.addEventListener('DOMContentLoaded', function() {
        var scrollPosition = sessionStorage.getItem('scrollPosition');
        var activeTab = sessionStorage.getItem('activeTab');
        
        if (scrollPosition) {
            window.scrollTo(0, scrollPosition);
            sessionStorage.removeItem('scrollPosition'); // Remove stored position after using it
        }

        if (activeTab) {
            var tabLink = document.querySelector('a[href="' + activeTab + '"]');
            var tabPane = document.querySelector(activeTab);
            
            if (tabLink && tabPane) {
                // Remove 'active' class from all tab links and panes
                document.querySelectorAll('.nav-link').forEach(function(link) {
                    link.classList.remove('active');
                });
                document.querySelectorAll('.tab-pane').forEach(function(pane) {
                    pane.classList.remove('show', 'active');
                });

                // Add 'active' class to the selected tab link and pane
                tabLink.classList.add('active');
                tabPane.classList.add('show', 'active');
            } else {
                console.error('Tab link or pane not found:', activeTab);
            }
            sessionStorage.removeItem('activeTab'); // Remove stored tab after using it
        }
    });
</script>

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
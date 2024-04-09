<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.orderorbit.model.MenuItem"%>
<%@ page import="com.orderorbit.model.Category"%>
<%@ page import="com.orderorbit.util.DbConnection"%>
<%@ page import="com.orderorbit.dao.MenuItemDao"%>
<%
  
 MenuItemDao menuItemDao = new MenuItemDao(DbConnection.getDbConnnection());
    
 MenuItem springRoll = menuItemDao.findItemByName("Spring Rolls", new Category(1, "Appetizers", "Starters or appetizers to whet your appetite.")); 
 MenuItem paneerButterMasala = menuItemDao.findItemByName("Paneer Butter Masala", new Category(2, "Main Course", "Delicious main dishes to satisfy your hunger.")); 
 MenuItem bhindiCapsicum = menuItemDao.findItemByName("Bhindi Capsicum Sabzi", new Category(2, "Main Course", "Delicious main dishes to satisfy your hunger.")); 
 MenuItem cupCakes = menuItemDao.findItemByName("Red Velvet Cupcake", new Category(3, "Desserts", "Sweet treats to end your meal on a high note.")); 

%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Order Orbit</title>
<link href="User_Frontend_Files\img\Order_Orbit_Final_Logo.jpg"
	rel="icon">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<style>
.form {
	background-color: #fff;
	display: block;
	padding: 1rem;
	max-width: 100%;
	border-radius: 0.5rem;
	box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px
		rgba(0, 0, 0, 0.05);
}

.clr-blue {
	color: blue;
}

* {
	padding: 0;
	margin: 0;
}

.form-title {
	font-size: 1.25rem;
	line-height: 1.75rem;
	font-weight: 600;
	text-align: center;
	color: #000;
}

.input-container {
	position: relative;
}

.input-container input, .form button {
	outline: none;
	border: 1px solid #e5e7eb;
	margin: 8px 0;
}

.input-container input {
	background-color: #fff;
	padding: 1rem;
	padding-right: 3rem;
	font-size: 0.875rem;
	line-height: 1.25rem;
	width: 100%;
	border-radius: 0.5rem;
	box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
}

.submit {
	display: block;
	padding-top: 0.75rem;
	padding-bottom: 0.75rem;
	padding-left: 1.25rem;
	padding-right: 1.25rem;
	background-color: #dbb300;
	color: #ffffff;
	font-size: 0.875rem;
	line-height: 1.25rem;
	font-weight: 500;
	width: 100%;
	border-radius: 0.5rem;
	text-transform: uppercase;
}

.signup-link {
	color: #6B7280;
	font-size: 0.875rem;
	line-height: 1.25rem;
	text-align: center;
}

.signup-link a {
	text-decoration: underline;
}
</style>

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
</head>

<body>
	<div class="container-xxl bg-white p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
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
					<a href="index.jsp" class="nav-item nav-link active">Home</a> <a
						href="#about" class="nav-item nav-link">About</a>
					<!--  <a href="service.html" class="nav-item nav-link">Service</a>-->
					<!-- <a href="menu.html" class="nav-item nav-link">Menu</a> -->
					<a href="CustomerLogin.jsp" class="nav-item nav-link">Login</a> <a
						href="CustomerRegister.jsp" id="name" class="nav-item nav-link">SignUp</a>

				</div>
			</div>
		</nav>

		<div class="container-xxl py-5 bg-dark hero-header mb-5">
			<div class="container my-5 py-5">
				<div class="row align-items-center g-5">
					<div class="col-lg-6 text-center text-lg-start">
						<h1 class="display-3 text-white animated slideInLeft">
							Enjoy Our<br>Delicious Meal
						</h1>
						<p class="text-white animated slideInLeft mb-4 pb-2">"Embark
							on a culinary journey and savor the symphony of flavors with our
							tantalizing array of dishes – each bite a celebration, each meal
							an unforgettable experience."</p>
					</div>
					<div class="col-lg-6 text-center text-lg-end overflow-hidden">
						<img class="img-fluid"
							src="User_Frontend_Files/img/new_front_photo.png"
							alt="Front_Photo">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Navbar & Hero End -->

	<!-- About Start -->
	<div class="container-xxl py-5" id="about">
		<div class="container">
			<div class="row g-5 align-items-center">
				<div class="col-lg-6">
					<div class="row g-3">
						<div class="col-6 text-start">
							<img class="img-fluid rounded w-100 wow zoomIn"
								data-wow-delay="0.1s"
								src="User_Frontend_Files/img/about-1-ne.jpg">
						</div>
						<div class="col-6 text-start">
							<img class="img-fluid rounded w-75 wow zoomIn"
								data-wow-delay="0.3s"
								src="User_Frontend_Files/img/about-5-new.jpeg"
								style="margin-top: 13%;">
						</div>
						<div class="col-6 text-end">
							<img class="img-fluid rounded w-75 wow zoomIn"
								data-wow-delay="0.5s"
								src="User_Frontend_Files/img/about-3-new.jpg">
						</div>
						<div class="col-6 text-end">
							<img class="img-fluid rounded w-100 wow zoomIn"
								data-wow-delay="0.7s"
								src="User_Frontend_Files/img/about-4-new.jpg">
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<h5
						class="section-title ff-secondary text-start text-primary fw-normal">About
						Us</h5>
					<h1 class="mb-4">
						Welcome to Order <i class="fa fa-utensils text-primary me-2"></i>Orbit
					</h1>
					<p class="mb-4">As a premier cloud kitchen management platform,
						we are dedicated to revolutionizing the culinary landscape, one
						order at a time. Our mission is simple: to provide seamless,
						efficient, and delightful dining experiences for both our partners
						and customers.</p>
					<p class="mb-4">At Order Orbit, we understand the evolving
						demands of the modern food industry. That's why we've crafted a
						comprehensive suite of tools and services designed to empower
						cloud kitchens, enabling them to thrive in today's dynamic market.
						From streamlined order management to advanced analytics, we offer
						everything you need to unleash your kitchen's full potential.</p>
					<div class="row g-4 mb-4">
						<div class="col-sm-6">
							<div
								class="d-flex align-items-center border-start border-5 border-primary px-3">
								<h1 class="flex-shrink-0 display-5 text-primary mb-0"
									data-toggle="counter-up">5</h1>
								<div class="ps-4">
									<p class="mb-0">Years of</p>
									<h6 class="text-uppercase mb-0">Experience</h6>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div
								class="d-flex align-items-center border-start border-5 border-primary px-3">
								<h1 class="flex-shrink-0 display-5 text-primary mb-0"
									data-toggle="counter-up">4</h1>
								<div class="ps-4">
									<p class="mb-0">Popular</p>
									<h6 class="text-uppercase mb-0">Master Chefs</h6>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- About End -->


	<!--  Menu Start -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
				<h5
					class="section-title ff-secondary text-center text-primary fw-normal">Food
					Menu</h5>
				<h1 class="mb-5">Most Popular Items</h1>
			</div>
			<div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
				<div class="tab-content">
					<div id="tab-1" class="tab-pane fade show p-0 active">
						<div class="row g-4">
							<div class="col-lg-6">
								<div class="d-flex align-items-center">
									<img class="flex-shrink-0 img-fluid rounded"
										src="User_Frontend_Files/img/appetizer/spring-rolls-recipe-appetizer.jpg"
										alt="" style="width: 80px;">
									<div class="w-100 d-flex flex-column text-start ps-4">
										<h5 class="d-flex justify-content-between border-bottom pb-2">
											<span>Spring-Roll</span> <span class="text-primary">₹
												<%= springRoll.getItemPrice() %></span>
										</h5>
										<small class="fst-italic">The crisp you are looking
											for ends here.</small>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="d-flex align-items-center">
									<img class="flex-shrink-0 img-fluid rounded"
										src="User_Frontend_Files/img/main_course/kadai-paneer-main_course.jpg"
										alt="" style="width: 80px;">
									<div class="w-100 d-flex flex-column text-start ps-4">
										<h5 class="d-flex justify-content-between border-bottom pb-2">
											<span>Paneer Butter Masala</span> <span class="text-primary">₹
												<%= paneerButterMasala.getItemPrice() %></span>
										</h5>
										<small class="fst-italic">Bursting with flavor, a
											must-try at Order Orbit.</small>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="d-flex align-items-center">
									<img class="flex-shrink-0 img-fluid rounded"
										src="User_Frontend_Files/img/main_course/bhindi-capsicum-main_course.jpg"
										alt="" style="width: 80px;">
									<div class="w-100 d-flex flex-column text-start ps-4">
										<h5 class="d-flex justify-content-between border-bottom pb-2">
											<span>Bhindi-Capsicum</span> <span class="text-primary">₹
												<%=bhindiCapsicum.getItemPrice() %></span>
										</h5>
										<small class="fst-italic">A delightful twist to
											traditional Indian cuisine.</small>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="d-flex align-items-center">
									<img class="flex-shrink-0 img-fluid rounded"
										src="User_Frontend_Files/img/desserts/eggless-red-velvet-cupcakes-desserts.jpg"
										alt="" style="width: 80px;">
									<div class="w-100 d-flex flex-column text-start ps-4">
										<h5 class="d-flex justify-content-between border-bottom pb-2">
											<span>Cup-Cakes</span> <span class="text-primary">₹ <%=cupCakes.getItemPrice() %></span>
										</h5>
										<small class="fst-italic">A delightful treat that's
											both luscious and irresistible</small>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Menu End -->



	<div class="modal fade" id="videoModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content rounded-0">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Youtube Video</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- 16:9 aspect ratio -->
					<div class="ratio ratio-16x9">
						<iframe class="embed-responsive-item" src="" id="video"
							allowfullscreen allowscriptaccess="always" allow="autoplay"></iframe>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Reservation Start -->


	<!-- Team Start -->
	<div class="container-xxl pt-5 pb-3">
		<div class="container">
			<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
				<h5
					class="section-title ff-secondary text-center text-primary fw-normal">Team
					Members</h5>
				<h1 class="mb-5">Our Master Chefs</h1>
			</div>
			<div class="row g-4">
				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
					<div class="team-item text-center rounded overflow-hidden">
						<div class="rounded-circle overflow-hidden m-4">
							<img class="img-fluid" src="User_Frontend_Files/img/team-2.jpg"
								alt="">
						</div>
						<h5 class="mb-0">Deepak</h5>
						<small>Senior Chef</small>
						<div class="d-flex justify-content-center mt-3">
							<a class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
					<div class="team-item text-center rounded overflow-hidden">
						<div class="rounded-circle overflow-hidden m-4">
							<img class="img-fluid" src="User_Frontend_Files/img/team-1.jpg"
								alt="">
						</div>
						<h5 class="mb-0">Kartik</h5>
						<small>Chef</small>
						<div class="d-flex justify-content-center mt-3">
							<a class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
					<div class="team-item text-center rounded overflow-hidden">
						<div class="rounded-circle overflow-hidden m-4">
							<img class="img-fluid" src="User_Frontend_Files/img/team-3.jpg"
								alt="">
						</div>
						<h5 class="mb-0">Nitin</h5>
						<small>Chef</small>
						<div class="d-flex justify-content-center mt-3">
							<a class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
					<div class="team-item text-center rounded overflow-hidden">
						<div class="rounded-circle overflow-hidden m-4">
							<img class="img-fluid" src="User_Frontend_Files/img/team-4.jpg"
								alt="">
						</div>
						<h5 class="mb-0">Naveen</h5>
						<small>Chef</small>
						<div class="d-flex justify-content-center mt-3">
							<a class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Team End -->


	<!-- Testimonial Start -->
	<div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
		<div class="container">
			<div class="text-center">
				<h5
					class="section-title ff-secondary text-center text-primary fw-normal">Testimonial</h5>
				<h1 class="mb-5">Our Clients Say!!!</h1>
			</div>
			<div class="owl-carousel testimonial-carousel">
				<div class="testimonial-item bg-transparent border rounded p-4">
					<i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
					<p>The flavors were exquisite! Each dish was a culinary
						masterpiece.</p>
					<div class="d-flex align-items-center">
						<img class="img-fluid flex-shrink-0 rounded-circle"
							src="User_Frontend_Files/img/testimonial-2.jpg"
							style="width: 50px; height: 50px;">
						<div class="ps-3">
							<h5 class="mb-1">Ram</h5>
							<small>Engineer</small>
						</div>
					</div>
				</div>
				<div class="testimonial-item bg-transparent border rounded p-4">
					<i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
					<p>Absolutely delicious! The perfect blend of spices and
						textures.</p>
					<div class="d-flex align-items-center">
						<img class="img-fluid flex-shrink-0 rounded-circle"
							src="User_Frontend_Files/img/testimonial-1.jpg"
							style="width: 50px; height: 50px;">
						<div class="ps-3">
							<h5 class="mb-1">Shreya</h5>
							<small>Designer</small>
						</div>
					</div>
				</div>
				<div class="testimonial-item bg-transparent border rounded p-4">
					<i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
					<p>Satisfying portions and bursting with flavor! A delightful
						culinary journey.</p>
					<div class="d-flex align-items-center">
						<img class="img-fluid flex-shrink-0 rounded-circle"
							src="User_Frontend_Files/img/testimonial-3.jpg"
							style="width: 50px; height: 50px;">
						<div class="ps-3">
							<h5 class="mb-1">Varun</h5>
							<small>Doctor</small>
						</div>
					</div>
				</div>
				<div class="testimonial-item bg-transparent border rounded p-4">
					<i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
					<p>Consistently amazing! Always fresh, always delicious</p>
					<div class="d-flex align-items-center">
						<img class="img-fluid flex-shrink-0 rounded-circle"
							src="User_Frontend_Files/img/testimonial-4.jpg"
							style="width: 50px; height: 50px;">
						<div class="ps-3">
							<h5 class="mb-1">Kriti</h5>
							<small>CA</small>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Testimonial End -->


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
							<a href="">Home</a> <a href="">Help</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer End -->



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

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Order Orbit Registration</title>
  <link href="User_Frontend_Files\img\Order_Orbit_Final_Logo.jpg" rel="icon">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <!-- Custom CSS -->
  <style>
    body {
      background: linear-gradient(135deg, #FFD700, #FFA000); /* Yellow gradient background */
      font-family: 'Poppins', sans-serif; /* Google font */
      overflow: hidden; /* Hide overflow */
    }
    .container {
      position: relative;
      z-index: 1; /* Ensure content appears above background */
      margin-top: 100px;
      max-width: 400px;
      border-radius: 10px;
      background-color: #fff; /* White background */
      padding: 40px;
      box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
    }
    .form-group {
      margin-bottom: 20px;
    }
    .btn-yellow {
      background-color: #FFC107; /* Yellow button */
      border: none;
      transition: all 0.3s ease-in-out; /* Smooth transition */
    }
    .btn-yellow:hover {
      background-color: #FFD100; /* Lighter yellow on hover */
      transform: scale(1.05); /* Slight scale on hover */
    }
    h1 {
      color: #FFC107; /* Yellow heading */
      font-weight: 600; /* Bold */
      font-size: 2rem; /* Larger font size */
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2); /* Text shadow for depth */
    }
    .form-control {
      background-color: #fff; /* White input background */
      border-color: #FFC107; /* Yellow border */
    }
    .form-control:focus {
      box-shadow: 0 0 5px #FFC107; /* Yellow box shadow on focus */
    }
    .small-text {
      font-size: 0.9em; /* Slightly larger font size */
      color: #888;
    }
    a {
      color: #FFC107; /* Yellow link color */
    }
    .decoration {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-image: url('User_Frontend_Files/img/bg-her.jpg'); /* Background image */
      background-size: cover;
      background-position: center;
      filter: blur(5px); /* Blur effect */
      z-index: 0;
    }
  </style>
</head>
<body>
  <div class="decoration"></div> <!-- Background decoration -->
  <div class="container">
   <%
								String err = (String) session.getAttribute("error");
								if (err != null) {
								%>
								<h5 style="color: red; display: flex; justify-content: center ;font-size: 14px; "><%=err%></h5>
								<%
								session.removeAttribute("error");
								}
								%>
    <h1 class="text-center mb-4" onclick="window.location.href='index.jsp'" >Order <i class="fa fa-utensils me-2" style="color: #FFC107;"></i><span class="text-dark"> Orbit</span></h1>
    <form action="CustomerRegisterServlet" method="post">
      <div class="form-group">
        <input type="text" class="form-control" id="name" placeholder="Name" name="customerName" pattern="[A-Za-z\s]+" title="Only Alphabets are allowed" required>
      </div>
      <div class="form-group">
        <input type="tel" class="form-control" id="phone" placeholder="Phone Number" name="customerPhone" pattern="[1-9]{1}[0-9]{9}" required title="Enter 10 digit phone number">
      </div>
      <div class="form-group">
        <input type="email" class="form-control" id="email" placeholder="Email Address" name="customerEmail" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" required>
      </div>
      <div class="form-group">
      <input type="password" class="form-control" id="password" placeholder="Password" name="customerPassword" autocomplete="new-password" 
    pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
    title="Must contain at least one number, one uppercase and one lowercase letter, and be at least 8 characters long." required>
      </div>
      <button type="submit" class="btn btn-yellow btn-block">Register</button>
      <p class="text-center mt-3 small-text">Already have an account? <a href="CustomerLogin.jsp" style="color: #FFC107;">Login</a></p>
    </form>
  </div>
  
</body>
</html>
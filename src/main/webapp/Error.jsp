<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error Page</title>
<% session.invalidate();%>
<style>
body {
	background: linear-gradient(135deg, #fffb00, #fdd835);
	/* Yellow gradient */
	font-family: Arial, sans-serif;
	text-align: center;
	animation: fadeIn 1s ease-in-out; /* Fade-in animation */
}

@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
.error-symbol {
	font-size: 100px;
	color: #fff; /* White color for error symbol */
	margin-bottom: 20px;
	animation: bounce 1s ease-in-out infinite alternate;
	/* Bouncing animation */
}

@
keyframes bounce {from { transform:translateY(-10px);
	
}

to {
	transform: translateY(0px);
}

}
.error-message {
	font-size: 24px;
	color: #000; /* Black color for error message */
	margin-bottom: 20px;
	animation: pulse 1s ease-in-out infinite alternate;
	/* Pulse animation */
}

@
keyframes pulse {from { transform:scale(1);
	
}

to {
	transform: scale(1.1);
}

}
.button {
    background-color: #fff; /* White background for button */
    color: #000; /* Black text color for button */
    padding: 10px 20px;
    font-size: 18px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    text-decoration: none;
    transition: background-color 0.3s ease; /* Smooth hover transition */
}

.button:hover {
    background-color: #ff4081; /* Pink hover color for button */
    color: #fff; /* White text color on hover */
}

</style>
</head>
<body>
	<div class="error-symbol">
		<!-- You can replace this with your custom error symbol -->
		⚠️
	</div>
	<div class="error-message">Oops! Something Went Wrong</div>
	<div>We apologize for the inconvenience. Our team has been
		notified and is working to fix the issue. Please try again later.</div>
	<div style="margin-top: 20px;">
		<a href="index.jsp" class="button">Return to Home</a>
	</div>

	<!-- JavaScript for additional interactivity -->
	<script>
        // Add event listener to error symbol for additional animation
        const errorSymbol = document.querySelector('.error-symbol');
        errorSymbol.addEventListener('mouseover', () => {
            errorSymbol.style.animation = 'rotate 1s linear infinite';
        });
        errorSymbol.addEventListener('mouseout', () => {
            errorSymbol.style.animation = 'bounce 1s ease-in-out infinite alternate';
        });
    </script>
</body>
</html>

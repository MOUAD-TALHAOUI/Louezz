<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, viewport-fit=cover">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>louezz</title>

<!-- Bootstrap 4.5 CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/bootstrap.min.css">
<!-- Style CSS -->
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/style.css">
	
	
	
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/navbar.css">
	
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/footer.css">
	
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700&display=swap"
	rel="stylesheet">
	<link rel="shortcut icon" href="res/img/favicon.png">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">


<script type="text/javascript">
	function myFunction() {
		i = i % 6;
		i++;
		if(i==0){i=1;}
		document.getElementById("mouad").style ='background-image: url('+'res/img/' + i + '.jpg)';
	}

	var i = 1;
	var interval = setInterval(function() {
		myFunction();
	}, 6000);
</script>
</head>
<body id="mouad" style="background-image: url('${pageContext.request.contextPath}/res/img/ins.png');" >

	<!-- Navigation -->
	<%@ include file="navbar.jsp"%>

	<!-- End Navigation -->
	<div class="wrap mb-5">
		<h2>Login</h2>
		<div class="social-media">
			<button>
				<a href="#"><i class="fa fa-facebook"></i> Sign in with Facebook</a>
			</button>
			<button>
				<a href="#"><i class="fa fa-google"></i> Sign in with Google</a>
			</button>
		</div>
		<form action="Login" method="Post">
			<label>Email:</label><br> <input type="email"
				required="required" name="email" value=<%=request.getParameter("email") %>> <label>Password:</label><br>
			<input type="Password" required="required" name="password">

			<%
				if (request.getParameter("error") != "" && request.getParameter("error") != null) {
			%>
			<center><h3 style="color: rgb(255,0,0);background-color: white;">Invalid username or password.</h3></center>
			<%
				}
			%>

			<input type="submit" value="Sign In">
			<a href="Signup">you do not have an account?</a>


		</form>

	</div>





	<!-- Image Carousel -->


	<!-- Carousel Content -->

	<!-- End Carousel Content -->


	<!-- Previous & Next Buttons -->

	<!-- End Previous & Next Buttons -->


	<!-- End Image Carousel -->


	<!-- Main Page Heading -->


	<!-- Three Column Section -->

	<!-- End Three Column Section -->


	<!-- Emoji Navbar First -->


	<!-- Start Fixed Background IMG -->

	<!-- End Fixed Background IMG -->


	<!-- Emoji Navbar Second -->


	<!-- Modal Popup -->


	<!-- Start Two Column Section -->

	<!-- End Two Column Section -->


	<!-- Start Jumbotron -->

	<!-- End Jumbotron -->


	<!-- Start Footer -->

	<!-- End Footer -->


	<!-- Start Socket -->

	<!-- End Socket -->



	<!-- Script Source Files -->

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/res/js/jquery-3.5.1.min.js"></script>
	<!-- Bootstrap 4.5 JS -->
	<script
		src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
	<!-- Popper JS -->
	<script src="${pageContext.request.contextPath}/res/js/popper.min.js"></script>
	<!-- Font Awesome -->
	<script src="${pageContext.request.contextPath}/res/js/all.min.js"></script>

	<!-- End Script Source Files -->

</body>
	<%@ include file="footer.jsp"%>

</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Louezz</title>
<link rel="shortcut icon" href="res/img/favicon.png">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/navbar.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/footer.css">
	
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/Error.css">
	
	
	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:500" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Titillium+Web:700,900" rel="stylesheet">

	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

	

	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/bootstrap.min.css">
</head>

<body>
	<!-- Navigation -->
	<%@ include file="navbar.jsp"%>
	<div id="notfound">
		<div class="notfound">
			<div class="notfound-404">
				<h1>404</h1>
			</div>
			<h2 class="mt-4">Oops! This Page Could Not Be Found</h2>
			<p class="mt-4">Sorry but the page you are looking for does not exist, have been removed. name changed or is temporarily unavailable</p>
			<a href="home" class="mt-4">Go To Homepage</a>
		</div>
	</div>
<%@ include file="footer.jsp"%>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->



<div class="">

</div>
</html>
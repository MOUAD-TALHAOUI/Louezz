<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, viewport-fit=cover">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>louezz</title>
<link rel="shortcut icon" href="res/img/favicon.png">

<!-- Bootstrap 4.5 CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/bootstrap.min.css">
<!-- Style CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/style.css">
	
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/style.css">
	
	
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/navbar.css">
	
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/footer.css">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700&display=swap"
	rel="stylesheet">
<link rel="icon" type="${pageContext.request.contextPath}/res/image/png"
	href="images/icons/favicon.ico" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">



</head>


<script type="text/javascript">
	function checkpassword() {
		var p = f.pass.value;
		var cp = f.cpass.value;
		if (p !== cp) {
			return false;
		}
		return true;

	}
	function showalert() {

		var p = f.pass.value;
		var cp = f.cpass.value;
		if (p !== cp) {
			alert("Passwords are defferents");
		}

	}
</script>
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

<body id="mouad" style="background-image: url('${pageContext.request.contextPath}/res/img/ins.png');" >


	<!-- Navigation -->
	<%@ include file="navbar.jsp"%>

	<div class="wrap mb-5">
		<h2>Sign up</h2>

		<form name="f" method="post" action="Signup?action=signup">

			<label>First Name:</label><br> <input type="text"
				name="firstname" required="required"> <label>Last
				Name:</label><br> <input type="text" name="lastname"
				required="required"> <label>Date of birth:</label><br>

			<input type="Date" name="date" required="required"> <label>Address:</label><br>

			<input type="text" name="adress" required="required"> <label>Username:</label><br>

			<input type="text" name="username" required="required"> <label>CIN:</label><br>

			<input type="text" name="cin" required="required"> <label>num
				permis:</label><br> <input type="text" name="num_permis"
				required="required"> <label>Telephone:</label><br> <input
				type="text" name="telephone" required="required"> <label>Email:</label><br>

			<input type="email" name="email" required="required"> <label>Password:</label><br>

			<input type="Password" name="pass" id="pwd" required="required">

			<label>Confirm Password:</label><br> <input type="Password"
				name="cpass" id="pwd" required="required"> <label><input
				type="checkbox">I accept all the terms and conditions</label>

			<%
				if (request.getParameter("error") != "" && request.getParameter("error") != null) {
			%>
			<center>
				<h3 style="color: rgb(255, 0, 0); background-color: white;">Invalid
					username or password.</h3>
			</center>
			<%
				}
			%>
			<input type="submit" value="Sign Up"
				onclick="return checkpassword();" ondblclick="showalert();">

			<a href="Login">you have an account?</a>



		</form>


	</div>

















</body>
	<%@ include file="footer.jsp"%>

	<script
		src="${pageContext.request.contextPath}/res/js/jquery-3.5.1.min.js"></script>
	<!-- Bootstrap 4.5 JS -->
	<script
		src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
	<!-- Popper JS -->
	<script src="${pageContext.request.contextPath}/res/js/popper.min.js"></script>
	<!-- Font Awesome -->
	<script src="${pageContext.request.contextPath}/res/js/all.min.js"></script>
</html>
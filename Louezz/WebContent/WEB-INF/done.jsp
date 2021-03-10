<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://kit.fontawesome.com/a455eca549.js"
	crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<link rel="shortcut icon" href="res/img/favicon.png">

<link rel="stylesheet" href="/res/css/style.css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/navbar.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/footer.css">
<title>dashboard</title>
</head>
<body>

	<!-- Navigation -->
	<%@ include file="navbar.jsp"%>
	<!-- End Navigation -->

	<div class="container-fluid m-5">


		<div class="row m-5">
			<div class="col-xs-0  col-md-4"></div>
			<div class="col-md-4 col-xs-12 ">
				<div class="text-center mt-2">
					<h2>Done!!</h2>
				</div>
				<div class="text-center mt-3">
					<i class="far fa-check-circle fa-10x " style="color: #51cf66"></i>
				</div>
				<div class="text-center">
					<a href="home"
						class="btn btn-primary  bg-theme-2 outline-theme-2 mt-3">retourner
						a l'accueil</a>
				</div>

			</div>
			<div class="col-xs-0 col-md-4"></div>
		</div>
	</div>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
</body>
<div class="">
	<%@ include file="footer.jsp"%>
</div>

</html>
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
	href="${pageContext.request.contextPath}/res/css/style0.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/style00.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/navbar.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/footer.css">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">



</head>



<body id="mouad"
	style="background-color: rgba(100,150,255,1)">


	<!-- Navigation -->
	<%@ include file="navbar.jsp"%>

	<div class="">

		<div class="row content">

			<div class="container">

				<div class="row top-buffer">
					<div class="col-md-3 col-sm-0"></div>
					<div class="col-md-6 col-sm-12 mb-sm-5">
						<form method="post" action="profile?action=changepassword"
							class="px-3">
							<div class="form-group row">
								<label for="password" class="col-sm-2 col-form-label col-md-3"><i
									class="fas fa-key mr-2"></i>Ancien mot de passe</label>
								<div class="col-sm-10 col-md-9">

									<input type="password" class="form-control" id="password"
										placeholder="Ancien  mot de pass" name="motdepasse1"
										required="required">
								</div>
							</div>
							<div class="form-group row">
								<label for="password" class="col-sm-2 col-form-label col-md-3"><i
									class="fas fa-key mr-2"></i>Noveau mot de passe</label>
								<div class="col-sm-10 col-md-9">

									<input type="password" class="form-control" id="password"
										placeholder="Noveau mot de pass" name="motdepasse2"
										required="required">
								</div>
							</div>
							<div class="form-group row">
								<label for="Cpassword" class="col-sm-2 col-form-label col-md-3"><i
									class="fas fa-key mr-2"></i>Comfirmer mot de passe</label>
								<div class="col-sm-10 col-md-9">

									<input type="password" class="form-control" id="Cpassword"
										placeholder="comfirmer mot de pass" name="motdepasse3"
										required="required">
								</div>
							</div>
							<div class="form-group row justify-content-end">
								<div class="col-sm-10 col-md-9">
									<button class=" form-control btn btn-primary btn-sm co">Changer</button>
								</div>

							</div>

						</form>
					</div>
					<div class="col-sm-0 col-md-3"></div>
				</div>
			</div>
		</div>


	</div>

	<script
		src="${pageContext.request.contextPath}/res/js/jquery-3.5.1.min.js"></script>
	<!-- Bootstrap 4.5 JS -->
	<script
		src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
	<!-- Popper JS -->
	<script src="${pageContext.request.contextPath}/res/js/popper.min.js"></script>
	<!-- Font Awesome -->
	<script src="${pageContext.request.contextPath}/res/js/all.min.js"></script>

</body>
<%@ include file="footer.jsp"%>

</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ajouter une vehicule</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/style1.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<link rel="shortcut icon" href="res/img/favicon.png">

<!-- Style CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/style.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/style.css">
<!-- Bootstrap 4.5 CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/bootstrap.min.css">


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

<body
	style="background-image: url('${pageContext.request.contextPath}/res/img/5.jpg');">


	<%@ include file="navbar.jsp"%>
	<form action="voiture1?action=ajoutervoiture"
		enctype="multipart/form-data" method="post">
		<div class="root_container">
			<div class="root_title">
				<h1>louer sa voiture en quelques pas</h1>
			</div>
			<div class="sec_title">
				<h3>vehicule</h3>
			</div>
			<!-- section wraper -->
			<div class="wraper">
				<div class="in_title">
					<h3>caracteristique principales</h3>
				</div>
				<div class="data_wrapper">
					<!-- one entery wraper-->

					<!-- one entery wraper-->
					<div class="entery_wraper">
						<label>Marque</label> <input type="text" placeholder="Marque"
							value="" name="marque" required="required">
					</div>

					<div class="entery_wraper">
						<label>Modéle</label> <input type="text" placeholder="Modéle"
							value="" name="modéle" required="required">
					</div>

				</div>
			</div>

			<!-- section wraper -->
			<div class="wraper">
				<div class="in_title">
					<h3>Détails</h3>
				</div>
				<div class="data_wrapper">
					<!-- one entery wraper-->
					<div class="entery_wraper">
						<label>Carburant</label> <select name="carburant"
							required="required">
							<option value="gazoil">gazoil</option>
							<option value="essance">essance</option>
						</select>
					</div>
					<!-- one entery wraper-->
					<div class="entery_wraper">
						<label>Boit a vitesse</label> <select name="boitvts"
							required="required">
							<option value="automatique">automatique</option>
							<option value="manuele">manuele</option>
						</select>
					</div>
					<!-- one entery wraper-->
					<div class="entery_wraper">
						<label>Nombre de places</label> <input type="number" name="places"
							placeholder="places" id="places" max="10" min="0"
							required="required">
					</div>
					<!-- one entery wraper-->
					<div class="entery_wraper">
						<label>Nombre de ports</label> <input type="number" name="ports"
							placeholder="ports" id="ports" max="8" min="0"
							required="required">
					</div>
					<!-- one entery wraper-->
					<div class="entery_wraper">
						<label>Kilométrage</label> <select name="kilometrage"
							required="required">
							<option value="0">0 - 5000</option>
							<option value="2">5000 - 10000</option>
							<option value="3">10000 - 100000</option>
							<option value="4">100000 -</option>
						</select>
					</div>
				</div>
			</div>


			<!-- section wraper -->
			<div class="wraper">
				<div class="in_title">
					<h3>Offre</h3>
				</div>
				<div class="data_wrapper">
					<!-- one entery wraper-->
					<div class="entery_wraper">
						<label>ville</label> <input type="text" value="" name="ville"
							placeholder="ville" id="ville" required="required">
					</div>
					<!-- one entery wraper-->
					<div class="entery_wraper">
						<label>prix/jour</label> <input type="number" name="prix"
							id="prix" placeholder="prix" min="0" required="required">
					</div>

					<!-- one entery wraper-->
					<div class="entery_wraper">
						<label>Lieu de rencontre</label> <input type="text" name="lieu"
							id="lieu" placeholder="lieu" required="required">
					</div>

				</div>
			</div>

			<!-- section wraper -->
			<div class="wraper">
				<div class="in_title">
					<h3>Description Offre</h3>
				</div>
				<div class="data_wrapper">
					<!-- one entery wraper-->
					<div class="entery_wraper extend_wraper">


						<textarea name="description" id="" cols="30" rows="10"
							placeholder="description" style="width: 80%;" required="required"></textarea>
					</div>


				</div>
			</div>

			<!-- section wraper -->
			<div class="wraper">
				<div class="in_title">
					<h3>Date disponibilite</h3>
				</div>
				<div class="data_wrapper">
					<!-- one entery wraper-->
					<div class="entery_wraper">
						<input type="date" name="DATEDEB">

					</div>
					<div class="entery_wraper ">
						<input type="date" name="DATEFIN" required="required">

					</div>


				</div>
			</div>


			<div class="wraper">
				<div class="in_title">
					<h3>Photos</h3>
				</div>
				<div class="data_wrapper">
					<!-- one entery wraper-->
					<div class="entery_wraper">
						<input type="file" name="photo1">

					</div>
					<div class="entery_wraper ">
						<input type="file" name="photo2" required="required">

					</div>


				</div>
			</div>



			<!-- section wraper -->
			<div class="wraper">
				<div class="in_title">
					<h3>Description Offre</h3>
				</div>

				<div class="data_wrapper">
					<!-- one entery wraper-->
					<div class="entery_wraper extend_wraper">


						<button class="call_to_action" style="margin: 106px">
							Poster</button>


					</div>


				</div>
			</div>







		</div>
	</form>
	<footer class="footer"></footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>

	<script
		src="${pageContext.request.contextPath}/res/js/jquery-3.5.1.min.js"></script>
	<!-- Bootstrap 4.5 JS -->
	<script
		src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
	<!-- Popper JS -->
	<script src="${pageContext.request.contextPath}/res/js/popper.min.js"></script>
	<!-- Font Awesome -->
	<script src="${pageContext.request.contextPath}/res/js/all.min.js"></script>
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
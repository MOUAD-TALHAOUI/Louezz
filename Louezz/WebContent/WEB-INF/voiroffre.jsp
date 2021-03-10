<%@page import="com.modules.User"%>
<%@page import="com.modules.Voiture"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<%
	Voiture voiture = (Voiture) request.getAttribute("voiture");
%>

<%
	User utilisateur = (User) request.getAttribute("utilisateur");
%>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, viewport-fit=cover">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Offres disponibles</title>
<link rel="shortcut icon" href="res/img/favicon.png">
<!-- Bootstrap 4.5 CSS -->
<link rel="stylesheet" href="res/css/bootstrap.min.css">
<!-- Style CSS -->
<link rel="stylesheet" href="res/css/navbar.css">
<link rel="stylesheet" href="res/css/offre.css">
<link rel="stylesheet" href="res/css/footer.css">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700&display=swap"
	rel="stylesheet">
</head>
<body>


	<!-- Navigation -->
	<%@ include file="navbar.jsp"%>
	<!-- End Navigation -->

	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row ">
				<div class="col-lg-7 col-sm-12">
					<div class="card mb-4 box-shadow">


						<img class="card-img-top"
							src="res/voiture/<%=voiture.getPHOTO1()%>" alt="Car image"
							height="275px">



						<div class="card-body"
							style="font-family: 'Montserrat', sans-serif;">
							<small class="text-muted"> à <%=voiture.getLieu_rencontre()%></small>
						</div>

					</div>
				</div>

				<div class="col-lg-5 col-sm-8 justify-content-center">
					<div class="card mb-4 box-shadow pt-3 pb-5">
						<div class="card-body"
							style="font-family: 'Montserrat', sans-serif;">
							<h3 class="card-text">
								<%=voiture.getMarque()%>, &nbsp
								<%=voiture.getModele()%>
							</h3>
							<h3 class="card-text pb-3">
								<%=voiture.getPrix()%>
								Dirhams/jour
							</h3>
							<h5 class="card-text pb-3">
								<i class="fas fa-map-marker-alt"></i>
								<%=voiture.getLieu_rencontre()%>, &nbsp
								<%=voiture.getVille()%></h5>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="album bg-light">
		<div class="container">
			<div class="card mb-4 box-shadow pb-5">
				<div class="card-body"
					style="font-family: 'Montserrat', sans-serif;">
					<div class="row ">
						<div class="col-12">
							<h2>PROPRIÉTAIRE</h2>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 col-sm-12 pt-1">

							<%
								if (utilisateur.getPhoto().equals("")) {
							%>
							<img src="res/img/avatar.png" style="float: left;">
							<%
								}
							%>
							<%
								if (!utilisateur.getPhoto().equals("")) {
							%>
							<img src="res/utilisateur/<%=utilisateur.getPhoto()%>"
								style="float: left;" width="25%">
							<%
								}
							%>


							<h5 style="text-align: left; padding-top: .5rem;"><%=utilisateur.getPrenom()%>
								<%=utilisateur.getNom()%></h5>
							<p style="">
								date de naissance :
								<%=utilisateur.getDate_naissance()%>
							</p>
						</div>
						<div class="col-lg-6 col-sm-12">
							<h5 style="text-align: left; padding-top: .5rem;">Contactez
								le propriétaire :</h5>
							<p>
								<i class="fas fa-phone-square-alt"></i>
								<%=utilisateur.getTelephone()%></p>
							<p>
								<i class="fas fa-at"></i>
								<%=utilisateur.getEmail()%></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="album bg-light">
		<div class="container">
			<div class="card mb-4 box-shadow pb-5">
				<div class="card-body"
					style="font-family: 'Montserrat', sans-serif;">
					<div class="row ">
						<div class="col-12">
							<h2>DESCRIPTION</h2>
							<p><%=voiture.getDescr()%>
							<p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="album bg-light">
		<div class="container">
			<div class="card mb-4 box-shadow pb-5">
				<div class="card-body"
					style="font-family: 'Montserrat', sans-serif;">
					<div class="row ">
						<div class="col-12">
							<h2>CARACTÉRISTIQUES TECHNIQUES</h2>
							
							<h5 style="text-align: left;">
								<i class="fas fa-gas-pump"></i> carburant &nbsp:
								<%=voiture.getCARBURANT()%>
							</h5>
							<h5 style="text-align: left;">
								# Nombre de portes &nbsp:
								<%=voiture.getNbr_portes()%>
							</h5>
							<h5 style="text-align: left;">
								# Nombre de places &nbsp:
								<%=voiture.getNbr_places()%>
							</h5>
							<h5 style="text-align: left;">
								<i class="fas fa-cog"></i> Boîte de vitesses &nbsp:
								<%=voiture.getBoite_vitesse()%>
							</h5>
							<%
								String KILOMETRAGE1 = "";
							%>
							<%
								int KILOMETRAGE = voiture.getKILOMETRAGE();
							%>
							<%
								if (KILOMETRAGE == 0) {
								KILOMETRAGE1 = "0 - 5000";
							} else if (KILOMETRAGE == 2) {
								KILOMETRAGE1 = "5000 - 10000";
							} else if (KILOMETRAGE == 3) {
								KILOMETRAGE1 = "10000 - 100000";
							} else if (KILOMETRAGE == 4) {
								KILOMETRAGE1 = "plus 100000";
							}
							%>
							<h5 style="text-align: left;">
								<i class="fas fa-road"></i> Kilométrage &nbsp:
								<%=KILOMETRAGE1%>
							</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Start Footer -->
	<%@ include file="footer.jsp"%>
	<!-- End Footer -->

	<!-- jQuery -->
	<script src="res/js/jquery-3.5.1.min.js"></script>
	<!-- Bootstrap 4.5 JS -->
	<script src="res/js/bootstrap.min.js"></script>
	<!-- Popper JS -->
	<script src="res/js/popper.min.js"></script>
	<!-- Font Awesome -->
	<script src="res/js/all.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="res/js/jquery-slim.min.js"><\/script>')
	</script>
	<script src="res/js/popper1.min.js"></script>
	<script src="res/js/bootstrap.min.js"></script>
	<script src="res/js/holder.min.js"></script>


</body>
</html>
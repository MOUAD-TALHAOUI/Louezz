<%@page import="java.util.List"%>
<%@page import="com.modules.Voiture"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.modules.Voiture"%>
<%
	List<Voiture> voiture = (List<Voiture>) request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<!-- Bootstrap 4.5 CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/bootstrap.min.css">
<head>
<meta charset="ISO-8859-1">
<title>louezz</title>
<link rel="shortcut icon" href="res/img/favicon.png">



<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/navbar.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/footer.css">
</head>
<body >
	<%@ include file="navbar.jsp"%>
	<%
		if (voiture.size() != 0) {
	%>
	
		<style>
.space { margin:0; padding:0; height:50px; }
</style>
	<div class="space"></div>
	<div class="container-fluid m-3">
		<div class="row">
			<%
				for (Voiture v : voiture) {
			%>
			<div class="col-xs-12 col-sm-12 col-md-6  col-lg-3 mb-2 mt-5">
				<div class="card" style="width: 20rem;">
					<img class="card-img-top"
						src="${pageContext.request.contextPath}/res/voiture/<%=v.getPHOTO1() %>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=v.getMarque()%></h5>
						<p class="card-text"><%=v.getEtat()%></p>
						<a
							href="voiture1?action=modifiermavoiture&id_vehicule=<%=v.getId_vehicule()%>"
							class="btn btn-primary">Edit</a> <a
							href="demande1?action=voirdemandeparvoiture&id_vehicule=<%=v.getId_vehicule()%>"
							class="btn btn-success">Demandes</a> <a
							href="voiture1?action=deletevoiture&id_vehicule=<%=v.getId_vehicule()%>"
							class="btn btn-danger">Delete</a>

					</div>
				</div>
			</div>
			<%
				}
			%>





		</div>
	</div>
	<%
		}
	%>
	<%
		if (voiture.size() == 0) {
	%>
	<div style="margin: 100px">
		<div class="row content">
			<div class="container acount-user-bg">
				<div class="row">
					<div class="col-md-3 col-sm-0"></div>
					<div class="col-md-6 col-sm-12">
						<div class="container text-center" style="margin: 0 auto;">
							<div class="row">
								<i class="fas fa-folder-open fa-10x" style="margin: 0 auto;"></i>
							</div>

							<div class="row">
								<h1 style="margin: 0 auto;">vous n'avez aucune voiture</h1>
							</div>
							<div class="text-center">
								<a href="home"
									class="btn btn-primary  bg-theme-2 outline-theme-2 mt-3">retourner
									a l'accueil</a>
							</div>
						</div>
					</div>
					<div class="col-3 col-sm-0"></div>
				</div>
			</div>
		</div>
	</div>
	<%
		}
	%>
<div class="space"></div>
</body>
<%@ include file="footer.jsp"%>

<!-- Script Source Files -->

<!-- jQuery -->
<script
	src="${pageContext.request.contextPath}/res/js/jquery-3.5.1.min.js"></script>
<!-- Bootstrap 4.5 JS -->
<script src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
<!-- Popper JS -->
<script src="${pageContext.request.contextPath}/res/js/popper.min.js"></script>
<!-- Font Awesome -->
<script src="${pageContext.request.contextPath}/res/js/all.min.js"></script>

<!-- End Script Source Files -->

</html>
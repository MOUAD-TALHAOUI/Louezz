<%@page import="com.modules.Demande"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.modules.Voiture"%>
<%
	List<Demande> demande = (List<Demande>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<!-- Bootstrap 4.5 CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/bootstrap.min.css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/navbar.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/footer.css">
<head>
<meta charset="ISO-8859-1">
<title>louezz</title>
<link rel="shortcut icon" href="res/img/favicon.png">

</head>
<body>
	<%@ include file="navbar.jsp"%>
	<%
		if (demande.size() != 0) {
	%>
	<style>
.space {
	margin: 0;
	padding: 0;
	height: 50px;
}
</style>
	<div class="space"></div>
	<div class="container-fluid m-3">
		<div class="row">
			<%
				for (Demande v : demande) {
			%>
			<div class="col-xs-12 col-sm-12 col-md-6  col-lg-3 mb-2">
				<div class="card" style="width: 18rem;">
					<img class="card-img-top" <%int i=v.getId_vehicule()-1; %>
						src="${pageContext.request.contextPath}/res/voiture/<%=i+"1.jpg" %>"
						alt="Card image cap">
					<div class="card-body">

						<h5 class="card-title">
							Etat:
							<%=v.getEtat_demande()%></h5>

						<center>
							<a
								href="demande1?action=accepterdemande&id_demande=<%=v.getId_demande()%>"
								class="btn btn-success m-1">Accepter</a> <a
								href="demande1?action=refuserdemande&id_demande=<%=v.getId_demande()%>"
								class="btn btn-danger m-1">Refuser</a> <a
								href="demande1?action=voirprofile&id_user=<%=v.getId_user()%>"
								class="btn btn-primary m-1">voir profile</a>
						</center>
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
		if (demande.size() == 0) {
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
								<h1 style="margin: 0 auto;">aucune demande trouvée</h1>
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
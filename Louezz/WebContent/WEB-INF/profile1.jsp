<%@page import="com.modules.User"%>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/bootstrap.min.css">
<!-- Style CSS -->


	
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/navbar.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/footer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/style0.css">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">



</head>

<%
	User user = (User) request.getAttribute("user");
%>
<script type="text/javascript">
	function myFunction() {
		i = i % 6;
		i++;
		if (i == 0) {
			i = 1;
		}
		document.getElementById("mouad").style = 'background-image: url('
				+ 'res/img/' + i + '.jpg)';
	}

	var i = 1;
	var interval = setInterval(function() {
		myFunction();
	}, 6000);
</script>

<body id="mouad"
	style="background-image: url('${pageContext.request.contextPath}/res/img/ins.png');">


	<!-- Navigation -->
	<%@ include file="navbar.jsp"%>









	<div class="box">

		<div class="row content">
			<div class="container ">
				<div class="container mt-5">
					<div class="row">
						<div
							class="offset-lg-4 col-lg-4 col-sm-6 col-12 main-section text-center">
							<div class="row">
								<div class="col-lg-12 col-sm-12 col-12 profile-header"></div>
							</div>
							<div class="row user-detail">
								<div class="col-lg-12 col-sm-12 col-12">
									<img src="res/img/user-blue.png"
										class="rounded-circle img-thumbnail">
									<h5></h5>
									<h5></h5>
									<p>
										<i class="fa fa-user mr-1" aria-hidden="true"></i>
										<%=user.getNom() + " " + user.getPrenom()%>
									</p>

									<hr>
									<a href="profile?action=changeinfo"
										class="btn btn-success btn-sm">Modifier</a> <a
										href="profile?action=changepassword"
										class="btn btn-warning btn-sm color-white">changer mot de
										pass</a>

									<!-- Button trigger modal -->
									<button type="button" class="btn btn-danger btn-sm co"
										data-toggle="modal" data-target="#exampleModal">
										supprimer</button>

									<!-- Modal -->
									<div class="modal fade" id="exampleModal" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Etes
														vous sure</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">est ce que vous voulez
													supprimer votre compte</div>
												<div class="modal-footer">
													<a class="btn btn-secondary btn-sm co color-white"
														data-dismiss="modal">annuler</a> <a
														href="profile?action=supprimercompte#"
														class="btn btn-danger btn-sm co">supprimer</a>
												</div>
											</div>
										</div>
									</div>
									<hr>
									<div>
										<span><i class="fa fa-user mr-1"></i>FirstName:<%=user.getPrenom()%>
										</span>
									</div>
									<div>
										<span><i class="fa fa-user mr-1"></i>LastName: <%=user.getNom()%></span>
									</div>

									<div>
										<span><i class="fas fa-phone-square-alt mr-2"></i>Tel:
											<%=user.getTelephone()%></span>
									</div>

									<div>
										<span><i class="fa fa-envelope-square mr-2"></i> Email:
											<%=user.getEmail()%></span>
									</div>
									<div>
										<span><i class="fa fa-id-card"></i> Num_permis: <%=user.getNum_permis()%></span>
									</div>
									<div>
										<span><i class="fa fa-id-badge"></i> CiN: <%=user.getCin()%></span>
									</div>
									<div>
										<span><i class="fa fa-map-marker"></i>Adresse: <%=user.getAdresse_utilisateur()%></span>
									</div>
									<div>
										<span><i class="fa fa-birthday-cake"></i>
											Date_naissance: <%=user.getDate_naissance()%></span>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>









</body>
<%@ include file="footer.jsp"%>

<script
	src="${pageContext.request.contextPath}/res/js/jquery-3.5.1.min.js"></script>
<!-- Bootstrap 4.5 JS -->
<script src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
<!-- Popper JS -->
<script src="${pageContext.request.contextPath}/res/js/popper.min.js"></script>
<!-- Font Awesome -->
<script src="${pageContext.request.contextPath}/res/js/all.min.js"></script>
</html>
<%@page import="com.modules.Voiture"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>louezz</title>
<link rel="shortcut icon" href="res/img/favicon.png">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/accueil.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/navbar.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/footer.css">
</head>




<%
	Voiture voiture = (Voiture) request.getAttribute("voiture");
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

	<%
		Boolean b = voiture.getId_user() == (int) session.getAttribute("id");
	%>
	<%
		if (voiture.getId_vehicule() != 0 && !b) {
	%>

	<div class="box mt-5">
		<div class="container">
			<div class="row">
				<div class="mx-auto">

					<img width="200px" height="200px" class="m-auto center"
						src="${pageContext.request.contextPath}/res/voiture/<%=voiture.getPHOTO1() %>"
						alt="Card image cap"> <img width="200px" height="200px"
						class="m-auto center"
						src="${pageContext.request.contextPath}/res/voiture/<%=voiture.getPHOTO2() %>"
						alt="Card image cap">

				</div>
			</div>

			<div class="row content">

				<div class="container">
					<div class="col-12 mt-2"></div>
					<div class="row top-buffer">
						<div class="col-md-3 col-sm-0"></div>
						<div class="col-md-6 col-sm-12 mb-sm-5">

							<div class="form-group row">
								<label for="staticEmail"
									class="col-sm-2 col-form-label col-md-3"><i
									class="fas fa-car"></i> Marque</label>
								<div class="col-sm-10 col-md-9">

									<input type="text" class="form-control"
										id="exampleFormControlInput1" placeholder="Nom Societ"
										disabled="disabled" name="firstname"
										value="<%=voiture.getMarque()%>">
								</div>
							</div>
							<div class="form-group row">
								<label for="staticEmail"
									class="col-sm-2 col-form-label col-md-3"><i
									class="fas fa-car"></i> Modele</label>
								<div class="col-sm-10 col-md-9">

									<input type="text" class="form-control"
										id="exampleFormControlInput1" placeholder="Nom Societ"
										disabled="disabled" name="lastname"
										value="<%=voiture.getModele()%>">
								</div>
							</div>





							<div class="form-group row">
								<label for="staticEmail"
									class="col-sm-2 col-form-label col-md-3"><i
									class="fas fa-tachometer-alt"></i> Boite vitesse :</label>
								<div class="col-sm-10 col-md-9">

									<select name="kilometrage"
										value="<%=voiture.getBoite_vitesse()%>" class="form-control"
										disabled="disabled" id="exampleFormControlInput1"
										required="required">
										<option value="automatique">automatique</option>
										<option value="manuele">manuele</option>

									</select>
								</div>

							</div>






							<div class="form-group row">
								<label for="staticEmail"
									class="col-sm-2 col-form-label col-md-3"><i
									class="fas fa-table"></i> Date debut:</label>
								<div class="col-sm-10 col-md-9">



									<input type="Date" name="date" class="form-control"
										id="exampleFormControlInput1" value="<%=voiture.getDebut()%>"
										disabled="disabled" required="required">
								</div>
							</div>


							<div class="form-group row">
								<label for="staticEmail"
									class="col-sm-2 col-form-label col-md-3"><i
									class="fas fa-table"></i> Date fin:</label>
								<div class="col-sm-10 col-md-9">



									<input type="Date" name="date" class="form-control"
										id="exampleFormControlInput1" value="<%=voiture.getFin()%>"
										disabled="disabled" required="required">
								</div>
							</div>

							<div class="form-group row">
								<label for="staticEmail"
									class="col-sm-2 col-form-label col-md-3"><i
									class="fa fa-map-marker"></i> Lieu rencontre</label>
								<div class="col-sm-10 col-md-9">

									<input type="text" class="form-control"
										id="exampleFormControlInput1" placeholder="ville"
										disabled="disabled" name="adress"
										value="<%=voiture.getLieu_rencontre()%>">
								</div>
							</div>



							<div class="form-group row">
								<label for="staticEmail"
									class="col-sm-2 col-form-label col-md-3"><i
									class="fa fa-map-marker"></i> Ville</label>
								<div class="col-sm-10 col-md-9">

									<input type="text" class="form-control"
										id="exampleFormControlInput1" placeholder="ville"
										disabled="disabled" name="adress"
										value="<%=voiture.getVille()%>">
								</div>
							</div>


							<div class="form-group row">
								<label for="staticEmail"
									class="col-sm-2 col-form-label col-md-3"><i
									class="fas fa-dollar-sign"></i> Prix</label>
								<div class="col-sm-10 col-md-9">

									<input type="text" class="form-control"
										id="exampleFormControlInput1" placeholder="ville"
										disabled="disabled" name="adress"
										value="<%=voiture.getPrix()%>">
								</div>
							</div>


							<div class="form-group row">
								<label for="staticEmail"
									class="col-sm-2 col-form-label col-md-3"><i
									class="fas fa-sort-numeric-up"></i> Nbr_places</label>
								<div class="col-sm-10 col-md-9">




									<input type="number" value="<%=voiture.getNbr_portes()%>"
										disabled="disabled" class="form-control" name="ports"
										placeholder="ports" id="ports" max="8" min="0"
										required="required">

								</div>
							</div>

							<div class="form-group row">
								<label for="staticEmail"
									class="col-sm-2 col-form-label col-md-3"><i
									class="fas fa-sort-numeric-up"></i> Nbr_portes</label>
								<div class="col-sm-10 col-md-9">


									<input type="number" value="<%=voiture.getNbr_portes()%>"
										disabled="disabled" class="form-control" name="ports"
										placeholder="ports" id="ports" max="8" min="0"
										required="required">

								</div>
							</div>

							<div class="form-group row">
								<label for="staticEmail"
									class="col-sm-2 col-form-label col-md-3"><i
									class="fas fa-audio-description"></i> Etat :</label>
								<div class="col-sm-10 col-md-9">

									<select name="kilometrage"
										value="<%=voiture.getKILOMETRAGE()%>" class="form-control"
										disabled="disabled" id="exampleFormControlInput1"
										required="required">
										<option value="desponible">desponible</option>
										<option value="louee">louee</option>

									</select>
								</div>

							</div>





							<div class="form-group row">
								<label for="staticEmail"
									class="col-sm-2 col-form-label col-md-3"><i
									class="fas fa-info-circle"></i> Description</label>
								<div class="col-sm-10 col-md-9">
									<!-- one entery wraper-->



									<textarea name="description" id="" cols="60" rows="10"
										placeholder="description" style="width: 100%;"
										disabled="disabled" required="required"><%=voiture.getDescr()%></textarea>



								</div>
							</div>








							<div class="form-group row">
								<label for="staticEmail"
									class="col-sm-2 col-form-label col-md-3"><i
									class="fas fa-car-battery"></i> CARBURANT :</label>
								<div class="col-sm-10 col-md-9">

									<select name="kilometrage" value="<%=voiture.getCARBURANT()%>"
										class="form-control" id="exampleFormControlInput1"
										disabled="disabled" required="required">
										<option value="gazoil">gazoil</option>
										<option value="essance">essance</option>
									</select>
								</div>

							</div>




							<div class="form-group row">
								<label for="staticEmail"
									class="col-sm-2 col-form-label col-md-3"><i
									class="fas fa-people-arrows"></i> kilometrage:</label>
								<div class="col-sm-10 col-md-9">

									<select name="kilometrage"
										value="<%=voiture.getKILOMETRAGE()%>" class="form-control"
										id="exampleFormControlInput1" required="required"
										disabled="disabled">
										<option value="0">0 - 5000</option>
										<option value="2">5000 - 10000</option>
										<option value="3">10000 - 100000</option>
										<option value="4">100000 -</option>
									</select>
								</div>

							</div>



							<div class="form-group row justify-content-end">
								<div class="col-sm-10 col-md-9">
									<center>
										<a class="btn btn-lg btn-danger  co"
											href="offre?action=voirprofile&id=<%=voiture.getId_vehicule()%>">Postuler</a>
										<a class="btn btn-success btn-lg  co"
											href="offre?action=voirprofile&id=<%=voiture.getId_user()%>">Profile</a>
									</center>
								</div>

							</div>


						</div>
						<div class="col-sm-0 col-md-3"></div>
					</div>
				</div>
			</div>

		</div>
		<%
			}
		%>
		<%
			if (voiture.getId_vehicule() == 0 || b) {
		%>
		<div style="margin: 115px">
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
									<h1 style="margin: 0 auto;">Cette voiture n'exite pas ou c
										est votre voiture</h1>
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
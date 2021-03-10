<%@page import="java.util.List"%>
<%@page import="com.dao.implementations.VoitureDaoImp"%>
<%@page import="com.modules.Voiture"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.interfaces.VoitureDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, viewport-fit=cover">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Louezz</title>
<!-- Bootstrap 4.5 CSS -->
	<link rel="shortcut icon" href="res/img/favicon.png">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/bootstrap.min.css">
<!-- Style CSS -->


	
	
		<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/accueil.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/navbar.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/footer.css">
	
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700&display=swap"
	rel="stylesheet">
</head>
<script type="text/javascript">
	function myFunction() {
		i = i % 3;
		i++;
		if(i==0){i=1;}
		var s='res/img/carousel/' + i + '.jpg';
		document.getElementById("mouad").src =s;
	}

	var i = 1;
	var interval = setInterval(function() {
		myFunction();
	}, 6000);
	document.getElementById("carousel-control-next").addEventListener("click", myFunction);
	document.getElementById("carousel-control-prev").addEventListener("click", myFunction);

</script>
<body style="background-color :#F0FFF0">


	
	<!-- Navigation -->
	<%@ include file="navbar.jsp"%>
	<!-- End Navigation -->


	<!-- Image Carousel -->

	<div id="carousel" class="carousel slide" data-ride="carousel"
		>


		<!-- Carousel Content -->
		<div class="carousel-inner">

			<div class="carousel-item active">
				<img src="${pageContext.request.contextPath}/res/img/carousel/1.jpg" id="mouad" alt="" class="w-100">

				<div class="carousel-caption">
					<div class="container">
						<div class="row d-flex align-items-start">
							<div class="col-7 bg-custom  d-lg-block py-3 px-0">
								<h1>Bienvenue sur Louezz</h1>
								<div class="border-top border-primary w-50 mx-auto my-3">
									<h3>Louez une voiture en quelques taps</h3>
								</div>
							</div>
							<div class="col-4 bg-custom  d-lg-block py-3 px-0 ml-5">
								<form action="offre" method="post">
									<fieldset>
										<!-- Ville -->
										<div class="w-75 mx-auto my-3" data-validate="indispensable">
											<label for="inputVille" class="form-label">Ville</label> <input
												class="input100 form-control" type="text" name="ville"
												id="inputville" placeholder="ville" required="required">
										</div>
										<!-- Date debut -->
										<div class="w-75 mx-auto my-3">
											<label for="input-dateDebut" class="form-label">dateFin
											 </label> <input class="input100 form-control" type="date"
												name="dateFin" id="input-dateDebut" placeholder="" required="required">
										</div>
										<!-- Date fin -->
										<div class="w-75 mx-auto my-3">
											<label for="input-dateFin" class="form-label"> Date Debut </label> <input class="input100 form-control" type="date"
												name="dateDebut" id="input-dateFin" placeholder="02-02-2020" required="required">
										</div>
										<!-- button de recherche -->
										<div class="w-50 mx-auto my-3">
											<input type="submit" value="Rechercher"
												class="btn btn-primary"></input>
										</div>
									</fieldset>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>
		
		
					<div class = "carousel-item">
				<img src="res/img/carousel/2.jpg" alt="" class="w-100">
			</div>

			<div class = "carousel-item">
				<img src="res/img/carousel/3.jpg" alt="" class="w-100">
			</div>
		<!-- End Carousel Content -->


		<!-- Previous & Next Buttons -->
		<a href="#carousel" id="carousel-control-prev" class="carousel-control-prev" role="button"
			data-slide="prev"> <span class="fas fa-chevron-left fa-3x"></span>
		</a> 
		
		<a href="#carousel" id="carousel-control-next" class="carousel-control-next" role="button"
			data-slide="next"> <span class="fas fa-chevron-right fa-3x"></span>
		</a>

		<!-- End Previous & Next Buttons -->

	</div>





<!-- End Image Carousel -->


	<!-- Main Page Heading -->
	<div class="col-12 text-center mt-5">
		<h1 class="text-dark pt-4">Location de voiture entre particuliers et pros</h1>
		<div class="border-top border-primary w-25 mx-auto my-3"></div>
		
	</div>

	<!-- Three Column Section -->
	<div class="container">
		<div class="row my-3">
			<div class="col-md-4 my-4 center-block" style="text-align:center;">
				<a href="" class="client-img " ><img src="res/img/client-1.png" alt="about us"></a>
				<h4 class="my-4">à propos de nous</h4>
				<br>
				<p>description description description description</p>
				<a href="" class="btn btn-outline-dark btn-md">Lire la suite</a>
			</div>
			<div class="col-md-4 my-4 center-block" style="text-align:center;">
				<a href="" class="client-img" ><img src="res/img/client-2.png" alt="infos" ></a>
				<h4 class="my-4">Comment je peux &nbsp&nbsp&nbsp proposer une offre ?</h4>
				<p>description description description description</p>
				<a href="" class="btn btn-outline-dark btn-md">Lire la suite</a>
			</div>
			<div class="col-md-4 my-4 center-block" style="text-align:center;" >
				<a href="" class="client-img"  ><img src="res/img/client-3.png" alt="assurance" ></a>
				<h4 class="my-4">Assurance</h4>
				<br>
				<p>description description description description</p>
				<a href="" class="btn btn-outline-dark btn-md">Lire la suite</a>
			</div>
		</div>
	</div>
	<hr style="height:2px;border-top:2px solid #ADD8E6">
	<!-- End Three Column Section -->
	<div class="col-12 text-center mt-3">
		<h1 class="text-dark pt-3">Dernières offres</h1>
		<div class="border-top border-primary w-25 mx-auto my-2"></div>	
	</div>

	<div class="tcb-product-slider pb-5">
        <div class="container">
            <div id="carousel2" class="carousel slide" data-ride="carousel" data-interval="10000">
                <!-- Wrapper for slides -->
                <%VoitureDao voituredao = new VoitureDaoImp(); %>
                <%					List<Voiture> list = voituredao.findAllVoiture(); %>
                <%if(list.size()<5){ %>
                		<p>Pas de offre</p>
           		 <%}%>
           		<%if(list.size()!=0){ %>
                <div class="carousel-inner" role="listbox">
                    <div class="carousel-item active">
                        <div class="row justify-content-center">
                            <div class="col-xs-12 col-sm-5">
                                <div class="tcb-product-item pr-3">
                                    <div class="tcb-product-photo">
                                    	
                                        <button type="submit" style="border:none;">
                                        <img src="${pageContext.request.contextPath}/res/voiture/<%=list.get(0).getPHOTO1() %>"  class="img-responsive h-100 w-100"  alt="a" />
                                        </button>
                                        
                                    </div>
                                    <div class="tcb-product-info">
                                        <div class="tcb-product-title">
                                        
                                            <h4><button type="submit" style="border:none;"> <%=list.get(0).getMarque() %>, <%=list.get(0).getModele() %> </button></h4>
                                        
                                        </div>
                                        <p><%=list.get(0).getLieu_rencontre()%>, <%=list.get(0).getVille()%></p>
                                        <div class="tcb-hline"></div>
                                        <div class="tcb-product-price" style="font-weight:bold">
                                            <%=list.get(0).getPrix()%> Dirhams/jours
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-5">
                                <div class="tcb-product-item pl-3">
                                    <div class="tcb-product-photo">
                                    	
                                        <button type="submit" style="border:none;">
                                        <img src="${pageContext.request.contextPath}/res/voiture/<%=list.get(1).getPHOTO1() %>" class="img-responsive  h-100 w-100"  alt="a" />
                                        </button>
                                        
                                    </div>
                                    <div class="tcb-product-info">
                                        <div class="tcb-product-title">
                                       
                                            <h4><button type="submit" style="border:none;"> <%=list.get(1).getMarque() %>, <%=list.get(1).getModele() %> </button></h4>
                                        
                                        </div>
                                        <p><%=list.get(1).getLieu_rencontre()%>, <%=list.get(1).getVille()%></p>
                                        <div class="tcb-hline"></div>
                                        <div class="tcb-product-price" style="font-weight:bold">
                                            <%=list.get(1).getPrix()%> Dirhams/jours
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
							
						</div>
					</div>
                        
                    <div class="carousel-item">
                        <div class="row justify-content-center">
                            <div class="col-xs-12 col-sm-5">
                                <div class="tcb-product-item pr-3">
                                    <div class="tcb-product-photo">
                                    	
                                        <button type="submit" style="border:none;">
                                        <img src="${pageContext.request.contextPath}/res/voiture/<%=list.get(2).getPHOTO1() %>" class="img-responsive  h-100 w-100"  alt="a" />
                                        </button>
                                        
                                    </div>
                                    <div class="tcb-product-info">
                                        <div class="tcb-product-title">
                                        
                                            <h4><button type="submit" style="border:none;"> <%=list.get(2).getMarque() %>, <%=list.get(2).getModele() %> </button></h4>
                                        
                                        </div>
                                        <p><%=list.get(2).getLieu_rencontre()%>, <%=list.get(2).getVille()%></p>
                                        <div class="tcb-hline"></div>
                                        <div class="tcb-product-price" style="font-weight:bold">
                                            <%=list.get(2).getPrix()%> Dirhams/jours
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-5">
                                <div class="tcb-product-item pl-3">
                                    <div class="tcb-product-photo">
                                    	
                                        <button type="submit" style="border:none;">
                                        <img src="${pageContext.request.contextPath}/res/voiture/<%=list.get(3).getPHOTO1() %>" class="img-responsive  h-100 w-100"  alt="a" />
                                        </button>
                                       
                                    </div>
                                    <div class="tcb-product-info">
                                        <div class="tcb-product-title">
                                        
                                            <h4><button type="submit" style="border:none;"> <%=list.get(3).getMarque() %>, <%=list.get(3).getModele() %> </button></h4>
                                        
                                        </div>
                                        <p><%=list.get(3).getLieu_rencontre()%>, <%=list.get(3).getVille()%></p>
                                        <div class="tcb-hline"></div>
                                        <div class="tcb-product-price" style="font-weight:bold">
                                            <%=list.get(3).getPrix()%> Dirhams/jours
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
							
						</div>
					</div>
                            
                    <div class="carousel-item">
                        <div class="row justify-content-center">
                            <div class="col-xs-12 col-sm-5">
                                <div class="tcb-product-item pr-3">
                                    <div class="tcb-product-photo">
                                    	
                                        <button type="submit" style="border:none;">
                                        <img src="${pageContext.request.contextPath}/res/voiture/<%=list.get(4).getPHOTO1() %>" class="img-responsive  h-100 w-100"  alt="a" />
                                        </button>
                                        
                                    </div>
                                    <div class="tcb-product-info">
                                        <div class="tcb-product-title">
                                        
                                            <h4><button type="submit" style="border:none;"> <%=list.get(4).getMarque() %>, <%=list.get(4).getModele() %> </button></h4>
                                        
                                        </div>
                                        <p><%=list.get(4).getLieu_rencontre()%>, <%=list.get(4).getVille()%></p>
                                        <div class="tcb-hline"></div>
                                        <div class="tcb-product-price" style="font-weight:bold">
                                            <%=list.get(4).getPrix()%> Dirhams/jours
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-5">
                                <div class="tcb-product-item pl-3">
                                    <div class="tcb-product-photo">
                                    	
                                        <button type="submit" style="border:none;">
                                        <img src="${pageContext.request.contextPath}/res/voiture/<%=list.get(0).getPHOTO1() %>" class="img-responsive  h-100 w-100"  alt="a" />
                                        </button>
                                        
                                    </div>
                                    <div class="tcb-product-info">
                                        <div class="tcb-product-title">
                                        
                                            <h4><button type="submit" style="border:none;"> <%=list.get(0).getMarque() %>, <%=list.get(0).getModele() %> </button></h4>
                                        
                                        </div>
                                        <p><%=list.get(0).getLieu_rencontre()%>, <%=list.get(0).getVille()%></p>
                                        <div class="tcb-hline"></div>
                                        <div class="tcb-product-price" style="font-weight:bold">
                                            <%=list.get(0).getPrix()%> Dirhams/jours
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
							
						</div>
					</div>
                </div>
                <%}%>
                <!-- Controls -->
                <a href="#carousel2" class="carousel-control-prev" role="button" data-slide="prev"
                style="color : rgba(0,0,0,0.8);left: -6.5rem;bottom:20%;">
					<span class="fas fa-caret-left fa-5x" aria-hidden="true"></span>
				</a>
				<a href="#carousel2" class="carousel-control-next" role="button" data-slide="next"
				style="color : rgba(0,0,0,0.8);right: -6.5rem;bottom:20%;">
					<span class="fas fa-caret-right fa-5x" aria-hidden="true"></span>
				</a>
            </div>
        </div>
    </div>

	<!-- end offres carousel -->

	<!-- End Fixed Background IMG -->
 
	
	<!-- Emoji Navbar Second -->


	<!-- Modal Popup -->

		
	<!-- Start Two Column Section -->

	<!-- End Two Column Section -->


	<!-- Start Jumbotron -->

	<!-- End Jumbotron -->








	<script
		src="${pageContext.request.contextPath}/res/js/jquery-3.5.1.min.js"></script>
	<!-- Bootstrap 4.5 JS -->
	<script
		src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
	<!-- Popper JS -->
	<script src="${pageContext.request.contextPath}/res/js/popper.min.js"></script>
	<!-- Font Awesome -->
	<script src="${pageContext.request.contextPath}/res/js/all.min.js"></script>

	<!-- End Script Source Files -->
</body>
	<%@ include file="footer.jsp"%>

</html>
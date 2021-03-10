<%@page import="com.modules.Voiture"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Offres disponibles</title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/res/img/favicon.png">
	<!-- Bootstrap 4.5 CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/bootstrap.min.css">
	<!-- Style CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/navbar.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/offres.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/footer.css">
	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700&display=swap" rel="stylesheet">
</head>
<body>

	<!-- Navigation -->
	<%@ include file="navbar.jsp"%>
	<!-- End Navigation -->
	<main role="main">
	
	      <section class="jumbotron text-center">
	        <div class="container">
	          <h1 class="jumbotron-heading">Les offres actuelles</h1>
	          <p class="lead text-muted">Profiter des offres dans toutes les villes du Maroc.</p>
	         
	        </div>
	      </section>
	 </main>
	 
	 <div class="album py-5 bg-light">
	 	<div class="container">
	 	
	 		<div class="row">
	 		
			 	  <div class="col-3 filter flex-md-column" style="box-shadow:0px 0px 10px rgba(0, 0, 0, .4); border-radius: 20px;">
		          <!-- Filtrage ---------------------->
		            <form method="post" action="">
		            	<hr>
		              	<div class="aside" style="margin-top: 30px;">
		
		                <!-- Par prix -->
		                <p style="font-weight: bold;margin-left: 12px;"> Prix par jour (Dhs)</p>
		                <section>
		                    
		                    <label for="prix_min">Min</label>
		                    <input type="text" id="prix_min" name="prixMin" class="form-control" value="">
		                    <label for="prix_max">Max</label>
		                    <input type="text" id="prix_max" name="prixMax" class="form-control" value="" >
							
						
		                  </section>
		            	</div>
		            	<hr>
		            	
		            	<div class="aside" style="margin-top: 5px;">
		            		<section>
		            			<div style="margin-left: -10px; margin-top: -8px;padding: 2em;">
		            				<p style="font-weight: bold;margin-left: 12px;"> Type du véhicule</p>
									<select class="form-control" id="sel1" name ="typeVehicule">
										<option disabled selected> -- sélectionnez -- </option>
									    <option>Berline </option>
									    <option>Citadine </option>
									    <option>Familiale </option>
									    <option>SUV</option>
									    <option>Camionnette</option>
				  				    </select>
		            			</div>
		            		</section>
		            	</div>
		
		            <hr>
		
		            <div class="aside" style="margin-top: 5px;">
		            	
		            		<section>
		            			<div style="margin-left: -10px; margin-top: -8px;padding: 2em;">
		            				<p style="font-weight: bold;margin-left: 12px;"> Marque du véhicule</p>
									<select class="form-control" id="sel2" name ="marque">
										<option disabled selected> -- sélectionnez -- </option>
									<c:forEach var="m" items="${marques}" step="1"  >
									    <option>${m} </option>
									    
									</c:forEach>
				  				    </select>
		            			</div>
		            		</section>
		            	
		            	</div>
		            <hr>
		
		            <div class="aside" style="margin-top: 5px;">
		            		<section>
		            			<div style="margin-left: -10px; margin-top: -8px;padding: 2em;">
		            				<p style="font-weight: bold;margin-left: 12px;"> Carburant</p>
									<select class="form-control" id="sel3" name ="carburant">
										<option disabled selected> -- sélectionnez -- </option>
									    <option>Essence </option>
									    <option>Diesel </option>
									    <option>Electrique </option>
									    <option>Hybride </option>
									    
				  				    </select>
		            			</div>
		            		</section>
		            </div>
		            <hr>
		            <div class="aside" style="margin-top: 5px;">
            		<section>
            			<div style="margin-left: -10px; margin-top: -8px;padding: 2em;">
            				<p style="font-weight: bold;margin-left: 12px;">Boîte de vitesse</p>
							<select class="form-control" id="sel4" name ="boiteVitesse">
								<option disabled selected> -- sélectionnez -- </option>
							    <option>Manuelle </option>
							    <option>Automatique </option>
							    
		  				    </select>
            			</div>
            		</section>
		            </div>
		
		            <hr>
		            <div class="aside" style="margin-top: 5px;">
            		<section>
            			<div style="margin-left: -10px; margin-top: -8px;padding: 2em;">
            				<p style="font-weight: bold;margin-left: 12px;">Nombre de places</p>
							<select class="form-control" id="sel5" name ="nbrPlaces">
								<option disabled selected> -- sélectionnez -- </option>
							    <c:forEach var="p"  items="${places}" >
									<option>${p} </option>
									    
								</c:forEach>
							    
		  				    </select>
            			</div>
            		</section>
		            </div>
		            <hr>
		            
		            <div class="aside" style="margin-top: 5px;">
		                <p style="font-weight: bold;margin-left: 12px;"> Kilométrage</p>
		                <section>
		            
		                    <label for="km_min">Min</label>
		                    <input type="text" id="km_min" class="form-control" name="kmMin" value="">
		                    <label for="km_max">Max</label>
		                    <input type="text" id="km_max" class="form-control" name="kmMax" value="" >
							
		                  </section>
		            	</div>
		            	<hr>
		            <div class="w-50 mx-auto my-3">
						<input type="submit" value="Filtrer" class="btn btn-primary" ></input>
					</div>
		       
		          </form>
		        </div>
		        
		         <!--  offres ----------------->
		         <%
	List<Voiture> voiture = (List<Voiture>) request.getAttribute("voiture");
%>
		         
		         <div class="col-9 offre">
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
								<h1 style="margin: 0 auto;">aucune offre trouvée</h1>
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
 	
 	
	<%
		if (voiture.size() != 0) {
	%>
            			<p><c:out value="<%= voiture.size() %>"></c:out> résultats trouvés</p>

                    		<div class="row ">
                    					<%
				for (Voiture v : voiture) {
			%>	
                    				<!--  offre 1 ----------------->
                    				<div class="col-sm-6" >
                    					<div class="card mb-4 box-shadow">
                    					<a type="submit" style="border:none;" href="offre?action=voiroffre&id_vehicule=<%=v.getId_vehicule()%>">
							                <img class="card-img-top" src="res/voiture/<%= v.getPHOTO1() %>"  alt="Car image">
							            </a>
							            
							                <div class="card-body" style="font-family : 'Montserrat', sans-serif;">
							                  <p class="card-text" style="font-weight :bold;"><%= v.getMarque() %>, &nbsp <%= v.getModele() %></p>
							                  <p class="card-text"><%= v.getLieu_rencontre() %>, &nbsp <%= v.getVille() %></p>
							                  <p class="card-text"><%= v.getPrix() %> Dirhams/jour</p>
							                  <div class="d-flex justify-content-between align-items-center">
							                    <div class="btn-group">
							                    <a href="offre?action=voiroffre&id_vehicule=<%=v.getId_vehicule()%>">
							                      	<input type="button" value="Decouvrir l'offre"  class="btn btn-sm btn-outline-secondary">
							                    </a>
							                    </div>
							                </div>
							              </div>
                    				</div>
                    				<!--  offre 2 ----------------->

                    		
                    			

                    		</div>
                    		                    				<%
				}
			%>
                    		<br> <br>

                    			<%
				}
			%>
		         </div>
		         
		         <!-- end offres ----------------->
		         
	 		</div>
	 	</div>
	 </div>
	 
	 <!-- Start Footer -->
	 
	<!-- End Footer -->
	 
	
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="res/js/jquery-slim.min.js"><\/script>')</script>
    <script src="res/js/popper1.min.js"></script>
    <script src="res/js/bootstrap.min.js"></script>
    <script src="res/js/holder.min.js"></script>	 	


</body>
	<%@ include file="footer.jsp"%>


</html>
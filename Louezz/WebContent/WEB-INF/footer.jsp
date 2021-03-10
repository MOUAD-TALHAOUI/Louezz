<%@ page import= "java.time.Year" %>
	<!-- Start Footer -->
    <footer>
		<div class="container">
			<div class="row text-light py-4">
				<div class="col-6">
					<img src="res/img/logo-white.png" alt="logo">
					<p> > Qui somme-nous</p>
					<p> > Foire aux Questions</p>
					<p> > Les avis de nos utilisateurs</p>
					<p> > Termes et conditions</p>
					<p> > Politiaque de Cookie</p>
					
				</div>
			
				<div id="contactus" class="col-6">
					<h4 class="my-4">Contactez-nous</h4>
					<form>
						<div class="form-group">
	    					<label for="footer-email">Adresse email</label>
	   		 				<input type="email" class="form-control" id="footer-email" placeholder="name@example.com">
	  					</div>
	  					<div class="form-group">
	    					<label for="footer-message">Message</label>
	    					<textarea class="form-control" id="footer-message" rows="6"></textarea>
	  					</div>
					</form>
				</div>
				
			</div>
			
			<div class="row text-light py-1">
			<ul class="social pt-3">
				<li><a href="" target="_blank"><i class="fab fa-facebook fa-2x"></i></a></li>
				<li><a href="" target="_blank"><i class="fab fa-twitter fa-2x"></i></a></li>
				<li><a href="" target="_blank"><i class="fab fa-instagram fa-2x"></i></a></li>
				<li><a href="" target="_blank"><i class="fab fa-youtube fa-2x"></i></a></li>
			</ul>
			</div>
			
			
		</div>
	</footer>
	<!-- End Footer -->



	<!-- Start Socket -->
	<div class="socket text-light text-center py-3">
		<p>&copy; ${ Year.now().toString()} <a href="" target="_blank">www.Louezz.ma</a></p>
	</div>
	<!-- End Socket -->
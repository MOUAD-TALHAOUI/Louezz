<nav class="navbar bg-light navbar-light navbar-expand-lg">
	<div class="container-fluid">
		<a href="Home" class="navbar-brand"><img src="res/img/logo.png"
			alt="Logo" title="Logo"></a>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a href="Home" class="nav-link active">Accueil</a></li>
				<%
					if (session.getAttribute("user") == null) {
				%><li class="nav-item"><a href="Login" class="nav-link">Se
						connecter</a></li>
				<%
					}
				%>
				<li class="nav-item"><a href="voiture1?action=ajoutervoiture"
					class="nav-link">Louer ma voiture</a></li>


				<li class="nav-item"><a href="#contactus" class="nav-link">à
						propos de nous</a></li>


				<li class="nav-item"><a href="#contactus" class="nav-link">Contactez-nous</a></li>
				<%
					if (session.getAttribute("user") != null) {
				%><li class="nav-item"><a href="voiture1?action=mesvoitures"
					class="nav-link">Mes voitures</a></li>
				<li class="nav-item"><a href="demande1?action=mesdemandes" 
					class="nav-link">Mes demandes</a></li>

				<a href="logout"><svg xmlns="http://www.w3.org/2000/svg"
						style="margin-right: 10px; margin-top: 10px" width="40"
						height="40" fill="currentColor" class="bi bi-box-arrow-in-right"
						viewBox="0 0 16 16">
  <path fill-rule="evenodd"
							d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z" />
  <path fill-rule="evenodd"
							d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
</svg></a>
				<a href="profile?action=profile"><svg
						xmlns="http://www.w3.org/2000/svg" width="40" height="40"
						style="margin-right: 10px; margin-top: 10px" fill="currentColor"
						class="bi bi-person-circle" viewBox="0 0 16 16">
  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
  <path fill-rule="evenodd"
							d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
</svg></a>
				<%
					}
				%>
			</ul>
		</div>


	</div>
</nav>
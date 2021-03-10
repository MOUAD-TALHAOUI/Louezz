<%@page import="com.sun.java_cup.internal.runtime.virtual_parse_stack"%>
<%@page import="com.modules.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
    	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/navbar.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/footer.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/profile.css">
<title>louezz</title>
	<link rel="shortcut icon" href="res/img/favicon.png">
	<%
	User user = (User) request.getAttribute("user");
%>
    <body>
    <div class="fixed-top">
    <%@ include file="navbar.jsp"%>
    </div>
<div class="container">
    <div class="main-body">
    
          <!-- Breadcrumb -->
          <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.html">Home</a></li>
              <li class="breadcrumb-item"><a href="javascript:void(0)">User</a></li>
              <li class="breadcrumb-item active" aria-current="page">User Profile</li>
            </ol>
          </nav>
          <!-- /Breadcrumb -->
    
          <div class="row gutters-sm mt-5">
            <div class="col-md-4 mb-3 ">
              <div class="card">
                <div class="card-body">
                  <div class="d-flex flex-column align-items-center text-center">
                    <%if(!user.getPhoto().equals("")){ %> <img  src="res/utilisateur/<%=user.getPhoto()%>"
                     alt="Admin" class="rounded-circle" width="150"><%} %>
                     <%if(user.getPhoto().equals("")){ %> <img  src="https://bootdey.com/img/Content/avatar/avatar7.png" 
                     alt="Admin" class="rounded-circle" width="150"><%} %>
                      
                    <div class="mt-3">
                      <h4><%=user.getNom()+" " +user.getPrenom() %></h4>
                      <p class="text-secondary mb-1"><%=user.getDate_naissance() %></p>
                      <p class="text-muted font-size-sm"><%=user.getAdresse_utilisateur() %></p>
                   

                      <a class="btn btn-primary" href="profile?action=changeinfo">Modifier</a>
                      <a class="btn btn-outline-primary" href="profile?action=changepassword" >Supprimer</a>
                      <a class="btn btn-primary" href="profile?action=changepassword">password</a>
                      
                      
                      

                    </div>
                  </div>
                </div>
              </div>
 
            </div>
            <div class="col-md-8">
              <div class="card mb-3">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Full Name</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=user.getNom()+" " +user.getPrenom() %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Email</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
					<%=user.getEmail() %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Phone</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=user.getTelephone() %>
                    </div>
                  </div>
                  <hr>
                  
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Date naissance</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=user.getDate_naissance() %>
                    </div>
                  </div>
                  <hr>
                  
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Numero de permis</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=user.getNum_permis() %>
                    </div>
                  </div>
                  <hr>

                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Login</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=user.getLogin() %>
                    </div>
                  </div>
                  <hr>                  
                  
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">CIN</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=user.getCin() %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Address</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=user.getAdresse_utilisateur() %>
                    </div>
                  </div>
                </div>
              </div>



            </div>
          </div>
        </div>
    </div>
    <%@ include file="footer.jsp"%>
    </body>
    
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="tn.enis.entity.Compte"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mise à jour d'un Compte</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	 <div class="container-fluid">
	<nav class="navbar navbar-light ">
  <div class="container-fluid">
    <a class="navbar-brand"><h1>Mise à jour compte</h1></a>
    <form class="d-flex">
      
         <div><a href="http://localhost:8080/BanqueWeb/accueil.html"><button
				type="button" class="btn btn-secondary">Accueil</button></a></div>
    </form>
  </div>
</nav>
	
	<%
	Compte c = (Compte)request.getAttribute("compte");
	%>
	<form action="CompteServlet" method="POST">
	
		<table class="table table-borderless">
			<tr>
				<td>Rib</td>
				<td><input  type="hidden"  type="text" name="rib" value="<%=c.getRib()%>"></td>
			</tr>
			<tr>
				<td>Id Client</td>
				<td><input type="text" name="id"
					value="<%=c.getClient().getId()%>"></td>
			</tr>
			<tr>
				<td>Nom Client</td>
				<td><input type="text" name="nom"
					value="<%=c.getClient().getNom()%>"></td>
			</tr>
			<tr>
				<td>Prenom Client</td>
				<td><input type="text" name="prenom"
					value="<%=c.getClient().getPrenom()%>"></td>
			</tr>
			<tr>
			<tr>
				<td>Adresse Client</td>
				<td><input type="text" name="adresse"
					value="<%=c.getClient().getAdresse()%>"></td>
			</tr>
			<tr>
				<td>Solde</td>
				<td><input type="text" name="solde" value="<%=c.getSolde()%>"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" class="btn btn-primary" name="action" value="apply"></td>
			</tr>
		</table>

	</form>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
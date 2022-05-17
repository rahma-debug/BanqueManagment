<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="tn.enis.entity.Client"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">

<nav class="navbar navbar-light ">
  <div class="container-fluid">
    <a class="navbar-brand"><h1>Mise à jour d'un Client</h1></a>
    <form class="d-flex">
      
         <div><a href="http://localhost:8080/BanqueWeb/accueil.html"><button
				type="button" class="btn btn-secondary">Accueil</button></a></div>
    </form>
  </div>
</nav>
  	
	<%
	Client c = (Client) request.getAttribute("client");
	
	%>
	
	<form action="ClientServlet" method="POST" >
		<table>
			
			<tr>
				<td>ID</td>
				<td><input type="text" name="id" value="<%=c.getId()%>"></td>
			</tr>
			<tr>
				<td>Nom</td>
				<td><input type="text" name="nom" value="<%=c.getNom()%>"></td>
			</tr>
			<tr>
				<td>Prenom</td>
				<td><input type="text" name="prenom" value="<%=c.getPrenom()%>"></td>
			</tr>
			<tr>
				<td>Adresse</td>
				<td><input type="text" name="adresse" value="<%=c.getAdresse()%>"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" name="action" value="apply"></td>
			</tr>
		</table>

	</form>
  
</div>

	<script src="js/bootstrap.bundle.min.js"></script>

</body>
</html>
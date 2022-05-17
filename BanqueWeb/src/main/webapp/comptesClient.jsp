<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="tn.enis.entity.Compte"%>
<%@ page import="tn.enis.entity.Client"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container-fluid">
		<%
		Client c = (Client) request.getAttribute("client");
		%>
		<nav class="navbar navbar-light ">
			<div class="container-fluid">
				<a class="navbar-brand">
					<h1>
						Liste des comptes du client : <%=c.getPrenom()%>    <%=c.getNom()%></h1>
				</a>
				<form class="d-flex">

					<div>
						<a href="http://localhost:8080/BanqueWeb/accueil.html"><button
								type="button" class="btn btn-secondary">Accueil</button></a>
					</div>
				</form>
			</div>
		</nav>


		<%
		List<Compte> comptes = (List<Compte>) request.getAttribute("comptesClient");
		%>
		<table class="table">
			<tr>
				<th>RIB</th>
				<th>Solde</th>
				<th>Delete</th>
				<th>update</th>

			</tr>
			<%
			if (comptes != null && !comptes.isEmpty()) {
				for (Compte com : comptes) {
					Long rib = com.getRib();
			%>
			<tr id="<%=rib%>">
				<td><%=com.getRib()%></td>
				<td><%=com.getSolde()%></td>
				<td><a href="javascript:deleteCompte(<%=rib%>)"><button
							type="button" class="btn btn-danger">Delete</button></a></td>
				<td><a href=CompteServlet?action=update&rib= <%=rib%>><button
							type="button" class="btn btn-info">update</button></a></td>
			</tr>
			<%
			}
			}
			%>
		</table>

		<script src="js/bootstrap.bundle.min.js"></script>
		<script src="js/jquery-3.6.0.min.js"></script>
		<script src="js/sweetalert.min.js"></script>
		<script src="js/compte.js"></script>
</body>
</html>
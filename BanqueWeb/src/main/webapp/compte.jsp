<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="tn.enis.entity.Compte"%>
<%@page import="tn.enis.entity.Client"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	 <div class="container-fluid">
	<nav class="navbar navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand"><h1>Liste des Comptes</h1></a>
    <form class="d-flex">
      
         <div><a href="http://localhost:8080/BanqueWeb/accueil.html"><button
				type="button" class="btn btn-secondary">Accueil</button></a></div>
    </form>
  </div>
</nav>
		
	<%
	List<Compte> comptes = (List<Compte>) request.getAttribute("comptes");
	%>
	<table class="table table-striped">
		<tr>
			<th>RIB</th>
			<th>Solde</th>
			<th>update</th>
			<th>Delete</th>
			
			
			

		</tr>
		<%
		if (comptes != null && !comptes.isEmpty()) {
			for (Compte c : comptes) {
				Long rib = c.getRib();
				
		%>
		<tr id="<%=rib%>">
			<td><%=c.getRib()%></td>
			<td><%=c.getSolde()%></td>
			<td><a href="CompteServlet?action=update&rib=<%=rib%>"><button type="button" class="btn btn-warning">update</button></a></td>
			<td><a href="javascript:deleteCompte(<%=rib%>)"><button
							type="button" class="btn btn-danger">delete</button></a></td>
		
		</tr>
		
		<%
		}
		}
		%>
	</table>
	</div>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery-3.6.0.min.js"></script>
	<script src="js/sweetalert.min.js"></script>
	<script src="js/compte.js"></script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<div class="container">

<nav class="navbar navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand"><h1>Liste des Clients</h1></a>
    <form class="d-flex">
      
         <div><a href="http://localhost:8080/BanqueWeb/accueil.html"><button
				type="button" class="btn btn-secondary">Accueil</button></a></div>
    </form>
  </div>
</nav>
		
		
		<%
		List<Client> clients = (List<Client>) request.getAttribute("clients");
		%>
		<table class="table table-striped">
			<tr>
				<th>name</th>
				<th>prenom</th>
				<th>adresse</th>
				<th>update</th>
				<th>delete</th>
				<th>afficher Comptes</th>

			</tr>
			<%
			if (clients != null && !clients.isEmpty()) {

				for (Client p : clients) {
					long index = p.getId();
			%>
			<tr id="<%=index%>">
				<td><%=p.getNom()%></td>
				<td><%=p.getPrenom()%></td>
				<td><%=p.getAdresse()%></td>


				<td><a href="ClientServlet?action=update&index=<%=index%>">
						<button type="button" class="btn btn-warning">update</button>
				</a></td>
				<td><a href="javascript:deleteClient(<%=index%>)"><button
							type="button" class="btn btn-danger">delete</button></a></td>
				<td><a
					href="ClientServlet?action=comptesClient&index=<%=index%>"><button
							type="button" class="btn btn-info">afficher comptes</button></a></td>


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
	<script src="js/client.js"></script>

</body>
</html>
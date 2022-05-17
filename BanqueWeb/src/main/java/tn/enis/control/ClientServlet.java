package tn.enis.control;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tn.enis.entity.Client;
import tn.enis.entity.Compte;
import tn.enis.service.ClientManager;
import tn.enis.service.CompteManager;

/**
 * Servlet implementation class ClientServlet
 */
@WebServlet("/ClientServlet")
public class ClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private ClientManager clientService;
	@EJB
	private CompteManager compteService;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ClientServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if ("add".equals(request.getParameter("action"))) {
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String adresse = request.getParameter("adresse");
			Client clt = new Client(nom, prenom, adresse);
			clientService.saveClient(clt);

		} else if ("delete-ajax".equals(request.getParameter("action"))) {
			long index = Long.parseLong(request.getParameter("index"));
			clientService.deleteClient(index);

		} else if ("update".equals(request.getParameter("action"))) {
			long index = Long.parseLong(request.getParameter("index"));
			Client client = clientService.getByIdClient(index);
			request.setAttribute("client", client);
			request.getRequestDispatcher("clientEdit.jsp").forward(request, response);
			return;
		} else if ("apply".equals(request.getParameter("action"))) {
			long index = Long.parseLong(request.getParameter("id"));
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String adresse = request.getParameter("adresse");
			Client client = new Client( index,nom, prenom, adresse);
			clientService.updateClient(client);
		}
		else if ("comptesClient".equals(request.getParameter("action"))) {
			long index = Long.parseLong(request.getParameter("index"));
			Client client=clientService.getByIdClient(index);
			List<Compte> comptesClient=compteService.getAllComptesByClient(client);
			request.setAttribute("client", client);
			request.setAttribute("comptesClient", comptesClient);
			request.getRequestDispatcher("comptesClient.jsp").forward(request, response);
			return;
		}
		 
		
		request.setAttribute("clients", clientService.getAllClients());
		request.getRequestDispatcher("client.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}

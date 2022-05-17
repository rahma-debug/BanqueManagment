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
 * Servlet implementation class CompteServlet
 */
@WebServlet("/CompteServlet")
public class CompteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	private CompteManager compteService;
	@EJB
	private ClientManager clientService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if ("add".equals(request.getParameter("action"))) {
			Long id = Long.parseLong(request.getParameter("id"));
			if (id != null) {
				Client client = clientService.getByIdClient(id);
				float solde = Float.parseFloat(request.getParameter("solde"));
				Compte compte = new Compte(solde, client);
				compteService.saveCompte(compte);
				
			} 

		}else if ("delete-ajax".equals(request.getParameter("action"))) {
			long rib = Long.parseLong(request.getParameter("rib"));
			compteService.deleteCompte(rib);

		} else if ("update".equals(request.getParameter("action"))) {
			long rib = Long.parseLong(request.getParameter("rib"));
			Compte compte = compteService.getByIdCompte(rib);
			request.setAttribute("compte", compte);
			request.getRequestDispatcher("compteEdit.jsp").forward(request, response);
			return;
		} else if ("apply".equals(request.getParameter("action"))) {
			float solde = Float.parseFloat(request.getParameter("solde"));
			long rib = Long.parseLong(request.getParameter("rib"));
			long index = Long.parseLong(request.getParameter("id"));
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String adresse = request.getParameter("adresse");
			Client client = new Client( index,nom, prenom, adresse);
			clientService.updateClient(client);
			Compte compte =new Compte(solde,client);
			compteService.updateCompte(compte);
			
		}
		

		request.setAttribute("comptes", compteService.getAllComptes());
		request.getRequestDispatcher("compte.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
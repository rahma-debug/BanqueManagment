package tn.enis.service;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import tn.enis.dao.ClientDao;
import tn.enis.entity.Client;
import tn.enis.entity.Compte;

/**
 * Session Bean implementation class ClientManager
 */
@Stateless
@LocalBean
public class ClientManager {

	@EJB
	private ClientDao clientDao;

	
	public void saveClient(Client client) {
		clientDao.saveClient(client);
	}

	public void updateClient(Client client) {
		clientDao.updateClient(client);
	}

	public void deleteClient(Long id) {
		clientDao.deleteClient(getByIdClient(id));
	}

	public Client getByIdClient(Long id) {
		return clientDao.getByIdClient(id);
	}

	public List<Compte> getAllCompteByClient(Long id) {
		return clientDao.getAllCopmtesByClient(id);
	}
	public List<Client> getAllClients(){
		return clientDao.getAllClients();
	}
}

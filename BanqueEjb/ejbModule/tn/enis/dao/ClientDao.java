package tn.enis.dao;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import tn.enis.entity.Client;
import tn.enis.entity.Compte;

/**
 * Session Bean implementation class ClientDao
 */
@Singleton
@LocalBean
public class ClientDao {

	@PersistenceContext
	private EntityManager em;

	
	public void saveClient(Client client) {
		em.persist(client);
	}

	public void updateClient(Client client) {
		em.merge(client);
	}

	public void deleteClient(Client client) {
		em.remove(client);
	}

	public Client getByIdClient(Long id) {
		return em.find(Client.class, id);
	}

	public List<Client> getAllClients() {
		return em.createQuery("select c from Client c", Client.class).getResultList();
	}

	public List<Compte> getAllCopmtesByClient(Long id) {
		return em.createQuery("select c from Compte c where c.compte=:clt", Compte.class).setParameter("clt", id)
				.getResultList();
	}
	
	
}
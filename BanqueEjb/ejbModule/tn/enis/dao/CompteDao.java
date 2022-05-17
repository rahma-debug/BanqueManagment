package tn.enis.dao;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import tn.enis.entity.Client;
import tn.enis.entity.Compte;

/**
 * Session Bean implementation class CompteDao
 */
@Singleton
@LocalBean
public class CompteDao {

	@PersistenceContext
	private EntityManager em;

	public void saveCompte(Compte compte) {
		em.persist(compte);
	}

	public void updateCompte(Compte compte) {
		em.merge(compte);
	}

	public void deleteCompte(Compte compte) {
		em.remove(compte);
	}

	public Compte getByIdCompte(Long rib) {
		return em.find(Compte.class, rib);
	}

	public List<Compte> getAllComptes() { 
		return em.createQuery("select c from Compte c", Compte.class).getResultList();
	}
	

	public List<Compte> getAllCopmtesByClient(Client client) { 
		return em.createQuery("select c from Compte c where c.client=:clt", Compte.class)
				.setParameter("clt", client).getResultList();
	}

	public Client getClientByIdCompte(Long rib) {
		return em.createQuery("select clt from Client clt where clt.compte=:c", Client.class)
				.setParameter("c", rib).getSingleResult();
	}
}
package tn.enis.service;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import tn.enis.dao.CompteDao;
import tn.enis.entity.Client;
import tn.enis.entity.Compte;

/**
 * Session Bean implementation class CompteManager
 */
@Stateless
@LocalBean
public class CompteManager {
	@EJB
	private CompteDao compteDao;

	public void saveCompte(Compte compte) {
		compteDao.saveCompte(compte);
	}

	public void updateCompte(Compte compte) {
		compteDao.updateCompte(compte);
	}

	public void deleteCompte(Long rib) {
		compteDao.deleteCompte(getByIdCompte(rib));
	}

	public Compte getByIdCompte(Long rib) {
		return compteDao.getByIdCompte(rib);
	}
	public Client getClientByIdCompte(Long rib) {
		return compteDao.getClientByIdCompte(rib);
	}

	public List<Compte> getAllComptesByClient(Client client) {
		return compteDao.getAllCopmtesByClient(client);
	}
	public List<Compte> getAllComptes(){
		return compteDao.getAllComptes();
	}

}
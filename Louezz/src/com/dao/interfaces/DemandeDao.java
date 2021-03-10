package com.dao.interfaces;

import java.sql.SQLException;
import java.util.List;
import com.modules.Demande;

public interface DemandeDao {

	public List<Demande> FindMesDemandes(int id_user) throws SQLException;

	public Demande FindDemandeById(int id_demande) throws SQLException;

	public List<Demande> FindMesDemandesById_Vehicule(int id_vehicule) throws SQLException;

	public void DeleteDemandeById(int id_demande) throws SQLException;

	public Demande CreateDemande(Demande demande) throws SQLException;

	public int getMax()  throws SQLException;

	public void UpdateDemandeEtat(String etat_demande, int id) throws SQLException;
}

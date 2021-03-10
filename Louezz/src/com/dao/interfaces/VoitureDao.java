package com.dao.interfaces;

import java.sql.SQLException;
import java.util.List;
import com.modules.*;



public interface VoitureDao {

	public int UpdateVoiture(Voiture voiture) throws SQLException;

	public Voiture findSpecificVoitureByid(int id) throws SQLException;

	public void DeleteVoiture(int id) throws SQLException;

	public int getMax() throws SQLException;

	public List<Voiture> findSpecificVoitureByEmail(String email) throws SQLException;

	public int insertVoiture(Voiture voiture) throws SQLException;

	public List<Voiture> findSpecificVoitures(String email) throws SQLException;
	public List<Voiture> findSpecificByDateAndCity(String ville, String datefin, String datedebut) throws SQLException;

	public List<Voiture> findAllVoiture() throws SQLException;



}

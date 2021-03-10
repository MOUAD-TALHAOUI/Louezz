package com.modules;

public class Demande {
	private int id_demande;
	private int id_user;
	private int id_vehicule;
	private String etat_demande;

	public int getId_demande() {
		return id_demande;
	}
	public void setId_demande(int id_demande) {
		this.id_demande = id_demande;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public int getId_vehicule() {
		return id_vehicule;
	}
	public void setId_vehicule(int id_vehicule) {
		this.id_vehicule = id_vehicule;
	}
	public String getEtat_demande() {
		return etat_demande;
	}
	public void setEtat_demande(String etat_demande) {
		this.etat_demande = etat_demande;
	}
	public Demande(int id_demande, int id_user, int id_vehicule, String etat_demande2) {
		super();
		this.id_demande = id_demande;
		this.id_user = id_user;
		this.id_vehicule = id_vehicule;
		this.etat_demande = etat_demande2;
	}
	public Demande() {
		super();
	}


	
}

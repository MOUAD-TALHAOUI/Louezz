package com.modules;

public class User {
private int id_user;
private String nom;
private String prenom;
private String telephone;
private String date_naissance;
private String adresse_utilisateur;
private String login;
private String email;
private String password;
private String cin;
private String num_permis;
private String photo;


public User() {
	super();
}
public User(int id_user, String nom, String prenom, String telephone, String date_naissance, String adresse_utilisateur,
		String login, String email, String password, String cin, String num_permis, String photo) {
	super();
	this.id_user = id_user;
	this.nom = nom;
	this.prenom = prenom;
	this.telephone = telephone;
	this.date_naissance = date_naissance;
	this.adresse_utilisateur = adresse_utilisateur;
	this.login = login;
	this.email = email;
	this.password = password;
	this.cin = cin;
	this.num_permis = num_permis;
	this.photo = photo;
}
public int getId_user() {
	return id_user;
}
public void setId_user(int id_user) {
	this.id_user = id_user;
}
public String getNom() {
	return nom;
}
public void setNom(String nom) {
	this.nom = nom;
}
public String getPrenom() {
	return prenom;
}
public void setPrenom(String prenom) {
	this.prenom = prenom;
}
public String getTelephone() {
	return telephone;
}
public void setTelephone(String telephone) {
	this.telephone = telephone;
}
public String getDate_naissance() {
	return date_naissance;
}
public void setDate_naissance(String date_naissance) {
	this.date_naissance = date_naissance;
}
public String getAdresse_utilisateur() {
	return adresse_utilisateur;
}
public void setAdresse_utilisateur(String adresse_utilisateur) {
	this.adresse_utilisateur = adresse_utilisateur;
}
public String getLogin() {
	return login;
}
public void setLogin(String login) {
	this.login = login;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getCin() {
	return cin;
}
public void setCin(String cin) {
	this.cin = cin;
}
public String getNum_permis() {
	return num_permis;
}
public void setNum_permis(String num_permis) {
	this.num_permis = num_permis;
}
public String getPhoto() {
	return photo;
}
public void setPhoto(String photo) {
	this.photo = photo;
}




}

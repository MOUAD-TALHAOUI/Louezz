package com.dao.implementations;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import com.dao.ConnectionFactory.ConnectionFactory;
import com.dao.interfaces.UserDao;
import com.modules.User;

public class UserDaoImp implements UserDao {

	Connection connection;
	@Override
	public int getMax() {

		ResultSet rs = null;

		String query = "SELECT max(id_user) FROM utilisateur";

		int max = 0;

		try {
			
			connection = ConnectionFactory.getConnection();
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			max = rs.getInt(1);
			rs.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

		return max;
	}

	@Override
	public Boolean findSpecificByEmail(String email) throws SQLException {

		ResultSet rs = null;
		
		connection = ConnectionFactory.getConnection();
		PreparedStatement preparedStmt = null;

		String query = "SELECT count(*) FROM utilisateur where email=?";
		preparedStmt = connection.prepareStatement(query);
		preparedStmt.setString(1, email);
		rs = preparedStmt.executeQuery();
		rs.next();
		int i = rs.getInt(1);
		return i == 1;

	}
	
	
	
	
	@Override
	public User findSpecificUserById(int id) throws SQLException {
		connection = ConnectionFactory.getConnection();
		ResultSet rs = null;
		

		connection = ConnectionFactory.getConnection();
		PreparedStatement preparedStmt = null;

		String query = "SELECT id_user,nom,prenom,telephone,DATE_NAISSANCE,ADRESSE_UTILISATEUR,LOGIN,EMAIL,PASSWORD,"
				+ "CIN,NUM_PERMIS,PHOTO FROM utilisateur where id_user=?";
		preparedStmt = connection.prepareStatement(query);
		preparedStmt.setInt(1, id);
		rs = preparedStmt.executeQuery();
		rs.next();
		int id_user = rs.getInt("id_user");
		String nom = rs.getString("nom");
		String prenom = rs.getString("prenom");
		String telephone = rs.getString("telephone");
		java.sql.Date date_naissance = rs.getDate("DATE_NAISSANCE");
		Date date_naissance1 = (Date) date_naissance ;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = formatter.format(date_naissance1);
		String email = rs.getString("email");

		String adresse_utilisateur = rs.getString("ADRESSE_UTILISATEUR");
		String login = rs.getString("LOGIN");
		String password = rs.getString("PASSWORD");
		String cin = rs.getString("CIN");
		String num_permis = rs.getString("NUM_PERMIS");
		String photo = rs.getString("PHOTO");
		User user = new User(id_user, nom, prenom, telephone, formattedDate, adresse_utilisateur, login, email,
				password, cin, num_permis, photo);
		return user;

	}
	
	
	
	
	
	
	
	

	@Override
	public User findSpecificUserByEmail(String email) throws SQLException {
		connection = ConnectionFactory.getConnection();
		ResultSet rs = null;
		

		connection = ConnectionFactory.getConnection();
		PreparedStatement preparedStmt = null;

		String query = "SELECT id_user,nom,prenom,telephone,DATE_NAISSANCE,ADRESSE_UTILISATEUR,LOGIN,EMAIL,PASSWORD,"
				+ "CIN,NUM_PERMIS,PHOTO FROM utilisateur where email=?";
		preparedStmt = connection.prepareStatement(query);
		preparedStmt.setString(1, email);
		rs = preparedStmt.executeQuery();
		rs.next();
		int id_user = rs.getInt("id_user");
		String nom = rs.getString("nom");
		String prenom = rs.getString("prenom");
		String telephone = rs.getString("telephone");
		java.sql.Date date_naissance = rs.getDate("DATE_NAISSANCE");
		Date date_naissance1 = (Date) date_naissance ;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = formatter.format(date_naissance1);
		
		String adresse_utilisateur = rs.getString("ADRESSE_UTILISATEUR");
		String login = rs.getString("LOGIN");
		String password = rs.getString("PASSWORD");
		String cin = rs.getString("CIN");
		String num_permis = rs.getString("NUM_PERMIS");
		String photo = rs.getString("PHOTO");
		User user = new User(id_user, nom, prenom, telephone, formattedDate, adresse_utilisateur, login, email,
				password, cin, num_permis, photo);
		return user;

	}

	@Override
	public int insertUser(User user) throws SQLException {

		PreparedStatement preparedStmt = null;
		
		connection = ConnectionFactory.getConnection();
		String query = "INSERT INTO utilisateur (id_user,nom,prenom,telephone,DATE_NAISSANCE,ADRESSE_UTILISATEUR,"
				+ "LOGIN,EMAIL,PASSWORD,CIN,NUM_PERMIS,PHOTO) " + "VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		preparedStmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
		preparedStmt.setInt(1, getMax() + 1);
		preparedStmt.setString(2, user.getNom());
		preparedStmt.setString(3, user.getPrenom());
		preparedStmt.setString(4, user.getTelephone());

		
		
		
		
		preparedStmt.setString(6, user.getAdresse_utilisateur());
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		 java.util.Date date=new java.util.Date();
		try {
			date = sdf.parse(user.getDate_naissance());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 java.sql.Date sqlDate = new Date(date.getTime());
		
		preparedStmt.setDate(5, sqlDate);
		preparedStmt.setString(7, user.getLogin());
		preparedStmt.setString(8, user.getEmail());
		preparedStmt.setString(9, user.getPassword());
		preparedStmt.setString(10, user.getCin());
		preparedStmt.setString(11, user.getNum_permis());
		preparedStmt.setString(12, user.getPhoto());
		preparedStmt.execute();

		return 0;

	}

	@Override
	public int UpdateUser(User user) throws SQLException {

		PreparedStatement preparedStmt = null;
		
		connection = ConnectionFactory.getConnection();
		
		User user1=findSpecificUserByEmail(user.getEmail());
		String query = "update utilisateur set  nom=?,prenom=?,telephone=?,DATE_NAISSANCE=?,ADRESSE_UTILISATEUR=?,"
				+ "CIN=?,NUM_PERMIS=?,PHOTO=?  where id_user="+user1.getId_user();

		preparedStmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

		preparedStmt.setString(1, user.getNom());
		preparedStmt.setString(2, user.getPrenom());
		preparedStmt.setString(3, user.getTelephone());		
		preparedStmt.setString(5, user.getAdresse_utilisateur());
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		 java.util.Date date=new java.util.Date();
		try {
			date = sdf.parse(user.getDate_naissance());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 java.sql.Date sqlDate = new Date(date.getTime());
		
		preparedStmt.setDate(4, sqlDate);
		preparedStmt.setString(6, user.getCin());
		preparedStmt.setString(7, user.getNum_permis());
		preparedStmt.setString(8, user.getPhoto());
		preparedStmt.execute();

		return 0;

	}


	@Override
	public void DeleteUser(String email) {
		PreparedStatement preparedStmt = null;
		try {
			
			connection = ConnectionFactory.getConnection();
			User user=findSpecificUserByEmail(email);
			String query = "DELETE FROM utilisateur where id_user="+user.getId_user();
			preparedStmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			preparedStmt.execute();
			preparedStmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	@Override
	public void ChangePassword(String email,String password) throws SQLException {

		PreparedStatement preparedStmt = null;
		
		connection = ConnectionFactory.getConnection();
		User user=findSpecificUserByEmail(email);
		String query = "update utilisateur set  PASSWORD = ?  where id_user="+user.getId_user();
		preparedStmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
		preparedStmt.setString(1, password);
		
		preparedStmt.execute();
	}

}

package com.dao.implementations;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import com.dao.ConnectionFactory.ConnectionFactory;
import com.dao.interfaces.UserDao;
import com.dao.interfaces.VoitureDao;
import com.modules.User;
import com.modules.Voiture;

public class VoitureDaoImp  implements VoitureDao{

	UserDao userdao= new UserDaoImp();

	Connection connection;
	@Override
	public int getMax() {

		ResultSet rs = null;

		String query = "SELECT max(id_vehicule) FROM vehicule";
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
	public int insertVoiture(Voiture voiture) throws SQLException {
		PreparedStatement preparedStmt = null;
		
		connection = ConnectionFactory.getConnection();
		String query = "INSERT INTO vehicule (id_vehicule,marque,modele,CARBURANT,KILOMETRAGE,IMMATRICULATION,type_vehicule,"
				+ "PHOTO1,PHOTO2,boite_vitesse,nbr_places,nbr_portes,id_user,fin,debut,descr,lieu_rencontre,prix,ville,etat) " 
				+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		preparedStmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
		preparedStmt.setInt(1, getMax() + 1);
		preparedStmt.setString(2, voiture.getMarque());
		preparedStmt.setString(3, voiture.getModele());
		preparedStmt.setString(4, voiture.getCARBURANT());
		preparedStmt.setInt(5, voiture.getKILOMETRAGE());
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		 java.util.Date date=new java.util.Date();
		try {
			date = sdf.parse(voiture.getFin());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		preparedStmt.setString(6, voiture.getIMMATRICULATION());
		preparedStmt.setString(7, "");
		preparedStmt.setString(8, voiture.getPHOTO1());
		preparedStmt.setString(9, voiture.getPHOTO2());
		preparedStmt.setString(10, voiture.getBoite_vitesse());
		preparedStmt.setInt(11, voiture.getNbr_places());
		preparedStmt.setInt(12, voiture.getNbr_portes());
		preparedStmt.setInt(13, voiture.getId_user());
		java.sql.Date sqlDate = new Date(date.getTime());
		preparedStmt.setDate(14, sqlDate);
		try {
			date = sdf.parse(voiture.getDebut());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sqlDate = new Date(date.getTime());

		preparedStmt.setDate(15,sqlDate);
		preparedStmt.setString(16, voiture.getDescr());
		preparedStmt.setString(17, voiture.getLieu_rencontre());
		preparedStmt.setInt(18, voiture.getPrix());
		preparedStmt.setString(19, voiture.getVille());
		preparedStmt.setString(20, voiture.getEtat());



		preparedStmt.execute();

		return 0;

	}
	@Override
	public int UpdateVoiture(Voiture voiture) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	@Override
	public Voiture findSpecificVoitureByid(int id) throws SQLException {
		connection = ConnectionFactory.getConnection();
		ResultSet rs = null;
		

		connection = ConnectionFactory.getConnection();
		PreparedStatement preparedStmt = null;

		String query = "SELECT id_vehicule , marque , modele , carburant , " + 
				"kilometrage , immatriculation , type_vehicule," + 
				" photo1 , photo2 , boite_vitesse , nbr_places , nbr_portes" + 
				" , id_user , fin , debut , ville , lieu_rencontre , prix , descr , etat" + 
				" FROM vehicule where  id_vehicule="+id;

		preparedStmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

		
		rs = preparedStmt.executeQuery();
		rs.next();
		int id_vehicule = rs.getInt("id_vehicule");
		String marque = rs.getString("marque");
		String modele = rs.getString("modele");
		String CARBURANT = rs.getString("CARBURANT");
		int KILOMETRAGE = rs.getInt("KILOMETRAGE");
		java.sql.Date date = rs.getDate("fin");
		Date date1 = (Date) date ;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String fin = formatter.format(date1);
        date = rs.getDate("debut");
        Date date2=(Date) date ;
        String debut=formatter.format(date2);
		String IMMATRICULATION = rs.getString("IMMATRICULATION");
		String TYPE_VRHICULE = rs.getString("type_vehicule");
		String PHOTO1 = rs.getString("PHOTO1");
		String PHOTO2 = rs.getString("PHOTO2");
		String boite_vitesse = rs.getString("boite_vitesse");
		int nbr_places = rs.getInt("nbr_places");
		int nbr_portes = rs.getInt("nbr_portes");
		int id_user = rs.getInt("id_user");
		int prix = rs.getInt("prix");
		String ville = rs.getString("ville");
		String descr = rs.getString("descr");
		String lieu_rencontre = rs.getString("lieu_rencontre");
		String etat = rs.getString("etat");

		Voiture voiture=new Voiture(id_vehicule, marque, modele, CARBURANT, KILOMETRAGE, IMMATRICULATION, TYPE_VRHICULE, PHOTO1,
		PHOTO2, boite_vitesse, nbr_places, nbr_portes, id_user, fin, debut, prix, descr, lieu_rencontre, ville,etat);
		
		return voiture;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public void DeleteVoiture(int id) throws SQLException {
		connection = ConnectionFactory.getConnection();
		ResultSet rs = null;
		

		
		PreparedStatement preparedStmt = null;

		String query = "delete from vehicule where id_vehicule="+id;
		
		preparedStmt = connection.prepareStatement(query);
		preparedStmt.execute();
		}
		
	

	@Override
	public List<Voiture> findSpecificVoitureByEmail(String email) throws SQLException {
		connection = ConnectionFactory.getConnection();
		ResultSet rs = null;
		

		connection = ConnectionFactory.getConnection();
		PreparedStatement preparedStmt = null;
		User user1=userdao.findSpecificUserByEmail(email);
		String query = "SELECT id_vehicule,marque,modele,carburant,"
				+ "kilometrage,immatriculation,type_vehicule," + 
				"+photo1,photo2,boite_vitesse,nbr_places,nbr_portes"
				+ ",id_user,fin,debut,ville,lieu_rencontre,prix,descr,etat"
				+ " FROM vehicule where id_user="+user1.getId_user();
		preparedStmt = connection.prepareStatement(query);
		rs = preparedStmt.executeQuery();
		List<Voiture> list=new ArrayList<Voiture>();
		
		int id_vehicule ;
		String marque ;
		String modele ;
		String CARBURANT;
		int KILOMETRAGE ;
		java.sql.Date date;
		Date date1;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String fin;
        Date date2;
        String debut;
		String IMMATRICULATION;
		String TYPE_VRHICULE ;
		String PHOTO1;
		String PHOTO2 ;
		String boite_vitesse;
		int nbr_places;
		int nbr_portes;
		int id_user;
		int prix ;
		String ville;
		String descr;
		String lieu_rencontre;
		String etat;
		Voiture voiture=new Voiture();
		
		while(rs.next()) {
			 id_vehicule = rs.getInt("id_vehicule");
			 marque = rs.getString("marque");
			 modele = rs.getString("modele");
			 CARBURANT = rs.getString("CARBURANT");
			 KILOMETRAGE = rs.getInt("KILOMETRAGE");
			 date = rs.getDate("fin");
			 date1 = (Date) date ;
			 formatter = new SimpleDateFormat("yyyy-MM-dd");
	         fin = formatter.format(date1);
	        date = rs.getDate("debut");
	         date2=(Date) date ;
	         debut=formatter.format(date2);
			 IMMATRICULATION = rs.getString("IMMATRICULATION");
			 TYPE_VRHICULE = rs.getString("type_vehicule");
			 PHOTO1 = rs.getString("PHOTO1");
			 PHOTO2 = rs.getString("PHOTO2");
			 boite_vitesse = rs.getString("boite_vitesse");
			 nbr_places = rs.getInt("nbr_places");
			 nbr_portes = rs.getInt("nbr_portes");
			 id_user = rs.getInt("id_user");
			 prix = rs.getInt("prix");
			 ville = rs.getString("ville");
			 descr = rs.getString("descr");
			 lieu_rencontre = rs.getString("lieu_rencontre");
			 etat = rs.getString("etat");

			 voiture=new Voiture(id_vehicule, marque, modele, CARBURANT, KILOMETRAGE, IMMATRICULATION, TYPE_VRHICULE, PHOTO1,
			PHOTO2, boite_vitesse, nbr_places, nbr_portes, id_user, fin, debut, prix, descr, lieu_rencontre, ville,etat);
			list.add(voiture);
		}
		
		return list;}
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public List<Voiture> findAllVoiture() throws SQLException {
		connection = ConnectionFactory.getConnection();
		ResultSet rs = null;
		

		connection = ConnectionFactory.getConnection();
		PreparedStatement preparedStmt = null;
		
		String query = "SELECT id_vehicule,marque,modele,carburant,"
				+ "kilometrage,immatriculation,type_vehicule," + 
				"+photo1,photo2,boite_vitesse,nbr_places,nbr_portes"
				+ ",id_user,fin,debut,ville,lieu_rencontre,prix,descr,etat"
				+ " FROM vehicule order by id_vehicule desc";
		preparedStmt = connection.prepareStatement(query);
		rs = preparedStmt.executeQuery();
		List<Voiture> list=new ArrayList<Voiture>();
		
		int id_vehicule ;
		String marque ;
		String modele ;
		String CARBURANT;
		int KILOMETRAGE ;
		java.sql.Date date;
		Date date1;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String fin;
        Date date2;
        String debut;
		String IMMATRICULATION;
		String TYPE_VRHICULE ;
		String PHOTO1;
		String PHOTO2 ;
		String boite_vitesse;
		int nbr_places;
		int nbr_portes;
		int id_user;
		int prix ;
		String ville;
		String descr;
		String lieu_rencontre;
		String etat;
		Voiture voiture=new Voiture();
		
		while(rs.next()) {
			 id_vehicule = rs.getInt("id_vehicule");
			 marque = rs.getString("marque");
			 modele = rs.getString("modele");
			 CARBURANT = rs.getString("CARBURANT");
			 KILOMETRAGE = rs.getInt("KILOMETRAGE");
			 date = rs.getDate("fin");
			 date1 = (Date) date ;
			 formatter = new SimpleDateFormat("yyyy-MM-dd");
	         fin = formatter.format(date1);
	        date = rs.getDate("debut");
	         date2=(Date) date ;
	         debut=formatter.format(date2);
			 IMMATRICULATION = rs.getString("IMMATRICULATION");
			 TYPE_VRHICULE = rs.getString("type_vehicule");
			 PHOTO1 = rs.getString("PHOTO1");
			 PHOTO2 = rs.getString("PHOTO2");
			 boite_vitesse = rs.getString("boite_vitesse");
			 nbr_places = rs.getInt("nbr_places");
			 nbr_portes = rs.getInt("nbr_portes");
			 id_user = rs.getInt("id_user");
			 prix = rs.getInt("prix");
			 ville = rs.getString("ville");
			 descr = rs.getString("descr");
			 lieu_rencontre = rs.getString("lieu_rencontre");
			 etat = rs.getString("etat");

			 voiture=new Voiture(id_vehicule, marque, modele, CARBURANT, KILOMETRAGE, IMMATRICULATION, TYPE_VRHICULE, PHOTO1,
			PHOTO2, boite_vitesse, nbr_places, nbr_portes, id_user, fin, debut, prix, descr, lieu_rencontre, ville,etat);
			list.add(voiture);
		}
		
		return list;}
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public List<Voiture> findSpecificVoitures(String email) throws SQLException {
		connection = ConnectionFactory.getConnection();
		ResultSet rs = null;
		

		connection = ConnectionFactory.getConnection();
		PreparedStatement preparedStmt = null;
		User user1=userdao.findSpecificUserByEmail(email);
		String query = "SELECT id_vehicule,marque,modele,carburant,"
				+ "kilometrage,immatriculation,type_vehicule," + 
				"+photo1,photo2,boite_vitesse,nbr_places,nbr_portes"
				+ ",id_user,fin,debut,ville,lieu_rencontre,prix,descr,etat"
				+ " FROM vehicule where id_user!="+user1.getId_user()+" order by id_vehicule desc";
		preparedStmt = connection.prepareStatement(query);
		rs = preparedStmt.executeQuery();
		List<Voiture> list=new ArrayList<Voiture>();
		
		int id_vehicule ;
		String marque ;
		String modele ;
		String CARBURANT;
		int KILOMETRAGE ;
		java.sql.Date date;
		Date date1;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String fin;
        Date date2;
        String debut;
		String IMMATRICULATION;
		String TYPE_VRHICULE ;
		String PHOTO1;
		String PHOTO2 ;
		String boite_vitesse;
		int nbr_places;
		int nbr_portes;
		int id_user;
		int prix ;
		String ville;
		String descr;
		String lieu_rencontre;
		String etat;
		Voiture voiture=new Voiture();
		
		while(rs.next()) {
			 id_vehicule = rs.getInt("id_vehicule");
			 marque = rs.getString("marque");
			 modele = rs.getString("modele");
			 CARBURANT = rs.getString("CARBURANT");
			 KILOMETRAGE = rs.getInt("KILOMETRAGE");
			 date = rs.getDate("fin");
			 date1 = (Date) date ;
			 formatter = new SimpleDateFormat("yyyy-MM-dd");
	         fin = formatter.format(date1);
	        date = rs.getDate("debut");
	         date2=(Date) date ;
	         debut=formatter.format(date2);
			 IMMATRICULATION = rs.getString("IMMATRICULATION");
			 TYPE_VRHICULE = rs.getString("type_vehicule");
			 PHOTO1 = rs.getString("PHOTO1");
			 PHOTO2 = rs.getString("PHOTO2");
			 boite_vitesse = rs.getString("boite_vitesse");
			 nbr_places = rs.getInt("nbr_places");
			 nbr_portes = rs.getInt("nbr_portes");
			 id_user = rs.getInt("id_user");
			 prix = rs.getInt("prix");
			 ville = rs.getString("ville");
			 descr = rs.getString("descr");
			 lieu_rencontre = rs.getString("lieu_rencontre");
			 etat = rs.getString("etat");

			 voiture=new Voiture(id_vehicule, marque, modele, CARBURANT, KILOMETRAGE, IMMATRICULATION, TYPE_VRHICULE, PHOTO1,
			PHOTO2, boite_vitesse, nbr_places, nbr_portes, id_user, fin, debut, prix, descr, lieu_rencontre, ville,etat);
			list.add(voiture);
		}
		
		return list;
	}
	
	
	
	
	
	@Override
	public List<Voiture> findSpecificByDateAndCity(String ville,String datefin,String datedebut) throws SQLException {
		connection = ConnectionFactory.getConnection();
		ResultSet rs = null;
		

		connection = ConnectionFactory.getConnection();
		PreparedStatement preparedStmt = null;
		String query = "SELECT id_vehicule,marque,modele,carburant,"
				+ "kilometrage,immatriculation,type_vehicule," + 
				"+photo1,photo2,boite_vitesse,nbr_places,nbr_portes"
				+ ",id_user,fin,debut,ville,lieu_rencontre,prix,descr,etat"
				+ " FROM vehicule where ville like ? and debut between ? and ? and fin between ? and ?"+" order by id_vehicule desc";
		preparedStmt = connection.prepareStatement(query);
		
		List<Voiture> list=new ArrayList<Voiture>();
		
		
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		 java.util.Date date=new java.util.Date();
		try {
			date = sdf.parse(datedebut);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 java.sql.Date sqlDate = new Date(date.getTime());
		 
		 
		 preparedStmt.setString(1, ville);
		preparedStmt.setDate(2, sqlDate);
		preparedStmt.setDate(4, sqlDate);
		
		try {
			date = sdf.parse(datefin);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		  sqlDate = new Date(date.getTime());
			preparedStmt.setDate(3, sqlDate);
			preparedStmt.setDate(5, sqlDate);
			rs = preparedStmt.executeQuery();
		
		int id_vehicule ;
		String marque ;
		String modele ;
		String CARBURANT;
		int KILOMETRAGE ;
		
		Date date1;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String fin;
        Date date2;
        String debut;
		String IMMATRICULATION;
		String TYPE_VRHICULE ;
		String PHOTO1;
		String PHOTO2 ;
		String boite_vitesse;
		int nbr_places;
		int nbr_portes;
		int id_user;
		int prix ;

		String descr;
		String lieu_rencontre;
		String etat;
		Voiture voiture=new Voiture();
		
		while(rs.next()) {
			 id_vehicule = rs.getInt("id_vehicule");
			 marque = rs.getString("marque");
			 modele = rs.getString("modele");
			 CARBURANT = rs.getString("CARBURANT");
			 KILOMETRAGE = rs.getInt("KILOMETRAGE");
			 date = rs.getDate("fin");
			 date1 = (Date) date ;
			 formatter = new SimpleDateFormat("yyyy-MM-dd");
	         fin = formatter.format(date1);
	        date = rs.getDate("debut");
	         date2=(Date) date ;
	         debut=formatter.format(date2);
			 IMMATRICULATION = rs.getString("IMMATRICULATION");
			 TYPE_VRHICULE = rs.getString("type_vehicule");
			 PHOTO1 = rs.getString("PHOTO1");
			 PHOTO2 = rs.getString("PHOTO2");
			 boite_vitesse = rs.getString("boite_vitesse");
			 nbr_places = rs.getInt("nbr_places");
			 nbr_portes = rs.getInt("nbr_portes");
			 id_user = rs.getInt("id_user");
			 prix = rs.getInt("prix");
			 ville = rs.getString("ville");
			 descr = rs.getString("descr");
			 lieu_rencontre = rs.getString("lieu_rencontre");
			 etat = rs.getString("etat");

			 voiture=new Voiture(id_vehicule, marque, modele, CARBURANT, KILOMETRAGE, IMMATRICULATION, TYPE_VRHICULE, PHOTO1,
			PHOTO2, boite_vitesse, nbr_places, nbr_portes, id_user, fin, debut, prix, descr, lieu_rencontre, ville,etat);
			list.add(voiture);
		}
		
		return list;}

}

package com.Servelet;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import com.dao.implementations.UserDaoImp;
import com.dao.implementations.VoitureDaoImp;
import com.dao.interfaces.UserDao;
import com.dao.interfaces.VoitureDao;
import com.modules.User;
import com.modules.Voiture;

@WebServlet
public class Voiture1 extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	UserDao userdao = new UserDaoImp();
	VoitureDao voituredao = new VoitureDaoImp();
	HttpSession session;
	String forward = "";
	String action;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		session = request.getSession();
		action = request.getParameter("action");
		if (session.getAttribute("user") != null) {
			if (action.equalsIgnoreCase("ajoutervoiture")) {
				forward = "/WEB-INF/veh.jsp";
			} else if (action.equalsIgnoreCase("mesvoitures")) {
				List<Voiture> list = new ArrayList<Voiture>();
				try {
					list = voituredao.findSpecificVoitureByEmail((String) session.getAttribute("user"));
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("list", list);

				forward = "/WEB-INF/Mesvoitures.jsp";
			} else if (action.equalsIgnoreCase("modifiermavoiture")) {

				String id = request.getParameter("id_vehicule");
				Voiture v = new Voiture();
				try {
					v = voituredao.findSpecificVoitureByid(Integer.parseInt(id));
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("voiture", v);

				forward = "/WEB-INF/Mavoiture.jsp";
			}else if(action.equalsIgnoreCase("deletevoiture")) {
				String id = request.getParameter("id_vehicule");
				try {
					voituredao.DeleteVoiture(Integer.parseInt(id));
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				forward = "/WEB-INF/done.jsp";
			}
		} else {
			forward = "/WEB-INF/login.jsp";
		}

		request.getRequestDispatcher(forward).forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		session = request.getSession();
		action = request.getParameter("action");
		if (session.getAttribute("user") != null) {
			if (action.equalsIgnoreCase("ajoutervoiture")) {

				int i = 0;
				try {
					i = voituredao.getMax();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				List<FileItem> multiparts = null;
				try {
					multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				} catch (FileUploadException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
//			for(FileItem f: multiparts)
//				System.out.println(""+f);

				try {
					multiparts.get(13).write(new File(
							"C:\\Users\\dododo\\git\\location-de-voiture\\location-de-voiture--JEE\\WebContent\\res\\voiture"
									+ File.separator + i + "1" + ".jpg"));
					multiparts.get(14).write(new File(
							"C:\\Users\\dododo\\git\\location-de-voiture\\location-de-voiture--JEE\\WebContent\\res\\voiture"
									+ File.separator + i + "2" + ".jpg"));
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				String marque = multiparts.get(0).getString();
				String modéle = multiparts.get(1).getString();
				String carburant = multiparts.get(2).getString();
				String boite_vitesse = multiparts.get(3).getString();
				String places = multiparts.get(4).getString();
				String ports = multiparts.get(5).getString();
				String kilometrage = multiparts.get(6).getString();
				String ville = multiparts.get(7).getString();
				String prix = multiparts.get(8).getString();
				String lieu = multiparts.get(9).getString();
				String description = multiparts.get(10).getString();
				String DATEDEB = multiparts.get(11).getString();
				String DATEFIN = multiparts.get(12).getString();
				String photo1 = i + "1" + ".jpg";
				String photo2 = i + "2" + ".jpg";
				String TYPE_VRHICULE = "";
				String IMMATRICULATION = "";
				User user = null;
				try {
					user = userdao.findSpecificUserByEmail((String) session.getAttribute("user"));
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				Voiture voiture = new Voiture(0, marque, modéle, carburant, Integer.parseInt(kilometrage),
						IMMATRICULATION, TYPE_VRHICULE, photo1, photo2, boite_vitesse, Integer.parseInt(places),
						Integer.parseInt(ports), user.getId_user(), DATEFIN, DATEDEB, Integer.parseInt(prix),
						description, lieu, ville, "Desponible");
				try {
					voituredao.insertVoiture(voiture);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				forward = "/WEB-INF/done.jsp";
			}

		} else {
			forward = "/WEB-INF/login.jsp";
		}

	}
}

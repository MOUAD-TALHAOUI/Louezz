package com.Servelet;

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

import com.dao.implementations.DemandeDaoImp;
import com.dao.implementations.UserDaoImp;
import com.dao.implementations.VoitureDaoImp;
import com.dao.interfaces.*;
import com.modules.Demande;
import com.modules.User;
import com.modules.Voiture;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Demande1")
public class Demande1 extends HttpServlet {
	HttpSession session;
	String forward = "";
	String action = "";
	UserDao userdao = new UserDaoImp();
	VoitureDao voituredao = new VoitureDaoImp();
	DemandeDao demandedao = new DemandeDaoImp();

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Demande1() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		session = request.getSession();
		action = (String) request.getParameter("action");
		// TODO Auto-generated method stub
		if (session.getAttribute("user") == null) {
			forward = "/WEB-INF/login.jsp";
		} else {
			if (action.equalsIgnoreCase("reserver")) {
				int id = (int) session.getAttribute("id");
				String id_vehicule = request.getParameter("id_vehicule");
				String etat_demande = "Non traitée";
				Demande demande = new Demande(0, id, Integer.parseInt(id_vehicule), etat_demande);
				try {
					demande = demandedao.CreateDemande(demande);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				forward = "/WEB-INF/done.jsp";
			} else if (action.equalsIgnoreCase("mesdemandes")) {
				List<Demande> list = new ArrayList<>();
				int id_user = (int) session.getAttribute("id");
				try {
					list = demandedao.FindMesDemandes(id_user);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("list", list);
				forward = "/WEB-INF/MesDemandes.jsp";
			} else if (action.equalsIgnoreCase("deletedemande")) {
				String id_demande = request.getParameter("id_demande");
				try {
					demandedao.DeleteDemandeById(Integer.parseInt(id_demande));
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				forward = "/WEB-INF/done.jsp";

			}else if(action.equalsIgnoreCase("voiroffre")) {
				String id=request.getParameter("id_vehicule");
				Voiture v=new Voiture();
				try {
					 v=voituredao.findSpecificVoitureByid(Integer.parseInt(id));
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("voiture",v);
				User utilisateur=new User();
				int id1=v.getId_user();
				try {
					 utilisateur=userdao.findSpecificUserById(id1);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("utilisateur",utilisateur);


				forward="/WEB-INF/voiroffre.jsp";
			}else if(action.equalsIgnoreCase("voirdemandeparvoiture")) {
				List<Demande> list=new ArrayList<Demande>();
				String id_vehicule=request.getParameter("id_vehicule");
				try {
					list=demandedao.FindMesDemandesById_Vehicule(Integer.parseInt(id_vehicule));
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("list", list);
				
				forward="/WEB-INF/DemandeParVehicule.jsp";
			}else if(action.equalsIgnoreCase("accepterdemande")) {
				String etat_demande="demande acceptee";
				String id_demande=request.getParameter("id_demande");
				
				try {
					demandedao.UpdateDemandeEtat(etat_demande, Integer.parseInt(id_demande));
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				forward="/WEB-INF/done.jsp";
			}else if(action.equalsIgnoreCase("refuserdemande")) {
				String etat_demande="demande refusee";
				String id_demande=request.getParameter("id_demande");
				try {
					demandedao.UpdateDemandeEtat(etat_demande, Integer.parseInt(id_demande));
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				forward="/WEB-INF/done.jsp";
			}else if(action.equalsIgnoreCase("voirprofile")) {
				User user=new User();
				String id=request.getParameter("id_user");
				try {
					user=userdao.findSpecificUserById(Integer.parseInt(id));
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("useroffre", user);
				forward="/WEB-INF/voirprofile.jsp";	
			}
		}

		request.getRequestDispatcher(forward).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher(forward).forward(request, response);

	}

}

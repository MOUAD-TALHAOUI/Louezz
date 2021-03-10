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

import com.dao.implementations.UserDaoImp;
import com.dao.implementations.VoitureDaoImp;
import com.dao.interfaces.*;
import com.modules.User;
import com.modules.Voiture;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Offre")
public class Offre extends HttpServlet {
	HttpSession session;
	String forward = "";
	String action = "";
	UserDao userdao = new UserDaoImp();
	VoitureDao voituredao=new VoitureDaoImp(); 

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Offre() {
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
		action=(String) request.getParameter("action");

		// TODO Auto-generated method stub
		if(session.getAttribute("user")==null) {
			forward="/WEB-INF/login.jsp";
	}else {
		if(action.equalsIgnoreCase("voiroffre")) {
			
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


			forward="/WEB-INF/offre.jsp";
		}		if(action.equalsIgnoreCase("voirprofile")) {
			
			
			User user=new User();
			String id=(String) request.getParameter("id");
			int iid=Integer.parseInt(id);
			try {
				user = userdao.findSpecificUserById(iid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("user", user);
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
		session = request.getSession();
		
		
		action = request.getParameter("action");
		String datedebut = request.getParameter("dateDebut");
		String datefin = request.getParameter("dateFin");
		String ville = request.getParameter("ville");
		List<Voiture> list=new ArrayList<Voiture>();
		try {
			list=voituredao.findAllVoiture()/*findSpecificByDateAndCity(ville, datefin, datedebut)*/;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("voiture", list);
		forward="/WEB-INF/offres.jsp";



		request.getRequestDispatcher(forward).forward(request, response);

	}

}

package com.Servelet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.implementations.UserDaoImp;
import com.dao.interfaces.*;
import com.modules.User;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	HttpSession session;
	String forward = "";
	String action = "";
	UserDao userdao = new UserDaoImp();
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Signup() {
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

		// TODO Auto-generated method stub
		if(session.getAttribute("user")==null) {
			forward="/WEB-INF/signup.jsp";
	}else {
		forward="/WEB-INF/index.jsp";
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
		if(session.getAttribute("user")==null) {
		forward = "/WEB-INF/index.jsp";
		action = request.getParameter("action");
		String nom = request.getParameter("lastname");
		String prenom = request.getParameter("firstname");
		String telephone = request.getParameter("telephone");
		String date_naissance = request.getParameter("date");
		String adresse_utilisateur = request.getParameter("adress");
		String login = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
		String cin = request.getParameter("cin");
		String num_permis = request.getParameter("num_permis");
		String photo = ""/* request.getParameter("photo") */;

		User user = new User(0, nom, prenom, telephone, date_naissance, adresse_utilisateur, login, email, password,
				cin, num_permis, photo);
		Boolean b = true;
		try {
			b = userdao.findSpecificByEmail(email);
			if (!b) {
				
				userdao.insertUser(user);
				user=userdao.findSpecificUserByEmail(email);
				session.setAttribute("user", email);
				session.setAttribute("id", user.getId_user());
			}else {
				forward="/WEB-INF/signup.jsp?error=Email existe deja";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	else {
		forward="/WEB-INF/index.jsp";
	}
		request.getRequestDispatcher(forward).forward(request, response);

	}

}

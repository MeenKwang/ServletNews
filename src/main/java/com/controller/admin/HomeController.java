package com.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.NewsDAO;
import com.dao.UserDAO;
import com.model.NewsModel;
import com.model.UserModel;

@WebServlet(urlPatterns = { "/admin-home" })
public class HomeController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public HomeController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String type = request.getParameter("type");
			if (type != null) {
				if (type.equals("NewsList")) {
					NewsDAO newsDAO = new NewsDAO();
					ArrayList<NewsModel> newsList = newsDAO.getAllNews();
					request.setAttribute("newsList", newsList);
					RequestDispatcher rd = request.getRequestDispatcher("./views/admin/admin-home.jsp");
					rd.forward(request, response);
				} else if (type.equals("userList")) {
					UserDAO userDAO = new UserDAO();
					ArrayList<UserModel> userList = userDAO.getAllUSer();
					request.setAttribute("userList", userList);
					RequestDispatcher rd = request.getRequestDispatcher("./views/admin/admin-home.jsp");
					rd.forward(request, response);
				}
			} else {
				response.sendRedirect("./views/admin/admin-home.jsp");
			}

		} catch (Exception e) {
			System.err.println(e);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
}

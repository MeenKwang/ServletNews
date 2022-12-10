package com.controller.web;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.NewsDAO;
import com.model.NewsModel;

/**
 * Servlet implementation class HomeController
 */
@WebServlet(urlPatterns = { "/home" })
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HomeController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NewsDAO newsDAO = new NewsDAO();
		String scategoryId = request.getParameter("categoryId");
		ArrayList<NewsModel> ds = new ArrayList<>();
		if (scategoryId != null) {
			int categoryId = Integer.parseInt(scategoryId);
			request.setAttribute("categoryId", categoryId);
			ds = newsDAO.getNewsByCategoryId(categoryId);
		} else {
			ds = newsDAO.getAllNews();
		}
		request.setAttribute("ds", ds);
		RequestDispatcher rd = request.getRequestDispatcher("./views/web/home.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

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
 * Servlet implementation class PageController
 */
@WebServlet("/newsPage")
public class PageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sId = request.getParameter("id");
		int id = Integer.parseInt(sId);
		NewsDAO newsDAO = new NewsDAO();
		NewsModel news = newsDAO.getNewsById(id);
		request.setAttribute("news", news);
		ArrayList<NewsModel> newsInCategory = newsDAO.getNewsByCategoryId(news.getCategoryId());
		request.setAttribute("newsInCategory", newsInCategory);
		RequestDispatcher rd = request.getRequestDispatcher("./views/web/single-page.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

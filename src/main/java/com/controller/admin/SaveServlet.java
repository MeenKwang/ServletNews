package com.controller.admin;

import java.io.IOException;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.NewsDAO;
import com.model.NewsModel;
@WebServlet(urlPatterns = {"/admin-SaveServlet"})  
public class SaveServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			String title = request.getParameter("title");
			String thumbnail = request.getParameter("thumbnail");
			String shortdes = request.getParameter("shortDescription");
			String content = request.getParameter("content");
			String scategoryId = request.getParameter("categoryCode");
			String user = request.getParameter("user");
			int categoryId = Integer.parseInt(scategoryId);
			
			NewsModel news = new NewsModel();
			news.setTitle(title);
			news.setThumbnail(thumbnail);
			news.setShortDescription(shortdes);
			news.setContent(content);
			news.setCategoryId(categoryId);
			news.setCreatedDate(new Timestamp(System.currentTimeMillis()));
			news.setCreatedBy(user);
			
			NewsDAO newsDAO = new NewsDAO();
			int status = newsDAO.save(news);
			if(status != 0) response.sendRedirect("admin-home?type=NewsList");
		}catch(Exception e) {
			System.err.println(e);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

}

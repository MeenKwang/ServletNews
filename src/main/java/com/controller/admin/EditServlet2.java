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
@WebServlet("/admin-EditServlet2")
public class EditServlet2 extends HttpServlet {
	/**
	* 
	*/
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);
		String title = request.getParameter("title");
		String thumbnail = request.getParameter("thumbnail");
		String shortdes = request.getParameter("shortDescription");
		String content = request.getParameter("content");
		String scategoryId = request.getParameter("categoryCode");
		String user = request.getParameter("user");
		int categoryId = Integer.parseInt(scategoryId);
		
		NewsModel news = new NewsModel();
		news.setId(id);
		news.setTitle(title);
		news.setThumbnail(thumbnail);
		news.setShortDescription(shortdes);
		news.setContent(content);
		news.setCategoryId(categoryId);
		news.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		news.setModifiedBy(user);
		
		NewsDAO newsDAO = new NewsDAO();
		int status = newsDAO.update(news);
        if(status>0){  
            response.sendRedirect("admin-home?type=NewsList");  
        }else{  
        	response.sendRedirect("admin-home?type=NewsList");  
        }  
	}
}

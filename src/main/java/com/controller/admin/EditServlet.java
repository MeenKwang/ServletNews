package com.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;

import com.dao.CategoryDAO;
import com.dao.NewsDAO;
import com.model.CategoryModel;
import com.model.NewsModel;

@WebServlet("/admin-EditServlet")  
public class EditServlet extends HttpServlet {  
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)   
           throws ServletException, IOException {    
        String sid=request.getParameter("id");
        int id=Integer.parseInt(sid);   
        NewsDAO newsDAO = new NewsDAO();
        NewsModel news = newsDAO.getNewsById(id);
		request.setAttribute("news", news);
		//Get category
		CategoryDAO categoryDAO = new CategoryDAO();
		ArrayList<CategoryModel> categories= categoryDAO.getAllCategories();
		request.setAttribute("categories", categories);
		RequestDispatcher rd = request.getRequestDispatcher("./views/admin/edit-news.jsp");
		rd.forward(request, response);
    }  
}  

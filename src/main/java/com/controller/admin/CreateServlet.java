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
import com.model.CategoryModel;

@WebServlet(urlPatterns = {"/admin-CreateServlet"})
public class CreateServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public CreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			CategoryDAO categoryDAO = new CategoryDAO();
			ArrayList<CategoryModel> categories= categoryDAO.getAllCategories();
			request.setAttribute("categories", categories);
			RequestDispatcher rd = request.getRequestDispatcher("./views/admin/insert-news.jsp");
			rd.forward(request, response);
		}catch(Exception e) {
			System.err.println(e);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
}

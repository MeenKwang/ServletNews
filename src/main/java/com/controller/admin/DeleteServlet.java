package com.controller.admin;

import java.io.IOException;  
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;

import com.dao.NewsDAO;  
@WebServlet("/admin-DeleteServlet")  
public class DeleteServlet extends HttpServlet {  
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)   
             throws ServletException, IOException {  
        String sid=request.getParameter("id");
        int id=Integer.parseInt(sid); 
        NewsDAO newsDAO = new NewsDAO();
        newsDAO.delete(id);  
        response.sendRedirect("admin-home");  
    }  
} 

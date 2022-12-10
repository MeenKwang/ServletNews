package com.controller;

import java.io.IOException;

import com.dao.UserDAO;
import com.model.UserModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet(urlPatterns = {"/login"})
public class LoginController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		RequestDispatcher rd = request.getRequestDispatcher("/views/both/login.jsp");
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html;charset=UTF-8");
		try {
			//Nhan du lieu ve client
			UserModel user = new UserModel();
			user.setUserName(request.getParameter("username"));
			user.setPassword(request.getParameter("password"));
			//Truyen xuong db
			UserDAO ud = new UserDAO();
			UserModel userLogin = ud.checkLogin(user);
			if(userLogin.getFullName() != null) {
	            HttpSession session = request.getSession();
	            session.setAttribute("user", userLogin);
	            if(userLogin.getRoleid() == 1) {
	            	response.sendRedirect("admin-home");
	            }else if(userLogin.getRoleid() == 2){
	            	response.sendRedirect("home");
	            } else {
	            	response.sendRedirect("login");
	            }
			} else {
				response.sendRedirect("login");
			}
			
		}catch(Exception e) {
			System.err.println(e);
		}
	}
}

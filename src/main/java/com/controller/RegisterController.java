package com.controller;

import java.io.IOException;
import java.sql.Timestamp;

import com.dao.UserDAO;
import com.model.UserModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns = {"/register"})
public class RegisterController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html;charset=UTF-8");
		try {
			request.setCharacterEncoding("UTF-8");
			//Nhan du lieu ve client
			UserModel user = new UserModel();
			user.setUserName(request.getParameter("username"));
			user.setPassword(request.getParameter("password"));
			user.setFullName(request.getParameter("name"));
			user.setStatus(1);
			user.setRoleid(2);
			user.setCreatedDate(new Timestamp(System.currentTimeMillis()));
			user.setCreatedBy(request.getParameter("username"));
			//Truyen xuong db
			UserDAO ud = new UserDAO();
			if(ud.register(user)) {
				response.sendRedirect("./views/both/alert_success.jsp");
			} else {
				response.sendRedirect("./views/both/register.jsp");
			}
			
		}catch(Exception e) {
			System.err.println(e);
		}
	}
}

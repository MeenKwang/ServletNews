package com.controller.admin;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDAO;
import com.model.UserModel;

/**
 * Servlet implementation class SaveUserServlet
 */
@WebServlet("/admin-SaveUserServlet")
public class SaveUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String userMain = request.getParameter("user");
		String sRoleId = request.getParameter("roleId");
		int roleId = Integer.parseInt(sRoleId);
		String sStatus = request.getParameter("status");
		int status = Integer.parseInt(sStatus);
		String name = request.getParameter("name");
		
		UserModel userFix = new UserModel();
		userFix.setFullName(name);
		userFix.setCreatedBy(userMain);
		userFix.setRoleid(roleId);
		userFix.setUserName(userName);
		userFix.setPassword(password);
		userFix.setStatus(status);
		userFix.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		UserDAO userDAO = new UserDAO();
		int check = userDAO.createUser(userFix);
        if(check>0){  
            response.sendRedirect("admin-home?type=userList");  
        }else{  
        	response.sendRedirect("admin-home?type=userList");  
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.RoleDAO;
import com.dao.UserDAO;
import com.model.RoleModel;
import com.model.UserModel;

/**
 * Servlet implementation class EditUserServlet
 */
@WebServlet("/admin-EditUserServlet")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sid=request.getParameter("id");
        int id=Integer.parseInt(sid);
        UserDAO userDAO = new UserDAO();
        UserModel userFix = userDAO.getUserById(id);
        //Get roles
        RoleDAO roleDAO = new RoleDAO();
        ArrayList<RoleModel> roles = roleDAO.getAllRoles();
		request.setAttribute("userFix", userFix);
		request.setAttribute("roles", roles);
		RequestDispatcher rd = request.getRequestDispatcher("./views/admin/edit-user.jsp");
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

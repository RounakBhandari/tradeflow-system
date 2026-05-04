package com.tradeflow.system.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.tradeflow.system.model.UserModel;
import com.tradeflow.system.service.UserService;

/**
 * Servlet implementation class AdminPendingUser
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/pendingUsers" })
public class AdminPendingUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private UserService userService = new UserService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPendingUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<UserModel> users = userService.getPendingUsers();
        request.setAttribute("pendingUsers", users);

        request.getRequestDispatcher("/WEB-INF/pages/admin/PendingUser.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

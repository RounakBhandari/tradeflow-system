package com.tradeflow.system.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.tradeflow.system.service.UserService;

/**
 * Servlet implementation class ApproveRejectServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/updateUserStatus" })
public class ApproveRejectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApproveRejectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int userId = Integer.parseInt(request.getParameter("id"));
		String action = request.getParameter("action");
		
		if("approve".equals(action)) {
			userService.approveUser(userId);
		}
		else if("reject".equals(action)) {
			userService.rejectUser(userId);
		}
		
		response.sendRedirect(request.getContextPath() + "/admin/pendingUsers");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

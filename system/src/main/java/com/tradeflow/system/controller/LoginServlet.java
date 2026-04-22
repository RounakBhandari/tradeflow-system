package com.tradeflow.system.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.tradeflow.system.model.UserModel;
import com.tradeflow.system.service.LoginService;
import com.tradeflow.system.utils.CookieUtil;
import com.tradeflow.system.utils.SessionUtil;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private LoginService loginService = new LoginService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/pages/Login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		if(email == null || password == null || email.isEmpty() || password.isEmpty()) {
			request.setAttribute("error", "Username and Password are required");
			request.getRequestDispatcher("/WEB-INF/pages/Login.jsp").forward(request, response);
			return;
		}
		
		UserModel user = new UserModel();
		user.setEmail(email.trim());
		user.setPassword(password.trim());
		
		Boolean status = loginService.loginUser(user);
		
		if(Boolean.TRUE.equals(status)) {
			SessionUtil.setAttribute(request, "email", email);
			if ("admin".equalsIgnoreCase(email)) {
                CookieUtil.addCookie(response, "role", "admin", 60 * 60);
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            } else if("salesperson".equalsIgnoreCase(email)){
                CookieUtil.addCookie(response, "role", "salesperson", 60 * 60);
                response.sendRedirect(request.getContextPath() + "/salesperson/dashboard");
            }
            else {
            	CookieUtil.addCookie(response, "role", "retailer", 60*60);
            	response.sendRedirect(request.getContextPath() + "/retailer/dashboard");
            }
		}
		else {
			request.setAttribute("error", "Invalid username or password");
			request.getRequestDispatcher("/WEB-INF/pages/Login.jsp").forward(request, response);
		}
	}

}

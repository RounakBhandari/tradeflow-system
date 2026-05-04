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
		
		UserModel userDb = new UserModel();
		
		
		if(userDb != null) {
			
			if(!"approved".equalsIgnoreCase(userDb.getStatus())) {
				request.setAttribute("error", "Your account is not approved yet.");
	            request.getRequestDispatcher("/WEB-INF/pages/Login.jsp").forward(request, response);
	            return;
			}
			String role = userDb.getRole();
			SessionUtil.setAttribute(request, "email", email);
			CookieUtil.addCookie(response, "role", role, 30 * 60);
			if ("admin".equalsIgnoreCase(role)) {
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            } 
			else if("salesperson".equalsIgnoreCase(role)){              
                response.sendRedirect(request.getContextPath() + "/salesperson/dashboard");
            }
            else {
            	response.sendRedirect(request.getContextPath() + "/retailer/dashboard");
            }
		}
		else {
	        request.setAttribute("error", "Invalid username or password");
	        request.getRequestDispatcher("/WEB-INF/pages/Login.jsp").forward(request, response);
		}
	}

}

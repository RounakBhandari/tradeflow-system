package com.tradeflow.system.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.tradeflow.system.service.RegisterService;



/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/pages/Register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String firstName = request.getParameter("first_name");
			String lastName = request.getParameter("last_name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String password = request.getParameter("password");
			String confirmPassword = request.getParameter("confirm_password");
			String role = request.getParameter("role");
			
			
			
			if (!password.equals(confirmPassword)) {
				    request.getRequestDispatcher("/WEB-INF/pages/Register.jsp").forward(request, response);
				    return;
			}
			
			Part imgPart = request.getPart("profile_img");
			
			String imgFile = imgPart.getSubmittedFileName();
			
			String imgUploadPath = getServletContext().getRealPath("") + "uploads";
			
			File imgUploadDir = new File(imgUploadPath);
			
			if(!imgUploadDir.exists()) imgUploadDir.mkdir();
			
			String imgPath = "uploads/default.jpg";
			if(imgFile != null && !imgFile.isEmpty())
			{
				String fullPath = imgUploadPath + File.separator + imgFile;
				imgPart.write(fullPath);
				imgPath = "uploads/" + imgFile;
			}
			
			RegisterService service = new RegisterService();
			service.addUser(firstName, lastName, email, phone, password, role, imgPath);
			response.sendRedirect(request.getContextPath() + "/login");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

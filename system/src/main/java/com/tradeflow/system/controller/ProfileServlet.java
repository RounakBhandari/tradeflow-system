package com.tradeflow.system.controller;

import com.tradeflow.system.model.UserModel;
import com.tradeflow.system.service.ProfileService;
import com.tradeflow.system.utils.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    private final ProfileService profileService = new ProfileService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = (String) SessionUtil.getAttribute(request, "email");
        try {
            UserModel user = profileService.getUserByEmail(email);
            request.setAttribute("user", user);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to load profile.");
        }

        request.getRequestDispatcher("/WEB-INF/pages/Profile.jsp")
               .forward(request, response);
    }
}
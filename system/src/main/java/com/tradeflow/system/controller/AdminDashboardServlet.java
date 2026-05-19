package com.tradeflow.system.controller;

import com.tradeflow.system.dao.DashboardDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(asyncSupported = true, urlPatterns = { "/admin/dashboard" })
public class AdminDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final DashboardDAO dashboardDAO = new DashboardDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("lowStockProducts", dashboardDAO.getLowStockProducts(2));
        request.setAttribute("recentOrders",     dashboardDAO.getRecentOrders(2));
        request.setAttribute("totalRevenue",     dashboardDAO.getTotalRevenue());
        request.setAttribute("pendingApprovals", dashboardDAO.getPendingApprovals());
        request.setAttribute("lowStockCount",    dashboardDAO.getLowStockCount());
        request.setAttribute("outstandingDues",  dashboardDAO.getOutstandingDues());

        request.getRequestDispatcher("/WEB-INF/pages/admin/Dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
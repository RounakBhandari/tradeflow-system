package com.tradeflow.system.controller;

import com.tradeflow.system.dao.RetailerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(asyncSupported = true, urlPatterns = { "/admin/retailers" })
public class AdminRetailers extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final RetailerDAO retailerDAO = new RetailerDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Map<String, Object>> retailers = retailerDAO.getRetailers();
        request.setAttribute("retailers", retailers);

        request.getRequestDispatcher("/WEB-INF/pages/admin/Retailers.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int retailerId = Integer.parseInt(request.getParameter("retailerId"));
            boolean success = retailerDAO.deleteRetailer(retailerId);
            if (success) {
                request.setAttribute("successMessage", "Retailer deleted successfully!");
            } else {
                request.setAttribute("errorMessage", "Failed to delete retailer.");
            }
        } else {
            // existing add logic
            String shopName  = request.getParameter("shopName");
            String ownerName = request.getParameter("ownerName");
            String phone     = request.getParameter("phone");
            String address   = request.getParameter("address");
            boolean success = retailerDAO.addRetailer(shopName, ownerName, phone, address);
            if (success) {
                request.setAttribute("successMessage", "Retailer added successfully!");
            } else {
                request.setAttribute("errorMessage", "Failed to add retailer. Please try again.");
            }
        }
        doGet(request, response);
    }
}
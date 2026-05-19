package com.tradeflow.system.controller;

import com.tradeflow.system.model.OrderApprovalModel;
import com.tradeflow.system.service.OrderApprovalService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = { "/admin/orderApprovals" })
public class AdminOrderApprovals extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final OrderApprovalService orderApprovalService = new OrderApprovalService();

    // ─── GET: load the order approvals page ───────────────────────────────────
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<OrderApprovalModel> orders = orderApprovalService.getAllOrders();
            request.setAttribute("orders", orders);
            request.setAttribute("totalOrders", orderApprovalService.getTotalOrders());
            request.setAttribute("pendingCount", orderApprovalService.getPendingCount());
            request.setAttribute("approvedCount", orderApprovalService.getApprovedCount());
            request.setAttribute("rejectedCount", orderApprovalService.getRejectedCount());
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to load orders.");
        }
        request.getRequestDispatcher("/WEB-INF/pages/admin/OrderApprovals.jsp").forward(request, response);
    }

    // ─── POST: handle approve / reject actions ────────────────────────────────
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");   // "approve" or "reject"
        String orderIdParam = request.getParameter("orderId");

        if (action != null && orderIdParam != null) {
            try {
                int orderId = Integer.parseInt(orderIdParam);
                if ("approve".equals(action)) {
                    orderApprovalService.approveOrder(orderId);
                } else if ("reject".equals(action)) {
                    orderApprovalService.rejectOrder(orderId);
                }
            } catch (NumberFormatException | SQLException e) {
                e.printStackTrace();
            }
        }

        // Redirect back to the page (PRG pattern — prevents double-submit on refresh)
        response.sendRedirect(request.getContextPath() + "/admin/orderApprovals");
    }
}
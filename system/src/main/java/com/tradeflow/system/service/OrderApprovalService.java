package com.tradeflow.system.service;

import com.tradeflow.system.dao.OrderApprovalDAO;
import com.tradeflow.system.model.OrderApprovalModel;

import java.sql.SQLException;
import java.util.List;

public class OrderApprovalService {

    private final OrderApprovalDAO orderApprovalDAO = new OrderApprovalDAO();

    public List<OrderApprovalModel> getAllOrders() throws SQLException {
        return orderApprovalDAO.getAllOrders();
    }

    public int getTotalOrders() throws SQLException {
        return orderApprovalDAO.countAll();
    }

    public int getPendingCount() throws SQLException {
        return orderApprovalDAO.countByStatus("pending");
    }

    public int getApprovedCount() throws SQLException {
        return orderApprovalDAO.countByStatus("approved");
    }

    public int getRejectedCount() throws SQLException {
        return orderApprovalDAO.countByStatus("rejected");
    }

    public boolean approveOrder(int orderId) throws SQLException {
        return orderApprovalDAO.approveOrder(orderId);
    }

    public boolean rejectOrder(int orderId) throws SQLException {
        return orderApprovalDAO.rejectOrder(orderId);
    }
}
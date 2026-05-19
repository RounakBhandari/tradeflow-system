package com.tradeflow.system.dao;

import com.tradeflow.system.model.OrderApprovalModel;
import com.tradeflow.system.utils.DBConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderApprovalDAO {

    // ─── All orders with retailer name (JOIN) ─────────────────────────────────
    public List<OrderApprovalModel> getAllOrders() throws SQLException {
        String sql = """
                SELECT o.order_id,
                       DATE_FORMAT(o.order_date, '%Y-%m-%d') AS order_date,
                       r.shop_name AS retailer_name,
                       o.total_amount,
                       o.status
                FROM orders o
                JOIN retailers r ON o.retailer_id = r.retailer_id
                ORDER BY o.order_date DESC
                """;
        List<OrderApprovalModel> list = new ArrayList<>();
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                OrderApprovalModel order = new OrderApprovalModel();
                order.setOrderId(rs.getInt("order_id"));
                order.setOrderDate(rs.getString("order_date"));
                order.setRetailerName(rs.getString("retailer_name"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setStatus(rs.getString("status"));
                list.add(order);
            }
        }
        return list;
    }

    // ─── Overview card counts ─────────────────────────────────────────────────
    public int countByStatus(String status) throws SQLException {
        String sql = "SELECT COUNT(*) FROM orders WHERE status = ?";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? rs.getInt(1) : 0;
            }
        }
    }

    public int countAll() throws SQLException {
        String sql = "SELECT COUNT(*) FROM orders";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            return rs.next() ? rs.getInt(1) : 0;
        }
    }

    // ─── Approve an order ─────────────────────────────────────────────────────
    public boolean approveOrder(int orderId) throws SQLException {
        String sql = "UPDATE orders SET status = 'approved' WHERE order_id = ? AND status = 'pending'";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            return ps.executeUpdate() > 0;
        }
    }

    // ─── Reject an order ──────────────────────────────────────────────────────
    public boolean rejectOrder(int orderId) throws SQLException {
        String sql = "UPDATE orders SET status = 'rejected' WHERE order_id = ? AND status = 'pending'";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            return ps.executeUpdate() > 0;
        }
    }
}
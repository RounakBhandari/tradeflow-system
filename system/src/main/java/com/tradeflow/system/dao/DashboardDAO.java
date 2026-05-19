package com.tradeflow.system.dao;

import com.tradeflow.system.model.DashboardModel;
import com.tradeflow.system.model.DashboardModel.OrderSummary;
import com.tradeflow.system.model.DashboardModel.ProductSummary;
import com.tradeflow.system.utils.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class DashboardDAO {
	
	public List<OrderSummary> getRecentOrders(int limit) throws SQLException {
	    String sql = """
	            SELECT o.order_id,
	                   DATE_FORMAT(o.order_date, '%Y-%m-%d') AS date,
	                   r.shop_name AS retailer_name,
	                   o.status
	            FROM orders o
	            JOIN retailers r ON o.retailer_id = r.retailer_id
	            WHERE o.status = 'pending'
	            ORDER BY o.order_date DESC
	            LIMIT ?
	            """;
	    List<OrderSummary> list = new ArrayList<>();
	    try (Connection conn = DBConfig.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setInt(1, limit);
	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                OrderSummary o = new OrderSummary();
	                o.setOrderId(rs.getInt("order_id"));
	                o.setDate(rs.getString("date"));
	                o.setRetailerName(rs.getString("retailer_name"));
	                o.setStatus(rs.getString("status"));
	                list.add(o);
	            }
	        }
	    }
	    return list;
	}
	

    public List<Map<String, Object>> getLowStockProducts(int limit) {
        List<Map<String, Object>> list = new ArrayList<>();

        String sql = "SELECT product_id, product_name, category, stock_quantity, " +
                     "CASE WHEN stock_quantity = 0 THEN 'Out of Stock' ELSE 'Low Stock' END AS stock_status " +
                     "FROM products WHERE stock_quantity <= min_stock_quantity " +
                     "ORDER BY stock_quantity ASC LIMIT ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("productId",   rs.getInt("product_id"));
                row.put("productName", rs.getString("product_name"));
                row.put("category",    rs.getString("category"));
                row.put("stock",       rs.getInt("stock_quantity"));
                row.put("status",      rs.getString("stock_status"));
                list.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

public double getTotalRevenue() {
    String sql = "SELECT COALESCE(SUM(total_amount), 0) FROM orders WHERE status = 'approved'";
    try (Connection conn = DBConfig.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
        return rs.next() ? rs.getDouble(1) : 0.0;
    } catch (SQLException e) {
        e.printStackTrace();
        return 0.0;
    }
}

public int getPendingApprovals() {
    String sql = "SELECT COUNT(*) FROM orders WHERE status = 'pending'";
    try (Connection conn = DBConfig.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
        return rs.next() ? rs.getInt(1) : 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return 0;
    }
}

public int getLowStockCount() {
    String sql = "SELECT COUNT(*) FROM products WHERE stock_quantity <= min_stock_quantity";
    try (Connection conn = DBConfig.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
        return rs.next() ? rs.getInt(1) : 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return 0;
    }
}

public double getOutstandingDues() {
    String sql = "SELECT COALESCE(SUM(total_amount), 0) FROM orders WHERE status != 'approved'";
    try (Connection conn = DBConfig.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
        return rs.next() ? rs.getDouble(1) : 0.0;
    } catch (SQLException e) {
        e.printStackTrace();
        return 0.0;
    }
}
}
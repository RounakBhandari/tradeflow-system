package com.tradeflow.system.dao;

import com.tradeflow.system.utils.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RetailerDAO {

    // ─── Fetch all retailers ──────────────────────────────────────────────────
    public List<Map<String, Object>> getRetailers() {
        String sql = "SELECT retailer_id, shop_name, owner_name, phone, address, due_amount FROM retailers ORDER BY shop_name ASC";
        List<Map<String, Object>> list = new ArrayList<>();
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("retailerId", rs.getInt("retailer_id"));
                row.put("shopName",   rs.getString("shop_name"));
                row.put("ownerName",  rs.getString("owner_name"));
                row.put("phone",      rs.getString("phone"));
                row.put("address",    rs.getString("address"));
                row.put("dueAmount",  rs.getDouble("due_amount"));
                list.add(row);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // ─── Insert a new retailer (due_amount defaults to 0) ─────────────────────
    public boolean addRetailer(String shopName, String ownerName, String phone, String address) {
        String sql = "INSERT INTO retailers (shop_name, owner_name, phone, address, due_amount) VALUES (?, ?, ?, ?, 0)";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, shopName);
            ps.setString(2, ownerName);
            ps.setString(3, phone);
            ps.setString(4, address);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean deleteRetailer(int retailerId) {
        String sql = "DELETE FROM retailers WHERE retailer_id = ?";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, retailerId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
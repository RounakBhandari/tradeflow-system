package com.tradeflow.system.dao;

import com.tradeflow.system.model.UserModel;
import com.tradeflow.system.utils.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProfileDAO {

    // ─── Fetch user by email ──────────────────────────────────────────────────
    public UserModel getUserByEmail(String email) throws SQLException {
        String sql = "SELECT first_name, last_name, email, phone, profile_pic FROM users WHERE email = ?";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    UserModel user = new UserModel();
                    user.setFirstName(rs.getString("first_name"));
                    user.setLastName(rs.getString("last_name"));
                    user.setEmail(rs.getString("email"));
                    user.setPhone(rs.getString("phone"));
                    user.setProfilePic(rs.getString("profile_pic"));
                    return user;
                }
            }
        }
        return null;
    }

    // ─── Update first name, last name, email, phone (no image change) ─────────
    public boolean updateProfile(UserModel user, String originalEmail) throws SQLException {
        // Only update profile_pic column if a new one was uploaded
        String sql = user.getProfilePic() != null
            ? "UPDATE users SET first_name=?, last_name=?, email=?, phone=?, profile_pic=? WHERE email=?"
            : "UPDATE users SET first_name=?, last_name=?, email=?, phone=? WHERE email=?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhone());
            if (user.getProfilePic() != null) {
                ps.setString(5, user.getProfilePic());
                ps.setString(6, originalEmail);
            } else {
                ps.setString(5, originalEmail);
            }
            return ps.executeUpdate() > 0;
        }
    }
}
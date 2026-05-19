package com.tradeflow.system.service;

import com.tradeflow.system.dao.ProfileDAO;
import com.tradeflow.system.model.UserModel;

import java.sql.SQLException;

public class ProfileService {

    private final ProfileDAO profileDAO = new ProfileDAO();

    // ─── Get user by email ────────────────────────────────────────────────────
    public UserModel getUserByEmail(String email) throws SQLException {
        return profileDAO.getUserByEmail(email);
    }

    // ─── Update profile (name, email, phone only) ─────────────────────────────
    public boolean updateProfile(UserModel user, String originalEmail) throws SQLException {
        return profileDAO.updateProfile(user, originalEmail);
    }
}
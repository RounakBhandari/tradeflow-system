package com.tradeflow.system.service;

import java.util.List;

import com.tradeflow.system.dao.UserDAO;
import com.tradeflow.system.model.UserModel;

public class UserService {
    private UserDAO userDAO = new UserDAO();

    public List<UserModel> getPendingUsers() {
        return userDAO.getPendingUsers();
    }

    public boolean approveUser(int userId) {
        return userDAO.approveUser(userId);
    }

    public boolean rejectUser(int userId) {
        return userDAO.rejectUser(userId);
    }
}

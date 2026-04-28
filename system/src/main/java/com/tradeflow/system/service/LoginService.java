package com.tradeflow.system.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tradeflow.system.model.UserModel;
import com.tradeflow.system.utils.DBConfig;
import com.tradeflow.system.utils.PasswordUtil;

public class LoginService {
	public Boolean loginUser(UserModel userModel) {
		String query = "SELECT email, password FROM users WHERE email = ?";
		
		try (Connection dbcon = DBConfig.getConnection();
				PreparedStatement pst = dbcon.prepareStatement(query)){
			
			pst.setString(1, userModel.getEmail());
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				String storedPassword = rs.getString("password");
				return PasswordUtil.checkPassword(userModel.getPassword(), storedPassword);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null; 
		}
		return false;
	}
	
	public String getUserRole(String email) {
		String role = null;
		try {
			Connection dbcon = DBConfig.getConnection();
			
			String query = "SELECT role FROM users WHERE email = ?";
			PreparedStatement pst = dbcon.prepareStatement(query);
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				role = rs.getString("role");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return role;
	}

}

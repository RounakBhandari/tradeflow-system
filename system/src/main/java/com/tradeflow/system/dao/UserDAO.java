package com.tradeflow.system.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tradeflow.system.model.UserModel;
import com.tradeflow.system.utils.DBConfig;

public class UserDAO {
	public void insertUser(String firstName, String lastName, String email, String phone, String password, String role, String imgPath) throws Exception{
		
		Connection dbconn = DBConfig.getConnection();
		
		String sqlQuery =  "INSERT INTO users (first_name, last_name, email, phone, password, role, profile_pic) VALUES (?,?,?,?,?,?,?)";
		PreparedStatement pst =  dbconn.prepareStatement(sqlQuery);
		pst.setString(1, firstName);
		pst.setString(2, lastName);
		pst.setString(3, email);
		pst.setString(4, phone);
		pst.setString(5, password);
		pst.setString(6, role);
		pst.setString(7, imgPath);
		
		pst.executeUpdate();
		pst.close();
		dbconn.close();
	}
	
	public List<UserModel> getAllUsers() throws Exception{
		List<UserModel> users = new ArrayList<>();
		Connection dbconn = DBConfig.getConnection();
		String sqlQuery = "SELECT * FROM users";
		PreparedStatement pst = dbconn.prepareStatement(sqlQuery);
		ResultSet rs = pst.executeQuery();
		
		while(rs.next()) {
			UserModel u = new UserModel();
			u.setFirstName(rs.getString("first_name"));
			u.setLastName(rs.getString("last_name"));
			u.setEmail(rs.getString("email"));
			u.setPhone(rs.getString("phone"));
			u.setRole(rs.getString("role"));
			u.setStatus(rs.getString("status"));
			users.add(u);
		}
		rs.close();
		pst.close();
		dbconn.close();
		return users;
	}
}

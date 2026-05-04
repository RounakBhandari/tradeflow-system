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
			u.setUserId(rs.getInt("user_id"));
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
	
	public List<UserModel> getPendingUsers() {
	    List<UserModel> users = new ArrayList<>();

	    String sql = "SELECT * FROM users WHERE status = 'pending'";

	    try (Connection conn = DBConfig.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {
	            UserModel user = new UserModel();
	            user.setUserId(rs.getInt("user_id"));
	            user.setEmail(rs.getString("email"));
	            user.setRole(rs.getString("role"));
	            user.setStatus(rs.getString("status"));

	            users.add(user);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return users;
	}
	
	public boolean approveUser(int userId) {
	    String sql = "UPDATE users SET status = 'approved' WHERE user_id = ?";

	    try (Connection conn = DBConfig.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setInt(1, userId);
	        return ps.executeUpdate() > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}
	
	public boolean rejectUser(int userId) {
	    String sql = "UPDATE users SET status = 'rejected' WHERE user_id = ?";

	    try (Connection conn = DBConfig.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setInt(1, userId);
	        return ps.executeUpdate() > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}
	
}

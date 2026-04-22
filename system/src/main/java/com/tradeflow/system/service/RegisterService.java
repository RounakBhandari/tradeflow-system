package com.tradeflow.system.service;

import com.tradeflow.system.dao.UserDAO;
import com.tradeflow.system.utils.PasswordUtil;

public class RegisterService {
	
	public void addUser(String firstName, String lastName,  String email, String phone, String password, String role, String imgPath) throws Exception{
		password = PasswordUtil.getHashPassword(password);
		
		UserDAO dao = new UserDAO();
		dao.insertUser(firstName, lastName, email, phone, password, role, imgPath);
	}
}

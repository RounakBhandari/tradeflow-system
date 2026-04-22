package com.tradeflow.system.utils;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {
		private static final int COST = 12;
		
		public static String getHashPassword(String password) {
			return BCrypt.hashpw(password, BCrypt.gensalt(COST));
		}
		
		public static boolean checkPassword(String inputPassword, String storedHash) {
			return BCrypt.checkpw(inputPassword, storedHash);
		}
		
}

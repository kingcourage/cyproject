package com.wcy.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.wcy.pojo.User;

public class CurrentUserUtil {
	public static User getCurrentUser(HttpServletRequest request){
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("CURRENT_USER");
		return user;
	}
}

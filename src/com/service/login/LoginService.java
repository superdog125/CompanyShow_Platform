package com.service.login;

import com.domain.User;

public interface LoginService {
	
	// ×¢²á
	public void registerUser(String name, String phone, String password);
	
	// µÇÂ¼
	public User loginUser(String name, String password);
	
	// ÐÞ¸ÄÃÜÂë
	public User confirmExistByPhone(String phone);
	
	public void modifyPwd(User user);
	
	// ÍË³ö
	public String logoutUser();
	
}

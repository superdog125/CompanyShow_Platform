package com.service.impl.login;

import com.dao.login.LoginDao;
import com.domain.User;
import com.service.login.LoginService;

public class LoginServiceImpl implements LoginService {
	
	public LoginDao loginDao;


	public LoginDao getLoginDao() {
		return loginDao;
	}

	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;
	}

	@Override
	public void registerUser(String name, String phone, String password) {
		loginDao.insertUser(name, phone, password); 
	}

	@Override
	public User loginUser(String name, String password) {
		return loginDao.findUserByInfo(name, password);
	}

	@Override
	public String logoutUser() {
		
		return null;
	}

	@Override
	public void modifyPwd(User user) {
		loginDao.insertUserByUser(user); 
	}

	@Override
	public User confirmExistByPhone(String phone) {
		return loginDao.findUserByPhone(phone);
	}


}

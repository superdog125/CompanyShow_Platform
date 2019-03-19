package com.service.impl.user;

import java.util.List;

import com.dao.user.UserDao;
import com.domain.User;
import com.service.user.UserService;

public class UserServiceImpl implements UserService{
	public UserDao userDao;
	
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao carDao) {
		this.userDao = carDao;
	}

	@Override
	public void addUser(User car) {
		userDao.insertUser(car);
	}

	@Override
	public void QueryUserById(Integer cid) {
		userDao.findUserById(cid);

	}

	@Override
	public void changeUser(User car) {
		userDao.updateUser(car);
	}

	@Override
	public void dropUser(User car) {
		userDao.deleteUser(car);

	}

	@Override
	public List<User> QueryAllUser() {
		return userDao.findAllUser();
	}

	@Override
//	public User QueryUserByName(String cname) {
//		return userDao.findUserByName(cname);
//		
//	}
	public User QueryUserByName(String aname, String apassword) {
		return userDao.findUserByName(aname, apassword);
	
	}
}

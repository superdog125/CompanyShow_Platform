package com.dao.login;

import com.domain.User;

public interface LoginDao{
	
	// 增加一名新用户
	public void insertUser(String name, String phone, String password);
	
	// 根据用户名和密码查找用户
	public User findUserByInfo(String name, String password);
	
	// 根据手机号修改该用户密码
	public int updateUserByPhone(String phone, String password);
	
	// 根据id删除用户
	public int deleteUserById(Integer id);

	public User findUserByPhone(String phone);

	public void insertUserByUser(User user);
}

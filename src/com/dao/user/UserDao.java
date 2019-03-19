package com.dao.user;

import java.util.List;

import com.domain.User;

public interface UserDao {
	public void insertUser(User user);

	public User findUserById(Integer cid);
	
	public List<User> findAllUser();

	public void updateUser(User User);

	public void deleteUser(User User);

//	public User findUserByName(String cname);

	public User findUserByName(String name, String pwd);
}

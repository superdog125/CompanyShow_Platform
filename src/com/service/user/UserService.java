package com.service.user;

import java.util.List;

import com.domain.User;



public interface UserService {
	public void addUser(User user);
	
	public void QueryUserById(Integer cid);
	
//	public User QueryUserByName(String cname);
	
	public List<User> QueryAllUser();
	
	public void changeUser(User user);
	
	public void dropUser(User user);

	public User QueryUserByName(String aname, String apassword);
}

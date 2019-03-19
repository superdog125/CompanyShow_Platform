package com.action.login;

import com.domain.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.service.login.LoginService;

public class ExitAction extends ActionSupport implements ModelDriven<User> {
	private static final long serialVersionUID = 1L;

	private User user = new User();
	
	private LoginService loginService;

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	} 
	
	public String execute() throws Exception {
		ActionContext.getContext().getSession().remove("user");
		user = (User) ActionContext.getContext().getSession().get("user");;
		if(user == null){
			System.out.println("注销成功");
			return "success";
		}
		System.out.println("用户注销失败" + user);
		return "input";
	}
	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public User getModel() {
		return user;
	}
	

}

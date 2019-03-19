package com.action.login;

import com.domain.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.service.login.LoginService;
import com.service.user.UserService;

public class RegisterAction extends ActionSupport implements ModelDriven<User>{
	// 这个定义的User为了接受前端表单的传值
		private User user = new User();
		
		private LoginService loginService;
		private UserService userService;
		
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
		
		public LoginService getLoginService() {
			return loginService;
		}

		public void setLoginService(LoginService loginService) {
			this.loginService = loginService;
		}

		public UserService getUserService() {
			return userService;
		}

		public void setUserService(UserService userService) {
			this.userService = userService;
		}

		
		public String execute(){
			System.out.println("进来啦");
			System.out.println("接收到用户注册数据："+ user);
			User u = userService.QueryUserByName(user.getLoginName(),user.getLoginPwd());
			//未查到该注册用户，添加入库
			if (u == null){
				loginService.registerUser(user.getLoginName(), user.getTelephone(), user.getLoginPwd());;
				//判断用户是否添加到数据库
				System.out.println("loginService.registerUser方法执行完毕");
				User u1 = userService.QueryUserByName(user.getLoginName(),user.getLoginPwd());
				//注册失败
				if (u1 == null){
					System.out.println("用户注册失败");
					addActionError("用户注册失败");
					return "input";
				}
				//注册成功
				System.out.println("用户注册成功");
				return "success";
			//已存在该用户
			}else{
				System.out.println("数据库中已有该用户");
				return "input";
			}

		}

	
}

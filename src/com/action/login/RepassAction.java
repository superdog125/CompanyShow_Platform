package com.action.login;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.domain.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.service.login.LoginService;

public class RepassAction extends ActionSupport implements ModelDriven<User>{
	
	// 这个定义的User为了接受前端表单的传值
		private User user;
		
		@Override
		public User getModel() {
			return user;
		}
		
		private LoginService loginService;

		public void setLoginService(LoginService loginService) {
			this.loginService = loginService;
		} 

		public String repass1() throws Exception {
			System.out.println("忘记密码方法1");
			System.out.println("接收到用户登录手机号："+ user.getTelephone());
			User dbUser = loginService.confirmExistByPhone(user.getTelephone());
			// 判断是否查询到该用户
			if (dbUser == null){
				System.out.println("号码验证失败");
				addActionError("此用户尚未注册");
				return "input";
			}
			System.out.println("用户完成手机号验证："+ dbUser);
			// 验证成功，跳转到密码修改页面
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("repassUser", dbUser);
		    return "success";
		}
		
		
		public String repass2() throws Exception {
			System.out.println("忘记密码方法2");
			System.out.println("接收到用户密码修改数据："+ user);
			HttpSession session = ServletActionContext.getRequest().getSession();
			User u = (User) session.getAttribute("repassUser");
			// 得到域中的User,即刚刚请求修改密码的User
			u.setLoginPwd(user.getLoginPwd());
			try{
				loginService.modifyPwd(u);
			}catch(Exception e){
				e.printStackTrace();
				return "input";
			}
			// 注册成功
			// 获取Context上下文对象,添加入当前session
			System.out.println("修改密码成功");
		    return "success";
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}
		
	

}

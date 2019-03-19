package com.action.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.domain.User;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.service.user.UserService;

public class UserAction extends ActionSupport implements ModelDriven<User>{
	private static final long serialVersionUID = 1L;
	private User user;
	private UserService userService;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Override
	public User getModel() {
		return user;
	}
	
	public String add(){
		try{
			System.out.println("新增用户" + user);
			userService.addUser(user);
		}catch (Exception e){
			System.out.println("add这里出错啦");
			System.out.println(e.getMessage());
			return "input";
		}
		return "success";

	}

	public String delete(){
		try{
			System.out.println("删除用户" + user);
			userService.dropUser(user);
		}catch (Exception e){
			System.out.println("delete这里出错啦");
			System.out.println(e.getMessage());
			return "input";
		}
		return "success";

	}
	
	public String update(){
		try{
			System.out.println("用户信息更改" + user);
			userService.changeUser(user);
		}catch (Exception e){
			System.out.println("update这里出错啦");
			System.out.println(e.getMessage());
			return "input";
		}
		return "success";
	}
	
	public void find() throws IOException{
		HttpServletResponse response= ServletActionContext.getResponse();
		response.setHeader("Access-Control-Allow-Origin", "*"); 		  
        response.setHeader("Access-Control-Allow-Headers", "Content-Type,Content-Length, Authorization, Accept,X-Requested-With");  
        response.setHeader("Access-Control-Allow-Methods","PUT,POST,GET,DELETE,OPTIONS");  	
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
		try{
			System.out.println("查询全部用户信息中...");
			System.out.println("接受客户端消息:" + user);
			ArrayList<User> userlist = new ArrayList<User>();
			userlist = (ArrayList<User>) userService.QueryAllUser();
			System.out.println("查询结果:" + userlist);
//			Map session = ActionContext.getContext().getSession();  
//			session.put("Userlist", Userlist);
			String userString = new Gson().toJson(userlist);
			System.out.println("json转换结果" + userString);
			out.println(userString);
		}catch (Exception e){
			System.out.println("find这里出错啦");
			System.out.println(e.getMessage());
		}
	    out.flush();
	    out.close();
	}
	
}

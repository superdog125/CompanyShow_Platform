package com.web.interceptor;

import java.util.Map;

import com.domain.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;


public class PrivilegeInterceptor extends MethodFilterInterceptor{
	
	//不校验登录和注册的方法
	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		//获得session
		Map<String, Object> session = ActionContext.getContext().getSession();
		//获得登录标识
		User user = (User) session.get("user");
		//判断标识是否存在
		if(user!=null){
			//存在，放行
			return invocation.invoke();
		}else{
			//不存在，跳转			
			return "toLogin";
		}
	}

}

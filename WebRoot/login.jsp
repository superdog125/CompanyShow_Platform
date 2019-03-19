<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="layuiadmin/layui/css/layui.css">
    <link rel="stylesheet" href="layuiadmin/style/admin.css">
    <link rel="stylesheet" href="layuiadmin/style/login.css">
    <link id="layuicss-layer" rel="stylesheet" href="layuiadmin/style/layer.css" media="all">
</head>
<body layadmin-themealias="default">
<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
	<form class="layui-form" action="${pageContext.request.contextPath}/login.action" method="post">
	    <div class="layadmin-user-login-main">
	        <div class="layadmin-user-login-box layadmin-user-login-header">
	            <h2>×××公司项目展示平台登录界面</h2>
	 			<p></p>
	        </div>	        
	        <div class="layadmin-user-login-box layadmin-user-login-body layui-form">	         
	            <div class="layui-form-item">
	                <label class="layadmin-user-login-icon layui-icon layui-icon-username"
	                       for="LAY-user-login-username"></label>
	                <input type="text" name="user.loginName" id="LAY-user-login-username" lay-verify="required" placeholder="用户名"
	                       class="layui-input">
	            </div>
	            <div class="layui-form-item">
	                <label class="layadmin-user-login-icon layui-icon layui-icon-password"
	                       for="LAY-user-login-password"></label>
	                <input type="password" name="user.loginPwd" id="LAY-user-login-password" lay-verify="required"
	                       placeholder="密码" class="layui-input">	                       
	            </div>
	           <div class="layui-form-item">
	                <div class="layui-row">
	                    <div class="layui-col-xs7">
	                        <label class="layadmin-user-login-icon layui-icon layui-icon-vercode"
	                               for="LAY-user-login-vercode"></label>
	                        <input type="text" name="checkcode" id="checkcode" lay-verify="required"
	                               placeholder="图形验证码" class="layui-input">
	                    </div>	                    
						<div class="layui-col-xs5">
	                        <div style="margin-left: 5px;margin-top: 3px;">
	                            <img id="checkImg" class="captchaImage" src="${pageContext.request.contextPath}/checkImg.action" onclick="javascript:window.location.reload()" title="点击更换验证码">
	                        </div>
	                    </div>	                    
	                <font color="red" style="margin-left: 10px;margin-top: 1px;"><s:actionerror /></font> 
	                </div>
	            </div>
	            <div class="layui-form-item" style="margin-bottom: 20px;">
	                <input type="checkbox" name="remember" lay-skin="primary" title="记住密码">
	                <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><span>记住密码</span><i
	                        class="layui-icon layui-icon-ok"></i></div>
	                <a href="views/user/forget1.jsp" class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;">忘记密码？</a>
	            </div>
	            <div class="layui-form-item">
	                    <button class="layui-btn layui-btn-fluid" lay-submit="" lay-filter="LAY-user-login-submit">登 入</button>
	            </div>
	            <!-- 
	            <div class="layui-form-item">
	               <label class="layui-form-label">请选择角色登录</label>
				   <div class="layui-input-inline">
				   <select name="role" lay-verify="required" lay-search="">
				      <option value="0">管理员</option>
				      <option value="1">司机</option>
				      <option value="2">技术员</option>
				   </select>
				   </div>
	        	</div>
	        	-->
	            <div class="layui-trans layui-form-item layadmin-user-login-other">
	                <a href="views/user/reg.jsp" class="layadmin-user-jump-change layadmin-link">注册帐号</a>
	            </div>
	        </div>
	    </div>
	</form>




</div>
<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.all.js" type="text/javascript">
			
	//切换验证码
	function change(){
		/* var img1=document.getElementById("checkImg");
		img1.src="${pageContext.request.contextPath}/checkImg.action?"+new Date().getTime(); //加时间戳防止缓存 */

	}

</script>


</body>

</html>
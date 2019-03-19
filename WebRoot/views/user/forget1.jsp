<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>忘记密码 - layuiAdmin</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/login.css" media="all">
</head>
<body>
<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
    <div class="layadmin-user-login-main">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <h2>运输公司货车管理系统</h2>
            <p>找回密码</p>
        </div>
        <div class="layadmin-user-login-box layadmin-user-login-body layui-form">

	     <form class="layui-form" action="${pageContext.request.contextPath}/repass1" method="post">
	        <div class="layui-form-item">
	            <label class="layadmin-user-login-icon layui-icon layui-icon-cellphone"
	                   for="LAY-user-login-cellphone"></label>
	            <input type="text" name="user.telephone" id="LAY-user-login-cellphone" lay-verify="phone"
	                   placeholder="请输入注册时的手机号" class="layui-input">
	        </div>
	        <div class="layui-form-item">
	            <div class="layui-row">
	                <div class="layui-col-xs7">
	                    <label class="layadmin-user-login-icon layui-icon layui-icon-vercode"
	                           for="LAY-user-login-vercode"></label>
	                    <input type="text" name="vercode" id="LAY-user-login-vercode" lay-verify="required"
	                           placeholder="图形验证码" class="layui-input">
	                </div>
	                <div class="layui-col-xs5">
	                    <div style="margin-left: 10px;">
	                        <img src="https://www.oschina.net/action/user/captcha"
	                             class="layadmin-user-login-codeimg" id="LAY-user-get-vercode">
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- 
	        <div class="layui-form-item">
	            <div class="layui-row">
	                <div class="layui-col-xs7">
	                    <label class="layadmin-user-login-icon layui-icon layui-icon-vercode"
	                           for="LAY-user-login-smscode"></label>
	                    <input type="text" name="vercode" id="LAY-user-login-smscode" lay-verify="required"
	                           placeholder="短信验证码" class="layui-input">
	                </div>
	                
	                <div class="layui-col-xs5">
	                    <div style="margin-left: 10px;">
	                        <button type="button" class="layui-btn layui-btn-primary layui-btn-fluid"
	                                id="LAY-user-getsmscode">获取验证码
	                        </button>
	                    </div>
	                </div>
	                
	            </div>
	        </div>
	         -->
	        <div class="layui-form-item">
	            <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-forget-submit">找回密码
	            </button>
	        </div>
		</form>
			
        </div>
    </div>

</div>

<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'user'], function () {
        var $ = layui.$
            , setter = layui.setter
            , admin = layui.admin
            , form = layui.form
            , router = layui.router();

        form.render();

    });
</script>
</body>
</html>
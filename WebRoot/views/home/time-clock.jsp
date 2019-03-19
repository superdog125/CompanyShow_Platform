<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<title>运输公司货车管理系统主页</title>
		<link rel="stylesheet" href="../css/bootstrap.css" />
		<!--需要引入JQuery-->
		<script type="text/javascript" src="../js/jquery-1.11.0.js"></script>
		<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
		<script type="text/javascript" src="../js/bootstrap.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body  onload="init()" bgcolor="white"><!-- style="width:1000px;height:400px;" -->
	
		<div id="main" style="text-align: center;">
	        <h1>运输公司货车管理系统主页</h1><br/>
	        <h4>欢迎登录：<font color="red"><s:property value="#session.user.loginName"/></font></h4>
	    </div>
	    <br/><br/>
	<!--轮播图-->
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="2000" style="text-align: center;">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>
				
				<center>
				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="img/1.jpg" alt="..." width="700px" height="400px">
						<div class="carousel-caption">
							...
						</div>
					</div>
					<div class="item">
						<img src="img/2.jpg" alt="..." width="700px" height="400px">
						<div class="carousel-caption">
							...
						</div>
					</div>
					<div class="item">
						<img src="img/3.jpg" alt="..." width="700px" height="400px">
						<div class="carousel-caption">
							...
						</div>
					</div>
				</div>
				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
			
			  <div style="text-align: center;">
					<h3>公司简介(暂缺)</h3>
					<h1>。</h1>
					<h1>。</h1>
					<h1>。</h1>					
					<br/><br/>
			     
					<a href="https://www.baidu.com/">使用说明</a>
					<a href="https://www.sise.com.cn/">关于我们</a>
					<a href="http://home.sise.cn/">联系我们</a>					
					<br/>					
					Copyright ©2019  版权所有
			</div>
	
</body>
</html>

<script type="text/javascript">
			var index = 0;
			
			function changeImg(){
				
				//1. 获得要切换图片的那个元素
				var img = document.getElementById("img1");
				
				//计算出当前要切换到第几张图片
				var curIndex = index%3 + 1;  //0,1,2 
				img.src="img/"+curIndex+".jpg";  //1,2,3
				//每切换完,索引加1
				index = index + 1;
			}
			
			function init(){
				
				setInterval("changeImg()",3000);
			}
			
		</script>
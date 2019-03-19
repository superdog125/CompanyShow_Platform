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
    <title>运输公司货车管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="layuiadmin/style/admin.css" media="all">

    <script>
        /^http(s*):\/\//.test(location.href) || alert('请先部署到 localhost 下再访问');
    </script>
    <link id="layuicss-layer" rel="stylesheet" href="layuiadmin/layui/css/modules/layer/default/layer.css"
          media="all">

</head>
<body class="layui-layout-body">

<div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <!-- 头部区域 -->
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item layadmin-flexible" lay-unselect="">
                    <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
                        <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect="">
                    <a href="" target="_blank" title="前台">
                        <i class="layui-icon layui-icon-website"></i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect="">
                    <a href="javascript:;" layadmin-event="refresh" title="刷新">
                        <i class="layui-icon layui-icon-refresh-3"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect="">
                    <input type="text" placeholder="搜索..." autocomplete="off" class="layui-input layui-input-search"
                           layadmin-event="serach" lay-action="views/template/search.html?keywords=">
                </li>
            </ul>
            <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">

                <li class="layui-nav-item" lay-unselect="">
                    <a lay-href="views/app/message/index.html" layadmin-event="message" lay-text="消息中心">
                        <i class="layui-icon layui-icon-notice"></i>

                        <!-- 如果有新消息，则显示小圆点 -->
                        <span class="layui-badge-dot"></span>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect="">
                    <a href="javascript:;" layadmin-event="theme">
                        <i class="layui-icon layui-icon-theme"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect="">
                    <a href="javascript:;" layadmin-event="note">
                        <i class="layui-icon layui-icon-note"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect="">
                    <a href="javascript:;" layadmin-event="fullscreen">
                        <i class="layui-icon layui-icon-screen-full"></i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect="">
                    <a href="javascript:;">
                        <cite><s:property value="#session.user.loginName"/></cite>
                        <span class="layui-nav-more"></span></a>
                    <dl class="layui-nav-child">
                        <dd><a lay-href="views/set/user/password.html">修改密码</a></dd>
                        <hr>
                        <!-- <dd layadmin-event="logout" style="text-align: center;"><a lay-href="${pageContext.request.contextPath}/exit.action">退出</a></dd> -->
                        <dd><a href="${pageContext.request.contextPath}/exit.action">退出</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-hide-xs" lay-unselect="">
                    <a href="javascript:;" layadmin-event="about"><i
                            class="layui-icon layui-icon-more-vertical"></i></a>
                </li>
                <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-unselect="">
                    <a href="javascript:;" layadmin-event="more"><i class="layui-icon layui-icon-more-vertical"></i></a>
                </li>
            </ul>
        </div>

        <!--侧边菜单-->
        <div class="layui-side layui-side-menu">
            <div class="layui-side-scroll">
                <div class="layui-logo" lay-href="">
                    <span>×××项目展示平台</span>
                </div>
                <ul class="layui-nav layui-nav-tree" lay-filter="test">
                    <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
                    <li data-name="home" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="主页" lay-direction="2">
                            <i class="layui-icon layui-icon-home"></i>
                            <cite>主页</cite>
                            <span class="layui-nav-more"></span>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="console" class="layui-this">
                                <a lay-href="views/home/time-clock.jsp">主页</a>
                            </dd>
                        </dl>
 
                    </li>

                    <li data-name="app" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="项目一" lay-direction="2">
                            <i class="layui-icon layui-icon-app"></i>
                            <cite>项目一</cite>
                            <span class="layui-nav-more"></span></a>
                        <dl class="layui-nav-child">
                            <dd data-name="content">
                                <a lay-href="views/show/project11.jsp">展示一</a>
                            </dd>
                            <dd data-name="content">
                                <a lay-href="views/show/project12.jsp">展示二</a>
                            </dd>
                            <dd data-name="content">
                                <a lay-href="views/show/project13.jsp">展示三</a>
                            </dd>
                        </dl>
                    </li>
                    
                    <li data-name="component" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="项目二" lay-direction="2">
                            <i class="layui-icon layui-icon-component"></i>
                            <cite>项目二</cite>
                            <span class="layui-nav-more"></span>
                        </a>
                        <dl class="layui-nav-child">
                        	<!-- data-name="grid" 是全页面转向某页面 -->
                        	<!-- data-name="content" 是子页面转向某页面 -->
                            <dd data-name="grid">
                                <a lay-href="views/show/project21.jsp">展示一</a>
                            </dd>
                            <dd data-name="grid">
                                <a lay-href="views/show/project22.jsp">展示二</a>
                            </dd>
                        </dl>
                    </li>


                    <li data-name="senior" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="项目三" lay-direction="2">
                            <i class="layui-icon layui-icon-senior"></i>
                            <cite>项目三</cite>
                            <span class="layui-nav-more"></span></a>
                        <dl class="layui-nav-child">
                            <dd data-name="echarts">
                                <a lay-href="views/show/project31.jsp">展示一</a>
                            </dd>
                        </dl>
                    </li>

					
                    <li data-name="template" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="项目四" lay-direction="2">
                            <i class="layui-icon layui-icon-template"></i>
                            <cite>项目四</cite>
                            <span class="layui-nav-more"></span></a>
                        <dl class="layui-nav-child">
                            <dd><a lay-href="views/show/project41.jsp">展示一</a></dd>
                        </dl>
                    </li>
					
                    <li data-name="user" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="项目五" lay-direction="2">
                            <i class="layui-icon layui-icon-user"></i>
                            <cite>项目五</cite>
                            <span class="layui-nav-more"></span></a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a lay-href="views/show/project51.jsp">展示一</a>
                            </dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 页面标签 -->
        <div class="layadmin-pagetabs" id="LAY_app_tabs">
            <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
            <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
            <div class="layui-icon layadmin-tabs-control layui-icon-down">
                <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
                    <li class="layui-nav-item" lay-unselect="">
                        <a href="javascript:;"><span class="layui-nav-more"></span></a>
                        <dl class="layui-nav-child layui-anim-fadein">
                            <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
                            <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
                            <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
            <div class="layui-tab" lay-unauto="" lay-allowclose="true" lay-filter="layadmin-layout-tabs">
                <ul class="layui-tab-title" id="LAY_app_tabsheader">
                    <li lay-id="home/console.html" lay-attr="home/console.html" class="layui-this"><i
                            class="layui-icon layui-icon-home"></i><i class="layui-icon layui-unselect layui-tab-close">ဆ</i>
                    </li>
                </ul>
            </div>
        </div>


        <!-- 主体内容 -->
        <div class="layui-body" id="LAY_app_body">
            <div class="layadmin-tabsbody-item layui-show">
                <iframe src="" frameborder="0" class="layadmin-iframe"></iframe>
            </div>
        </div>

        <!-- 辅助元素，一般用于移动设备下遮罩 -->
        <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
</div>
<script src="layuiadmin/layui/layui.js" ></script>
<script>
    layui.config({
        base: 'layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use('index');
</script>
</body>
</html>
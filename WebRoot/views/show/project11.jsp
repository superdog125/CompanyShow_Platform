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
    <title>Echarts集成</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <script src="${pageContext.request.contextPath}/layuiadmin/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layuiadmin/js/echarts-all.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
</head>
<body>

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">Vertical Wind Speed (m/s) at 50m</div>
                <div class="layui-card-body">
                    <div class="layui-carousel layadmin-carousel layadmin-dataview">
                		<div id="chart_VerticalWindSpeed" style="width: 642px; height: 332px;">
                	
                		</div>
                	</div>
                </div>
            </div>
            <div class="layui-card">
                <div class="layui-card-header">Horizontal Wind Speed (m/s) at 50m</div>
                <div class="layui-card-body">
                	<div class="layui-carousel layadmin-carousel layadmin-dataview">
                		<div id="chart_HorizontalWindSpeed" style="width: 642px; height: 332px;">
                	
                		</div>
                	</div>
                	<!-- 
                    <div class="layui-carousel layadmin-carousel layadmin-dataview" data-anim="fade" lay-filter="LAY-index-heapcol">
                        <div carousel-item id="LAY-index-heapcol">
                            <div><i class="layui-icon layui-icon-loading1 layadmin-loading"></i></div>
                        </div>
                    </div>
                     -->
                </div>
            </div>
        </div>
        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">Met Wind Speed (m/s)</div>
                <div class="layui-card-body">
                	<div class="layui-carousel layadmin-carousel layadmin-dataview">
                		<div id="chart_MetWindSpeed" style="width: 642px; height: 332px;">
                	
                		</div>
                	</div>
                </div>
            </div>
            <div class="layui-card">
                <div class="layui-card-header">Battery (V)</div>
                <div class="layui-card-body">
					<div class="layui-carousel layadmin-carousel layadmin-dataview">
                		<div id="chart_Battery" style="width: 642px; height: 332px;">
                	
                		</div>
                	</div>
                </div>
            </div>

        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'show']);
</script>
<script type="text/javascript">
	function sleep(d){
        for (var t = Date.now(); Date.now() - t <= d; );
    }
	
	var myChart_VerticalWindSpeed = echarts.init(document.getElementById("chart_VerticalWindSpeed"));
    option_VerticalWindSpeed = {
	    title: {
	        text: '纵向风速变化趋势',
	        subtext: '变化趋势'
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data:['纵向风速']
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    toolbox: {
	        feature: {
	            saveAsImage: {}
	        }
	    },
	    xAxis: {
	        type: 'category',
	        boundaryGap: false,
	        data: ['2018/11/12  10:29:07','2018/11/12  10:29:13','2018/11/12  10:29:19','2018/11/12  10:29:24','2018/11/12  10:29:30','2018/11/12  10:29:35','2018/11/12  10:29:42','2018/11/12  10:29:47','2018/11/12  10:29:53','2018/11/12  10:29:58','2018/11/12  10:30:02','2018/11/12  10:30:07','2018/11/12  10:30:16','2018/11/12  10:30:22','2018/11/12  10:30:27','2018/11/12  10:30:32','2018/11/12  10:30:39','2018/11/12  10:30:45','2018/11/12  10:30:50','2018/11/12  10:30:55','2018/11/12  10:31:01','2018/11/12  10:31:07','2018/11/12  10:31:13','2018/11/12  10:31:18','2018/11/12  10:31:23','2018/11/12  10:31:29']
	    },
	    yAxis: {
	        type: 'value'
	    },
	    series: [
	        {
	            name:'纵向风速',
	            type:'line',
	            stack: '总量',
	            data:['-0.025','0.154','0.112','-0.186','-0.072','-0.003','0.025','0.058','-0.166','-0.076','0.074','0.215','0.309','0.257','0.509','0.383','0.432','0.467','0.507','0.694','0.311','0.139','0.022','0.082','0.05']
	        }
	    ]
};
	myChart_VerticalWindSpeed.setOption(option_VerticalWindSpeed);
	// =====================================================================
	var myChart_HorizontalWindSpeed = echarts.init(document.getElementById("chart_HorizontalWindSpeed"));
    option_HorizontalWindSpeed = {
	    title: {
	        text: '横向风速变化趋势',
	        subtext: '变化趋势'
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data:['横向风速']
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    toolbox: {
	        feature: {
	            saveAsImage: {}
	        }
	    },
	    xAxis: {
	        type: 'category',
	        boundaryGap: false,
	        data: ['2018/11/12  10:29:07','2018/11/12  10:29:13','2018/11/12  10:29:19','2018/11/12  10:29:24','2018/11/12  10:29:30','2018/11/12  10:29:35','2018/11/12  10:29:42','2018/11/12  10:29:47','2018/11/12  10:29:53','2018/11/12  10:29:58','2018/11/12  10:30:02','2018/11/12  10:30:07','2018/11/12  10:30:16','2018/11/12  10:30:22','2018/11/12  10:30:27','2018/11/12  10:30:32','2018/11/12  10:30:39','2018/11/12  10:30:45','2018/11/12  10:30:50','2018/11/12  10:30:55','2018/11/12  10:31:01','2018/11/12  10:31:07','2018/11/12  10:31:13','2018/11/12  10:31:18','2018/11/12  10:31:23','2018/11/12  10:31:29']
	    },
	    yAxis: {
	        type: 'value'
	    },
	    series: [
	        {
	            name:'横向风速',
	            type:'line',
	            stack: '总量',
	            data:['1.834','1.685','1.561','1.897','2.362','2.297','2.431','2.36','1.938','2.031','2.033','2.29','2.103','1.888','2.181','2.319','2.898','2.856','2.909','2.886','2.687','1.761','1.987','2.404','2.144']
	        }
	    ]
};
	myChart_HorizontalWindSpeed.setOption(option_HorizontalWindSpeed);
	// =====================================================================
	var myChart_MetWindSpeed = echarts.init(document.getElementById("chart_MetWindSpeed"));
    option_MetWindSpeed = {
	    title: {
	        text: '风速变化趋势',
	        subtext: '变化趋势'
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data:['风速']
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    toolbox: {
	        feature: {
	            saveAsImage: {}
	        }
	    },
	    xAxis: {
	        type: 'category',
	        boundaryGap: false,
	        data: ['2018/11/12  10:29:07','2018/11/12  10:29:13','2018/11/12  10:29:19','2018/11/12  10:29:24','2018/11/12  10:29:30','2018/11/12  10:29:35','2018/11/12  10:29:42','2018/11/12  10:29:47','2018/11/12  10:29:53','2018/11/12  10:29:58','2018/11/12  10:30:02','2018/11/12  10:30:07','2018/11/12  10:30:16','2018/11/12  10:30:22','2018/11/12  10:30:27','2018/11/12  10:30:32','2018/11/12  10:30:39','2018/11/12  10:30:45','2018/11/12  10:30:50','2018/11/12  10:30:55','2018/11/12  10:31:01','2018/11/12  10:31:07','2018/11/12  10:31:13','2018/11/12  10:31:18','2018/11/12  10:31:23','2018/11/12  10:31:29']
	    },
	    yAxis: {
	        type: 'value'
	    },
	    series: [
	        {
	            name:'风速',
	            type:'line',
	            stack: '总量',
	            data:['0.617','1.852','1.903','1.08','1.492','1.338','1.801','1.749','1.801','1.183','1.338','1.183','1.389','1.44','1.543','1.698','1.595','1.183','1.543','0.257','3.087','0.463','1.543','1.389','1.333']
	        }
	    ]
};
	myChart_MetWindSpeed.setOption(option_MetWindSpeed);
	// =====================================================================
	var myChart_Battery = echarts.init(document.getElementById("chart_Battery"));
    option_Battery = {
	    title: {
	        text: '电量变化趋势',
	        subtext: '变化趋势'
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data:['电量']
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    toolbox: {
	        feature: {
	            saveAsImage: {}
	        }
	    },
	    xAxis: {
	        type: 'category',
	        boundaryGap: false,
	        data: ['2018/11/12  10:29:07','2018/11/12  10:29:13','2018/11/12  10:29:19','2018/11/12  10:29:24','2018/11/12  10:29:30','2018/11/12  10:29:35','2018/11/12  10:29:42','2018/11/12  10:29:47','2018/11/12  10:29:53','2018/11/12  10:29:58','2018/11/12  10:30:02','2018/11/12  10:30:07','2018/11/12  10:30:16','2018/11/12  10:30:22','2018/11/12  10:30:27','2018/11/12  10:30:32','2018/11/12  10:30:39','2018/11/12  10:30:45','2018/11/12  10:30:50','2018/11/12  10:30:55','2018/11/12  10:31:01','2018/11/12  10:31:07','2018/11/12  10:31:13','2018/11/12  10:31:18','2018/11/12  10:31:23','2018/11/12  10:31:29']
	    },
	    yAxis: {
	        type: 'value'
	    },
	    series: [
	        {
	            name:'电量',
	            type:'line',
	            stack: '总量',
	            data:['11.952','11.95','11.949','11.953','11.951','11.951','11.952','11.95','11.952','11.952','11.947','11.946','11.948','11.95','11.946','11.948','11.95','11.946','11.946','11.948','11.948','11.946','11.946','11.945','11.945']
	        }
	    ]
};
	myChart_Battery.setOption(option_Battery);
	// =====================================================================
</script>
</body>
</html>
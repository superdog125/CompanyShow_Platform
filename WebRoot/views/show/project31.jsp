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
    <script src="${pageContext.request.contextPath}/layuiadmin/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layuiadmin/js/echarts.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
</head>
<body>

<div class="layui-fluid">
    <div class="layui-row layui-col-space20">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">Vertical Wind Speed (m/s) at 50m</div>
                <div class="layui-card-body">
                    <div class="layui-carousel layadmin-carousel layadmin-dataview">
                		<div id="chart_main" style="width: 950px; height: 330px;">
                	
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
	
	var myChart = echarts.init(document.getElementById("chart_main"));
    myChart.showLoading();

        $.get("${pageContext.request.contextPath}/layuiadmin/json/demo.json", function (obama_budget_2012) {
            myChart.hideLoading();

            option = {
                tooltip : {
                    trigger: 'item'
                },
                legend: {
                    data: ['Growth', 'Budget 2011', 'Budget 2012'],
                    itemGap: 5
                },
                grid: {
                    top: '12%',
                    left: '1%',
                    right: '10%',
                    containLabel: true
                },
                xAxis: [
                    {
                        type : 'category',
                        data : obama_budget_2012.names
                    }
                ],
                yAxis: [
                    {
                        type : 'value',
                        name : 'Budget (million USD)',
                        axisLabel: {
                            formatter: function (a) {
                                a = +a;
                                return isFinite(a)
                                    ? echarts.format.addCommas(+a / 1000)
                                    : '';
                            }
                        }
                    }
                ],
                dataZoom: [
                    {
                        type: 'slider',
                        show: true,
                        start: 94,
                        end: 100,
                        handleSize: 8
                    },
                    {
                        type: 'inside',
                        start: 94,
                        end: 100
                    },
                    {
                        type: 'slider',
                        show: true,
                        yAxisIndex: 0,
                        filterMode: 'empty',
                        width: 12,
                        height: '70%',
                        handleSize: 8,
                        showDataShadow: false,
                        left: '93%'
                    }
                ],
                series : [
                    {
                        name: 'Budget 2011',
                        type: 'bar',
                        data: obama_budget_2012.budget2011List
                    },
                    {
                        name: 'Budget 2012',
                        type: 'bar',
                        data: obama_budget_2012.budget2012List
                    }
                ]
            };

            myChart.setOption(option);

        });


        myChart.setOption(option);

</script>
</body>
</html>
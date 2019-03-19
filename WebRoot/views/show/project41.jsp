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
    var source = [['-23','-18',67],
                ['-23','-14',118],
                ['-23','0',105],
                ['-23','10',49],
                ['-22','-18',142],
                ['-22','-14',118],
                ['-22','10',72],
                ['-21','-18',118],
                ['-21','-16',139],
                ['-20','-14',78],
                ['-20','-5',88],
                ['-19','-12',59],
                ['-19','-10',29],
                ['-19','-6',143],
                ['-19','11',48],
                ['-18','-14',108],
                ['-18','-10',176],
                ['-18','-14',108],
                ['-18','10',67],
                ['-17','-17',182],
                ['-17','10',43],
                ['-16','-12',293],
                ['-16','-10',304],
                ['-16','0',392],
                ['-16','8',272],
                ['-16','9',482],
                ['-16','14',208],
                ['-15','-10',248],
                ['-15','-8',401],
                ['-15','1',334],
                ['-15','2',97],
                ['-15','8',209],
                ['-15','9',282],
                ['-15','13:',142],
                ['-14','-10',203],
                ['-14','-2',492],
                ['-14','1',384],
                ['-14','4',362],
                ['-14','9',182],
                ['-13','-10',296],
                ['-13','-8',281],
                ['-13','2',183],
                ['-13','17',142],
                ['-12','-10',49],
                ['-12','-8',224],
                ['-12','14',33],
                ['-12','9',92],
                ['-12','9',92],
                ['-12','-8',241],
                ['-12','-5',240],
                ['-12','9',133],
                ['-12','14',92],
                ['-11','-12',268],
                ['-11','-10',182],
                ['-11','2',164],
                ['-11','9',234],
                ['-11','17',188],
                ['-10','-12',168],
                ['-10','-10',135],
                ['-10','-8',267],
                ['-10','9',194],
                ['-10','13',112],
                ['-9','-13',216],
                ['-9','-10',203],
                ['-9','9',182],
                ['-9','13',142],
                ['-9','17',184],
                ['-8','-11',268],
                ['-8','-10',148],
                ['-8','-9',256],
                ['-8','9',192],
                ['-7','-10',129],   
                ['-7','5',176],
                ['-7','9',143], 
                ['-6','-15',312], 
                ['-6','-10',251], 
                ['-6','9',463], 
                ['-5','-10',281], 
                ['-5','-8',328], 
                ['-5','-3',378], 
                ['-5','9',312], 
                ['-4','-10',246], 
                ['-4','-9',277], 
                ['-4','9',281], 
                ['-3','-14',59], 
                ['-3','-10',108], 
                ['-3','-9',376], 
                ['-3','-4',382], 
                ['-3','1',369], 
                ['-2','-10',105], 
                ['-2','1',396], 
                ['-2','13',279], 
                ['-1','-8',143], 
                ['-1','-4',182], 
                ['-1','4',212], 
                ['0','-13',68], 
                ['0','-10',79], 
                ['0','-4',190], 
                ['0','4',190],
                ['1','-10',132],
                ['1','-7',309],
                ['1','-1',294],
                ['2','-15',382],
                ['2','-10',189],
                ['2','1',362],
                ['3','-14',198],
                ['3','-13',204],
                ['3','-14',152],
                ['4','-11',115],
                ['4','-4',104],
                ['4','11',53],
                ['5','-11',208],
                ['5','-10',115],
                ['5','-9',182],
                ['5','9',176],
                ['6','-13',168],
                ['6','-10',104],
                ['6','-9',124],
                ['6','9',156],
                ['7','-14',109],
                ['7','-13',142],
                ['7','-8',54],
                ['7','-4',158],
                ['7','7',162],
                ['7','11',134],
                ['8','-13',49],
                ['8','-8',43],
                ['8','-4',55],
                ['8','1',35],
                ['8','7',62],
                ['8','11',81],
                ['9','-13',327],
                ['9','-10',284],
                ['9','-8',311],
                ['9','-4',304],
                ['9','11',81],
                ['10','-13',291],
                ['10','-10',242],
                ['10','-8',265],
                ['11','-8',162],
                ['11','-4',149],
                ['11','6',158], 
                ['12','-10',324],
                ['12','-13',344],
                ['12','-1',361],
                ['12','4',268],
                ['12','10',189],
                ['12','11',204],
                ['13','-10',79],
                ['13','-1',134],
                ['13','3',91],
                ['13','4',118],
                ['13','6',149],
                ['14','4',99],
                ['14','7',68],
                ['15','-13',152],
                ['15','-10',168],
                ['15','3',218],
                ['15','6',192],
                ['15','7',242],
                ['15','11',193],
                ['16','11',241],
                ['16','12',139],
                ['16','13',324],
                ['16','14',264],
                ['17','-12',168],
                ['17','-9',168],
                ['17','2',45],
                ['17','12',30],
                ['18','11',197],
                ['18','12',102],
                ['18','16',212],
                ['18','15',206],
                ['19','2',231],
                ['19','3',174],
                ['19','6',262],
                ['19','11',141],
                ['20','3',215],
                ['20','12',142],
                ['20','16',187],
                ['21','3',121],
                ['21','6',103],
                ['21','12',57],
                ['22','2',61],
                ['22','3',135],
                ['22','6',96]];

        option = {
            tooltip : {
                trigger: 'axis',
                showDelay : 0,
                axisPointer:{
                    show: false,
                    type : 'line',
                    lineStyle: {
                        type : 'dashed',
                        width : 0
                    }
                }
            },
            legend: {
                data:['scatter1']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: false},
                    dataZoom : {show: true},
                    dataView : {show: true, readOnly: false},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            xAxis : [
                {
                    type : 'value',
                    scale: true
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    scale: false
                }
            ],
            series : [
                {
                    name:'relationship',
                    type:'scatter',
                    symbolSize: function (value){
                        return Math.round(value[2] / 11);
                    },
                    data: source,
                }
            ]
        };


        myChart.setOption(option);

</script>
</body>
</html>
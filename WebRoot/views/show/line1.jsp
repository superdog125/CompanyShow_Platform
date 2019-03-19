<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>水质数据综合显示</title>
    <script src="../../layuiadmin/js/jquery.min.js"></script>
    <script type="text/javascript" src="../../layuiadmin/js/echarts.js"></script>
    
    <link href="../../layuiadmin/css/bootstrap.css" rel="stylesheet" />
    <script src="../../layuiadmin/js/bootstrap.js"></script>

    <link href="../../layuiadmin/css/bootstrap-table.css" rel="stylesheet"/>
    <script src="../../layuiadmin/js/bootstrap-table.js"></script>
    <script src="../../layuiadmin/js/bootstrap-table-zh-CN.js"></script>

    <link href="../../layuiadmin/css/bootstrap-datetimepicker.css" rel="stylesheet"/>
    <script src="../../layuiadmin/js/bootstrap-datetimepicker.js"></script>
    <script src="../../layuiadmin/js/bootstrap-datetimepicker.zh-CN.js"></script>

    <link rel="stylesheet" type="text/css" href="../../layuiadmin/css/lines.css">
</head>
<body>
<center>
    <form  method="post" action="http://localhost:8080/My_UnmannedShip_Test/websocket" id="formSearch" class="form-horizontal">
    <!-- <form  method="post" action="http://106.14.149.68:8080/My_UnmannedShip/websocket" id="formSearch" class="form-horizontal"> -->
        <div class="row form-group">
            <label class="col-sm-1 control-label" for="date1">起始:</label>
            <div class="col-sm-3">   
            <div class="input-group date" id='date1'>  
                <input type="text" class="form-control" name="startTime" readonly>
                <span class="input-group-addon">  
                    <i class="glyphicon glyphicon-calendar"></i>  
                </span>  
            </div>
            </div>

            <label class="col-sm-1 control-label" for="date2">结束:</label>
            <div class="col-sm-3">
            <div class="input-group date" id='date2'>  
                <input type="text" class="form-control" name="endTime" readonly>       
                <span class="input-group-addon">  
                    <i class="glyphicon glyphicon-calendar"></i>  
                </span>  
            </div>
            </div>

            <div class="col-sm-4" style="text-align:left;">
                <input type="button" style="margin-left:50px" id="search" class="btn btn-primary" value="查询" onclick="query()">
            </div>
        </div>
    </form>


    <div id="chart_ph"></div>

    <div id="chart_water_temperature" ></div>

    <div id="chart_ship_temperature" ></div>

    <div id="chart_velocity" ></div>
</center>
</body>
<script type="text/javascript">
    function sleep(d){
        for (var t = Date.now(); Date.now() - t <= d; );
    }

    // 初始化图表标签
    var myChart_ph = echarts.init(document.getElementById('chart_ph'));
    //myChart.showLoading();
    var options_ph = {
                        title:{
                            text:'PH值'
                        },
                        legend:{
                            data:['时间']
                        },
                        //X轴设置
                        xAxis:{
                            name :'时间',
                            data: (function (){
                            var res = [];
                            var len = 20;
                            while (len--) {
                                var now = (new Date()).toLocaleTimeString().replace(/^\D*/,'');
                                //只显示秒
                                //var now = (new Date().getSeconds());
                                //sleep(1000);
                                res.push(now); 
                            }
                            return res;
                        })()
                        },
                        //y轴不设置意味着y轴的数值随传进来参数最值自动给出波动范围
                        yAxis:{
                        },
                        //name=legend.data的时候才能显示图例
                        series:[{
                            name:'时间',
                            type:'line',
                            data:(function(){
                            var res = [];
                            var len = 20;
                            while (len--) {
                                res.push(0);
                            }
                            return res;
                        })()
                        }]
                };      
                myChart_ph.setOption(options_ph);
    //***********************************************************//
    // 初始化图表标签
    var myChart_water_temperature = echarts.init(document.getElementById('chart_water_temperature'));
    //myChart.showLoading();
    var options_water_temperature = {
                        title:{
                            text:'水温'
                        },
                        legend:{
                            data:['时间']
                        },
                        //X轴设置
                        xAxis:{
                            name :'时间',
                            data: (function (){
                            var res = [];
                            var len = 20;
                            while (len--) {
                                var now = (new Date()).toLocaleTimeString().replace(/^\D*/,'');
                                //只显示秒
                                //var now = (new Date().getSeconds());
                                //sleep(1000);
                                res.push(now); 
                            }
                            return res;
                        })()
                        },
                        //y轴不设置意味着y轴的数值随传进来参数最值自动给出波动范围
                        yAxis:{
                        },
                        //name=legend.data的时候才能显示图例
                        series:[{
                            name:'时间',
                            type:'line',
                            data:(function(){
                            var res = [];
                            var len = 20;
                            while (len--) {
                                res.push(0);
                            }
                            return res;
                        })()
                        }]
                };      
                myChart_water_temperature.setOption(options_water_temperature);
    //************************************************************//
    // 初始化图表标签
    var myChart_ship_temperature = echarts.init(document.getElementById('chart_ship_temperature'));
    //myChart.showLoading();
    var options_ship_temperature = {
                        title:{
                            text:'船体温度'
                        },
                        legend:{
                            data:['时间']
                        },
                        //X轴设置
                        xAxis:{
                            name :'时间',
                            data: (function (){
                            var res = [];
                            var len = 20;
                            while (len--) {
                                var now = (new Date()).toLocaleTimeString().replace(/^\D*/,'');
                                //只显示秒
                                //var now = (new Date().getSeconds());
                                //sleep(1000);
                                res.push(now); 
                            }
                            return res;
                        })()
                        },
                        //y轴不设置意味着y轴的数值随传进来参数最值自动给出波动范围
                        yAxis:{
                        },
                        //name=legend.data的时候才能显示图例
                        series:[{
                            name:'时间',
                            type:'line',
                            data:(function(){
                            var res = [];
                            var len = 20;
                            while (len--) {
                                res.push(0);
                            }
                            return res;
                        })()
                        }]
                };      
                myChart_ship_temperature.setOption(options_ship_temperature);
    //************************************************************//
    // 初始化图表标签
    var myChart_velocity = echarts.init(document.getElementById('chart_velocity'));
    //myChart.showLoading();
    var options_velocity = {
                        title:{
                            text:'船速'
                        },
                        legend:{
                            data:['时间']
                        },
                        //X轴设置
                        xAxis:{
                            name :'时间',
                            data: (function (){
                            var res = [];
                            var len = 20;
                            while (len--) {
                                var now = (new Date()).toLocaleTimeString().replace(/^\D*/,'');
                                //只显示秒
                                //var now = (new Date().getSeconds());
                                //sleep(1000);
                                res.push(now); 
                            }
                            return res;
                        })()
                        },
                        //y轴不设置意味着y轴的数值随传进来参数最值自动给出波动范围
                        yAxis:{
                        },
                        //name=legend.data的时候才能显示图例
                        series:[{
                            name:'时间',
                            type:'line',
                            data:(function(){
                            var res = [];
                            var len = 20;
                            while (len--) {
                                res.push(0);
                            }
                            return res;
                        })()
                        }]
                };      
                myChart_velocity.setOption(options_velocity);


    $('#date1').datetimepicker({
        format: 'yyyy-mm-dd hh:ii',
        initialDate: new Date(),    //初始化当前日期
        autoclose: true,        //选中自动关闭
        todayBtn: true      //显示今日按钮
    });
    $('#date2').datetimepicker({
        format: 'yyyy-mm-dd hh:ii',
        initialDate: new Date(),    //初始化当前日期
        autoclose: true,        //选中自动关闭
        todayBtn: true      //显示今日按钮
    });


    var websocket = null;
    if ('WebSocket' in window) {
        //websocket = new WebSocket("ws://106.14.149.68:8080/My_UnmannedShip/websocket");
        websocket = new WebSocket("ws://localhost:8080/My_UnmannedShip_Test/websocket");
    }
    else {
        alert('当前浏览器 Not support websocket');
    }
    //连接成功建立的回调方法
    websocket.onopen = function() {
        //setMessageInnerHTML("WebSocket连接成功");
        alert("WebSocket连接成功");
        websocket.send("连接成功啦，快给我发数据吧");
       
    }
    //连接发生错误的回调方法
    websocket.onerror = function () {
        //setMessageInnerHTML("WebSocket连接发生错误");
        alert("WebSocket连接发生错误");
    }
    //接收到消息的回调方法
    var a = new Array();
    var b = new Array();
    //var arr = new Array();
    websocket.onmessage = function(event) {
        //数据解析
        //setMessageInnerHTML(event.data); 
        var str = event.data;   
        //var arr = str.split(",");
        var obj = JSON.parse(str);  //将和后端传来的json字符串解析去掉""
        var ph = obj.ph;    //解析去掉引号之后才可以这样调用属性值
        var water_temperature = obj.water_temperature;
        var ship_temperature = obj.ship_temperature;
        var velocity = obj.velocity;
        //console.log(obj.ph);
        //console.log(obj.water_temperature);
        //console.log(obj.ship_temperature);
        //console.log(obj.velocity);
        var now = (new Date()).toLocaleTimeString().replace(/^\D*/,'');
        //var now = (new Date().getSeconds());
        setLine_ph(now,ph);
        setLine_water_temperature(now,water_temperature);
        setLine_ship_temperature(now,ship_temperature);
        setLine_velocity(now,velocity);
        }
    //连接关闭的回调方法
    websocket.onclose = function() { 
        //setMessageInnerHTML("WebSocket连接关闭");
        alert("WebSocket连接关闭");
    }


    //将消息显示在网页上
    /*function setMessageInnerHTML(innerHTML) {
        document.getElementById('text').innerHTML += innerHTML + '<br/>';
    }*/

    function setLine_ph(time,ph) {
        var option = myChart_ph.getOption();
        option.series[0].data.shift();
        option.series[0].data.push(ph);
        option.xAxis[0].data.shift();
        option.xAxis[0].data.push(time);
        myChart_ph.setOption(option);
        //myChart.hideLoading();
    }

    function setLine_water_temperature(time,water_temperature) {
        var option = myChart_water_temperature.getOption();
        option.series[0].data.shift();
        option.series[0].data.push(water_temperature);
        option.xAxis[0].data.shift();
        option.xAxis[0].data.push(time);
        myChart_water_temperature.setOption(option);
        //myChart.hideLoading();
    }

    function setLine_ship_temperature(time,ship_temperature) {
        var option = myChart_ship_temperature.getOption();
        option.series[0].data.shift();
        option.series[0].data.push(ship_temperature);
        option.xAxis[0].data.shift();
        option.xAxis[0].data.push(time);
        myChart_ship_temperature.setOption(option);
        //myChart.hideLoading();
    }

    function setLine_velocity(time,velocity) {
        var option = myChart_velocity.getOption();
        option.series[0].data.shift();
        option.series[0].data.push(velocity);
        option.xAxis[0].data.shift();
        option.xAxis[0].data.push(time);
        myChart_velocity.setOption(option);
        //myChart.hideLoading();
    }

    function query() {
        var jsonObj = {startTime: $("#date1 input[name=startTime]").val(),endTime: $("#date2 input[name=endTime]").val()};
        var jsonStr = JSON.stringify(jsonObj);
        websocket.send(jsonStr);
        console.log(jsonStr);

        var ph = [];
        var water_temperature = [];
        var ship_temperature = [];
        var velocity = [];
        var time = [];

        websocket.onmessage = function(event) {
            //数据解析
            //setMessageInnerHTML(event.data);
            console.log(event.data);
            var str = event.data;   
            var obj = JSON.parse(str);  //将和后端传来的json字符串解析去掉""
            ph.push(obj.ph);    //解析去掉引号之后才可以这样调用属性值
            water_temperature.push(obj.water_temperature);
            ship_temperature.push(obj.ship_temperature);
            velocity.push(obj.velocity);
            time.push(obj.time);
            var myChart_ph = echarts.init(document.getElementById('chart_ph'));
            var options_ph = {
                        title:{
                            text:'PH值'
                        },
                        legend:{
                            data:['时间']
                        },
                        //X轴设置
                        xAxis:{
                            name :'时间',
                            data: time
                        },
                        //y轴不设置意味着y轴的数值随传进来参数最值自动给出波动范围
                        yAxis:{
                        },
                        //name=legend.data的时候才能显示图例
                        series:[{
                            name:'时间',
                            type:'line',
                            data:ph
                        }]
                };      
                myChart_ph.setOption(options_ph);
//*********************************************************************************/
            var myChart_water_temperature = echarts.init(document.getElementById('chart_water_temperature'));
            //myChart.showLoading();
            var options_water_temperature = {
                        title:{
                            text:'水温'
                        },
                        legend:{
                            data:['时间']
                        },
                        //X轴设置
                        xAxis:{
                            name :'时间',
                            data: time
                        },
                        //y轴不设置意味着y轴的数值随传进来参数最值自动给出波动范围
                        yAxis:{
                        },
                        //name=legend.data的时候才能显示图例
                        series:[{
                            name:'时间',
                            type:'line',
                            data:water_temperature
                        }]
                };      
                myChart_water_temperature.setOption(options_water_temperature);
        }
    }
//*****************************************************************************//
            var myChart_ship_temperature = echarts.init(document.getElementById('chart_ship_temperature'));
            //myChart.showLoading();
            var options_ship_temperature = {
                        title:{
                            text:'船体温度'
                        },
                        legend:{
                            data:['时间']
                        },
                        //X轴设置
                        xAxis:{
                            name :'时间',
                            data: time
                        },
                        //y轴不设置意味着y轴的数值随传进来参数最值自动给出波动范围
                        yAxis:{
                        },
                        //name=legend.data的时候才能显示图例
                        series:ship_temperature
                };      
                myChart_ship_temperature.setOption(options_ship_temperature);
//*************************************************************************/
            var myChart_velocity = echarts.init(document.getElementById('chart_velocity'));
            //myChart.showLoading();
            var options_velocity = {
                        title:{
                            text:'船速'
                        },
                        legend:{
                            data:['时间']
                        },
                        //X轴设置
                        xAxis:{
                            name :'时间',
                            data: time
                        },
                        //y轴不设置意味着y轴的数值随传进来参数最值自动给出波动范围
                        yAxis:{
                        },
                        //name=legend.data的时候才能显示图例
                        series:[{
                            name:'时间',
                            type:'line',
                            data:velocity
                        }]
                };      
                myChart_velocity.setOption(options_velocity);

    //关闭WebSocket连接
    function closeWebSocket() {
       websocket.close();
    }
</script>
</html>





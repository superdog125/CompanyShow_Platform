<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <title>车辆行驶数据</title>
    <script src="${pageContext.request.contextPath}/layuiadmin/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/layuiadmin/js/FileSaver.min.js"></script>
    <script src="${pageContext.request.contextPath}/layuiadmin/js/xlsx.core.min.js"></script>
    
    <link href="${pageContext.request.contextPath}/layuiadmin/css/bootstrap.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/layuiadmin/js/bootstrap.js"></script>

    <link href="${pageContext.request.contextPath}/layuiadmin/css/bootstrap-table.css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/layuiadmin/js/bootstrap-table.js"></script>
    <script src="${pageContext.request.contextPath}/layuiadmin/js/bootstrap-table-zh-CN.js"></script>

    <script src="${pageContext.request.contextPath}/layuiadmin/js/tableExport.js"></script>
    <script src="${pageContext.request.contextPath}/layuiadmin/js/bootstrap-table-export.js"></script>
    <link href="${pageContext.request.contextPath}/layuiadmin/css/tableExport.css" rel="stylesheet" />

    <link href="${pageContext.request.contextPath}/layuiadmin/css/bootstrap-datetimepicker.css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/layuiadmin/js/bootstrap-datetimepicker.js"></script>
    <script src="${pageContext.request.contextPath}/layuiadmin/js/bootstrap-datetimepicker.zh-CN.js"></script>
    
    
    
    
    <!-- 
    <script src="../../layuiadmin/js/jquery.min.js"></script>
    <script src="../../layuiadmin/js/FileSaver.min.js"></script>
    <script src="../../layuiadmin/js/xlsx.core.min.js"></script>
    
    <link href="../../layuiadmin/css/bootstrap.css" rel="stylesheet" />
    <script src="../../layuiadmin/js/bootstrap.js"></script>

    <link href="../../layuiadmin/css/bootstrap-table.css" rel="stylesheet"/>
    <script src="../../layuiadmin/js/bootstrap-table.js"></script>
    <script src="../../layuiadmin/js/bootstrap-table-zh-CN.js"></script>

    <script src="../../layuiadmin/js/tableExport.js"></script>
    <script src="../../layuiadmin/js/bootstrap-table-export.js"></script>
    <link href="../../layuiadmin/css/tableExport.css" rel="stylesheet" />

    <link href="../../layuiadmin/css/bootstrap-datetimepicker.css" rel="stylesheet"/>
    <script src="../../layuiadmin/js/bootstrap-datetimepicker.js"></script>
    <script src="../../layuiadmin/js/bootstrap-datetimepicker.zh-CN.js"></script>
     -->
</head>
<body>
    <div class="panel-body" style="padding-bottom:0px;">      
        <div id="toolbar" class="btn-group">
            <button id="btn_add" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
            </button>
            <button id="btn_edit" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
            </button>
            <button id="btn_delete" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
            </button>
        </div>
    
        
	    <form method="post" action="${pageContext.request.contextPath}/carinfo_add">
	        <div class="modal fade" id="addCarInfo" role="dialog">
			      <div class="modal-dialog">
			        <div class="modal-content">
			          <div class="modal-header">
			            <!-- <button type="button" class="close" data-dismiss="modal">&times;</button>-->
			            <h4 class="modal-title">添加车辆行驶信息</h4>
			          </div>
			          <div id="addCarInfoModal" class="modal-body">
			            <div class="form-horizontal">
			           
			              <div class="form-group">
			                <label for="add_cid" class="col-sm-2 control-label">车辆序号:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="car.cid" id="add_cid" type="text" readonly>
			                  <button id="btn_add" type="button" class="btn btn-default" onclick="window.open('${pageContext.request.contextPath}/views/show/table_car.jsp?select=true','','width=800,height=600,top='+(screen.height-600)/2+',left='+(screen.width-800)/2 + '')">
                					选择车辆
            					</button>
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="add_did" class="col-sm-2 control-label">司机编号:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="driver.did" id="add_did" type="text" readonly>
			                   <button id="btn_add" type="button" class="btn btn-default" onclick="window.open('${pageContext.request.contextPath}/views/show/table_driver.jsp?select=true','','width=800,height=600,top='+(screen.height-600)/2+',left='+(screen.width-800)/2 + '')">
                					选择驾驶员
            					</button>
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="add_cistart" class="col-sm-2 control-label">起点:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="cistart" id="add_cistart" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="add_ciend" class="col-sm-2 control-label">终点:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="ciend" id="add_ciend" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="add_cicost" class="col-sm-2 control-label">花费:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="cicost" id="add_cicost" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="add_cioil" class="col-sm-2 control-label">油耗:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="cioil" id="add_cioil" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="add_citime" class="col-sm-2 control-label">行驶时间:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="citime" id="add_citime" type="text">
			                </div>
			              </div>
			            </div>
			          </div>
			          <div class="modal-footer">
			            <div class="center-block">
			              <button id="cancelAdd" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			              <button id="addCarInfoBtn" type="submit" class="btn btn-success">保存</button>
			            </div>
			          </div>
			        </div>
			      </div>
			</div>
		</form>
	
		<form method="post" action="${pageContext.request.contextPath}/carinfo_update">
			<div class="modal fade" id="editCarInfo" role="dialog">
	        <div class="modal-dialog">
	          <div class="modal-content">
	            <div class="modal-header">
	              <button type="button" class="close" data-dismiss="modal">&times;</button>
	              <h4 class="modal-title">修改车辆行驶信息</h4>
	            </div>
	            <div id="editCarInfoModal" class="modal-body">
	              <div class="form-horizontal">	
	              	<div class="form-group">
		                <label for="edit_ciid" class="col-sm-2 control-label">序号:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="ciid" id="edit_ciid" type="text" readonly>
		                </div>
		              </div>                          	 
	              	  <div class="form-group">
		                <label for="edit_cid" class="col-sm-2 control-label">车辆序号:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="car.cid" id="edit_cid" type="text"  readonly>
		                  <button id="btn_add" type="button" class="btn btn-default" onclick="window.open('${pageContext.request.contextPath}/views/show/table_car.jsp?select=true','','width=800,height=600,top='+(screen.height-600)/2+',left='+(screen.width-800)/2 + '')">
                					选择车辆
            					</button>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="edit_did" class="col-sm-2 control-label">司机编号:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="driver.did" id="edit_did" type="text" readonly>
		                  <button id="btn_add" type="button" class="btn btn-default" onclick="window.open('${pageContext.request.contextPath}/views/show/table_driver.jsp?select=true','','width=800,height=600,top='+(screen.height-600)/2+',left='+(screen.width-800)/2 + '')">
                					选择驾驶员
            					</button>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="edit_cistart" class="col-sm-2 control-label">起点:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="cistart" id="edit_cistart" type="text">
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="edit_ciend" class="col-sm-2 control-label">终点:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="ciend" id="edit_ciend" type="text">
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="edit_cicost" class="col-sm-2 control-label">花费:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="cicost" id="edit_cicost" type="text">
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="edit_cioil" class="col-sm-2 control-label">油耗:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="cioil" id="edit_cioil" type="text">
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="edit_citime" class="col-sm-2 control-label">行驶时间:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="citime" id="edit_citime" type="text">
		                </div>
		              </div>
	              </div>
	            </div>
	            <div class="modal-footer">
	              <div class="center-block">
	                <button id="cancelEdit" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	                <button id="saveEdit" type="submit" class="btn btn-success">保存</button>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	      </form>
	      
	      <form method="post" action="${pageContext.request.contextPath}/carinfo_delete">
		      <div class="modal fade" id="deleteCarInfo" role="dialog">
		      <div class="modal-dialog">
		        <div class="modal-content">
		          <div class="modal-header">
		            <button type="button" class="close" data-dismiss="modal">&times;</button>
		            <h4 class="modal-title">确认要删除吗？</h4>
		            <h5><font style="color: red">*删除记录的同时会删除该记录下的车辆</font></h5>
		          </div>
		          <div id="deleteCarInfoModal" class="modal-body">
	              <div class="form-horizontal">
	              	  <div class="form-group">
		                <label for="delete_ciid" class="col-sm-2 control-label">序号:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="ciid" id="delete_ciid" type="text" readonly>
		                </div>
		              </div>
	              	  <div class="form-group">
		                <label for="delete_cid" class="col-sm-2 control-label">车辆序号:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="car.cid" id="delete_cid" type="text" readonly>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="delete_did" class="col-sm-2 control-label">司机编号:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="did" id="delete_did" type="text" readonly>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="delete_cistart" class="col-sm-2 control-label">起点:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="cistart" id="delete_cistart" type="text" readonly>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="delete_ciend" class="col-sm-2 control-label">终点:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="ciend" id="delete_ciend" type="text" readonly>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="delete_cicost" class="col-sm-2 control-label">花费:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="cicost" id="delete_cicost" type="text" readonly>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="delete_cioil" class="col-sm-2 control-label">油耗:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="cioil" id="delete_cioil" type="text" readonly>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="delete_citime" class="col-sm-2 control-label">行驶时间:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="citime" id="delete_citime" type="text" readonly>
		                </div>
		              </div>
	              </div>
	            </div>
		          <div class="modal-footer">
		            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		            <button id="delete" type="submit" class="btn btn-danger">删除</button>
		          </div>
		        </div>
		      </div>
		    </div>
		 </form>
			
	    <div id="atable">
	    <table id="table" class="table table-hover table-bordered" data-toggle="table" data-url="" >
	    </table>
	    </div>
</div>

    <script type="text/javascript">
      $("#btn_add").click(function(){
	      console.log('add');
	      $("#addCarInfo").modal()
    	});
    	
      $("#btn_edit").click(function(){
	      console.log('edit');
	      var a= $("table").bootstrapTable("getSelections");
		  if(a.length==1){
     		console.log(a);
     		$("#editCarInfo").modal()
     		
     		$("#edit_ciid").val(a[0].ciid);
     		$("#edit_cid").val(a[0].cid);
     		$("#edit_did").val(a[0].did);  
     		$("#edit_cistart").val(a[0].cistart);
     		$("#edit_ciend").val(a[0].ciend);
     		$("#edit_cicost").val(a[0].cicost);
     		$("#edit_cioil").val(a[0].cioil);
     		$("#edit_citime").val(a[0].citime);
    
		  }else{
		    alert("请选中一行")
		  }
    	});
    	
    
      $("#btn_delete").click(function(){
	      console.log('l_delete');
	      var a= $("table").bootstrapTable("getSelections");
		  if(a.length==1){
     		console.log(a);
     		$("#deleteCarInfo").modal()
     		
     		$("#delete_ciid").val(a[0].ciid);
     		$("#delete_cid").val(a[0].cid);
     		$("#delete_did").val(a[0].did);
     		$("#delete_cistart").val(a[0].cistart);
     		$("#delete_ciend").val(a[0].ciend);
     		$("#delete_cicost").val(a[0].cicost);
     		$("#delete_cioil").val(a[0].cioil);
     		$("#delete_citime").val(a[0].citime);
    
		  }else{
		    alert("请选中一行")
		  }
    	});
    	
      window.operateEvents = {
          'click #l_add': function (e, value, row, index) {
          $("#addCarInfo").modal();
      }
    };	
    	

	  $("#l_add").click(function(){
	      console.log('l_add');
	      $("#addCarInfo").modal()
    	});
    	
      $("#l_edit").click(function(){
	      console.log('l_edit');
	      var a= $("table").bootstrapTable("getSelections");
		  if(a.length==1){
     		console.log(a);
     		$("#editCarInfo").modal()
     		
     		$("#edit_cid").val(a[0].cid);
     		$("#edit_cbrand").val(a[0].cbrand);
     		$("#edit_cid").val(a[0].cid);
     		$("#edit_cfix").val(a[0].cfix);
     		$("#edit_cproblem").val(a[0].cproblem);
     		$("#edit_ccheck").val(a[0].ccheck);
    
		  }else{
		    alert("请选中一行")
		  }
    	});
    	
      $("#l_delete").click(function(){
	      console.log('l_delete');
	      var a= $("table").bootstrapTable("getSelections");
		  if(a.length==1){
     		console.log(a);
     		$("#deleteCarInfo").modal()
     		
     		$("#delete_cid").val(a[0].cid);
     		$("#delete_cbrand").val(a[0].cbrand);
     		$("#delete_cid").val(a[0].cid);
     		$("#delete_cfix").val(a[0].cfix);
     		$("#delete_cproblem").val(a[0].cproblem);
     		$("#delete_ccheck").val(a[0].ccheck);
    
		  }else{
		    alert("请选中一行")
		  }
    	});
   
    	
      function initTable() {  
          $("#table").bootstrapTable('destroy');
          $("#table").bootstrapTable({ // 对应table标签的id
            ajax: function ajaxReqDate(result) {
            console.log(result);
            $.ajax({
                    type: "get",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    url: "carinfo_find.action" ,
                    data: "",
                    success: function (msg) {
                        
                        console.log(msg);//打印服务端返回的数据(调试用)
                        if (result.resultCode == 200) {
                            alert("连接成功");
                        };
                        result.success({
                          row: msg
                        });
                        $("#table").bootstrapTable('load', msg);
                    },
                    error : function(msg) {
                        console.log(msg);
                        alert("没有连接成功！");
                    }
                });

            },
            cache: true, // 设置为 false 禁用 AJAX 数据缓存， 默认为true
            striped: true,  //表格显示 条纹，默认为false
            pagination: true, // 在表格底部显示分页组件，默认false
            pageList: [10, 25, 50], // 设置页面可以显示的数据条数
            pageSize: 10, // 页面数据条数
            pageNumber: 1, // 首页页码
            toolbar: '#toolbar',  //工具按钮用哪个容器
            search: true,   //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: true,
            showRefresh: true,   //是否显示刷新按钮
            showExport: true, //是否显示导出按钮
            exportDataType: "all", //导出表格数据方式，basic'导出当前页, 'all'导出全部, 'selected'导出选中项
            showColumns: true,    //是否显示所有列
            showToggle: false,      //是否显示详细视图和列表视图的切换按钮
            cardView: false,   //是否显示详细视图
            detailView: false,  //是否显示父子表
            searchOnEnterKey: true,
            search: true,
            sidePagination: 'client', // 设置为服务器端分页
            uniqueId: "id",     //每一行的唯一标识，一般为主键列
            columns: [
            {
                checkbox: true, // 显示一个勾选框
                align: 'center' // 居中显示
            }, {
                sortable: true,
                field: 'ciid', // 返回json数据中的name
                title: '序号', // 表格表头显示文字
                align: 'center', // 左右居中
                valign: 'middle' // 上下居中
            }, {
                sortable: true,
                field: 'cid',
                title: '车牌序号',
                align: 'center',
                valign: 'middle'
            }, {
                sortable: true,
                field: 'did',
                title: '司机编号',
                align: 'center',
                valign: 'middle'
            }, {
                sortable: true,
                field: 'cistart',
                title: '起点',
                align: 'center',
                valign: 'middle'
            }, {
                sortable: true,
                field: 'ciend',
                title: '终点',
                align: 'center',
                valign: 'middle'
            }, {
                sortable: true,
                field: 'cicost',
                title: '花费',
                align: 'center',
                valign: 'middle'
            },{
                sortable: true,
                field: 'cioil',
                title: '油耗',
                align: 'center',
                valign: 'middle'
            },{
                sortable: true,
                field: 'citime',
                title: '行驶时间',
                align: 'center',
                valign: 'middle',
            },
          ],
            onLoadSuccess: function(){  //加载成功时执行
                console.info("加载成功");
            },
            onLoadError: function(){  //加载失败时执行
                console.info("加载数据失败");
            },
            onDblClickRow: function (row, $element) {
                var id = row.ID;
                console.log(row);
            	EditViewById(id, 'view');
            },
          });
    };
     

    $(document).ready(function() {
      initTable();

      //$("#search").bind("click", queryData); 

    });
</script>


</body>
</html>
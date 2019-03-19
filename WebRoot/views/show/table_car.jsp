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
    <title>车辆数据</title>

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
</head>
<body>
    <div class="panel-body" style="padding-bottom:0px;">      
        <div id="toolbar" class="btn-group">
        	<s:if test="#parameters.select==null">
            <button id="btn_add" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
            </button>
            <button id="btn_edit" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
            </button>
            <button id="btn_delete" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
            </button>
            </s:if>
            <s:else>
            <button id="btn_select" type="button" class="btn btn-default">
                	选择
            </button>
            </s:else>
        </div>
    
        
	    <form method="post" action="${pageContext.request.contextPath}/car_add">
	        <div class="modal fade" id="addCar" role="dialog">
			      <div class="modal-dialog">
			        <div class="modal-content">
			          <div class="modal-header">
			            <!-- <button type="button" class="close" data-dismiss="modal">&times;</button>-->
			            <h4 class="modal-title">添加车辆信息</h4>
			          </div>
			          <div id="addCarModal" class="modal-body">
			            <div class="form-horizontal">
			              <div class="form-group">
			                <label for="add_cbrand" class="col-sm-2 control-label">品牌:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="car.cbrand" id="add_cbrand" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="add_cnumber" class="col-sm-2 control-label">车牌号:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="car.cnumber" id="add_cnumber" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="add_cfix" class="col-sm-2 control-label">维修情况:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="car.cfix" id="add_cfix" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="add_cproblem" class="col-sm-2 control-label">故障信息:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="car.cproblem" id="add_cproblem" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="add_ccheck" class="col-sm-2 control-label">年检信息:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="car.ccheck" id="add_ccheck" type="text">
			                </div>
			              </div>
			            </div>
			          </div>
			          <div class="modal-footer">
			            <div class="center-block">
			              <button id="cancelAdd" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			              <button id="addCarBtn" type="submit" class="btn btn-success">保存</button>
			            </div>
			          </div>
			        </div>
			      </div>
			</div>
		</form>
	
		<form method="post" action="${pageContext.request.contextPath}/car_update">
			<div class="modal fade" id="editCar" role="dialog">
	        <div class="modal-dialog">
	          <div class="modal-content">
	            <div class="modal-header">
	              <button type="button" class="close" data-dismiss="modal">&times;</button>
	              <h4 class="modal-title">修改车辆信息</h4>
	            </div>
	            <div id="editCarModal" class="modal-body">
	              <div class="form-horizontal">	
	              	<div class="form-group">
		                <label for="delete_cid" class="col-sm-2 control-label">车辆序号:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="car.cid" id="edit_cid" type="text" readonly>
		                </div>
		              </div>              	 
	                  <div class="form-group">
		                <label for="edit_cbrand" class="col-sm-2 control-label">品牌:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="car.cbrand" id="edit_cbrand" type="text">
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="edit_cnumber" class="col-sm-2 control-label">车牌号:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="car.cnumber" id="edit_cnumber" type="text">
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="edit_cfix" class="col-sm-2 control-label">维修情况:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="car.cfix" id="edit_cfix" type="text">
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="edit_cproblem" class="col-sm-2 control-label">故障信息:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="car.cproblem" id="edit_cproblem" type="text">
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="edit_ccheck" class="col-sm-2 control-label">年检信息:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="car.ccheck" id="edit_ccheck" type="text">
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
	      
	      <form method="post" action="${pageContext.request.contextPath}/car_delete">
		      <div class="modal fade" id="deleteCar" role="dialog">
		      <div class="modal-dialog">
		        <div class="modal-content">
		          <div class="modal-header">
		            <button type="button" class="close" data-dismiss="modal">&times;</button>
		            <h4 class="modal-title">确认要删除吗？</h4>
		          </div>
		          <div id="editCarModal" class="modal-body">
	              <div class="form-horizontal">
	              	  <div class="form-group">
		                <label for="delete_cid" class="col-sm-2 control-label">车辆序号:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="car.cid" id="delete_cid" type="text" readonly>
		                </div>
		              </div>
	                  <div class="form-group">
		                <label for="delete_cbrand" class="col-sm-2 control-label">品牌:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="car.cbrand" id="delete_cbrand" type="text" readonly>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="delete_cnumber" class="col-sm-2 control-label">车牌号:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="car.cnumber" id="delete_cnumber" type="text" readonly>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="delete_cfix" class="col-sm-2 control-label">维修情况:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="car.cfix" id="delete_cfix" type="text" readonly>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="delete_cproblem" class="col-sm-2 control-label">故障信息:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="car.cproblem" id="delete_cproblem" type="text" readonly>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="delete_ccheck" class="col-sm-2 control-label">年检信息:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="car.ccheck" id="delete_ccheck" type="text" readonly>
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
	      $("#addCar").modal()
    	});
    	
      $("#btn_edit").click(function(){
	      console.log('edit');
	      var a= $("table").bootstrapTable("getSelections");
		  if(a.length==1){
     		console.log(a);
     		$("#editCar").modal()
     		
    		$("#edit_cid").val(a[0].cid);
     		$("#edit_cbrand").val(a[0].cbrand);
     		$("#edit_cnumber").val(a[0].cnumber);
     		$("#edit_cfix").val(a[0].cfix);
     		$("#edit_cproblem").val(a[0].cproblem);
     		$("#edit_ccheck").val(a[0].ccheck);
    
		  }else{
		    alert("请选中一行")
		  }
    	});
    
      $("#btn_delete").click(function(){
	      console.log('l_delete');
	      var a= $("table").bootstrapTable("getSelections");
		  if(a.length==1){
     		console.log(a);
     		$("#deleteCar").modal()
     		
     		$("#delete_cid").val(a[0].cid);
     		$("#delete_cbrand").val(a[0].cbrand);
     		$("#delete_cnumber").val(a[0].cnumber);
     		$("#delete_cfix").val(a[0].cfix);
     		$("#delete_cproblem").val(a[0].cproblem);
     		$("#delete_ccheck").val(a[0].ccheck);
    
		  }else{
		    alert("请选中一行")
		  }
    	});
    	
      window.operateEvents = {
          'click #l_add': function (e, value, row, index) {
          $("#addCar").modal();
      }
    };	
    	

	  $("#l_add").click(function(){
	      console.log('l_add');
	      $("#addCar").modal()
    	});
    	
      $("#l_edit").click(function(){
	      console.log('l_edit');
	      var a= $("table").bootstrapTable("getSelections");
		  if(a.length==1){
     		console.log(a);
     		$("#editCar").modal()
     		
     		$("#edit_cid").val(a[0].cid);
     		$("#edit_cbrand").val(a[0].cbrand);
     		$("#edit_cnumber").val(a[0].cnumber);
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
     		$("#deleteCar").modal()
     		
     		$("#delete_cid").val(a[0].cid);
     		$("#delete_cbrand").val(a[0].cbrand);
     		$("#delete_cnumber").val(a[0].cnumber);
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
                    type: "post",//方法类型
                    dataType: "json",//预期服务器返回的数据类型  符合预期的话会根据success方法自动处理
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    url: "car_find.action" ,
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
                field: 'cid', // 返回json数据中的name
                title: '车辆序号', // 表格表头显示文字
                align: 'center', // 左右居中
                valign: 'middle' // 上下居中
            }, {
                sortable: true,
                field: 'cbrand',
                title: '品牌',
                align: 'center',
                valign: 'middle'
            }, {
                sortable: true,
                field: 'cnumber',
                title: '车牌号',
                align: 'center',
                valign: 'middle'
            }, {
                sortable: true,
                field: 'cfix',
                title: '维修情况',
                align: 'center',
                valign: 'middle'
            }, {
                sortable: true,
                field: 'cproblem',
                title: '故障信息',
                align: 'center',
                valign: 'middle'
            }, {
                sortable: true,
                field: 'ccheck',
                title: '年检信息',
                align: 'center',
                valign: 'middle'
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
     
     $("#btn_select").click(function(){
     	//获得添加页面的window对象
		var win = window.opener;
		//获得添加页面的document对象
		var doc = win.document;
		//获得 文本框,并赋值
		var a= $("table").bootstrapTable("getSelections");
		doc.getElementById("add_cid").value=a[0].cid;
		doc.getElementById("edit_cid").value=a[0].cid;
		//关闭当前窗口
		window.close();
     }); 

    $(document).ready(function() {
      initTable();

      //$("#search").bind("click", queryData); 

    });
</script>


</body>
</html>
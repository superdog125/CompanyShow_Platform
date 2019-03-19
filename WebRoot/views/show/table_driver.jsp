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
    <title>司机数据</title>
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
    
        
	    <form method="post" action="${pageContext.request.contextPath}/driver_add">
	        <div class="modal fade" id="addDriver" role="dialog">
			      <div class="modal-dialog">
			        <div class="modal-content">
			          <div class="modal-header">
			            <!-- <button type="button" class="close" data-dismiss="modal">&times;</button>-->
			            <h4 class="modal-title">添加司机信息</h4>
			          </div>
			          <div id="addDriverModal" class="modal-body">
			            <div class="form-horizontal">
			              <div class="form-group">
			                <label for="add_dname" class="col-sm-2 control-label">姓名:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="driver.dname" id="add_dname" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="add_dphone" class="col-sm-2 control-label">手机号:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="driver.dphone" id="add_dphone" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="add_dpassword" class="col-sm-2 control-label">登录密码:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="driver.dpassword" id="add_dpassword" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="add_dworkyear" class="col-sm-2 control-label">工作年限:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="driver.dworkyear" id="add_dworkyear" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="add_dsex" class="col-sm-2 control-label">性别:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="driver.dsex" id="add_dsex" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="add_dage" class="col-sm-2 control-label">年龄:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="driver.dage" id="add_dage" type="text">
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
	
		<form method="post" action="${pageContext.request.contextPath}/driver_update">
			<div class="modal fade" id="editDriver" role="dialog">
	        <div class="modal-dialog">
	          <div class="modal-content">
	            <div class="modal-header">
	              <button type="button" class="close" data-dismiss="modal">&times;</button>
	              <h4 class="modal-title">修改车辆信息</h4>
	            </div>
	            <div id="editDriverModal" class="modal-body">
	            <div class="form-horizontal">	
	            	<div class="form-group">
		                <label for="delete_did" class="col-sm-2 control-label">司机编号:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="driver.did" id="edit_did" type="text" readonly>
		                </div>
		              </div>	                            	
	              	  <div class="form-group">
		                <label for="edit_dname" class="col-sm-2 control-label">姓名:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="driver.dname" id="edit_dname" type="text">
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="edit_dphone" class="col-sm-2 control-label">手机号:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="driver.dphone" id="edit_dphone" type="text">
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="edit_dpassword" class="col-sm-2 control-label">登录密码:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="driver.dpassword" id="edit_dpassword" type="text">
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="edit_dworkyear" class="col-sm-2 control-label">工作年限:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="driver.dworkyear" id="edit_dworkyear" type="text">
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="edit_dsex" class="col-sm-2 control-label">性别:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="driver.dsex" id="edit_dsex" type="text">
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="edit_dage" class="col-sm-2 control-label">年龄:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="driver.dage" id="edit_dage" type="text">
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
	      
	      <form method="post" action="${pageContext.request.contextPath}/driver_delete">
		      <div class="modal fade" id="deleteDriver" role="dialog">
		      <div class="modal-dialog">
		        <div class="modal-content">
		          <div class="modal-header">
		            <button type="button" class="close" data-dismiss="modal">&times;</button>
		            <h4 class="modal-title">确认要删除吗？</h4>
		          </div>
		          <div id="editDriverModal" class="modal-body">
	              <div class="form-horizontal">
	              	  <div class="form-group">
		                <label for="delete_did" class="col-sm-2 control-label">司机编号:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="driver.did" id="delete_did" type="text" readonly>
		                </div>
		              </div>
	              	  <div class="form-group">
		                <label for="delete_dname" class="col-sm-2 control-label">姓名:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="driver.dname" id="delete_dname" type="text" readonly>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="delete_dphone" class="col-sm-2 control-label">手机号:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="driver.dphone" id="delete_dphone" type="text" readonly>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="delete_dpassword" class="col-sm-2 control-label">登录密码:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="driver.dpassword" id="delete_dpassword" type="text" readonly>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="delete_dworkyear" class="col-sm-2 control-label">工作年限:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="driver.dworkyear" id="delete_dworkyear" type="text" readonly>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="delete_dsex" class="col-sm-2 control-label">性别:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="driver.dsex" id="delete_dsex" type="text" readonly>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="delete_dage" class="col-sm-2 control-label">年龄:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="driver.dage" id="delete_dage" type="text" readonly>
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
	      $("#addDriver").modal()
    	});
    	
      $("#btn_edit").click(function(){
	      console.log('edit');
	      var a= $("table").bootstrapTable("getSelections");
		  if(a.length==1){
     		console.log(a);
     		$("#editDriver").modal()
     		
     		$("#edit_did").val(a[0].did);
     		$("#edit_dname").val(a[0].dname);
     		$("#edit_dphone").val(a[0].dphone);
     		$("#edit_dpassword").val(a[0].dpassword);
     		$("#edit_dworkyear").val(a[0].dworkyear);
     		$("#edit_dsex").val(a[0].dsex);
     		$("#edit_dage").val(a[0].dage);
    
		  }else{
		    alert("请选中一行")
		  }
    	});
    
      $("#btn_delete").click(function(){
	      console.log('l_delete');
	      var a= $("table").bootstrapTable("getSelections");
		  if(a.length==1){
     		console.log(a);
     		$("#deleteDriver").modal()
     		
     		$("#delete_did").val(a[0].did);
     		$("#delete_dname").val(a[0].dname);
     		$("#delete_dphone").val(a[0].dphone);
     		$("#delete_dpassword").val(a[0].dpassword);
     		$("#delete_dworkyear").val(a[0].dworkyear);
     		$("#delete_dsex").val(a[0].dsex);
     		$("#delete_dage").val(a[0].dage);
    
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
                    type: "get",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    url: "driver_find.action" ,
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
                field: 'did', // 返回json数据中的name
                title: '司机序号', // 表格表头显示文字
                align: 'center', // 左右居中
                valign: 'middle' // 上下居中
            }, {
                sortable: true,
                field: 'dname',
                title: '姓名',
                align: 'center',
                valign: 'middle'
            }, {
                sortable: true,
                field: 'dphone',
                title: '手机号',
                align: 'center',
                valign: 'middle'
            }, {
                sortable: true,
                field: 'dpassword',
                title: '登录密码',
                align: 'center',
                valign: 'middle'
            }, {
                sortable: true,
                field: 'dworkyear',
                title: '入职时间',
                align: 'center',
                valign: 'middle'
            }, {
                sortable: true,
                field: 'dsex',
                title: '性别',
                align: 'center',
                valign: 'middle'
            },{
                sortable: true,
                field: 'dage',
                title: '年龄',
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
		doc.getElementById("add_did").value=a[0].did;
		doc.getElementById("edit_did").value=a[0].did;
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
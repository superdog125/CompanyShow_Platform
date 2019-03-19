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
    <title>用户管理</title>
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
    
        
	    <form method="post" action="${pageContext.request.contextPath}/user_add">
	        <div class="modal fade" id="addUser" role="dialog">
			      <div class="modal-dialog">
			        <div class="modal-content">
			          <div class="modal-header">
			            <!-- <button type="button" class="close" data-dismiss="modal">&times;</button>-->
			            <h4 class="modal-title">添加用户信息</h4>
			          </div>
			          <div id="addUserModal" class="modal-body">
			            <div class="form-horizontal">
			              <div class="form-group">
			                <label for="add_aname" class="col-sm-2 control-label">登录账号:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="user.loginName" id="add_aname" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="add_atname" class="col-sm-2 control-label">姓名:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="user.userName" id="add_atname" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="add_apassword" class="col-sm-2 control-label">密码:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="user.loginPwd" id="add_apassword" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="add_aphone" class="col-sm-2 control-label">手机号:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="user.telephone" id="add_aphone" type="text">
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
	
		<form method="post" action="${pageContext.request.contextPath}/user_update">
			<div class="modal fade" id="editUser" role="dialog">
	        <div class="modal-dialog">
	          <div class="modal-content">
	            <div class="modal-header">
	              <button type="button" class="close" data-dismiss="modal">&times;</button>
	              <h4 class="modal-title">修改用户信息</h4>
	            </div>
	            <div id="editUserModal" class="modal-body">
	              <div class="form-horizontal">
	              	<div class="form-group">
		                <label for="edit_aid" class="col-sm-2 control-label">用户序号:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="user.uid" id="edit_aid" type="text" readonly>
		                </div>
		              </div>	              		
	              	  	<div class="form-group">
			                <label for="edit_aname" class="col-sm-2 control-label">登录账号:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="user.loginName" id="edit_aname" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="edit_atname" class="col-sm-2 control-label">姓名:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="user.userName" id="edit_atname" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="edit_apassword" class="col-sm-2 control-label">密码:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="user.loginPwd" id="edit_apassword" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="edit_aphone" class="col-sm-2 control-label">手机号:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="user.telephone" id="edit_aphone" type="text">
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
	      
	      <form method="post" action="${pageContext.request.contextPath}/user_delete">
		      <div class="modal fade" id="deleteUser" role="dialog">
		      <div class="modal-dialog">
		        <div class="modal-content">
		          <div class="modal-header">
		            <button type="button" class="close" data-dismiss="modal">&times;</button>
		            <h4 class="modal-title">确认要删除吗？</h4>
		          </div>
		          <div id="editUserModal" class="modal-body">
	              <div class="form-horizontal">
	              	  <div class="form-group">
		                <label for="delete_aid" class="col-sm-2 control-label">用户序号:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="user.uid" id="delete_aid" type="text" readonly>
		                </div>
		              </div>
	                  <div class="form-group">
		                <label for="delete_aname" class="col-sm-2 control-label">登录账号:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="user.loginName" id="delete_aname" type="text" readonly>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="delete_atname" class="col-sm-2 control-label">姓名:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="user.userName" id="delete_atname" type="text" readonly>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="delete_apassword" class="col-sm-2 control-label">密码:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="user.loginPwd" id="delete_apassword" type="text" readonly>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="delete_aphone" class="col-sm-2 control-label">手机号:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="user.telephone" id="delete_aphone" type="text" readonly>
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
	      $("#addUser").modal()
    	});
    	
      $("#btn_edit").click(function(){
	      console.log('edit');
	      var a= $("table").bootstrapTable("getSelections");
		  if(a.length==1){
     		console.log(a);
     		$("#editUser").modal()
     		
    		$("#edit_aid").val(a[0].uid);
     		$("#edit_aname").val(a[0].loginName);
     		$("#edit_aphone").val(a[0].telephone);
     		$("#edit_apassword").val(a[0].loginPwd);
     		$("#edit_atname").val(a[0].userName);
    
		  }else{
		    alert("请选中一行");
		  }
    	});
    
      $("#btn_delete").click(function(){
	      console.log('l_delete');
	      var a= $("table").bootstrapTable("getSelections");
		  if(a.length==1){
     		console.log(a);
     		$("#deleteUser").modal()
     		
     		$("#delete_aid").val(a[0].uid);
     		$("#delete_aname").val(a[0].loginName);
     		$("#delete_aphone").val(a[0].telephone);
     		$("#delete_apassword").val(a[0].loginPwd);
     		$("#delete_atname").val(a[0].userName);
    
		  }else{
		    alert("请选中一行");
		  }
    	});
    	
      window.operateEvents = {
          'click #l_add': function (e, value, row, index) {
          $("#addUser").modal();
      }
    };	
    	

	  $("#l_add").click(function(){
	      console.log('l_add');
	      $("#addUser").modal()
    	});
    	
      $("#l_edit").click(function(){
	      console.log('l_edit');
	      var a= $("table").bootstrapTable("getSelections");
		  if(a.length==1){
     		console.log(a);
     		$("#editUser").modal()
     		
     		$("#edit_aid").val(a[0].aid);
     		$("#edit_aname").val(a[0].aname);
     		$("#edit_aphone").val(a[0].aphone);
     		$("#edit_apassword").val(a[0].apassword);
     		$("#edit_atname").val(a[0].atname)
    
		  }else{
		    alert("请选中一行")
		  }
    	});
    	
      $("#l_delete").click(function(){
	      console.log('l_delete');
	      var a= $("table").bootstrapTable("getSelections");
		  if(a.length==1){
     		console.log(a);
     		$("#deleteUser").modal()
     		
     		$("#delete_aid").val(a[0].aid);
     		$("#delete_aname").val(a[0].aname);
     		$("#delete_aphone").val(a[0].aphone);
     		$("#delete_apassword").val(a[0].apassword);
     		$("#delete_atname").val(a[0].atname);
    
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
                    url: "user_find.action" ,
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
            uniqueId: "uid",     //每一行的唯一标识，一般为主键列
            columns: [
            {
                checkbox: true, // 显示一个勾选框
                align: 'center' // 居中显示
            }, {
                sortable: true,
                field: 'uid', // 返回json数据中的name
                title: '用户序号', // 表格表头显示文字
                align: 'center', // 左右居中
                valign: 'middle' // 上下居中
            }, {
                sortable: true,
                field: 'userName',
                title: '姓名',
                align: 'center',
                valign: 'middle'
            },{
                sortable: true,
                field: 'loginName',
                title: '登录账号',
                align: 'center',
                valign: 'middle'
            },{
                sortable: true,
                field: 'loginPwd',
                title: '密码',
                align: 'center',
                valign: 'middle'
            },{
                sortable: true,
                field: 'telephone',
                title: '手机号',
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
     

    $(document).ready(function() {
      initTable();
	
      //$("#search").bind("click", queryData); 

    });
</script>


</body>
</html>
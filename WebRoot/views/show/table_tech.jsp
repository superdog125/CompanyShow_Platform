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
    <title>技工数据</title>
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
    
        
	    <form method="post" action="${pageContext.request.contextPath}/techer_add">
	        <div class="modal fade" id="addTecher" role="dialog">
			      <div class="modal-dialog">
			        <div class="modal-content">
			          <div class="modal-header">
			            <!-- <button type="button" class="close" data-dismiss="modal">&times;</button>-->
			            <h4 class="modal-title">添加技师信息</h4>
			          </div>
			          <div id="addTecherModal" class="modal-body">
			            <div class="form-horizontal">
			              <div class="form-group">
			                <label for="add_tname" class="col-sm-2 control-label">姓名:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="techer.tname" id="add_tname" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="add_tphone" class="col-sm-2 control-label">手机号:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="techer.tphone" id="add_tphone" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="add_tpassword" class="col-sm-2 control-label">登录密码:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="techer.tpassword" id="add_tpassword" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="add_tworkyear" class="col-sm-2 control-label">入职时间:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="techer.tworkyear" id="add_tworkyear" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="add_tsex" class="col-sm-2 control-label">性别:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="techer.tsex" id="add_tsex" type="text">
			                </div>
			              </div>
			              <div class="form-group">
			                <label for="add_tage" class="col-sm-2 control-label">年龄:*</label>
			                <div class="col-sm-10">
			                  <input class="form-control" name="techer.tage" id="add_tage" type="text">
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
	
		<form method="post" action="${pageContext.request.contextPath}/techer_update">
			<div class="modal fade" id="editTecher" role="dialog">
	        <div class="modal-dialog">
	          <div class="modal-content">
	            <div class="modal-header">
	              <button type="button" class="close" data-dismiss="modal">&times;</button>
	              <h4 class="modal-title">修改技师信息</h4>
	            </div>
	            <div id="editTecherModal" class="modal-body">
	              <div class="form-horizontal"> 
	              	<div class="form-group">
		                <label for="edit_tid" class="col-sm-2 control-label">技师序号:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="techer.tid" id="edit_tid" type="text" readonly>
		                </div>
		              </div>             	  
              	  <div class="form-group">
	                <label for="edit_tname" class="col-sm-2 control-label">姓名:*</label>
	                <div class="col-sm-10">
	                  <input class="form-control" name="techer.tname" id="edit_tname" type="text">
	                </div>
	              </div>
	              <div class="form-group">
	                <label for="edit_tphone" class="col-sm-2 control-label">手机号:*</label>
	                <div class="col-sm-10">
	                  <input class="form-control" name="techer.tphone" id="edit_tphone" type="text">
	                </div>
	              </div>
	              <div class="form-group">
	                <label for="edit_tpassword" class="col-sm-2 control-label">登录密码:*</label>
	                <div class="col-sm-10">
	                  <input class="form-control" name="techer.tpassword" id="edit_tpassword" type="text">
	                </div>
	              </div>
	              <div class="form-group">
	                <label for="edit_tworkyear" class="col-sm-2 control-label">入职时间:*</label>
	                <div class="col-sm-10">
	                  <input class="form-control" name="techer.tworkyear" id="edit_tworkyear" type="text">
	                </div>
	              </div>
	              <div class="form-group">
	                <label for="edit_tsex" class="col-sm-2 control-label">性别:*</label>
	                <div class="col-sm-10">
	                  <input class="form-control" name="techer.tsex" id="edit_tsex" type="text">
	                </div>
	              </div>
	              <div class="form-group">
	                <label for="edit_tage" class="col-sm-2 control-label">年龄:*</label>
	                <div class="col-sm-10">
	                  <input class="form-control" name="techer.tage" id="edit_tage" type="text">
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
	      
	      <form method="post" action="${pageContext.request.contextPath}/techer_delete">
		      <div class="modal fade" id="deleteTecher" role="dialog">
		      <div class="modal-dialog">
		        <div class="modal-content">
		          <div class="modal-header">
		            <button type="button" class="close" data-dismiss="modal">&times;</button>
		            <h4 class="modal-title">确认要删除吗？</h4>
		          </div>
		          <div id="editTecherModal" class="modal-body">
	              <div class="form-horizontal">
	              	  <div class="form-group">
		                <label for="delete_tid" class="col-sm-2 control-label">技师序号:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="techer.tid" id="delete_tid" type="text" readonly>
		                </div>
		              </div>
	                  <div class="form-group">
		                <label for="delete_tname" class="col-sm-2 control-label">姓名:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="techer.tname" id="delete_tname" type="text" readonly>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="delete_tphone" class="col-sm-2 control-label">手机号:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="techer.tphone" id="delete_tphone" type="text" readonly>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="delete_tpassword" class="col-sm-2 control-label">登录密码:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="techer.tpassword" id="delete_tpassword" type="text" readonly>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="delete_tworkyear" class="col-sm-2 control-label">入职时间:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="techer.tworkyear" id="delete_tworkyear" type="text" readonly>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="delete_tsex" class="col-sm-2 control-label">性别:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="techer.tsex" id="delete_tsex" type="text" readonly>
		                </div>
		              </div>
		              <div class="form-group">
		                <label for="delete_tage" class="col-sm-2 control-label">年龄:*</label>
		                <div class="col-sm-10">
		                  <input class="form-control" name="techer.tage" id="delete_tage" type="text" readonly>
		                </div>
		              </div>
		            </div>
			          </div>
			          <div class="modal-footer">
			            <div class="center-block">
			              <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			              <button id="delete" type="submit" class="btn btn-danger">删除</button>
			            </div>
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
	      $("#addTecher").modal()
    	});
    	
      $("#btn_edit").click(function(){
	      console.log('edit');
	      var a= $("table").bootstrapTable("getSelections");
		  if(a.length==1){
     		console.log(a);
     		$("#editTecher").modal()
     		
     		$("#edit_tid").val(a[0].tid);
     		$("#edit_tname").val(a[0].tname);
     		$("#edit_tphone").val(a[0].tphone);
     		$("#edit_tpassword").val(a[0].tpassword);
     		$("#edit_tworkyear").val(a[0].tworkyear);
     		$("#edit_tsex").val(a[0].tsex);
     		$("#edit_tage").val(a[0].tage);
    
		  }else{
		    alert("请选中一行")
		  }
    	});
    
      $("#btn_delete").click(function(){
	      console.log('delete');
	      var a= $("table").bootstrapTable("getSelections");
		  if(a.length==1){
     		console.log(a);
     		$("#deleteTecher").modal()
     		
     		$("#delete_tid").val(a[0].tid);
     		$("#delete_tname").val(a[0].tname);
     		$("#delete_tphone").val(a[0].tphone);
     		$("#delete_tpassword").val(a[0].tpassword);
     		$("#delete_tworkyear").val(a[0].tworkyear);
     		$("#delete_tsex").val(a[0].tsex);
     		$("#delete_tage").val(a[0].tage);
    
		  }else{
		    alert("请选中一行")
		  }
    	});
    	

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
                    url: "techer_find.action" ,
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
                field: 'tid', // 返回json数据中的name
                title: '技师序号', // 表格表头显示文字
                align: 'center', // 左右居中
                valign: 'middle' // 上下居中
            }, {
                sortable: true,
                field: 'tname',
                title: '姓名',
                align: 'center',
                valign: 'middle'
            }, {
                sortable: true,
                field: 'tphone',
                title: '手机号',
                align: 'center',
                valign: 'middle'
            }, {
                sortable: true,
                field: 'tpassword',
                title: '登录密码',
                align: 'center',
                valign: 'middle'
            }, {
                sortable: true,
                field: 'tworkyear',
                title: '入职时间',
                align: 'center',
                valign: 'middle'
            }, {
                sortable: true,
                field: 'tsex',
                title: '性别',
                align: 'center',
                valign: 'middle'
            },{
                sortable: true,
                field: 'tage',
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
     

    $(document).ready(function() {
      initTable();

      //$("#search").bind("click", queryData); 

    });
</script>


</body>
</html>
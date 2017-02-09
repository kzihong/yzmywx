<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cn.easycode.yzmywx.bean.vo.SessionInfo"%>
<%@ page import="cn.easycode.yzmywx.utils.ConfigUtil"%>
<%@ page import="cn.easycode.yzmywx.utils.SecurityUtil"%>
<%
	String contextPath = request.getContextPath();
	SessionInfo sessionInfo = (SessionInfo) session.getAttribute(ConfigUtil.getSessionInfoName());
	if (sessionInfo == null || sessionInfo.getUser() == null) {
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}
	SecurityUtil securityUtil = new SecurityUtil(session);
	
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<jsp:include page="../../inc.jsp"></jsp:include>
<script type="text/javascript">
	var grid;
	var addFun = function() {
		var dialog = parent.sy.modalDialog({
			title : '添加用户信息',
			height : 430,
			url : sy.contextPath + '/admin/system/userForm.jsp',
			buttons : [ {
				text : '添加',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			},{
				text : '取消',
				handler : function(){
					dialog.dialog('close');
				}
			} ]
		});
	};
	var showFun = function(id) {
		var dialog = parent.sy.modalDialog({
			title : '查看用户信息',
			url : sy.contextPath + '/admin/system/userForm.jsp?id=' + id,
			buttons : [ {
				text : '关闭',
				handler : function(){
					dialog.dialog('close');
				}
			} ]
		});
	};
	var editFun = function(id) {
		var dialog = parent.sy.modalDialog({
			title : '编辑用户信息',
			url : sy.contextPath + '/admin/system/userForm.jsp?id=' + id,
			buttons : [ {
				text : '编辑',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			},{
				text : '取消',
				handler : function(){
					dialog.dialog('close');
				}
			} ]
		});
	};
	var goDormant = function(id) {
		doActive(id,"0");
	};
	var goActive = function(id) {
		doActive(id,"1");
	};	
	function doActive(id,type){
		var msg = "激活";
		if(type == "0"){
			msg = "冻结";
		}
		parent.$.messager.confirm('询问', '您确定设置为<<<b style=\'font-size:18px;\'>' + msg + '</b>>>状态？', function(r) {
			if (r) {
				$.post(sy.contextPath + '/rest/user/active/' + id, {
					id : id
				}, function(result) {
					if(result.success){
						grid.datagrid('reload');
					}else{
						parent.$.messager.alert('提示', result.msg, 'info');
					}
				}, 'json');
			}
		});
	}
	
	var grantRoleFun = function(id) {
		var dialog = parent.sy.modalDialog({
			title : '修改角色',
			url : sy.contextPath + '/admin/system/userRoleGrant.jsp?id=' + id,
			buttons : [ {
				text : '设置角色',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			},{
				text : '取消',
				handler : function(){
					dialog.dialog('close');
				}
			} ]
		});
	};
	$(function() {
		grid = $('#grid').datagrid({
			title : '',
			url : sy.contextPath + '/rest/user/userList',
			striped : true,
			rownumbers : true,
			pagination : true,
			singleSelect : true,
			idField : 'id',
			pageSize : 20,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			frozenColumns : [ [ {
				width : '100',
				title : '登录名',
				field : 'loginname',
				sortable : true
			}, {
				width : '80',
				title : '姓名',
				field : 'name',
				sortable : true
			} ] ],
			columns : [ [  {
				width : '50',
				title : '性别',
				field : 'sex',
				sortable : true,
				formatter : function(value, row, index) {
					switch (value) {
					case '0':
						return '女';
					case '1':
						return '男';
					}
				}
			}, {
				width : '250',
				title : '照片',
				field : 'photo',
				formatter : function(value, row) {
					if(value){
						return sy.formatString('<span title="{0}">{1}</span>', value, value);
					}
				}
			}, {
				title : '操作',
				field : 'action',
				width : '90',
				formatter : function(value, row) {
					var str = '';
					
					<%if (securityUtil.havePermission("system.userManager.getById")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note" title="查看" onclick="showFun(\'{0}\');"/>', row.id);
					<%}%>
					<%if (securityUtil.havePermission("system.userManager.update")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_edit" title="编辑" onclick="editFun(\'{0}\');"/>', row.id);
					<%}%>
					<%if (securityUtil.havePermission("system.userManager.grantRole")) {%>
					str += sy.formatString('<img class="iconImg ext-icon-user" title="用户角色" onclick="grantRoleFun(\'{0}\');"/>', row.id);
					<%}%>
					
					<%if (securityUtil.havePermission("system.userManager.active")) {%>
						if(row.active == "1"){
							str += sy.formatString('<img class="iconImg ext-icon-note_delete" title="冻结" onclick="goDormant(\'{0}\');"/>', row.id);
						}else{
							str += sy.formatString('<img class="iconImg ext-icon-note_go" title="激活" onclick="goActive(\'{0}\');"/>', row.id);
						}
					<%}%>						
					return str;
				}
			} ] ],
			toolbar : '#toolbar',
			onLoadSuccess : function(data) {
				$('.iconImg').attr('src', sy.pixel_0);
			}
		});
	});
</script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div id="toolbar" style="display: none;">
		<table>
			<tr>
				<td>
					<form id="searchForm">
						<table>
							<tr>
								<td>登录名</td>
								<td><input name="loginname" style="width: 80px;" /></td>
								<td>姓名</td>
								<td><input name="name" style="width: 80px;" /></td>
								<td>性别</td>
								<td><select name="sex" class="easyui-combobox" data-options="panelHeight:'auto',editable:false"><option value="">请选择</option>
										<option value="1">男</option>
										<option value="0">女</option></select></td>
								<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom',plain:true" onclick="grid.datagrid('load',sy.serializeObject($('#searchForm')));">查询</a><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom_out',plain:true" onclick="$('#searchForm input').val('');grid.datagrid('load',{});">重置</a></td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
			<tr>
				<td>
					<table>
						<tr>
							<%if (securityUtil.havePermission("system.userManager.save")) {%>
							<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-note_add',plain:true" onclick="addFun();">添加</a></td>
							<%}%>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<div data-options="region:'center',fit:true,border:false">
		<table id="grid" data-options="fit:true,border:false"></table>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cn.easycode.yzmywx.utils.SecurityUtil"%>
<%@ page import="cn.easycode.yzmywx.bean.vo.SessionInfo"%>
<%@ page import="cn.easycode.yzmywx.utils.ConfigUtil"%>
<%
	String contextPath = request.getContextPath();
	SessionInfo sessionInfo = (SessionInfo) session.getAttribute(ConfigUtil.getSessionInfoName());
	if (sessionInfo == null) {
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
			title : '添加角色信息',
			url : sy.contextPath + '/admin/system/roleForm.jsp?tag=add',
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
			title : '查看角色信息',
			url : sy.contextPath + '/admin/system/roleForm.jsp?id=' + id,
			buttons : [ {
				text : '关闭',
				handler : function(){
					dialog.dialog('close');
				}
			} ]
		});
	};
	var editFun = function(id,type) {
		var dialog = parent.sy.modalDialog({
			title : '编辑角色信息',
			url : sy.contextPath + '/admin/system/roleForm.jsp?tag=' + type + '&id=' + id,
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
	var removeFun = function(id) {
		parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
			if (r) {
				$.post(sy.contextPath + '/rest/role/delete/' + id, function() {
					grid.datagrid('reload');
				}, 'json');
			}
		});
	};
	var grantFun = function(id) {
		var dialog = parent.sy.modalDialog({
			title : '角色授权',
			url : sy.contextPath + '/admin/system/roleGrant.jsp?id=' + id,
			buttons : [ {
				text : '授权',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			},{
				text : '取消',
				handler : function(){
					dialog.dialog('close');
				}
			}]
		});
	};
	$(function() {
		grid = $('#grid').datagrid({
			title : '',
			url : sy.contextPath + '/rest/role/roleList',
			striped : true,
			rownumbers : true,
			pagination : true,
			singleSelect : true,
			pageSize : 20,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			idField : 'id',
			sortName : 'seq',
			sortOrder : 'asc',
			frozenColumns : [ [ {
				width : '100',
				title : '角色名称',
				field : 'name',
				sortable : true
			} ] ],
			columns : [ [ {
				width : '300',
				title : '资源描述',
				field : 'description'
			}, {
				width : '90',
				title : '类型',
				field : 'type',
				sortable : true,
				formatter : function(value, row, index) {
					if(value && value == "1"){
						return "系统级";
					}else if(value && value == "0"){
						return "用户级";
					}else{
						return "";
					}
				}
			},{
				width : '60',
				title : '排序',
				field : 'seq',
				hidden : true,
				sortable : true
			}, {
				title : '操作',
				field : 'action',
				width : '180',
				formatter : function(value, row) {
					var str = '';
					<%if (securityUtil.havePermission("system.roleManager.getById")) {%>
						//str += sy.formatString('<img class="iconImg ext-icon-note" title="查看" onclick="showFun(\'{0}\');"/>', row.id);
						str += "<a href=\"javascript:void(0);\"  onclick=\"showFun('" + row.id + "');\">查看</a> ";
					<%}%>
					<%if (securityUtil.havePermission("system.roleManager.update")) {%>
						//str += sy.formatString('<img class="iconImg ext-icon-note_edit" title="编辑" onclick="editFun(\'{0}\',\'{1}\');"/>', row.id, row.type);
						str += "<a href=\"javascript:void(0);\"  onclick=\"editFun('" + row.id + "','" + row.type + "');\">编辑</a> ";
					<%}%>
					<%if (securityUtil.havePermission("system.roleManager.grant")) {%>
						//str += sy.formatString('<img class="iconImg ext-icon-key" title="授权" onclick="grantFun(\'{0}\');"/>', row.id);
						str += "<a href=\"javascript:void(0);\"  onclick=\"grantFun('" + row.id + "');\">资源授权</a> ";
					<%}%>
					if(row.type == "0"){
					<%if (securityUtil.havePermission("system.roleManager.delete")) {%>
						//str += sy.formatString('<img class="iconImg ext-icon-note_delete" title="删除" onclick="removeFun(\'{0}\');"/>', row.id);
						str += "<a href=\"javascript:void(0);\"  onclick=\"removeFun('" + row.id + "');\">删除</a>";
					<%}%>
					}
					return str;
				}
			} ] ],
			toolbar : '#toolbar'
		});
	});
</script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div id="toolbar" style="display: none;">
		<table>
			<tr>
				<%if (securityUtil.havePermission("system.roleManager.save")) {%>
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-note_add',plain:true" onclick="addFun();">添加</a></td>
				<%}%>
				<td><div class="datagrid-btn-separator"></div></td>
				<td><input id="searchBox" class="easyui-searchbox" style="width: 150px" data-options="searcher:function(value,name){grid.datagrid('load',{'name':value});},prompt:'搜索角色名称'"></input></td>
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom_out',plain:true" onclick="$('#searchBox').searchbox('setValue','');grid.datagrid('load',{});">清空查询</a></td>
			</tr>
		</table>
	</div>
	<div data-options="region:'center',fit:true,border:false">
		<table id="grid" data-options="fit:true,border:false"></table>
	</div>
</body>
</html>
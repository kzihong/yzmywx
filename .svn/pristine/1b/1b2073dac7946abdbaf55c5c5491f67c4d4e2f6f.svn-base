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
			title : '添加资源信息',
			url : sy.contextPath + '/admin/system/resourceForm.jsp',
			buttons : [ {
				text : '添加',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$, parent.mainMenu);
				}
			} ,{
				text : '取消',
				handler : function(){
					dialog.dialog('close');
				}
			} ]
		});
	};
	var showFun = function(id) {
		var dialog = parent.sy.modalDialog({
			title : '查看资源信息',
			url : sy.contextPath + '/admin/system/resourceForm.jsp?id=' + id,
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
			title : '编辑资源信息',
			url : sy.contextPath + '/admin/system/resourceForm.jsp?id=' + id,
			buttons : [ {
				text : '编辑',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$, parent.mainMenu);
				}
			},{
				text : '取消',
				handler : function(){
					dialog.dialog('close');
				}
			} ]
		});
	};
	/* var removeFun = function(id) {
		parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
			if (r) {
				$.post(sy.contextPath + '/base/syresource!delete.sy', {
					id : id
				}, function() {
					grid.treegrid('reload');
					parent.mainMenu.tree('reload');
				}, 'json');
			}
		});
	}; */
	var redoFun = function() {
		var node = grid.treegrid('getSelected');
		if (node) {
			grid.treegrid('expandAll', node.id);
		} else {
			grid.treegrid('expandAll');
		}
	};
	var undoFun = function() {
		var node = grid.treegrid('getSelected');
		if (node) {
			grid.treegrid('collapseAll', node.id);
		} else {
			grid.treegrid('collapseAll');
		}
	};
	$(function() {
		grid = $('#grid').treegrid({
			title : '',
			url : sy.contextPath + '/rest/resource/treeGrid',
			idField : 'id',
			treeField : 'name',
			parentField : 'pid',
			rownumbers : true,
			pagination : false,
			sortName : 'seq',
			sortOrder : 'asc',
			frozenColumns : [ [ {
				width : '200',
				title : '资源名称',
				field : 'name'
			} ] ],
			columns : [ [ {
				width : '200',
				title : '图标名称',
				field : 'iconCls'
			}, {
				width : '200',
				title : '资源路径',
				field : 'url',
				formatter : function(value, row) {
					if(value){
						return sy.formatString('<span title="{0}">{1}</span>', value, value);
					}
				}
			}, {
				width : '60',
				title : '资源类型',
				field : 'resourcetype',
				formatter : function(value, row) {
					return value.name;
				}
			}, {
				width : '200',
				title : '资源描述',
				field : 'description',
				formatter : function(value, row) {
					if(value){
						return sy.formatString('<span title="{0}">{1}</span>', value, value);
					}
				}
			}, {
				width : '80',
				title : '排序',
				field : 'seq',
				hidden : true
			}, {
				width : '80',
				title : '目标',
				field : 'target'
			}, {
				title : '操作',
				field : 'action',
				width : '60',
				formatter : function(value, row) {
					var str = '';
					<%if (securityUtil.havePermission("system.resourceManager.getById")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note" title="查看" onclick="showFun(\'{0}\');"/>', row.id);
					<%}%>
					<%if (securityUtil.havePermission("system.resourceManager.update")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_edit" title="编辑" onclick="editFun(\'{0}\');"/>', row.id);
					<%}%>
					<%if (securityUtil.havePermission("system.resourceManager.delete")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_delete" title="删除" onclick="removeFun(\'{0}\');"/>', row.id);
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
				<%if (securityUtil.havePermission("system.resourceManager.save")) {%>
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-note_add',plain:true" onclick="addFun();">添加</a></td>
				<%}%>
				<td><div class="datagrid-btn-separator"></div></td>
				<td><a onclick="redoFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'ext-icon-resultset_next'">展开</a><a onclick="undoFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'ext-icon-resultset_previous'">折叠</a></td>
				<td><div class="datagrid-btn-separator"></div></td>
				<td><a onclick="grid.treegrid('reload');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'ext-icon-arrow_refresh'">刷新</a></td>
			</tr>
		</table>
	</div>
	<div data-options="region:'center',fit:true,border:false">
		<table id="grid" data-options="fit:true,border:false"></table>
	</div>
</body>
</html>
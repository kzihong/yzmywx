<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cn.easycode.yzmywx.bean.vo.SessionInfo"%>
<%@ page import="cn.easycode.yzmywx.utils.ConfigUtil"%>
<%@ page import="cn.easycode.yzmywx.utils.SecurityUtil"%>
<%
	String contextPath = request.getContextPath();
	SessionInfo sessionInfo = (SessionInfo) session.getAttribute(ConfigUtil.getSessionInfoName());
	if (sessionInfo == null) {
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}
	SecurityUtil securityUtil = new SecurityUtil(session);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<jsp:include page="../../../inc.jsp"></jsp:include>
<script src="../../../jslib/json2.js" type="text/javascript"></script>
<script src="../../../jslib/ajax.js" type="text/javascript"></script>
<script type="text/javascript">
var grid;
var addMenu = function(flag) {
	var action = "";
	var Flag = "";
	if(flag == 1){
		action = "F";
		Flag = "一级";
	}else if (flag == 2){
		action = "S";
		Flag = "二级";
	}
	var dialog = parent.sy.modalDialog({
		title : '添加'+ Flag +'信息',
		url : sy.contextPath + '/admin/wechat/Menu/menuForm.jsp?action='+action,
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
var editMenu = function(id) {
	var dialog = parent.sy.modalDialog({
		title : '编辑菜单',
		url : sy.contextPath + '/admin/wechat/Menu/menuForm.jsp?id=' + id,
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
var removeMenu = function(id) {
	parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
		if (r) {
			$.post(sy.contextPath + '/rest/menu/delete/'+id,function() {
				grid.treegrid('reload');
				parent.mainMenu.tree('reload');
			}, 'json');
		}
	});
};
var syncMenu = function() {
	parent.$.messager.confirm('询问', '您确定要同步至微信公众号吗？', function(r) {
		if (r) {
			var result = postAjaxNoData(sy.contextPath + '/rest/menu/sync');
			if(result.errcode == "0"){
				alert("操作成功");
			}else{
				alert(result.errmsg);
			}
		}
	});
};
$(function() {
	grid = $('#grid').treegrid({
		title : '',
		url : sy.contextPath + '/rest/menu/get',
		idField : 'id',
		treeField : 'name',
		parentField : 'pid',
		rownumbers : true,
		pagination : false,
		sortName : 'seq',
		sortOrder : 'asc',
		frozenColumns : [ [ {
			width : '200',
			title : '菜单名称',
			field : 'name'
		} ] ],
		columns : [ [ {
			width : '200',
			title : 'Type',
			field : 'buttontype',
			formatter : function(value, row) {
				return sy.formatString('<span title="{0}">{1}</span>', value.id, value.typename);
			}
		}, {
			width : '200',
			title : 'Key',
			field : 'btkey',
			/* formatter : function(value, row) {
				if(value){
					return sy.formatString('<span title="{0}">{1}</span>', value, value);
				}
			} */
		}, {
			width : '200',
			title : 'Url',
			field : 'url',
			/* formatter : function(value, row) {
				return value.name;
			} */
		}, {
			width : '200',
			title : '图文消息ID',
			field : 'MediaId',
			/* formatter : function(value, row) {
				if(value){
					return sy.formatString('<span title="{0}">{1}</span>', value, value);
				}
			} */
		},{
			title : '操作',
			field : 'action',
			width : '60',
			formatter : function(value, row) {
				var str = '';
				<%if (securityUtil.havePermission("wechat.menuManager.update")) {%>
					str += sy.formatString('<img class="iconImg ext-icon-note_edit" title="编辑" onclick="editMenu(\'{0}\');"/>', row.id);
				<%}%>
				<%if (securityUtil.havePermission("wechat.menuManager.delete")) {%>
					str += sy.formatString('<img class="iconImg ext-icon-note_delete" title="删除" onclick="removeMenu(\'{0}\');"/>', row.id);
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
				<%if (securityUtil.havePermission("wechat.menuManager.creat")) {%>
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-note_add',plain:true" onclick="addMenu(1);">添加一级菜单</a></td>
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-note_add',plain:true" onclick="addMenu(2);">添加二级菜单</a></td>
				<td><div class="datagrid-btn-separator"></div></td>
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-note_add',plain:true" onclick="preview();">预览</a></td>
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-note_add',plain:true" onclick="syncMenu();">同步至微信菜单</a></td>
				<%}%>
			</tr>
		</table>
	</div>
	<div data-options="region:'center',fit:true,border:false">
		<table id="grid" data-options="fit:true,border:false"></table>
	</div>
</body>
</html>
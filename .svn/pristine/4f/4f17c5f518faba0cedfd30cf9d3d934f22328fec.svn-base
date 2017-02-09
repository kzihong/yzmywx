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
<jsp:include page="../../inc.jsp"></jsp:include>
<script src="../../jslib/json2.js" type="text/javascript"></script>
<script src="../../jslib/ajax.js" type="text/javascript"></script>
<script type="text/javascript">
var grid;
var dialog;
var addNews = function() {
	dialog = parent.sy.modalDialog({
		title : '添加新闻',
		height : 600,
		width  : 1000,
		maximizable : true,
		resizable : true,
		url : sy.contextPath + '/admin/news/newsForm.jsp',
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
var editNews = function(id) {
	dialog = parent.sy.modalDialog({
		title : '编辑新闻',
		height : 600,
		width  : 1000,
		maximizable : true,
		resizable : true,
		url : sy.contextPath + '/admin/news/newsForm.jsp?id=' + id,
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
var removeNews = function(id) {
	parent.$.messager.confirm('询问', '您确定要删除此新闻？', function(r) {
		if (r) {
			$.post(sy.contextPath + '/rest/news/delete/'+id,function() {
				parent.mainMenu.tree('reload');
				grid.datagrid('reload');
			}, 'json');
		}
	});
};
var showNews = function(id) {
	dialog = parent.sy.modalDialog({
		title : '查看新闻详情',
		height : 600,
		width  : 1000,
		maximizable : true,
		resizable : true,
		url : sy.contextPath + '/admin/news/newsForm.jsp?id=' + id,
		buttons : [ {
			text : '关闭',
			handler : function(){
				dialog.dialog('close');
			}
		} ]
	});
};
$(function() {
	grid = $('#grid').datagrid({
		title : '',
		url : sy.contextPath + '/rest/news/get',
		striped : true,
		rownumbers : true,
		pagination : true,
		singleSelect : true,
		pageSize : 20,
		pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		idField : 'id',
		sortName : 'createtime',
		sortOrder : 'desc',
		frozenColumns : [ [ {
			width : '300',
			title : '新闻标题',
			field : 'title'
		} ] ],
		columns : [ [ {
			width : '150',
			title : '发布时间',
			field : 'formatcreatetime',
		}, {
			width : '600',
			title : '简短内容',
			field : 'formatcontent',
		},{
			title : '操作',
			field : 'action',
			width : '60',
			formatter : function(value, row) {
				var str = '';
				<%if (securityUtil.havePermission("system.roleManager.getById")) {%>
				str += sy.formatString('<img class="iconImg ext-icon-note" title="查看" onclick="showNews(\'{0}\');"/>', row.id);
				//str += "<a href=\"javascript:void(0);\"  onclick=\"showNews('" + row.id + "');\">查看</a> ";
				<%}%>
				<%if (securityUtil.havePermission("news.newsManager.update")) {%>
					str += sy.formatString('<img class="iconImg ext-icon-note_edit" title="编辑" onclick="editNews(\'{0}\');"/>', row.id);
				<%}%>
				<%if (securityUtil.havePermission("news.newsManager.delete")) {%>
					str += sy.formatString('<img class="iconImg ext-icon-note_delete" title="删除" onclick="removeNews(\'{0}\');"/>', row.id);
				<%}%>
				return str;
			}
		} ] ],
		toolbar : '#toolbar',
		onLoadSuccess : function(data) {
			$('.iconImg').attr('src', sy.pixel_0);
		},
		onDblClickRow : function(rowIndex, rowData){
			//双击查看			
			showNews(rowData.id);
		}
	
	});
});
</script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div id="toolbar" style="display: none;">
		<table>
			<tr>
				<%if (securityUtil.havePermission("news.newsManager.add")) {%>
					<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-note_add',plain:true" onclick="addNews();">添加新闻</a></td>
					<td><div class="datagrid-btn-separator"></div></td>
				<%}%>
				<td>
				<form id="searchForm">
					<table>
						<tr>
							<td>发布时间：</td>
							<td><input name="date" type="text" class="easyui-datebox" /></td>
							<td>新闻标题：</td>
							<td><input name="title" type="text" /></td>
							<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom',plain:true" onclick="grid.datagrid('load',sy.serializeObject($('#searchForm')));">查询</a><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom_out',plain:true" onclick="$('#searchForm input').val('');grid.datagrid('load',{});">重置</a></td>
					</table>
				</form>
				</td>
			</tr>
		</table>
	</div>
	<div data-options="region:'center',fit:true,border:false">
		<table id="grid" data-options="fit:true,border:false"></table>
	</div>
</body>
</html>
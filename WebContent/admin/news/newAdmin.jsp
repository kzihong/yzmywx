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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<jsp:include page="../../inc.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {
		grid = $('#grid').datagrid({
			title : '',
			url : sy.contextPath + '/rest/role/shopManagerList',
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
			},{
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
					<%if (securityUtil.havePermission("order.workerManager.getById")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note" title="查看" onclick="showFun(\'{0}\');"/>', row.id);
					<%}%>
					<%if (securityUtil.havePermission("order.workerManager.update")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_edit" title="编辑" onclick="editFun(\'{0}\');"/>', row.id);
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
				<%if (securityUtil.havePermission("order.workerManager.addWorker")) {%>
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-note_add',plain:true" onclick="addWorker();">添加商城管理员</a></td>
				<%}%>
				<td><div class="datagrid-btn-separator"></div></td>
				<td>
					<form id="searchForm">
						<table>
							<tr>
								<td>登录名</td>
								<td><input name="loginname" style="width: 80px;" /></td>
								<td>姓名</td>
								<td><input name="name" style="width: 80px;" /></td>
								<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom',plain:true" onclick="grid.datagrid('load',sy.serializeObject($('#searchForm')));">查询</a><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom_out',plain:true" onclick="$('#searchForm input').val('');grid.datagrid('load',{});">重置</a></td>
							</tr>
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
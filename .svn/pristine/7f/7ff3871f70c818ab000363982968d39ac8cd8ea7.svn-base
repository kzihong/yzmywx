<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cn.easycode.yzmywx.bean.vo.SessionInfo"%>
<%@ page import="cn.easycode.yzmywx.utils.ConfigUtil"%>
<%
	String contextPath = request.getContextPath();
	SessionInfo sessionInfo = (SessionInfo) session.getAttribute(ConfigUtil.getSessionInfoName());
	if (sessionInfo == null) {
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}
	String id = request.getParameter("id");
	String tag = request.getParameter("tag");
	if (id == null) {
		id = "";
	}
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<jsp:include page="../../inc.jsp"></jsp:include>
<script src="../../jslib/json2.js" type="text/javascript"></script>
<script src="../../jslib/ajax.js" type="text/javascript"></script>
<script type="text/javascript">
	var submitForm = function($dialog, $grid, $pjq) {
		if ($('form').form('validate')) {
			var url;
			if ($(':input[name="id"]').val().length > 0) {
				url = sy.contextPath + '/rest/role/update';
			} else {
				url = sy.contextPath + '/rest/role/save';
			}
			/* $.post(url, sy.serializeObject($('form')), function(result) {
				if (result.success) {
					$grid.datagrid('load');
					$dialog.dialog('destroy');
				} else {
					$pjq.messager.alert('提示', result.msg, 'error');
				}
			}, 'json'); */
			var dataResult = postAjax(url, sy.serializeObject($('form')));
			if (dataResult.success) {
				$pjq.messager.alert('提示', dataResult.msg, 'info');
				$grid.datagrid('load');
				$dialog.dialog('destroy');
			} else {
				$pjq.messager.alert('提示', dataResult.msg, 'error');
			}
		}
	};
	$(function() {
		var roleid = $(':input[name="id"]').val();
		if (roleid && roleid.length > 0) {
			parent.$.messager.progress({
				text : '数据加载中....'
			});
			$.get(sy.contextPath + '/rest/role/getById/' + roleid, function(result) {
				if (result.id != undefined) {
					$('form').form('load', {
						'id' : result.id,
						'name' : result.name,
						'type' : result.type,
						'description' : result.description,
						'seq' : result.seq
					});
				}
				parent.$.messager.progress('close');
			}, 'json');
		}
	});
</script>
</head>
<body>
	<form method="post" class="form">
		<fieldset>
			<legend>角色基本信息</legend>
			<table class="table" style="width: 100%;">
				<tr>
					<th>编号</th>
					<td><input name="id" value="<%= id%>" readonly="readonly" /></td>
					<th>角色名称</th>
					<td><input name="name" class="easyui-validatebox" data-options="required:true" /></td>
				</tr>
				<tr>
					<th>类型</th>
					<% if(null != tag && (tag.equals("add") || tag.equals("0"))) {%>
						<td><select name="type" class="easyui-combobox" data-options="panelHeight:'auto',editable:false"><option value="">请选择</option>
						<option value="0">用户级</option></select></td>
					<%}else if(null != tag && tag.equals("1")){%>
						<td><select name="type" class="easyui-combobox" data-options="panelHeight:'auto',editable:false"><option value="">请选择</option>
						<option value="1">系统级</option></select></td>
					<%}else{%>
						<td><select name="type" class="easyui-combobox" data-options="panelHeight:'auto',editable:false"><option value="">请选择</option>
						<option value="1">系统级</option><option value="0">用户级</option></select></td>
					<%}%>
					<th>顺序</th>
					<td><input name="seq" class="easyui-numberspinner" data-options="required:true,min:0,max:100000,editable:false" style="width: 155px;" value="100" /></td>
				</tr>
				<tr>
					<th>角色描述</th>
					<td colspan='3'><textarea name="description" style="width: 448px;height:60px;"></textarea></td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>
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
	if (id == null) {
		id = "";
	}
	String action = request.getParameter("action");
	if(action == null){
		action = "";
	}
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<jsp:include page="../../../inc.jsp"></jsp:include>
<script src="../../../jslib/json2.js" type="text/javascript"></script>
<script src="../../../jslib/ajax.js" type="text/javascript"></script>
<script type="text/javascript">
	var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
		if ($('form').form('validate')) {
			var url;
			if ($(':input[name="id"]').val().length > 0) {
				url = sy.contextPath + '/rest/menu/update';
			} else {
				url = sy.contextPath + '/rest/menu/save';
			}
			/* $.post(url, sy.serializeObject($('form')), function(result) {
				if (result.success) {
					$grid.treegrid('reload');
					$dialog.dialog('destroy');
					$mainMenu.tree('reload');
				} else {
					$pjq.messager.alert('提示', result.errmsg, 'error');
				}
			}, 'json'); */
			var dataResult = postAjax(url, sy.serializeObject($('form')));
			if (dataResult.success) {
				$pjq.messager.alert('提示', dataResult.errmsg, 'info');
				$grid.treegrid('reload');
				$dialog.dialog('destroy');
				$mainMenu.tree('reload');
			} else {
				$pjq.messager.alert('提示', dataResult.errmsg, 'error');
			}
		}
	};
	
	$(function() {
		var menuid = '<%=id%>';
		if (menuid && menuid.length > 0) {
			$.get(sy.contextPath + '/rest/menu/getById/' + menuid, function(result) {
				if (result.id != undefined) {
					$('form').form('load', {
						'id' : result.id,
						'name' : result.name,
						'url' : result.url,
						'typeid' : result.buttontype.id,
						'mediaid' : result.mediaid,
						'pid' : result.pid,
						'btkey' : result.btkey,
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
			<legend>菜单基本信息</legend>
			<table class="table" style="width: 100%;">
				<tr>
					<th>编号</th>
					<td><input name="id" value="<%= id%>" readonly="readonly" /></td>
					<th>菜单名称</th>
					<td><input name="name" class="easyui-validatebox" data-options="required:true" /></td>
				</tr>
				<tr>
					<th>菜单类型</th>
					<td><select name="typeid" class="easyui-combobox" data-options="required:true,editable:false,valueField:'id',textField:'typename',url:'<%=contextPath%>/rest/menu/getBttype',panelHeight:'auto'" style="width: 155px;"></select></td>
					<%if (action.equals("S") || action.equals("")) {%>
					<th>上级菜单</th>
					<td><select id="resource_id" name="pid" class="easyui-combotree" data-options="editable:false,idField:'id',textField:'name',parentField:'pid',url:'<%=contextPath%>/rest/menu/getFM',panelHeight:'auto'" style="width: 155px;"></select><img class="iconImg ext-icon-cross" onclick="$('#resource_id').combotree('clear');" title="清空" /></td>
					<%}%>
				</tr>
				<tr>
					<th>跳转链接(http开头)</th>
					<td><input name="url" /></td>
					<th>Key</th>
					<td><input name="btkey" /></td>
				</tr>
				<tr>
					<th>MediaId</th>
					<td><input name="mediaid" /></td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>
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
		var nodes = $('#tree').tree('getChecked', [ 'checked', 'indeterminate' ]);
		var ids = [];
		for (var i = 0; i < nodes.length; i++) {
			ids.push({"id" : nodes[i].id });
		}
		var jsondata = {"id": $(':input[name="data.id"]').val(), "roles" : ids};
		var dataResult = postAjax(sy.contextPath + '/rest/user/grantRole', jsondata);
		if (dataResult.success) {
			$pjq.messager.alert('提示', dataResult.msg, 'info');
			$grid.datagrid('load');
			$dialog.dialog('destroy');
		} else {
			$pjq.messager.alert('提示', dataResult.msg, 'error');
		}
	};
	$(function() {
		parent.$.messager.progress({
			text : '数据加载中....'
		});
		var userid = $(':input[name="data.id"]').val();
		if(userid){
			$('#tree').tree({
				url : sy.contextPath + '/rest/role/rolesTree',
				parentField : 'pid',
				checkbox : true,
				formatter : function(node) {
					return node.text;
				},
				onLoadSuccess : function(node, data) {
					$.get(sy.contextPath + '/rest/role/userRoles/' + userid,  function(result) {
						if (result) {
							for (var i = 0; i < result.length; i++) {
								var node = $('#tree').tree('find', result[i].id);
								if (node) {
									var isLeaf = $('#tree').tree('isLeaf', node.target);
									if (isLeaf) {
										$('#tree').tree('check', node.target);
									}
								}
							}
						}
						parent.$.messager.progress('close');
					}, 'json');
				}
			});
		}else{
			parent.$.messager.progress('close');
			$pjq.messager.alert('提示', '获取数据失败！', 'info');
		}
	});
</script>
</head>
<body>
	<input name="data.id" value="<%= id%>" readonly="readonly" type="hidden" />
	<fieldset>
		<legend>所属角色</legend>
		<ul id="tree"></ul>
	</fieldset>
</body>
</html>
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
	var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
		if ($('form').form('validate')) {
			var url;
			if ($(':input[name="id"]').val().length > 0) {
				url = sy.contextPath + '/rest/resource/update';
			} else {
				url = sy.contextPath + '/rest/resource/save';
			}
			/* $.post(url, sy.serializeObject($('form')), function(result) {
				if (result.success) {
					$grid.treegrid('reload');
					$dialog.dialog('destroy');
					$mainMenu.tree('reload');
				} else {
					$pjq.messager.alert('提示', result.msg, 'error');
				}
			}, 'json'); */
			var dataResult = postAjax(url, sy.serializeObject($('form')));
			if (dataResult.success) {
				$pjq.messager.alert('提示', dataResult.msg, 'info');
				$grid.treegrid('reload');
				$dialog.dialog('destroy');
				$mainMenu.tree('reload');
			} else {
				$pjq.messager.alert('提示', dataResult.msg, 'error');
			}
		}
	};
	var showIcons = function() {
		var dialog = parent.sy.modalDialog({
			title : '浏览小图标',
			url : sy.contextPath + '/style/icons.jsp',
			buttons : [ {
				text : '确定',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.selectIcon(dialog, $('#iconCls'));
				}
			} ]
		});
	};
	$(function() {
		var resourceid = $(':input[name="id"]').val();
		if (resourceid && resourceid.length > 0) {
			parent.$.messager.progress({
				text : '数据加载中....'
			});
			$.get(sy.contextPath + '/rest/resource/getById/' + resourceid, function(result) {
				if (result.id != undefined) {
					$('form').form('load', {
						'id' : result.id,
						'name' : result.name,
						'url' : result.url,
						'resourcetypeid' : result.resourcetype.id,
						'description' : result.description,
						'pid' : result.pid,
						'iconCls' : result.iconCls,
						'seq' : result.seq,
						'target' : result.target
					});
					$('#iconCls').attr('class', result.iconCls);//设置背景图标
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
			<legend>资源基本信息</legend>
			<table class="table" style="width: 100%;">
				<tr>
					<th>编号</th>
					<td><input name="id" value="<%= id%>" readonly="readonly" /></td>
					<th>资源名称</th>
					<td><input name="name" class="easyui-validatebox" data-options="required:true" /></td>
				</tr>
				<tr>
					<th>资源路径</th>
					<td><input name="url" /></td>
					<th>资源类型</th>
					<td><select name="resourcetypeid" class="easyui-combobox" data-options="required:true,editable:false,valueField:'id',textField:'name',url:'<%=contextPath%>/rest/resource/resourcetype',panelHeight:'auto'" style="width: 155px;"></select></td>
				</tr>
				<tr>
					<th>上级资源</th>
					<td><select id="resource_id" name="pid" class="easyui-combotree" data-options="editable:false,idField:'id',textField:'text',parentField:'pid',url:'<%=contextPath%>/rest/resource/mainMenuList'" style="width: 155px;"></select><img class="iconImg ext-icon-cross" onclick="$('#resource_id').combotree('clear');" title="清空" /></td>
					<th>资源图标</th>
					<td><input id="iconCls" name="iconCls" readonly="readonly" style="padding-left: 18px; width: 134px;" /><img class="iconImg ext-icon-zoom" onclick="showIcons();" title="浏览图标" />&nbsp;<img class="iconImg ext-icon-cross" onclick="$('#iconCls').val('');$('#iconCls').attr('class','');" title="清空" /></td>
				</tr>
				<tr>
					<th>顺序</th>
					<td><input name="seq" class="easyui-numberspinner" data-options="required:true,min:0,max:100000,editable:false" style="width: 155px;" value="100" /></td>
					<th>目标</th>
					<td><input name="target" /></td>
				</tr>
				<tr>
					<th>资源描述</th>
					<td><textarea name="description"></textarea></td>
					<th></th>
					<td></td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>
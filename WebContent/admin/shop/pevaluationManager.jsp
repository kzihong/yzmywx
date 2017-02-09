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
<script src="../../jslib/ajax.js" type="text/javascript"></script>
<script type="text/javascript">
	var grid;
	$(function() {
		grid = $('#grid').datagrid({
			title : '',
			url : sy.contextPath + '/rest/productorder/getPevaluations',
			striped : true,
			rownumbers : true,
			pagination : true,
			singleSelect : false,
			idField : 'id',
			pageSize : 20,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			frozenColumns : [ [ {
				width : '140',
				title : '订单序列号',
				align : 'center',
				field : 'orderSn',
				formatter : function(value,row){
					return row.repairorder.orderSn;
				}
			},  ] ],
			columns : [ [  {
				width : '80',
				title : '消费者',
				align : 'center',
				field : 'contact',
				formatter : function(value,row){
					return row.repairorder.contact;
				}
			}, {
				width : '120',
				title : '联系电话',
				field : 'telephone',
				align : 'center',
				formatter : function(value,row){
					return row.repairorder.telephone;
				}
			},{
				width : '50',
				title : '评分',
				field : 'grade',
				align : 'center',
			},{
				width : '300',
				title : '评价内容',
				field : 'content',
				align : 'center',
			}] ],
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
								<td>商品类别:</td>
								<td><select name="categri" class="easyui-combobox" data-options="panelHeight:'auto',editable:false"><option value="">请选择</option>
										<option value="1">一颗星</option>
										<option value="2">两颗星</option>
										<option value="3">三颗星</option>
										<option value="4">四颗星</option>
										<option value="5">五颗星</option></select>
								<td>评价星级:</td>
								<td><select name="level" class="easyui-combobox" data-options="panelHeight:'auto',editable:false"><option value="">请选择</option>
										<option value="1">一颗星</option>
										<option value="2">两颗星</option>
										<option value="3">三颗星</option>
										<option value="4">四颗星</option>
										<option value="5">五颗星</option></select>
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
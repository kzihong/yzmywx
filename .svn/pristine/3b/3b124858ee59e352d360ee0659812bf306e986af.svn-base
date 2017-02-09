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
	function assignOrdersBatch(userid){
		var orderlist = $('#grid').datagrid('getSelections');
		var json = '{ "userid" : "'+ userid + '" ,';
		json += '"orders" : [';
		$.each(orderlist, function(i, n){
			if(n){
			  json += '{"id" : "'+ n.id + '"},';
			}
		});
		json += ']}'; 
		json = eval("(" + json + ")");
		var url = "<%=contextPath%>/rest/repair/assignRepairOrder";
		var dataResult = postAjax(url,json);
		if(dataResult.success){
			alert(dataResult.errmsg);
		}
	}
	function showAssignDIV(){
		var orderlist = $('#grid').datagrid('getSelections');
		if(orderlist.length < 1){
			alert("请选择需要分配的订单（可多选）");
			return ;
		}
		var flag = 1;
		$.each(orderlist,function(i,n){
			if(n.orderStatus == '2'){
				$.messager.confirm('询问', '所选订单中已有负责人，是否重新分配？', function(r) {
					if (r) {
						$("#selectbox").css({
							display:'block'
						});
					}
				});
			}
			if(n.orderStatus >= 3){
				$.messager.alert("提示","请检查所选订单的状态是否是已完成或已取消。");
				flag = 0 ;
			}
			return false;
		});
		if(flag == 0) return;
		$("#selectbox").css({
			display:'block'
		});
	}
	function showWorker(userid){
		dialog = parent.sy.modalDialog({
			title : '查看用户信息',
			url : sy.contextPath + '/admin/order/workerinfo.jsp?id=' + userid,
			buttons : [ {
				text : '关闭',
				handler : function(){
					dialog.dialog('close');
				}
			} ]
		});
	}
	function showDetail(orderid){
		if(orderid != null){
			dialog = parent.sy.modalDialog({
				title : '查看订单信息',
				url : sy.contextPath + '/admin/order/repairForm.jsp?id=' + orderid,
				buttons : [ {
					text : '关闭',
					handler : function(){
						dialog.dialog('close');
					}
				} ]
			});
		}
	}
	function updateOrder(orderid){
		if(orderid != null){
			dialog = parent.sy.modalDialog({
				title : '更改订单信息',
				url : sy.contextPath + '/admin/order/repairForm.jsp?id=' + orderid,
				width:800,
				height:600,
				buttons : [  {
					text : '确定',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$, parent.mainMenu);
					}
				} ,{
					text : '关闭',
					handler : function(){
						dialog.dialog('close');
					}
				} ]
			});
		}
	}
	function cancelOrder(orderid,ors){
		if(ors != 0){
			alert("对不起，只有未受理的订单才能被取消");
			return;
		}
		if(orderid != null){
			$.messager.confirm("警告","确定取消该订单吗？",function(r){
				if(r){
					var result = postAjaxNoData("/rest/repair/cancelRepairOrder/"+orderid);
					alert(result.errmsg);	
					if(result.success){
						$('#grid').datagrid('reload');
					}
				}
			});
		}
	}
	$(function() {
		grid = $('#grid').datagrid({
			title : '',
			url : sy.contextPath + '/rest/repair/orderList',
			striped : true,
			rownumbers : true,
			pagination : true,
			singleSelect : false,
			idField : 'id',
			pageSize : 20,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			frozenColumns : [ [ {
				title: 'checkboxColumn',
				field : 'checkboxColumn',
				title :'checkboxColumn',
				checkbox:true,
			},{
				width : '130',
				title : '订单序列号',
				align : 'center',
				field : 'orderSn',
				
			},  ] ],
			columns : [ [  {
				width : '50',
				title : '预约人',
				align : 'center',
				field : 'contact',
			}, {
				width : '250',
				title : '预约时间',
				field : 'formatbooktimeup',
				align : 'center',
				formatter : function(value , row){
					return row.formatbooktimedown + " ~~ "  + row.formatbooktimeup;
				}
			}, {
				width : '230',
				title : '地点',
				field : 'address',
				align : 'center',
			}, {
				width : '110',
				title : '联系电话',
				field : 'telephone',
				align : 'center',
			},{
				width : '100',
				title : '负责人',
				field : 'user',
				align : 'center',
				formatter : function(value,row){
					if(row.user != null){
						return sy.formatString('<a href = "javascript:void(0);" onclick="showWorker({0})">{1}</a>', "'"+row.user.id+"'",row.user.name);
					}else{
						return "订单未受理";
					}
				}
			},{
				width : '70',
				title : '用户评价',
				field : 'evaluation',
				align : 'center',
				formatter : function(value,row){
					if(row.evaluation != null){
						return sy.formatString('<span title="{0}">{1}</span>', row.evaluation.content,row.evaluation.grade);
					}else{
						return "暂无评价";
					}
				}
			},{
				width : '60',
				title : '订单状态',
				field : 'orderStatus',
				align : 'center',
				styler: function(value,row){
					switch (value) {
					case 0:
						return 'color:red;';
					case 4:
						return 'color:black;';
					case 1:
						return 'color:blue;';
					case 2:
						return 'color:pink;';
					case 3:
						return 'color:green;';
					}
				},
				formatter : function(value,row){
					switch (value) {
					case 0:
						return '未受理';
					case 4:
						return '已取消';
					case 1:
						return '已派单';
					case 2:
						return '未评价';
					case 3:
						return '已完结';
					}
				}
			}, {
				title : '操作',
				field : 'action',
				align : 'center',
				width : '80',
				formatter : function(value, row) {
					var str = '';
					<%if (securityUtil.havePermission("order.repairManager.getById")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-cog_add" title="查看详情" onclick="showDetail(\'{0}\');"/>', row.id);
					<%}%>
					<%if (securityUtil.havePermission("order.repairManager.cancel")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-cog_delete" title="取消订单" onclick="cancelOrder(\'{0}\',\'{1}\');"/>', row.id,row.orderStatus);
					<%}%>
					<%if (securityUtil.havePermission("order.repairManager.update")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-cog_edit" title="修改订单信息" onclick="updateOrder(\'{0}\');"/>', row.id);
					<%}%>
					return str;
				}
			} ] ],
			toolbar : '#toolbar',
			onLoadSuccess : function(data) {
				$('.iconImg').attr('src', sy.pixel_0);
			}
		});
		$("#workerselect").combobox({
			editable:false,
			valueField:'id',
			textField:'name',
			url:'<%=contextPath%>/rest/role/getWorkerlist',
			panelHeight:'auto',
			onSelect: function(rec){
				assignOrdersBatch(rec.id);
				$("#grid").datagrid('reload');
				$("#grid").datagrid('clearSelections');
				$("#selectbox").css({
					display:'none',
				});
			},
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
								<td>订单序列号</td>
								<td><input name="orderSn" style="width: 80px;" /></td>
								<td>预定人姓名</td>
								<td><input name="customername" style="width: 80px;" /></td>
								<td>维修师傅姓名</td>
								<td><input name="username" style="width: 80px;" /></td>
								<td>订单状态</td>
								<td><select name="orderStatus" class="easyui-combobox" data-options="panelHeight:'auto',editable:false"><option value="">请选择</option>
										<option value="0">未受理</option>
										<option value="2">已派单</option>
										<option value="3">已修完</option>
										<option value="5">已取消</option>
										<option value="4">已完结</option></select>
								<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom',plain:true" onclick="grid.datagrid('load',sy.serializeObject($('#searchForm')));">查询</a><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom_out',plain:true" onclick="$('#searchForm input').val('');grid.datagrid('load',{});">重置</a></td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
			<tr>
				<td>
					<table>
						<tr>
							<%if (securityUtil.havePermission("order.repairManager.assign")) {%>
							<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-cog_delete',plain:true" onclick="showAssignDIV();">派单给...</a></td>
							<%}%>
							<td>
								<div id = "selectbox" style="display:none" > <select id = "workerselect" style="width: 155px;"></select></div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<div data-options="region:'center',fit:true,border:false">
		<table id="grid" data-options="fit:true,border:false"></table>
	</div>
</body>
</html>
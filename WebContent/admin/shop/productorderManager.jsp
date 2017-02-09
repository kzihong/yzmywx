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
<script src="../../jslib/datagrid-detailview.js" type="text/javascript"></script>

<script type="text/javascript">

	function getOrderStutas(value){
		switch (value) {
		case 0:
			return '未付款';
		case 1:
			return '已付款';
		case 2:
			return '待收货';
		case 3:
			return '已收货';
		case 4:
			return '完成';
		case 5:
			return '申请售后';
		case 6:
			return '售后完成';
		case 7:
			return '已取消';
		default:
			return '错误';
		}
	}
	
	var grid;
	var dialog;
	
	//显示
	var showDetail = function(id) {
		dialog = parent.sy.modalDialog({
			title : '查看订单详情',
			height : 600,
			width  : 1200,
			maximizable : true,
			resizable : true,
			url : sy.contextPath + '/admin/shop/productorderForm.jsp?id=' + id,
			buttons : [ {
				text : '关闭',
				handler : function(){
					dialog.dialog('close');
				}
			} ]
		});
	};
	
	//更新
	var updateOrder = function(id) {
		dialog = parent.sy.modalDialog({
			title : '修改订单信息',
			height : 600,
			width  : 1200,
			maximizable : true,
			resizable : true,
			url : sy.contextPath + '/admin/shop/productorderForm.jsp?id=' + id,
			buttons : [ {
				text : '确定',
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
	
	//删除
	function deleteOrder(id){
		parent.$.messager.confirm('询问', '您确定要删除此新闻？', function(r) {
			if (r) {
				$.post(sy.contextPath + '/rest/productorder/delete/'+id,function() {
					parent.mainMenu.tree('reload');
					grid.datagrid('reload');
				}, 'json');
			}
		});
	}
	
	//初始化
	$(function() {
		grid = $('#grid').datagrid({
			title : '',
			url : sy.contextPath + '/rest/productorder/getList',
			striped : true,
			rownumbers : true,
			pagination : true,
			singleSelect : true,
			idField : 'id',
			pageSize : 20,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			frozenColumns : [ [ {
				width : '150',
				title : '订单序列号',
				field : 'orderSn',
				align : 'center'
			},  ] ],
			columns : [ [  {
				width : '150',
				title : '下单时间',
				field : 'formatcreatetime',
				align : 'center'
			}, {
				width : '60',
				title : '总数量',
				field : 'totalAmount',
				align : 'right'
			}, {
				width : '60',
				title : '总费用',
				field : 'totalPrice',
				align : 'right'
			},{
				width : '60',
				title : '订单状态',
				field : 'orderStatus',
				align : 'center',
				styler: function(value,row,index){
					switch (value) {
					case 0:
						return 'color:balck;';
					case 1:
						return 'color:blue;';
					case 2:
						return 'color:purple;';
					case 3:
						return 'color:pink;';
					case 4:
						return 'color:green;';
					default:
						return 'color:balck;';
					}
				},
				formatter : function(value,row){
					//调用函数
					return getOrderStutas(value);
				}

			}, {
				width : '400',
				title : '收货人',
				field : 'shipinfo',
				align : 'center',
				formatter : function(value,row){
					var html = value.contact + " " + value.phoneNum + " " + 
							value.shipAddress + value.shipArea + value.shipStreet + " " + value.zipcode;
					return html;
				}
			}, {
				title : '操作',
				field : 'action',
				align : 'center',
				width : '80',
				formatter : function(value, row) {
					var str = '';
					<%if (securityUtil.havePermission("productorder.productOrderManager.getById")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-cog_add" title="查看详情" onclick="showDetail(\'{0}\');"/>', row.id);
					<%}%>
					<%if (securityUtil.havePermission("productorder.productOrderManager.update")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-cog_edit" title="修改订单 " onclick="updateOrder(\'{0}\');"/>', row.id);
					<%}%>
					<%if (securityUtil.havePermission("productorder.productOrderManager.delete")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-cog_delete" title="删除订单" onclick="deleteOrder(\'{0}\');"/>', row.id);
					<%}%>
					return str;
				}
			} ] ],
			view: detailview,
			detailFormatter: function(rowIndex, rowData){
				var html = "";
				//订单详情
				html += '<table><tr>' +
						'<td style="border:0;padding:10px;">' +
						'<p>总数量: ' + rowData.totalAmount + '</p>' +
						'<p>总费用: ' + rowData.totalPrice + '</p>' +
						'<p>邮费: ' + rowData.deliveryfee + '</p></td>' +
						'<td style="border:0;padding:10px;">' +
						'<p>订单状态: ' + getOrderStutas(rowData.orderStatus) + '</p>' +
						'<p>留言: ' + (rowData.memo==null?"":rowData.memo) + '</p></td></tr>' ;
						
				//邮寄信息
				var shipinfo = rowData.shipinfo;
				if (shipinfo != undefined) {
					html += '<tr><td style="border:0;padding:10px;">'+
						'<p>联系人: ' +shipinfo.contact + '/' + shipinfo.phoneNum + '</p>' + 
						'<p>邮寄地址: ' + shipinfo.shipAddress + shipinfo.shipArea + shipinfo.shipStreet + '</p>' + 
						'<p>邮政编码: ' + shipinfo.zipcode + '</p></td>';
			
				}
				//支付信息
				var payment = rowData.payment;
				if (payment != undefined) {
					html += '<td style="border:0;padding:10px;">'+
							'<p>支付时间: ' + payment.formatcreatetime + '</p>' +
							'<p>支付方式: ' + payment.paymenttype.name + '</p></td>';
				}
				//评价信息
				var pevaluation = rowData.pevaluation;
				if (pevaluation != undefined) {
					html += '<td style="border:0;padding:10px;">'+
							'<p>评分: ' + pevaluation.grade + '</p>' +
							'<p>评价: ' + pevaluation.content + '</p></td>';
				}
				
				html += '</tr></table><table>';
				//订单下每一个商品的购买信息
				$.each(rowData.orderitems,function(index,orderitem){
					var product = orderitem.product;
					var productattrs = product.productattrs;
					var productcategory = orderitem.productcategory;
					var quantity = orderitem.quantity;
					
					var productHTML = "";
					if(undefined != product || product != null){
						productHTML += '<tr><td><img src="' + product.photoUrl + '" style="height:100px;"></td>';
						productHTML += '<td style="padding:10px;width:150px;"><p>名称: ' + product.name + '</p>'+
							'<p>类别: ' + product.producttype.name + '</p>'+
							'</td>';
					}
					/* if(undefined != productattrs || productattrs != null){
						productHTML += '<td style="padding:10px;width:150px;">';
						$.each(productattrs,function(index,productattr){
							productHTML += '<p>' + productattr.attrKey + ': ' + productattr.attrValue + '</p>';
								
						});
						productHTML += '</td>';
					} */
					if(undefined != productcategory || productcategory != null){
						productHTML += '<td style="padding:10px;width:150px;"><p>分类: ' + orderitem.productcategoryname + '</p>'+
							'<p>单价: ' + orderitem.productcategoryprice + '</p>'+
							'</td>';
					}
					
					productHTML += '<td style="padding:10px;width:150px;"><p>购买数量: ' + quantity + '</p></td></tr>';
					html += productHTML;
				});
				html += '</table>';
				return html;
			},
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
								<td>订单序列号：</td>
								<td><input name="orderSn" style="width:160px;" /></td>
								<td>下单时间：</td>
								<td><input name="date" type="text" class="easyui-datebox" style="width:100px;"/></td>
								<td>订单状态：</td>
								<td><select name="orderStatus" class="easyui-combobox" data-options="panelHeight:'auto',editable:false">
										<option value="">请选择</option>
										<option value="0">未付款</option>
										<option value="1">待发货</option>
										<option value="2">待收货</option>
										<option value="3">待评价</option>
										<option value="4">已完成</option>
									</select>
								<td>联系人：</td>
								<td><input name="contact" style="width:100px;" /></td>
								<td>联系方式：</td>
								<td><input name="phoneNum" style="width:100px;" /></td>
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
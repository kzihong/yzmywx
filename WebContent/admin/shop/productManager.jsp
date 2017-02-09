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
	var grid;
	/* function test(){
		$("#grid").datagrid('reload');
	}
	setInterval("test()",3000); */
	function inactiveProduct(){
		var productList = $("#grid").datagrid('getSelections');
		var str = '{"products": [';
		if(productList.length < 1){
			$.messager.alert("提示","请选择需要下架的商品，可多选");
			return;
		}
		$.messager.confirm("确认","确认将选中商品下架吗？",function(r){
			if(r){
					$.each(productList,function(i,n){
						if(!n.active){
							$.messager.alert("提示","所选商品已是下架状态！");
							return false;
						}else{
							str += '{"id" :"'+ n.id + '"},';
						}
					});
					str += "]}";
					str = eval("(" + str + ")");
					var url = "<%=contextPath%>/rest/product/inactive";
					var dataResult = postAjax(url,str);
					if(dataResult.success){
						$.messager.alert("提示",dataResult.errmsg);
					}else{
						$.messager.alert("提示",dataResult.errmsg);
					}
					$("#grid").datagrid('reload');
				}
			});
	}
	function updateProduct(id){
		dialog = parent.sy.modalDialog({
			title : '修改商品',
			height : 600,
			width  : 1200,
			maximizable : true,
			resizable : true,
			url : sy.contextPath + '/admin/shop/productInfo.jsp?productid='+id,
			buttons : [ {
				text : '确定',
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
	}
	function setHot(id,isHot){
		if(isHot != "false"){ 
			var url = "<%=contextPath%>/rest/product/cancelHot/"+id ;
		}else{
			var url = "<%=contextPath%>/rest/product/setHot/"+id ;
		}
		var dataR = postAjaxNoData(url);
		if(dataR.success){
			$.messager.alert("提示",dataR.errmsg);
		}else{
			$.messager.alert("错误",dataR.errmsg);
		}
		$("#grid").datagrid('reload');
	}
	function setNew(id,isHot){
		if(isHot != "false"){
			var url = "<%=contextPath%>/rest/product/cancelNew/"+id ;
		}else{
			var url = "<%=contextPath%>/rest/product/setNew/"+id ;
		}
		var dataR = postAjaxNoData(url);
		if(dataR.success){
			$.messager.alert("提示",dataR.errmsg);
		}else{
			$.messager.alert("错误",dataR.errmsg);
		}
		$("#grid").datagrid('reload');
	}
	function addProduct(){
		dialog = parent.sy.modalDialog({
			title : '添加商品',
			height : 600,
			width  : 1200,
			maximizable : true,
			resizable : true,
			url : sy.contextPath + '/admin/shop/productInfo.jsp',
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
	}
	function setActive(id,isActive){
		if(isActive == "false"){
			var url = "<%=contextPath%>/rest/product/setActive/"+id ;
		}else{
			var url = "<%=contextPath%>/rest/product/cancelActive/"+id ;
		}
		var dataR = postAjaxNoData(url);
		if(dataR.success){
			$.messager.alert("提示",dataR.errmsg);
		}else{
			$.messager.alert("错误",dataR.errmsg);
		}
		$("#grid").datagrid('reload');
	}
	function deleteProduct(){
		var productList = $("#grid").datagrid('getSelections');
		if(productList.length < 1){
			$.messager.alert("提示","请选择需要删除的商品，可多选");
			return;
		}
		$.messager.confirm('询问', '删除之后这'+productList.length+'商品的记录也将被清空，确定删除吗？', function(r){
			if(r){
				var str = '{"products": [';
				$.each(productList,function(i,n){
					str += '{"id" :"'+ n.id + '"},';
				});
				str += "]}";
				str = eval("(" + str + ")");
				var url = "<%=contextPath%>/rest/product/deleteProduct";
				var dataResult = postAjax(url,str);
				if(dataResult.success){
					$.messager.alert("提示",dataResult.errmsg);
				}else{
					$.messager.alert("提示",dataResult.errmsg);
				}
				$("#grid").datagrid('reload');
			}
		});
	}
	$(function() {
		grid = $('#grid').datagrid({
			title : '',
			url : sy.contextPath + '/rest/product/productList',
			striped : true,
			rownumbers : true,
			pagination : true,
			singleSelect : false,
			idField : 'id',
			pageSize : 20,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			/* view: detailview,
			detailFormatter: function(rowIndex, rowData){
				var str = "";
				$.each(rowData.productcategorys,function(i,n){
					str += "<p>种类"+ (i+1) + "：<strong>" + n.name + "&nbsp;&nbsp; 价格：</strong>" + n.price + "<strong>&nbsp;&nbsp;库存 ：</strong>" + n.inventory + "</p>" ;
				});
				return str;
			}, */
			frozenColumns : [ [ {
				title: 'checkboxColumn',
				field : 'checkboxColumn',
				title :'checkboxColumn',
				checkbox:true,
			},{
				width : '130',
				title : '产品序列号',
				align : 'center',
				sortable : true,
				field : 'productSn',
			},  ] ],
			columns : [ [  {
				width : '80',
				title : '产品名',
				align : 'center',
				field : 'name',
			}, {
				width : '140',
				title : '上架时间',
				field : 'formatcreatetime',
				sortable : true,
				align : 'center',
			}, {
				width : '70',
				title : '所属类别',
				field : 'producttype',
				align : 'center',
				formatter : function(value,row){
					return row.producttype.name;
				}
			},{
				width : '70',
				title : '综合价格',
				sortable : true,
				field : 'price',
				align : 'center',
			},{
				width : '150',
				title : '商品状态',
				field : 'productStatus',
				align : 'center',
				formatter : function(i,n){
					var str = "";
					if(n.active){
						str += "上架中&nbsp;&nbsp;";
					}else{
						str += "已下架&nbsp;&nbsp;";
					}
					if(n.formatisNew){
						str += "新品&nbsp;&nbsp;";
					}
					if(n.hot){
						str += "热卖中&nbsp;&nbsp;";
					}
					return str;
				}
			},{
				width : '60',
				title : '总库存量',
				field : 'inventory',
				align : 'center',
				formatter : function(value,row){
					var inventory = 0;
					$.each(row.productcategorys,function(i,n){
						inventory += n.inventory;
					});
					return inventory;
				}
			}, {
				width : '60',
				title : '销量',
				field : 'productsales',
				sortable : true,
				align : 'center',
				/* formatter : function(value,row){
				
				} */
			},{
				title : '操作',
				field : 'action',
				align : 'center',
				width : '80',
				formatter : function(value, row) {
					var str = '';
					<%if (securityUtil.havePermission("shop.productManager.update")) {%>
					str += sy.formatString('<img class="iconImg ext-icon-weather_sun" title="设为/取消 新品" onclick="setNew(\'{0}\',\'{1}\');"/>', row.id,row.formatisNew);	
					str += sy.formatString('<img class="iconImg ext-icon-star" title="设为/取消 热销" onclick="setHot(\'{0}\',\'{1}\');"/>', row.id,row.hot);
					str += sy.formatString('<img class="iconImg ext-icon-cart_put" title="设为上架/下架" onclick="setActive(\'{0}\',\'{1}\');"/>', row.id,row.active);
					str += sy.formatString('<img class="iconImg ext-icon-cart_edit" title="修改商品" onclick="updateProduct(\'{0}\');"/>', row.id);
					<%}%>
					return str;
				}
			} ] ],
			toolbar : '#toolbar',
			onLoadSuccess : function(data) {
				$('.iconImg').attr('src', sy.pixel_0);
			}
		});
		<%-- $("#workerselect").combobox({
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
		}); --%>
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
								<td>商品序列号：</td>
								<td><input name="productSn" style="width: 80px;" /></td>
								<td><div class="datagrid-btn-separator"></div></td>
								<td>商品所属类别：</td>
								<td><select name="producttype" class="easyui-combobox" style="width:100px" data-options="panelHeight:'auto',editable:false,url:'<%=contextPath%>/rest/product/getProductTypeList',valueField:'id',textField:'name',"></select></td>
								<td><div class="datagrid-btn-separator"></div></td>
								<td>选择商品状态：&nbsp;</td>
								<td>新品：</td>
								<td><select name="new" class="easyui-combobox" data-options="panelHeight:'auto',editable:false"><option value="">请选择</option>
										<option value="0">否</option>
										<option value="1">是</option></select>
								&nbsp;
								<td>热门：</td>
								<td><select name="hot" class="easyui-combobox" data-options="panelHeight:'auto',editable:false"><option value="">请选择</option>
										<option value="0">否</option>
										<option value="1">是</option></select>
								&nbsp;
								<td>上架：</td>
								<td><select name="active" class="easyui-combobox" data-options="panelHeight:'auto',editable:false"><option value="">请选择</option>
										<option value="0">否</option>
										<option value="1">是</option></select>
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
						<%if (securityUtil.havePermission("shop.productManager.add")) {%>
							<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-cart_add',plain:true" onclick="addProduct();">添加商品</a></td>
							<%}%>
							<%if (securityUtil.havePermission("shop.productManager.delete")) {%>
							<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-cart_delete',plain:true" onclick="deleteProduct();">删除选中商品(单选)</a></td>
							<%}%>
							<%if (securityUtil.havePermission("shop.productManager.inactive")) {%>
							<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-cart_remove',plain:true" onclick="inactiveProduct();">下架选中商品(多选)</a></td>
							<%}%>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cn.easycode.yzmywx.bean.vo.SessionInfo"%>
<%@ page import="cn.easycode.yzmywx.utils.ConfigUtil"%>
<%@ page import="cn.easycode.yzmywx.bean.eo.shop.Delivery"%>
<%
	String contextPath = request.getContextPath();
	SessionInfo sessionInfo = (SessionInfo) session.getAttribute(ConfigUtil.getSessionInfoName());
	if (sessionInfo == null) {
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<link href="<%=contextPath%>/jslib/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=contextPath%>/jslib/jquery-2.0.3.js" type="text/javascript"></script>
<script src="<%=contextPath%>/jslib/bootstrap-3.3.5-dist/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=contextPath%>/jslib/json2.js" type="text/javascript"></script>
<script src="<%=contextPath%>/jslib/ajax.js" type="text/javascript"></script>
<script src="<%=contextPath%>/jslib/syExtJquery.js" type="text/javascript"></script>
 <style>
       
 </style>
</head>
<body>

<div class="container-fluid" style="margin:0 auto; width:95%">
	<div class="row">
	  <div class="col-md-12">
	  	<div class="row" style="padding-top:50px;">
	  		<div class="col-md-2">
	  			<ul class="nav nav-pills nav-stacked">
				  <li role="presentation" onclick="showpanel('1')" ><a href="javascript:void(0)"><big><strong>基本信息</strong></big></a></li>
				  <li role="presentation" onclick="showpanel('2')" ><a href="javascript:void(0)"><big><strong>快递信息</strong></big></a></li>
				</ul>
	  		</div>
	  		<div class="col-md-10" style="background-color: #f8f8f8">
	  			<form>
		  			<div id="baseinfopanel">
		  				<table class="table table-bordered">
			  				<tbody id="cagegorybody">
			  					<tr>
			  						<td>
			  							<strong>订单序列号：</strong>
			  							<input type="text" name="id" value="<%=id%>" style="display:none;" >
					    			</td>
			  						<td><input type="text" name="orderSn" class="form-control" readonly="readonly" placeholder="订单状态"></td>
			  						<td><strong>订单状态：</strong></td>
			  						<td>
			  							<select class="form-control" name="orderStatus">
									      	<option value="0">未付款</option>
									      	<option value="1">已付款</option>
									      	<option value="2">待收货</option>
									      	<option value="3">已收货</option>
									      	<option value="4">完成</option>
									      	<option value="5">申请售后</option>
									      	<option value="6">售后完成</option>
									      	<option value="7">已取消</option>
								      	</select>
								     </td>
			  					</tr>
			  					<tr>
			  						<td><strong>总数量：</strong></td>
			  						<td><input type="text" name="totalAmount" class="form-control" placeholder="总数量"></td>
			  						<td><strong>总费用：</strong></td>
			  						<td><input type="text" name="totalPrice" class="form-control" placeholder="总费用"></td>
			  					</tr>
			  				</tbody>
				  		</table>
					
						<p></p>
			  			<p> </p>
		  			</div>
		  			<div id="deliverypanel" style="display: none">
			  			<h4><strong>快递单号：</strong></h4>
					    <input type="text" class="form-control" name="delivery.deliverySn" placeholder="快递单号" >
						<h4><strong>店长推荐：</strong></h4>
					    <input type="text" name="delivery.shippercode" />
					    <button class="btn btn-primary btn-sm" type="button" onclick="addColumn()">添加规格值</button>
			  			<button class="btn btn-danger btn-sm" type="button" onclick="deleteColumn()">删除规格值</button>
			  			
			  			<p></p>
			  			<p></p>
		  			</div>
		  		</form>
	  		</div>
	  	</div>
	</div>    
	</div>   
</div>
	
<script type="text/javascript">

function showpanel(panel){
	if(panel == "1"){
		$("#baseinfopanel").show(500);
		$("#deliverypanel").hide(200);
	}else{
		$("#baseinfopanel").hide(200);
		$("#deliverypanel").show(500);
	}
}

var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
	if (true) {
		if ($(':input[name="id"]').val().length > 0) {
			var url = '<%=contextPath%>/rest/productorder/update';
			var dataResult = postAjax(url, sy.serializeObject($('form')));
			if (dataResult.success) {
				$pjq.messager.alert('提示', dataResult.msg, 'info');
				$dialog.dialog('destroy');
				$grid.datagrid('reload');
				$mainMenu.tree('reload');
			} else {
				$pjq.messager.alert('提示', dataResult.msg, 'error');
			}
		}else{
			$pjq.messager.alert('提示', "出错", 'error');
			$dialog.dialog('destroy');
		}
	}
	
};

$(function() {
	var orderId = $(':input[name="id"]').val();
	if (orderId && orderId.length > 0) {
		$.get('<%=contextPath%>/rest/productorder/getById/' + orderId, function(result) {
			if (result.id != undefined) {
				$(':input[name="orderSn"]').val(result.orderSn);
				$(':input[name="orderStatus"]').val(result.orderStatus);
				$(':input[name="totalAmount"]').val(result.totalAmount);
				$(':input[name="totalPrice"]').val(result.totalPrice);
				
				$(':input[name="deliveryfee"]').val(result.deliveryfee);
				$(':input[name="memo"]').val(result.memo);
				///totalAmount
				//'delivery.companyName' : result.delivery.companyName,
				//'pevaluation.content' : result.pevaluation.content
			}
		}, 'json');
	}
	
	showpanel("1");
});

</script>
</body>
</html>
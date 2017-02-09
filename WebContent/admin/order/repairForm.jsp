<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String orderid = request.getParameter("id")==null?"":request.getParameter("id");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="../../jslib/bootstrap-3.3.5-dist/css/bootstrap.css">
<link href="../../jslib/bootstrap-3.3.5-dist/css/bootstrap-switch.css" rel="stylesheet">
<script type="text/javascript" src="../../jslib/jquery-2.0.3.js"></script>
<script type="text/javascript" src="../../jslib/ajax.js"></script>
<script type="text/javascript" src="../../jslib/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<script src="../../jslib/bootstrap-3.3.5-dist/js/bootstrap-switch.js"></script>
<script type="text/javascript">
$(function(){
	var orderid="<%=orderid%>";
	if(orderid != ""){
		var repairorder = getAjaxNoData("/rest/repair/getByOrderId/"+orderid);
		$("#orderStatus").val(repairorder.orderStatus);
		$("#contact").val(repairorder.contact);
		$("#telephone").val(repairorder.telephone);
		$("#photoUrl").val(repairorder.photoUrl);
		$("#img").attr("src",repairorder.photoUrl);
		$("#address").val(repairorder.address);
		$("#memo").val(repairorder.memo);
		$("#timeup").val(repairorder.formatbooktimeup);
		$("#timedown").val(repairorder.formatbooktimedown);
	}
});
</script>
</head>
<body>
<div class="container-fluid" style="margin:0 auto; width:95%">
	<div class="row" style="padding-top:10px;">
		<div class="col-md-12">
			<div class="form-group" id="orderStatusdiv">
			  	<h4><strong>订单状态：</strong></h4>
		     	<select class="form-control" id="orderStatus">
		      		<option value="0">未受理</option>
					<option value="2">已派单</option>
					<option value="3">已修完</option>
					<option value="5">已取消</option>
					<option value="4">已完结</option>
		      	</select>
	      	</div>
			<div class="form-group" id="contactdiv">
			    <h4><strong>预约人姓名：</strong></h4>
			    <input type="text" class="form-control " id="contact" placeholder="预约人姓名" >
			</div>
			<div class="form-group" id="telephonediv">
			    <h4><strong>电话：</strong></h4>
			    <input type="text" class="form-control " id="telephone" placeholder="电话" >
			</div>
			<div class="form-group" id="imgdiv">
			    <h4><strong>情景照片：</strong></h4>
			    <img src="" id="img">
			    <input type="hidden" id="photoUrl">
			</div>
			<div class="form-group" id="addressdiv">
			    <h4><strong>预约地点：</strong></h4>
			    <input type="text" class="form-control " id="address" placeholder="预约地点" >
			</div>
			<div class="form-group" id="memodiv">
			    <h4><strong>备注信息：</strong></h4>
			    <input type="text" class="form-control " id="memo" placeholder="备注信息" >
			</div>
			<div class="form-group" id="timeupdiv">
			    <h4><strong>预约时间上限：</strong></h4>
			    <input type="text" class="form-control " id="timeup" placeholder="预约时间上限" >
			</div>
			<div class="form-group" id="timedowndiv">
			    <h4><strong>预约时间下限：</strong></h4>
			    <input type="text" class="form-control " id="timedown" placeholder="预约时间下限" >
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
function submitForm(dialog, grid, parent, mainMenu){
	var contact =$.trim($("#contact").val());
	if(contact == ""){
		$("#contactdiv").attr('class','form-group has-error');
		$("#contact").attr('placeholder',"请输入预约人姓名");
		$("#contact").focus();
		return false ;
	}
	var orderStatus =$.trim($("#orderStatus").val());
	var telephone =$.trim($("#telephone").val());
	if(telephone == ""){
		$("#telephonediv").attr('class','form-group has-error');
		$("#telephone").attr('placeholder',"请输入电话号码");
		$("#telephone").focus();
		return false ;
	}
	var photoUrl =$.trim($("#photoUrl").val());
	var address =$.trim($("#address").val());
	if(address == ""){
		$("#addressdiv").attr('class','form-group has-error');
		$("#address").attr('placeholder',"请输入住址");
		$("#address").focus();
		return false ;
	}
	var memo =$.trim($("#memo").val());
	var timeup =$.trim($("#timeup").val());
	if(timeup == ""){
		$("#timeupdiv").attr('class','form-group has-error');
		$("#timeup").attr('placeholder',"请输入预约时间上限");
		$("#timeup").focus();
		return false ;
	}
	var timedown =$.trim($("#timedown").val());
	if(timedown == ""){
		$("#timedowndiv").attr('class','form-group has-error');
		$("#timedown").attr('placeholder',"请输入预约时间下限");
		$("#timedown").focus();
		return false ;
	}
	var json = {
			"formatbooktimedown" : timedown,
			"formatbooktimeup" :timeup,
			"memo" : memo,
			"address" : address,
			"photoUrl" :photoUrl,
			"contact":contact,
			"telephone":telephone,
			"orderStatus":orderStatus,
			"telephone":telephone
	};
	var url = "/rest/repair/update/<%=orderid%>";
	var result = postAjax(json,url);
	if(result.success){
		parent.messager.alert('提示',result.msg);
		dialog.dialog('destroy');
		grid.datagrid('reload');
		mainMenu.tree('reload');
	}else{
		parent.messager.alert('提示',result.msg);
	}
}
</script>
</html>
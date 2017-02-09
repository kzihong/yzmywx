<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String workerid = request.getParameter("id")==null?"":request.getParameter("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../jslib/bootstrap-3.3.5-dist/css/bootstrap.css">
<link href="../../jslib/bootstrap-3.3.5-dist/css/bootstrap-switch.css" rel="stylesheet">
<script type="text/javascript" src="../../jslib/jquery-2.0.3.js"></script>
<script type="text/javascript" src="../../jslib/ajax.js"></script>
<script type="text/javascript" src="../../jslib/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<script src="../../jslib/bootstrap-3.3.5-dist/js/bootstrap-switch.js"></script>
<style>
.img-rounded{
	margin:4px;
	z-index: -1;
}
.file{
	width:98px;
	height:137px;
   	z-index:999;
	opacity: 0;
	position: absolute;
	top:32px;
}
</style>
</head>
<body>
<div class="container-fluid" style="margin:0 auto; width:95%">
	<div class="row" style="padding-top:10px;"> 
		<div class="col-md-6">
			<div class="form-group" id="namediv">
			    <h4><strong>姓名：</strong></h4>
			    <input type="text" class="form-control " id="name" placeholder="姓名" >
			</div>
			<div class="form-group" id="loginnamediv">
			    <h4><strong>登录名(建议使用手机号码)：</strong></h4>
			    <input type="text" class="form-control " id="loginname" placeholder="登录名" >
			</div>
			<!-- <div class="form-group" id="pswdiv">
			    <h4><strong>登录密码：</strong></h4>
			    <input type="text" class="form-control " id="password" placeholder="登录密码" >
			</div> -->
			<div class="form-group">
			  	<h4><strong>性别：</strong></h4>
		     	<select class="form-control" id="sexselect">
		      		<option value="1">男</option>
		      		<option value="0">女</option>
		      	</select>
	      	</div>
	      	<div class="form-group" id="typediv">
			  	<h4><strong>分组：</strong></h4>
		     	<select class="form-control" id="typeselect">
		      		<option value="">请选择</option>
		      	</select>
	      	</div>
		</div>
		<div class="col-md-6" style="padding-bottom: 20px;">
			<h4><strong>员工相片：</strong></h4>
			<img src="../../img/uploadimg.png"  class="img-rounded" style="width:98px;height:137px" id="coverimg"> 
			<input type="file" id="file" class="file">	
			<input type="hidden" id="photoUrl">
			<canvas style="display:none" id="canvas"></canvas>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
$(function(){
	var workerid="<%=workerid%>";
	if(workerid != ""){
		var worker = getAjaxNoData("/rest/user/getById/"+workerid);
		$("#name").val(worker.name);
		$("#loginname").val(worker.loginname);
		//$("#password").val(worker.pwd);
		$("#typeselect").val(worker.workergroup.id);
		$("#sexselect").val(worker.sex);
		$("#photoUrl").val(worker.photo);
		$("#coverimg").attr("src",worker.photo);
	}
});

var coverfile = document.getElementById("file");
coverfile.onchange=function(){
	var image = document.getElementById("coverimg");
	var canvas = document.getElementById("canvas");
    var context = canvas.getContext("2d");
	image.className="img-rounded";
    image.src = window.URL.createObjectURL(coverfile.files[0]);
    image.onload = function () {
        canvas.width=image.width;
        canvas.height=image.height;
        context.drawImage(image, 0, 0,image.width,image.height);
	    var data = canvas.toDataURL();
		var json = {
				"base64code":data,
		};
		var result = postAjax('/rest/editor/uploadImage',json);
		if(result.success){
			$("#photoUrl").val(result.errmsg);
		}else{
			alert(result.errmsg);
		}
    };
};

var typeList = postAjaxNoData('/rest/user/getWorkergroup');
var str="";
$.each(typeList,function(i,n){
	str += "<option value='"+ n.id +"'>"+ n.groupname +"</option>";
});
$("#typeselect").append(str);
function validata(){
	var name = $.trim($("#name").val());
	if(name == ""){
		$("#namediv").attr('class','form-group has-error');
		$("#name").attr('placeholder',"请输入姓名");
		$("#name").focus();
		return false;
	}
	var loginname = $.trim($("#loginname").val());
	if(loginname == ""){
		$("#loginnamediv").attr('class','form-group has-error');
		$("#loginname").attr('placeholder',"请输入登录名");
		$("#loginname").focus();
		return false;
	}
	/* var psw = $.trim($("#password").val());
	if(psw == ""){
		$("#pswdiv").attr('class','form-group has-error');
		$("#password").attr('placeholder',"请输入登录名");
		$("#password").focus();
		return false;
	} */
	var type = $("#typeselect").val();
	if(type==""){
		$("#typediv").attr('class','form-group has-error');
		$("#typediv").focus();
		return false;
	}
	var photoUrl = $("#photoUrl").val();
	if(photoUrl==""){
		alert("请至少上传一张相片(1寸)");
		return false;
	}
	return true;
}
function submitForm(dialog, grid, parent, mainMenu){
	if(validata()){
		var json = {
				"name" : $.trim($("#name").val()),
				"loginname" : $.trim($("#loginname").val()),
				//"pwd":$.trim($("#password").val()),
				"sex":$("#sexselect").val(),
				"groupid":$("#typeselect").val(),
				"photo" : $("#photoUrl").val(),
				"active":"1"
		};
		var url = "<%=workerid%>"==""? "/rest/user/addWorker": "/rest/user/updateWorker/<%=workerid%>";
		var savaResult =  postAjax(url,json);
		if(savaResult.success){
	    		parent.messager.alert('提示',savaResult.msg);
	    		dialog.dialog('destroy');
	    		grid.datagrid('reload');
				mainMenu.tree('reload');
    	}else{
    		parent.messager.alert('提示',savaResult.msg);
    	}
	}
	
}

</script>
</html>
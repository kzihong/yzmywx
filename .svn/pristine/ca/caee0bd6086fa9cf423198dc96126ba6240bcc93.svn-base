<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cn.easycode.yzmywx.bean.vo.SessionInfo"%>
<%@ page import="cn.easycode.yzmywx.utils.ConfigUtil"%>
<%
	String contextPath = request.getContextPath();
	SessionInfo sessionInfo = (SessionInfo) session.getAttribute(ConfigUtil.getSessionInfoName());
	String userid = "";
	if (sessionInfo == null) {
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}else{
		userid = sessionInfo.getUser().getId();
	}
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
<script type="text/javascript">
function updateInfo(){
	
}
$(function(){
	var user = getAjaxNoData("/rest/user/getById/<%=userid%>");
	$("#coverimg").attr("src",user.photo);
	$("#name").val(user.name);
	$("#photoUrl").val(user.photo);
	$("#loginname").val(user.loginname);
	$("#sex").val(user.sex);
	if(user.workergroup == null){
		$("#typediv").hide();
	}else{
		$("#typeselect").val(user.workergroup.groupname);
	}
});
</script>
</head>
<body>
<div class="container-fluid" style="margin:0 auto; width:95%">
	<div class="row" style="padding-top:10px; margin-left:7%"> 
		<div class="col-md-2" >
			<h4><strong>员工相片：</strong></h4>
			<img src="../../img/uploadimg.png"  class="img-rounded" style="width:98px;height:137px" id="coverimg"> 
			<input type="file" id="file" class="file">	
			<input type="hidden" id="photoUrl">
			<canvas style="display:none" id="canvas"></canvas>
		</div>
		<div class="col-md-10" style="padding-bottom: 10px;">
			<div class="form-group" id="namediv">
			    <h4><strong>姓名：</strong></h4>
			    <input type="text" class="form-control " id="name" placeholder="姓名" style="width:70%">
			</div>
			<div class="form-group" id="loginnamediv">
			    <h4><strong>登录名：</strong></h4>
			    <input type="text" class="form-control " id="loginname" placeholder="登录名" style="width:70%">
			</div>
			<!-- <div class="form-group" id="pswdiv">
			    <h4><strong>登录密码：</strong></h4>
			    <input type="text" class="form-control " id="password" placeholder="登录密码" >
			</div> -->
			<div class="form-group">
			  	<h4><strong>性别：</strong></h4>
		     	<select class="form-control" id="sexselect" style="width:70%">
		      		<option value="1">男</option>
		      		<option value="0">女</option>
		      	</select>
	      	</div>
	      	<div class="form-group" id="typediv">
			  	<h4><strong>分组：</strong></h4>
			  	<input type="text" class="form-control " id="typeselect" placeholder="分组" style="width:70%">
	      	</div>
		</div>
		<!-- <button class="btn btn-primary" type="button" onclick="updateInfo()" style="width:50%;margin-left:8%；mar">更新个人资料</button> -->
	</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<script type="text/javascript" src="jslib/jquery-1.9.1.js"></script>
<script src="jslib/json2.js" type="text/javascript"></script>
<script src="jslib/ajax.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="jslib/bootstrap-3.3.5-dist/css/bootstrap.css">
<script type="text/javascript" src="jslib/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<script src="jslib/bootstrap-3.3.5-dist/js/bootstrap-switch.js"></script>
<script type="text/javascript"> 
	if (window != top) top.location.href = location.href; 
</script>
<%
	String server_path = request.getContextPath();
%>
<script type="text/javascript">
function doLogin(){
	var inputMsg = $.trim($("#username").val());
	var inputPWD = $.trim($("#password").val());
	if(inputMsg == ""){
		alert("请输入用户名"); return;
	}else if(inputPWD == ""){
		alert("请输入密码"); return;
	}else{
		var jsonobj = {
			"loginname" : inputMsg,
			"pwd" : inputPWD
		};
		var loginurl = "<%= server_path%>/rest/user/login";//servlet路径
		var dataResult = postAjax(loginurl,jsonobj);
		if(dataResult.success){
			//跳转到管理后台首页
			window.location="index.jsp";
		}else{
			alert(dataResult.msg);
		}
	}
}
$(document).ready(function(){
	document.onkeydown = function(e){ 
	    var ev = document.all ? window.event : e;
	    if(ev.keyCode==13) {
	    	doLogin();
		}
	};
	$("#bt_Login").click(function(){
		doLogin();
	});
	$('#username').focus();
});

</script>
</head>
<body style="background-image: url('img/5-120601095331-50.jpg');">
<div class="container-fluid" style="margin:0 auto; width:95%;padding-top:100px;">
	<div class="row" style="margin:0 auto; width:30%">
		<h1 style="margin-left:30%">系统登录</h1>
		<br>
		<div class="form-group" id="namediv">
		    <h4><strong>用户名：</strong></h4>
		    <input type="text" class="form-control " id="username" placeholder="用户名" >
		</div>
		<div class="form-group" id="namediv">
		    <h4><strong>密码：</strong></h4>
		    <input type="password" class="form-control " id="password" placeholder="密码" >
		</div>
		<br>
		<button id="bt_Login" class="btn btn-primary btn-lg" style="width:90%;margin-left:5%"> 登录</button>
	</div>		
</div>
</body>
</html>
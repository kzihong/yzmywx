<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
<link rel="stylesheet" href="jslib/weui-master/dist/style/weui.min.css"/>
<script type="text/javascript" src="js/zepto.min.js"></script>
<script type="text/javascript">
window.onload = function(){
};
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
		var loginurl = "/rest/user/login";//servlet路径
		var dataResult = postAjax(loginurl,jsonobj);
		if(dataResult.success){
			//跳转到管理后台首页
			window.location="workhistory.jsp";
		}else{
			alert(dataResult.msg);
		}
	}
}
function postAjax(url_post, data) {
	var result="" ;
	$.ajax({
		type : 'POST',
		contentType : "application/json; charset=utf-8",
		url : url_post,
		data : JSON.stringify(data),							
		success : function(result1) { result = result1; },
		dataType : 'json',
		error : function(XMLHttpRequest, textStatus, errorThrown) { },
		async: false
	});
	return result;
}
</script>
</head>
<body>
	<div style="margin-top:50%;widht:94%;magrin-left:3%">
		<div class="weui_cells_title">登录信息</div>
	        <div class="weui_cells weui_cells_form">
	            <div class="weui_cell">
	                <div class="weui_cell_hd"><label class="weui_label">登录名</label></div>
	                <div class="weui_cell_bd weui_cell_primary">
	                    <input class="weui_input" type="text" placeholder="请输入登录名" id="username"/>
	                </div>
	            </div>
	            <div class="weui_cell">
	                <div class="weui_cell_hd"><label class="weui_label">密码</label></div>
	                <div class="weui_cell_bd weui_cell_primary">
	                    <input class="weui_input" type="password" placeholder="请输入密码" id="password"/>
	                </div>
	            </div>
	        </div>
	        <div class="weui_cells_tips">若忘记登录信息请联系管理员</div>
	</div>
	<div style="padding-top:60px;width:80%;margin-left:10%">
	    <a href="javascript:void(0)" class="weui_btn weui_btn_plain_primary" onclick="doLogin()">登录</a>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jslib/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="jslib/ajax.js"></script>
<script type="text/javascript">
$(function(){
	$("#button").click(function(){
		var re = postAjaxNoData("/rest/editor/getcode");
		var url = "/rest/editor/uploadImage";
		var json = {
				"base64code" :re.errmsg
		};
		var result = postAjax(url,json);
		$("#img").attr("src",result.errmsg);
	});
});
</script>
</head>
<body>
<input id="button" type="button" value = "ok" onclick="sent()">
<img id="img" src="/rest/editor/getPIC/image/a7227c19c7ae4c039449b3d005710a23.PNG">
</body>
</html>
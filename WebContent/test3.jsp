<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jslib/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="jslib/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="jslib/bootstrap-3.3.5-dist/js/bootstrap-switch.min.js"></script>
<link rel="stylesheet" href="jslib/bootstrap-3.3.5-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="jslib/bootstrap-3.3.5-dist/css/bootstrap-switch.min.css">
</head>
<body>
<div id="destroy-switch" class="switch">
	<input type="checkbox" id="checkbox" checked>
</div>
</body>
<script type="text/javascript">
function init(){
	//$("#checkboxdiv").bootstrapSwitch('destory');
	/* $("#checkbox").bootstrapSwitch({
		state:true,
	}); */
}
$(function(){
	$("#checkbox").bootstrapSwitch({
		state:true,
	}); 
	alert(1)
	$('#destroy-switch').bootstrapSwitch('destroy');
});
</script>
</html>
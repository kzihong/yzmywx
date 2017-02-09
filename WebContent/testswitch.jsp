<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String productid = request.getParameter("productid") == null
			? ""
			: request.getParameter("productid");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Turn checkboxes and radio buttons in toggle switches.">
<meta name="author" content="Mattia Larentis, Emanuele Marchi and Peter Stein">
<title>testSwitch</title>

<link rel="stylesheet" type="text/css" href="jslib/bootstrap-3.3.5-dist/css/bootstrap.css">
<link href="jslib/bootstrap-3.3.5-dist/css/bootstrap-switch.css" rel="stylesheet">

</head>
<body>
	<div>
		<input class="form-control" type="checkbox" >/*checked*/
	</div>
	<div>
		<input type="checkbox" checked>
	</div>
	
	
	
	<script type="text/javascript" src="jslib/jquery-2.0.3.js"></script>
	<script type="text/javascript" src="jslib/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
	<script src="jslib/bootstrap-3.3.5-dist/js/bootstrap-switch.js"></script>
	<script>
		$(function(argument) {
			$('[type="checkbox"]').bootstrapSwitch();
		})
	</script>
</body>
</html>

<%@page import="cn.easycode.yzmywx.utils.ConfigUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String openid = (String)request.getSession().getAttribute(ConfigUtil.getSessionInfoName());
	out.print(openid);
	String response_type = request.getParameter("response_type");
	String scope = request.getParameter("scope");
	String state = request.getParameter("state");
	
	System.out.print(response_type);
	System.out.print(scope);
	System.out.print(state);
	
	HttpSession seesion = request.getSession();
	seesion.setAttribute("response_type", response_type);
	seesion.setAttribute("scope", scope);
	seesion.setAttribute("state", state);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>
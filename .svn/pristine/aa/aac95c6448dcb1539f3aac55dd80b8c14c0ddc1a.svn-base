<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cn.easycode.yzmywx.bean.vo.SessionInfo"%>
<%@ page import="cn.easycode.yzmywx.utils.ConfigUtil"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.HashSet"%>
<%
	String contextPath = request.getContextPath();
	SessionInfo sessionInfo = (SessionInfo) session.getAttribute(ConfigUtil.getSessionInfoName());
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<jsp:include page="../inc.jsp"></jsp:include>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',fit:true,border:false">
		<table style="width: 100%;">
			<tr>
				<td><fieldset>
						<legend>用户信息</legend>
						<table class="table" style="width: 100%;">
							<tr>
								<th>用户ID</th>
								<td><%=sessionInfo.getUser().getId()%></td>
								<th>使用IP</th>
								<td><%=sessionInfo.getUser().getIp()%></td>
							</tr>
							<tr>
								<th>登录名</th>
								<td><%=sessionInfo.getUser().getLoginname()%></td>
								<th>姓名</th>
								<td><%=sessionInfo.getUser().getName()%></td>
							</tr>
							<tr>
								<th>性别</th>
								<td>
									<%
										if (sessionInfo.getUser().getSex() != null && sessionInfo.getUser().getSex().equals("1")) {
											out.print("男");
										} else {
											out.print("女");
										}
									%>
								</td>
							</tr>
						</table>
					</fieldset></td>
			</tr>
		</table>
	</div>
</body>
</html>
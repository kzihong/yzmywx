<%@page import="net.sf.json.JSONObject"%>
<%@page import="cn.easycode.yzmywx.utils.WeixinUtil"%>
<%@page import="cn.easycode.yzmywx.utils.ConfigUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	/* String code = request.getParameter("code");
	String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
	url = url.replace("APPID", ConfigUtil.get("appid")).replace("SECRET", ConfigUtil.get("appsecret")).replace("CODE", code);
	JSONObject jo = WeixinUtil.doGetStr(url); */
	request.getSession().setAttribute(ConfigUtil.get("customer"), "oQ1HdvgOqUiH8rdMPgSrleM5l8tc");
	String orderid = "1993b0e6-2251-4482-b2bb-3abc49fddcba";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../jslib/jquery-1.9.1.js"></script>
<script type="text/javascript" src="../jslib/ajax.js"></script>
<script type="text/javascript">
	$(function(){
		$("#persist").click(function(){
			var url="<%=contextPath%>/rest/cart/addInto";
			var URL_LOCAL = "<%=contextPath%>/rest/cart/addInto";
			var json ={
						"categoryid": "27d2eee4d5ec4c1abd894e805a061b6a",
						"productid": "f4dab990-cbd8-4413-8043-1c255d8fa42a",
						"quantity":1,
			};
			var dataR = postAjax(URL_LOCAL,json);
			if(dataR.success){
				alert(dataR.errmsg);
			}
		});
			
		$("#cancel").click(function(){
			var url="<%=contextPath%>/rest/cart/remove/76b958af-2e72-4b2f-96f1-e8ea9df10b91";
			var dataR = postAjaxNoData(url);
			if(dataR.success){
				alert(dataR.errmsg);
			}
		});
		
		$("#assign").click(function(){
			var url="<%=contextPath%>/rest/cart/updateQuantity";
			var json_assign = {
					"categoryid" : "05cd0f27-076d-44ac-a218-a58e2a4dfaa9",
					"quantity" : 6
			};
			var dataR = postAjax(url,json_assign);
			if(dataR.success){
				alert(dataR.errmsg);
			}
		});
		
		$("#setFinish").click(function(){
			var url="<%=contextPath%>/rest/repair/setFinish/1bebd1de-7c25-46af-9d8c-6f119c490cea";
			var dataR = postAjaxNoData(url);
			if(dataR.success){
				alert(dataR.errmsg);
			}
		});
		
		$("#queryOrder").click(function(){
			var url="<%=contextPath%>/rest/repair/queryOrder/all";
			var dataR = postAjaxNoData(url);
			if(dataR.success){
				alert(dataR.list.length);
			}
		});
		
		$("#QueryEBU").click(function(){
			var url="<%=contextPath%>/rest/repair/queryEvaluationByUserid/-1";
			var dataR = postAjax(url);
			if(dataR.success){
				alert(dataR.list.length);
			}
		});
		
		$("#QueryEBL").click(function(){
			var url="<%=contextPath%>/rest/repair/queryEvaluation/all";
			var dataR = postAjax(url);
			if(dataR.success){
				alert(dataR.list.length);
			}
		});
		
		$("#evaluat").click(function(){
			var url="<%=contextPath%>/rest/repair/setEvaluation";
			var json_evaluat = {
					"orderid" : "1bebd1de-7c25-46af-9d8c-6f119c490cea",
					"content" :"dafsadfsadfsafsadfsadf"
			};
			var dataR = postAjax(url,json_evaluat);
			if(dataR.success){
				alert(dataR.errmsg);
			}
		});
		$("#getLocation").click(function(){
			var url="<%=contextPath%>/rest/repair/getLocation";
			var dataR = postAjaxNoData(url);
				alert(dataR.latitude);
		});
	});
</script>
</head>
<body>
<%
	if(orderid !=null){
%>
	<button id="persist" value="保存订单">加入购物车
	</button><br>
	<button id="cancel" value="取消订单">
	</button><br>
	<button id="assign" value="分配订单">
	</button><br>
	<button id="evaluat" value="评价订单">
	</button><br>
	<button id="setFinish" value="设置完成">
	</button><br>
	<button id="queryOrder" value="查询订单">
	</button><br>
	<button id="QueryEBU" value="查询工人评价">
	</button><br>
	<button id="QueryEBL" value="查询等级评价">
	</button>
	<button id="getLocation" value="查询等级评价">
	</button>
<% 
}
%>
<a href="test2.jsp"> tiaozhuan</a>
<input type="text" id="content">
</html>
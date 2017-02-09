<%@page import="net.sf.json.JSONObject"%>
<%@page import="cn.easycode.yzmywx.utils.WeixinUtil"%>
<%@page import="cn.easycode.yzmywx.utils.ConfigUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* String code = request.getParameter("code");
	String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
	url = url.replace("APPID", ConfigUtil.get("appid")).replace("SECRET", ConfigUtil.get("appsecret")).replace("CODE", code);
	JSONObject jo = WeixinUtil.doGetStr(url); 
	request.getSession().setAttribute("customer", jo.get("openid")); */
	request.getSession().setAttribute("customer", "oQ1HdvgOqUiH8rdMPgSrleM5l8tc");
	String openid = (String)request.getSession().getAttribute("customer");
	String orderid = "1993b0e6-2251-4482-b2bb-3abc49fddcba";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jslib/jquery-1.9.1.js"></script>
<script type="text/javascript" src="jslib/ajax.js"></script>
<script type="text/javascript">
	$(function(){
		$("#persist").click(function(){
			var url="http://fancy.ngrok.cc/rest/repair/cancelRepairOrder/<%=orderid%>";
			var URL_LOCAL = "http://localhost:8080/rest/product/persist";
			var json ={
						"active": true,
						"description":"sdfsdf",
						"isHot":true,
						"isNew":true,
						"name":"商品66",
						"price": 992,
						"producttypeid":"2001",
						"productcategorys":[{"inventory":55,"name":"red","price":66.6},{"inventory":65,"name":"blue","price":66.6}],
						"productattrs":[{"attrKey":"高度","attrValue":"170cm"},{"attrKey":"宽度","attrValue":"80cm"}],		
						"photoUrl":"img/TB1UEmgIXXXXXbeXFXXXXXXXXXX_!!0-item_pic.jpg_360x360.jpg"
			};
			var dataR = postAjax(URL_LOCAL,json);
			if(dataR.success){
				alert(dataR.errmsg);
			}
		});
			
		$("#cancel").click(function(){
			var url="http://fancy.ngrok.cc/rest/repair/cancelRepairOrder/1993b0e6-2251-4482-b2bb-3abc49fddcba";
			var dataR = postAjaxNoData(url);
			if(dataR.success){
				alert(dataR.errmsg);
			}
		});
		
		$("#assign").click(function(){
			var url="http://fancy.ngrok.cc/rest/repair/assignRepairOrder";
			var json_assign = {
					"userid" : "-1",
					"orders" : [
					            {"id":"1bebd1de-7c25-46af-9d8c-6f119c490cea"}
					            ]
			};
			var dataR = postAjax(url,json_assign);
			if(dataR.success){
				alert(dataR.errmsg);
			}
		});
		
		$("#setFinish").click(function(){
			var url="http://fancy.ngrok.cc/rest/repair/setFinish/1bebd1de-7c25-46af-9d8c-6f119c490cea";
			var dataR = postAjaxNoData(url);
			if(dataR.success){
				alert(dataR.errmsg);
			}
		});
		
		$("#queryOrder").click(function(){
			var url="http://fancy.ngrok.cc/rest/repair/queryOrder/all";
			var dataR = postAjaxNoData(url);
			if(dataR.success){
				alert(dataR.list.length);
			}
		});
		
		$("#QueryEBU").click(function(){
			var url="http://fancy.ngrok.cc/rest/repair/queryEvaluationByUserid/-1";
			var dataR = postAjax(url);
			if(dataR.success){
				alert(dataR.list.length);
			}
		});
		
		$("#QueryEBL").click(function(){
			var url="http://fancy.ngrok.cc/rest/repair/queryEvaluation/all";
			var dataR = postAjax(url);
			if(dataR.success){
				alert(dataR.list.length);
			}
		});
		
		$("#evaluat").click(function(){
			var url="http://fancy.ngrok.cc/rest/repair/setEvaluation";
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
			var url="http://fancy.ngrok.cc/rest/repair/getLocation";
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
	<button id="persist" value="保存订单">
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
	sdfasfasdfdfafasd
<% 
}
%>
<a href="test3.jsp?id=<%=openid%>"> tiaozhuan</a>
<input type="text" id="content">
</html>
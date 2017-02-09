<%@page import="net.sf.json.JSONObject"%>
<%@page import="cn.easycode.yzmywx.utils.WeixinUtil"%>
<%@page import="cn.easycode.yzmywx.utils.ConfigUtil"%>
<%@page import="cn.easycode.yzmywx.bean.eo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Customer customer = new Customer();
	customer.setOpenid("oQ1HdvgOqUiH8rdMPgSrleM5l8tc");
	request.getSession().setAttribute(ConfigUtil.get("customer"), customer);
	String orderid = "1993b0e6-2251-4482-b2bb-3abc49fddcba";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品订单</title>
<script type="text/javascript" src="../jslib/jquery-1.9.1.js"></script>
<script type="text/javascript" src="../jslib/ajax.js"></script>
</head>
<body>
	cartitemId:<input type="text" id="persistText"/>
	<button id="persist" value="保存订单">保存订单</button><br>
	
	orderId:<input type="text" id="orderId"/>
	<button id="pay" value="付款">付款</button><br>
	
	<button id="cancel" value="取消订单">取消订单</button><br>
	
	<button id="evaluate" value="评价订单">评价订单</button><br>
	
	<button id="confirm" value="确认">确认订单</button><br>
	
	<button id="queryOrder" value="查询订单">查询订单</button><br>
	
	
	<button id="getCustomerOrder" value="查询所有">查询所有</button><br>
	

<script type="text/javascript">

	function onBridgeReady(appId, timeStamp, nonceStr, packageString, signType, paySign){
	   WeixinJSBridge.invoke(
	       'getBrandWCPayRequest', {
	           "appId" : appId,//公众号名称，由商户传入     
	           "timeStamp" : timeStamp,//时间戳，自1970年以来的秒数     
	           "nonceStr" : nonceStr,//随机串     
	           "package" : packageString,     
	           "signType" : signType,//微信签名方式：     
	           "paySign" : paySign //微信签名 
	       },
	       function(res){
	           if(res.err_msg == "get_brand_wcpay_request：ok" ) {
	        	// 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，
	        	//但并不保证它绝对可靠。
	        		alert("商家收到你的付款后就会为您安排发货，请稍等！");
	           } 
	    	   alert(res.err_msg);
	       }
	   ); 
	}
	
	$(function(){
		$("#persist").click(function(){
			var url="<%=contextPath%>/rest/productorder/book";
			var persistText$ = $("#persistText").val();
			var json ={
				"shipinfo":{"contact":"Cherish蔡","phoneNum":18826137274,"shipAddress":"广东省","shipArea":"天河区","shipStreet":"龙洞街道广东工业大学","zipcode":510520},
				"cartitems":[{"id":persistText$,"customer_id":"oQ1HdvgOqUiH8rdMPgSrleM5l8tc",
					"quantity":"1","productid":"f4dab990-cbd8-4413-8043-1c255d8fa42a","product_category":"060f79eed4b54dc984fa40c79a58a74a"}]
			};
			var dataR = postAjax(url,json);
			if(dataR.success){
				alert(dataR.msg);
			}
		});
		
		$("#getCustomerOrder").click(function(){
			var url="<%=contextPath%>/rest/productorder/getCustomerOrder";
			var dataR = postAjax(url,{});
			if(dataR.success){
				alert(dataR.errmsg);
			}
		});
			
		$("#pay").click(function(){
			var orderId = $("#orderId").val();
			
			var url="<%=contextPath%>/rest/productorder/pay/" + orderId;
			var dataR = postAjaxNoData(url);
			if(dataR.success){
				var appId = dataR.obj.appId;
				var timeStamp = dataR.obj.timeStamp;
				var nonceStr = dataR.obj.nonceStr;
				var packageString = dataR.obj.packageString;
				var signType = dataR.obj.signType;
				var paySign = dataR.obj.paySign;
				
				if (typeof WeixinJSBridge == "undefined"){
					   if( document.addEventListener ){
					       document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
					   }else if (document.attachEvent){
					       document.attachEvent('WeixinJSBridgeReady', onBridgeReady); 
					       document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
					   }
					}else{
					   onBridgeReady(appId, timeStamp, nonceStr, packageString, signType, paySign);
					}
			}
		});
			
		$("#cancel").click(function(){
			var url="<%=contextPath%>/rest/productorder/cancel/36343026b7724536b3d0797aaedf2fe7";
			var dataR = postAjaxNoData(url);
			if(dataR.success){
				alert(dataR.errmsg);
			}
		});
		
		$("#queryOrder").click(function(){
			var url="<%=contextPath%>/rest/productorder/getById/36343026b7724536b3d0797aaedf2fe7";
			var dataR = postAjaxNoData(url);
			if(dataR.success){
				alert(dataR.list.length);
			}
		});
		

		$("#confirm").click(function(){
			var url="<%=contextPath%>/rest/productorder/confirm/36343026b7724536b3d0797aaedf2fe7";
			var dataR = postAjaxNoData(url);
			if(dataR.success){
				alert(dataR.list.length);
			}
		});
		
		$("#evaluate").click(function(){
			var url="<%=contextPath%>/rest/productorder/evaluate/36343026b7724536b3d0797aaedf2fe7";
			var json_evaluat = {
					"content" :"这就是我的评价",
					"grade" : 1
			};
			var dataR = postAjax(url,json_evaluat);
			if(dataR.success){
				alert(dataR.errmsg);
			}
		});
	});
</script>
</body>
</html>
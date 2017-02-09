<%@page import="com.sun.xml.rpc.processor.modeler.j2ee.xml.string"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="cn.easycode.yzmywx.utils.WeixinUtil"%>
<%@page import="cn.easycode.yzmywx.utils.ConfigUtil"%>
<%
	String path = request.getContextPath();
	String openid = (String)request.getSession().getAttribute("customer");
	if(openid == null){
	 	String code = request.getParameter("code");
		String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
		url = url.replace("APPID", ConfigUtil.get("appid")).replace("SECRET", ConfigUtil.get("appsecret")).replace("CODE", code);
		JSONObject jo = WeixinUtil.doGetStr(url);
		request.getSession().setAttribute(ConfigUtil.get("customer"), jo.get("openid"));
		openid = jo.getString("openid");
		String state = request.getParameter("state");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/zepto.min.js"></script>
    <title>历史维修订单</title>
    <link rel="stylesheet" href="./css/reset.css"/>
    <link rel="stylesheet" href="./css/common.css"/>
    <link rel="stylesheet" href="./css/repairhistory.css"/>
    <link rel="stylesheet" href="./css/font.css"/>
</head>
<body>
<div class="layout">
    <div class="wrap_box">
        <p class="icon-cog font"><span class="title"></span><span class="idcard"></span></p>

        <div class="line"></div>

        <p class="font">登记姓名：<span class="username"></span></p>

        <p class="font">登记电话：<span class="telephone"></span></p>

        <p class="font">维修进度：<span class="state"></span></p>

        <a class="btn">订单详情</a>
    </div>
</div>
<script type="text/javascript">
    window.onload = function () {
        var state = ["未受理", "已受理", "待评价", "已完成", "已取消"];
        $.ajax({
            type: "GET",
            url: "http://fancy.ngrok.cc/rest/repair/queryPersonalOrder",
            contentType: "application/json",
            dataType:'json',
            success: function (data) {
                init(data);
            }
        });
        function init(data) {
            var layout = document.getElementsByClassName("layout")[0]
            var wrap = document.getElementsByClassName("wrap_box")[0]
            var len = data.length
            if (len == 0) {
                layout.removeChild(wrap)
            } else {
                var temp = wrap.cloneNode(true)
                wrap.getElementsByClassName("title")[0].innerHTML=data[0].repaircategory.categoryname
                wrap.getElementsByClassName("idcard")[0].innerHTML=data[0].orderSn
                wrap.getElementsByClassName("username")[0].innerHTML = data[0].contact
                wrap.getElementsByClassName("telephone")[0].innerHTML = data[0].telephone
//                wrap.getElementsByClassName("address")[0].innerHTML = data[0].address;
//                wrap.getElementsByClassName("memo")[0].innerHTML = data[0].memo;
                wrap.getElementsByClassName("state")[0].innerHTML = state[data[0].orderStatus];
                var href="repairdetail.jsp?orderid="+data[0].id;
                wrap.getElementsByClassName("btn")[0].setAttribute("href",href);
                if (len > 1) {
                    for (var i = 1; i < len; i++) {
                        var obj = temp.cloneNode(true)
                        obj.getElementsByClassName("title")[0].innerHTML=data[i].repaircategory.categoryname
                        obj.getElementsByClassName("idcard")[0].innerHTML=data[i].orderSn
                        obj.getElementsByClassName("username")[0].innerHTML = data[i].contact;
                        obj.getElementsByClassName("telephone")[0].innerHTML = data[i].telephone;
//                      obj.getElementsByClassName("address")[0].innerHTML = data[i].address;
//                      obj.getElementsByClassName("memo")[0].innerHTML = data[i].memo;
                        obj.getElementsByClassName("state")[0].innerHTML = state[data[i].orderStatus];
                        var href="repairdetail.jsp?orderid="+data[i].id;
                        obj.getElementsByClassName("btn")[0].setAttribute("href",href);
                        layout.appendChild(obj);
                    }
                }

            }


        };
    };
</script>
</body>
</html>
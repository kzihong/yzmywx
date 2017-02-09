<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="cn.easycode.yzmywx.utils.WeixinUtil"%>
<%@page import="cn.easycode.yzmywx.utils.ConfigUtil"%>
<%
	String path = request.getContextPath();
 	String code = request.getParameter("code");
	String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
	url = url.replace("APPID", ConfigUtil.get("appid")).replace("SECRET", ConfigUtil.get("appsecret")).replace("CODE", code);
	JSONObject jo = WeixinUtil.doGetStr(url);
	request.getSession().setAttribute(ConfigUtil.get("customer"), jo.get("openid"));
	String state = request.getParameter("state");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>韵宅木业</title>
    <link rel="stylesheet" href="./css/reset.css"/>
    <link rel="stylesheet" href="./css/common.css"/>
    <link rel="stylesheet" href="./css/shopping.css"/>
    <link rel="stylesheet" href="./css/font.css"/>
    <script src="./js/zepto.min.js"></script>
    <script src="./js/util.js"></script>
</head>
<body>
<div class="layout">
    <h1 class="header">
        韵宅商城
    </h1>

    <div class="wrap">
           <img src="./img/T2dfvFXhVbXXXXXXXX_!!707994262.jpg" width="100%" alt=""/>
    </div>
    
    <div class="search"><input class="search-box" type="text" placeholder="搜索商品"></div>
    <a href="" style="margin: 10px 0;"><img src="img/T2ad8TXAJaXXXXXXXX_!!707994262.jpg" width="100%" alt=""></a>
    <a href="" style="margin: 10px 0;"><img src="img/203833882568786330.jpg" width="100%" alt=""></a>
    <div id="wrap_hot">
    <div class="contentL hot">
        <a href="">
            <img class="productPictures" src="" height="100" width="100" alt=""/>

            <p><span class="productName"></span></p >

            <p>单价<span class="price"></span></p >

            <p>销量<span class="number"></span></p >
        </a>
    </div>
	</div>
    <a href="" style="margin: 10px 0;"><img src="img/794244256785441423.jpg" width="100%" alt=""></a>
    <div id="wrap_sd">
        <div class="content sd">
            <a href="">
                <img class="productPictures" src=""
                     height="100%" width="100%" alt=""/>
                <span class="productName"></span><br/>
                单价<span class="price"></span><br/>
                销量<span class="number"></span><br/>
            </a>
        </div>
    </div>

    <a href="" style="margin: 10px 0;"><img src="img/808654535279728026.jpg" width="100%" alt=""></a>

    <div id="wrap_door">
        <div class="content door">
            <a href="">
                <img class="productPictures" src="" height="100%" width="100%" alt=""/>
                <span class="productName">木门</span><br/>
                单价<span class="price">999</span><br/>
                销量<span class="number">999</span><br/>
            </a>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="nav">
        <a href="#" class="icon-home"><br/><span>首页</span></a>
        <a href="#" class="icon-stack"><br/><span>分类</span></a>
        <a href="#" class="icon-cart"><br/><span>购物车</span></a>
        <a href="#" class="icon-user"><br/><span>我的订单</span></a>
    </div>
</div>
<script>
    window.onload = function () {
        $.ajax({
            type: "GET",
            contentType: "application/json",
            url:"http://localhost:8080/rest/product/getIndexData",
            success: function (data) {
                init(JSON.parse(data));
            }

        });

        function init(data) {

//            返回的json数据
            var hot = data.hot
            var door = data.door
            var sd = data.sd

//            外层盒子
            var wrap_hot=document.getElementById("wrap_hot")
            var wrap_door=document.getElementById("wrap_door")
            var wrap_sd=document.getElementById("wrap_sd")

//            需要第一次被修改的
            var content_hot = document.getElementsByClassName("hot")[0]
            var content_door = document.getElementsByClassName("door")[0]
            var content_sd = document.getElementsByClassName("sd")[0]


//            clone后的模板
            var temp_hot=content_hot.cloneNode(true)
            var temp_door=content_door.cloneNode(true)
            var temp_sd=content_sd.cloneNode(true)

//            json数据的长度
            var hot_len =hot.length
            var door_len=door.length
            var sd_len=sd.length

            content_hot.getElementsByClassName("productPictures")[0].src=hot[0].photoUrl
            content_hot.getElementsByClassName("productName")[0].innerHTML=hot[0].name
            content_hot.getElementsByClassName("price")[0].innerHTML=hot[0].price
            content_hot.getElementsByClassName("number")[0].innerHTML=298

            content_door.getElementsByClassName("productPictures")[0].src=door[0].photoUrl
            content_door.getElementsByClassName("productName")[0].innerHTML=door[0].name
            content_door.getElementsByClassName("price")[0].innerHTML=door[0].price
            content_door.getElementsByClassName("number")[0].innerHTML=298

            content_sd.getElementsByClassName("productPictures")[0].src=sd[0].photoUrl
            content_sd.getElementsByClassName("productName")[0].innerHTML=sd[0].name
            content_sd.getElementsByClassName("price")[0].innerHTML=sd[0].price
            content_sd.getElementsByClassName("number")[0].innerHTML=298


            if (hot_len > 1) {
                for (var i = 1; i < hot_len; i++) {

                    var obj_hot = temp_hot.cloneNode(true)
                    obj_hot.getElementsByClassName("productPictures")[0].src=hot[i].photoUrl
                    obj_hot.getElementsByClassName("productName")[0].innerHTML=hot[i].name
                    obj_hot.getElementsByClassName("price")[0].innerHTML=hot[i].price
                    obj_hot.getElementsByClassName("number")[0].innerHTML=298
                    wrap_hot.appendChild(obj_hot)

                }
            }

            if (door_len > 1) {
                for (var i = 1; i < hot_len; i++) {

                    var obj_door = temp_door.cloneNode(true)
                    obj_door.getElementsByClassName("productPictures")[0].src=door[i].photoUrl
                    obj_door.getElementsByClassName("productName")[0].innerHTML=door[i].name
                    obj_door.getElementsByClassName("price")[0].innerHTML=door[i].price
                    obj_door.getElementsByClassName("number")[0].innerHTML=298
                    wrap_door.appendChild(obj_door)

                }
            }

            if (sd_len > 1) {
                for (var i = 1; i < hot_len; i++) {

                    var obj_sd = temp_sd.cloneNode(true)
                    obj_sd.getElementsByClassName("productPictures")[0].src=sd[i].photoUrl
                    obj_sd.getElementsByClassName("productName")[0].innerHTML=sd[i].name
                    obj_sd.getElementsByClassName("price")[0].innerHTML=sd[i].price
                    obj_sd.getElementsByClassName("number")[0].innerHTML=298
                    wrap_sd.appendChild(obj_sd)

                }
            }
        }
    }
</script>
</body>
</html>
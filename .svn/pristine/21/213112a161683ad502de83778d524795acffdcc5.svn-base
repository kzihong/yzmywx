<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id = request.getParameter("id");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title></title>
    <link rel="stylesheet" href="./css/reset.css"/>
    <link rel="stylesheet" href="./css/common.css"/>
    <link rel="stylesheet" href="./css/newDetail.css"/>
    <script src="./js/zepto.min.js"></script>
</head>
<body>
<div class="layout">
    <h1 class="header">
        <span id="title"></span><span id="time" style="font-size:20px;margin-left:40%;"></span>
    </h1>

    <div class="wrap">
            <div class="box">
                <img src="./img/T2dfvFXhVbXXXXXXXX_!!707994262.jpg" width="100%" height="100%" alt=""/>
            </div>
    </div>
    <h2 class="title">
        
    </h2>
    <div id="content">
        
    </div>
</div>
</body>
<script>
    $.ajax({
        type:'get',
        url:"/rest/news/getById/<%=id%>",
        contentType: "application/json;charset=utf-8",
        dataType:'json',
        success:function(data){
        	data = data.obj;
            document.title=data.title;
            document.getElementById('title').innerHTML=data.title;
            document.getElementById('time').innerHTML=data.formatcreatetime;
            document.getElementById('content').innerHTML=data.content;
            document.getElementsByClassName('title')[0].innerHTML=data.title;
        }
    })
</script>
</html>
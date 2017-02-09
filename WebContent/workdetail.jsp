<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("orderid");
	System.out.println(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="js/zepto.min.js"></script>
    <title></title>
    <script>
        function log(e) {
            console.log(e)
        }
    </script>
    <link rel="stylesheet" href="./css/repairdetail.css"/>
</head>
<body>
<div class="layout">
    <div class="wrap_box">
        <p class="icon-cog font"><span class="title"></span><span class="idcard"></span></p>

        <div class="line"></div>

        <p class="font">登记姓名：<span class="username"></span></p>

        <p class="font">登记电话：<span class="telephone"></span></p>

        <p class="font">维修登记地址：<span class="address"></span></p>

        <p class="font">维修备注：<span class="memo"></span></p>

        <p class="font">维修进度：<span class="state"></span></p>
		<br>
        <img src="" alt="" class="img" style="width:90%;margin-left:5%" />

        <p><a href="repairhistory.jsp" class="btn" onclick="cancelOrder()">确定维修完成</a></p>
    </div>
</div>
<script type="text/javascript">
	function cancelOrder(){
		if(confirm("确定维修完成？")){
			$.ajax({
				type : 'POST',
				contentType : "application/json; charset=utf-8",
				url : '',			//url			
				success : function(result) { 
					alert(result.errmsg);
				},
				dataType : 'json',
				error : function(XMLHttpRequest, textStatus, errorThrown) { },
				async: false
			});
		}
	}
    window.onload = function () {
        var state = ["未受理", "已受理", "待评价", "已完成", "已取消"];
        $.ajax({
            type: "GET",
            url: "/rest/repair/getByOrderId/<%=id%>",
            contentType: "application/json",
            dataType:'json',
            success: function (data) {
                init(data);
            }
        });
        function init(data) {
            var wrap = document.getElementsByClassName("wrap_box")[0]
            wrap.getElementsByClassName("title")[0].innerHTML=data.repaircategory.categoryname
            wrap.getElementsByClassName("idcard")[0].innerHTML=data.orderSn
            wrap.getElementsByClassName("username")[0].innerHTML = data.contact
            wrap.getElementsByClassName("telephone")[0].innerHTML = data.telephone
            wrap.getElementsByClassName("address")[0].innerHTML = data.address;
            wrap.getElementsByClassName("memo")[0].innerHTML = data.memo;
            wrap.getElementsByClassName("state")[0].innerHTML = state[data.orderStatus];
            wrap.getElementsByClassName("img")[0].src = data.photoUrl
            console.log(data.orderStatus)
            if(data.orderStatus != 0){
            	$(".btn").css({
            		"display" : "none",
            	});
            }
            if(data.orderStatus==2){
            	var mark=document.createElement("a")
            	mark.innerHTML="点击评价"
            	a.setAttribute("href","marking.html")
            	wrap.getElementsByClassName("state")[0].appendChild(mark)
            }
        }

    }
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="import">
     <input type="file" id="fileImport" name="fileImport" class="input" onchange="return ajaxFileUpload(this)">
</div>
<img id="img" src=""/>

<form id="nimei" enctype="multipart/form-data" method="post">
	<input type="file" id="uploadFile" name="file" />
	<input type="button" value="确定" onclick="uploadImage()" />
	<div id="imgDiv">
	</div>
</form>

<script type="text/javascript" src="jslib/jquery-2.0.3.js"></script>
<script type="text/javascript" src="jslib/ajax.js"></script>
<script type="text/javascript" src="jslib/ajaxfileupload.js"></script>
<script type="text/javascript">
function uploadImage() {
//判断是否有选择上传文件
    var imgPath = $("#uploadFile").val();
    if (imgPath == "") {
        alert("请选择上传图片！");
        return;
    }
    //判断上传文件的后缀名
    var strExtension = imgPath.substr(imgPath.lastIndexOf('.') + 1);
    if (strExtension != 'jpg' && strExtension != 'gif'
    && strExtension != 'png' && strExtension != 'bmp') {
        alert("请选择图片文件");
        return;
    }
    console.log($("#nimei").serialize());
    $.ajax({
        type: "POST",
        url: "/uploadimage",
        data: {"photo":$("#nimei").serialize()},
        cache: false,
        success: function(data) {
            $("#imgDiv").empty();
            $("#imgDiv").html(data);
            $("#imgDiv").show();
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            alert("上传失败，请检查网络后重试");
        }
    });
}


function ajaxFileUpload(fileObj) {
	
	var allowExtention = ".gif.jpg.png"; //允许上传文件的后缀名
	var extention = fileObj.value.substring(fileObj.value.lastIndexOf(".") + 1).toLowerCase();
	
	//获取浏览器
	var browserVersion = window.navigator.userAgent.toUpperCase();
	if (allowExtention.indexOf(extention) > -1) {
	    $.ajaxFileUpload({
	        url : "/uploadimage",
	        secureuri : false,
	        fileElementId : 'fileImport',
	        dataType : 'json',
	        //data : {'fileImport' : fileObj.value},
	        success : function(data, status) {
	        	//
	        	$("#img").attr("src",data.url);
	        },
	        error : function(data, status, e) {
	            alert("上传出错");
	        }
	    });
	}else {
       alert("仅支持" + allowExtention + "为后缀名的文件!");
       fileObj.value = ""; //清空选中文件
       if (browserVersion.indexOf("MSIE") > -1) {
         fileObj.select();
         document.selection.clear();
       }
       fileObj.outerHTML = fileObj.outerHTML;
	}
    return false;
}

function getType(extention){
	var type = "image";
	if("gif"==extention || "jpg"==extention || "png"==extention){
		type = "image";
	}else if("mp4"==extention){
		type = "video";
	}
	return type;
}
$(document).ready(function(){
	
});
</script>
</body>
</html>
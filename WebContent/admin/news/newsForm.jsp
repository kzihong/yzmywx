<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String id = request.getParameter("id");
	if (id == null) {
		id = "";
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>news</title>
  <link href="<%=contextPath%>/jslib/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="<%=contextPath%>/jslib/jquery-2.0.3.js"></script>
  <script src="<%=contextPath%>/jslib/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script src="<%=contextPath%>/jslib/ajax.js" type="text/javascript"></script>
<script src="<%=contextPath%>/kindeditor4/kindeditor.js" type="text/javascript"></script>
<script src="<%=contextPath%>/kindeditor4/lang/zh_CN.js" type="text/javascript"></script>
<script src="<%=contextPath%>/kindeditor4/plugins/code/prettify.js" type="text/javascript"></script>
  
  <style>
      .file{
      	width:150px;
      	height:150px;
      	z-index:999;
      	top:0;
  		left:16px;
  		opacity: 0;
  		position: absolute;
      }
      .photocontainer{
       width:150px;
       height:150px;
  		border: 1px solid rgb(225,225,227);
      }
      .myH{
      	font-size:24px;
      	font-family:jieti;
      }
      
    </style>
</head>
<body>
  
  <div class="container">
	<div class="row">
	  <div class="col-md-12">
	  <h1>新闻详情</h1>
	  	<div class="row">
	  		<div class="col-md-2">
	  			<span class="myH">封面图片</span>
	  		</div>
	  		<div class="col-md-10" >
	  			<div class="photocontainer">
					<img id="img" src="<%=contextPath%>/img/uploadimg.png" style="width:100%;height:100%;z-index: -1">
            		<input type="file" id="coverPhoto" class="file">
				</div>
           		<input id="photoUrl" name="photoUrl"  style="display:none;" />	
				<canvas id="canvas" style="display:none"></canvas>
	  		</div>
	  	</div>
	  	<br>
	  	<div class="row">
	  		<div class="col-md-2">
	  			<span class="myH">新闻标题</span>
	  		</div>
	  		<div class="col-md-10" >
	  			<input id="id" name="id" value="<%=id%>" style="display:none;" />
				<input class="form-control" id="title" name="title" style="width:80%;overflow-x:visible;"/>
	  		</div>
	  	</div>
	  	<br>
		</div>
	</div>    
	<div class="row" style="padding-bottom: 100px">
  		<div class="col-md-2">
  			<span class="myH">图文描述</span>
  		</div>
  		<div class="col-md-10">
  			<textarea id="content" style="width:80%;height:350px"></textarea>
  		</div>
	</div>   
</div>    
  
  <script>
  	var file = document.getElementById("coverPhoto");
  	file.onchange=function(){
  		var image = document.getElementById("img");
  		var canvas = document.getElementById("canvas");
  	    var context = canvas.getContext("2d");
  		image.className="img-rounded";
  	    image.src = window.URL.createObjectURL(file.files[0]);
  	    image.onload = function () {
  	        canvas.width=image.width;
  	        canvas.height=image.height;
  	        context.drawImage(image, 0, 0,image.width,image.height);
  		    var data = canvas.toDataURL();
  			var json = {
  					"base64code":data,
  			};
  			var result = postAjax('/rest/editor/uploadImage',json);
  			if(result.success){
  				$("#photoUrl").val(result.errmsg);
  			}else{
  				alert(result.errmsg);
  			}
  	    };
  	};
	var editor;
	var options = {
			cssPath : '<%=contextPath%>/kindeditor4/plugins/code/prettify.css',
			uploadJson : '<%=contextPath%>/kindeditor4/jsp/upload_json.jsp',
			//fileManagerJson : '/kindeditor4/jsp/file_manager_json.jsp',
			//allowFileManager : true,
			
	};
	KindEditor.ready(function(K) {  
		editor = K.create("#content",options);  
	});

	var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
		var photoUrl = $("#photoUrl").val();
		var title = $("#title").val();
		var id = $("#id").val();
		if(photoUrl==null || ""==photoUrl){
			$pjq.messager.alert('提示', "请上传小图", 'info');
			return false;
		}
		if(title==null || ""==title){
			$pjq.messager.alert('提示', "请填写标题", 'info');
			return false;
		}
		
		//富文本的处理
		editor.sync();
		
		var content = $("#content").val();
		var json ={
			"id" : id,
			"title":title,
			"content":content,
			"photoUrl":photoUrl
		};
		var url;
		if ($(':input[name="id"]').val().length > 0) {
			url = '<%=contextPath%>/rest/news/update';
		} else {
			url = '<%=contextPath%>/rest/news/save';
		}
		var dataResult = postAjax(url, json);
		if (dataResult.success) {
			$pjq.messager.alert('提示', dataResult.msg, 'info');
			$dialog.dialog('destroy');
			$grid.datagrid('reload');
			$mainMenu.tree('reload');
		} else {
			$pjq.messager.alert('提示', dataResult.msg, 'error');
		}
		
	};

	$(function() {
		//修改新闻的加载
		if ($(':input[name="id"]').val().length > 0) {
			
			$.get("<%=contextPath%>/rest/news/getById/" + $(':input[name="id"]').val(), function(result) {
				result = result.obj;
				if (result.id != undefined) {
					$("#id").val(result.id);
					$("#title").val(result.title);
					$("#content").html(result.content);
					$("#img").attr("src",result.photoUrl);
					$("#photoUrl").val(result.photoUrl);
					
					editor.html(result.content);
					
				}
			}, 'json');
		}
	});
  </script>
</body>
</html>
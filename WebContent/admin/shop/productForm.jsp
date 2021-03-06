<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String contextPath = request.getContextPath();
 	String productid = request.getParameter("productid")==null?"":request.getParameter("productid");
 %>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="<%=contextPath%>/jslib/jquery-2.1.4.min.js"></script>
	<jsp:include page="../../inc.jsp"></jsp:include>
	<script src="../../kindeditor4/kindeditor.js" type="text/javascript"></script>
	<script src="../../kindeditor4/lang/zh_CN.js" type="text/javascript"></script>
	<script src="../../kindeditor4/plugins/code/prettify.js" type="text/javascript"></script>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>添加商品</title>
    <style>
        table tr td {
            /*text-align: center;*/
        }
        .value {
            width: 360px;
        }
        .sec {
            width: 90px;
        }
        .text {
            width: 76px;
        }
        #pro {
            width: 173px;
        }
        .file{
        	width:200px;
        	height:200px;
        	z-index:999;
        	top:49px;
    		left:114px;
    		opacity: 0;
    		position: absolute;
        }
        .container{
	        width:200px;
	        height:200px;
    		border: 1px solid rgb(225,225,227);
        }
        .validateInfo{
        	display:none
        }
    </style>
</head>
<body>
<div class="form-group">
    <table cellspacing="10">
        <tbody>
            <tr>
                <td>产品名：</td>
                <td class="value"><input type="text" id="name"/></td>
                <td id="nameTD" class="validateInfo">
               		 请输入产品名
                </td>
            </tr>
            <tr>
            	<td>封面图片：</td>
            	<td><div class="container">
            			<img alt="" src="<%=contextPath%>/img/uploadimg.png" style="width:100%;height:100%;z-index: -1" id="img">
            			<input type="file" id="file" class="file"  multiple="multiple"/>
            		</div>
            	</td>
            </tr>
            <tr>
                <td>所属类别：</td>
                <td class="value"><select id="producttype" class="easyui-combobox" style="width:100px" data-options="panelHeight:'auto',editable:false,url:'<%=contextPath%>/rest/product/getProductTypeList',valueField:'id',textField:'name'">
                </select></td>
                <td id="typeTD" class="validateInfo">
                	请选择类别
                </td>
            </tr>
            <tr>
                <td>产品属性：</td>
                <td class="value">
                    <table id="properts" cellspacing="5" cellpadding="0">
                        <tr>
                            <td class="sec">属性名</td>
                            <td class="sec">属性值</td>
                            <td class="sec"><input type="button" value="+" onclick="add('properts')" /></td>
                            <td class="sec"><input type="button" value="-" onclick="pop('properts')" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>产品种类：</td>
                <td class="value">
                    <table id="kind">
                        <tr>
                            <td class="sec">种类</td>
                            <td class="sec">价格</td>
                            <td class="sec">库存</td>
                            <td class="sec"><input type="button" value="+" onclick="add('kind')" /></td>
                            <td class="sec"><input type="button" value="-" onclick="pop('kind')" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>综合价格：</td>
                <td class="value"><input type="text" id="price"/></td>
                <td id="priceTD" class="validateInfo">
                	请输入价格(用于显示在商品列表中)
                </td>
            </tr>
            <tr>
                <td>商品状态：</td>
                <td class="value">
                    <input type="checkbox" name="r" value="isHot" />热卖
                    <input type="checkbox" name="r" value="isNew" />新品
                </td>
            </tr>
            <tr>
            	<td>商品描述：</td>
            	<td>
            		<div>
						<textarea id="content" rows="20" cols="30" name="content" style="visibility:hidden;" ></textarea>
					</div>
            	</td>
            </tr>
        </tbody>
    </table>
    <canvas id="canvas" style="display:none">
	</canvas>
</div>
</body>
    <script>
    var flag = 0;
    var editor;
    var options = {
    		cssPath : '<%=contextPath%>/kindeditor4/plugins/code/prettify.css',
    		uploadJson : '<%=contextPath%>/kindeditor4/jsp/upload_json.jsp',
    		fileManagerJson :'<%=contextPath%>/kindeditor4/jsp/file_manager_json.jsp',
    		allowFileManager : true,
    		
    };
    KindEditor.ready(function(K) {  
     editor = K.create("#content",options);  
    });
    function add(id) {
        var table= document.getElementById(id);
        var tbody=table.getElementsByTagName('tbody')[0];
        var tr=tbody.getElementsByTagName('tr')[0];
        var td=tr.getElementsByTagName('td');
        var length=td.length;
        var Ntr=document.createElement('tr');
        for(var i=0;i<length-2;i++){
            Ntd=document.createElement('td');
            Ntd.innerHTML="<input class='text' type='text' value=''>";
            Ntr.appendChild(Ntd);
        }
        tbody.appendChild(Ntr);
    }
    function pop(id){
    	var table= document.getElementById(id);
        var tbody=table.getElementsByTagName('tbody')[0];
        var tr=tbody.getElementsByTagName('tr');
        if(tr.length > 0 ){
        	tbody.removeChild(tr[tr.length -1]);
        }
    }
    function getData(id){
    	var table= document.getElementById(id);
    	var tbody=table.getElementsByTagName('tbody')[0];
        var tr=tbody.getElementsByTagName('tr')[0];
        var td=tr.getElementsByTagName('td');
        var tdlength=td.length;
        if(tdlength == 4){
        	var subtr = tbody.getElementsByTagName('tr');
        	var jsonArray = [];
        	for(var i = 1 ; i < subtr.length ; i ++){
        		var subtd = subtr[i].getElementsByTagName('td');
        		var json={
        				"attrKey":subtd[0].getElementsByTagName('input')[0].value,
        				"attrValue":subtd[1].getElementsByTagName('input')[0].value
        		};
        		jsonArray.push(json);
        	}
        		return jsonArray;
        }
        if(tdlength == 5){
        	var jsonArray = [];
        	var subtr = tbody.getElementsByTagName('tr');
        	for(var i = 1 ; i < subtr.length ; i ++){
        		var subtd = subtr[i].getElementsByTagName('td');
        		var json={
        				"name":subtd[0].getElementsByTagName('input')[0].value,
        				"price":subtd[1].getElementsByTagName('input')[0].value,
        				"inventory":subtd[2].getElementsByTagName('input')[0].value
        		};
        		jsonArray.push(json);
        	}
        		return jsonArray;
        }
    }
    function postAjax(url_post, data) {
    	var result="" ;
    	$.ajax({
    		type : 'POST',
    		contentType : "application/json; charset=utf-8",
    		url : url_post,
    		data : JSON.stringify(data),							
    		success : function(result1) { result = result1; },
    		dataType : 'json',
    		error : function(XMLHttpRequest, textStatus, errorThrown) { },
    		async: false
    	});
    	return result;
    }
    var file=document.getElementById("file");
		  file.onchange=function(){
		  flag = 1;
	      var img=document.getElementById("img");
	      img.src=window.URL.createObjectURL(file.files[0]);
	      img.onload=function(){
	          window.URL.revokeObjectURL(this.src);
	      };
	      //document.body.appendChild(img);

//	      传图片
	      var canvas = document.getElementById("canvas");
	      var context = canvas.getContext("2d");
	      var image = new Image();
	      image.src = window.URL.createObjectURL(file.files[0]);
	      image.onload = function () {
	          canvas.width=image.width;
	          canvas.height=image.height;
	          context.drawImage(image, 0, 0,image.width,image.height);
	      };
	};
	function validatedata(type){
		if(type == "name"){
			var name = $("#name").val();
			if(name.trim().length == 0){
				
				return false;
			}else{
				return true;
			}
		}else if(type == "producttype"){
			var producttype = $("#producttype").combobox('getValue');
			if(producttype.length == 0){
				
				return false;
			}else{
				return true;
			}
		}else if(type == "price"){
			var price = $("#price").val().trim();
			 if(price.length!=0){    
			        var reg = new RegExp("^[0-9]*$");  
			        if(!reg.test(price)){
			        	
			        	return false;
			        }else{
			        	return true;
			        }
			 }else{
				 return false;
			 }
		}
	}
	var submitForm = function(dialog, grid, parent, mainMenu){
	     var data = canvas.toDataURL();
	      var json = {
	      	"base64code" : data,
	      };
	      $.ajax({
	          url: "/rest/editor/uploadImage",
	          type: "POST",
	          dataType: 'json',
	          data:JSON.stringify(json),
	          contentType: "application/json;charset=utf-8",
	          success: function (dataResult) {
	          	if(dataResult.success){
	          		var isHot = false;
	          		var isNew = false;
	          		var r=document.getElementsByName("r"); 
	          		for(var i=0;i<r.length;i++){
	          			if(r[i].checked){
	   	          			if(r[i].value == "isHot"){
	   	          				isHot = true;
	   	          			}
	   	          			if(r[i].value == "isNew"){
	   	          				isNew = true;
	   	          			};
	          			};
	          		}
	          		editor.sync();
	          		var description = $("#content").val();
	          		var name = "";
	          		if(validatedata('name')){
		          		 name = $("#name").val();
	          		}else{
	          			alert('请输入商品名字');
	          			return;
	          		}
	          		var price = "";
	          		if(validatedata('price')){
		          		price =	$("#price").val();
	          		}else{
	          			alert('请输入数字！');
	          			return;
	          		}
	          		var producttype = ""; 
	          		if(validatedata('producttype')){
	          			producttype = $("#producttype").combobox('getValue');
	          		}else{
	          			alert('请选择商品类型');
	          			return;
	          		}
	          		var photoUrl = flag== 0?$("#img").attr('src'):dataResult.errmsg;
	          		var json_submit={
	          				"active" : true,
	          				"description" : description,
	          				"hot":isHot,
	          				"new":isNew,
	          				"name":name,
	          				"photoUrl":photoUrl,
	          				"price":price,
	          				"productattrs":getData('properts'),
	          				"productcategorys":getData('kind'),
	          				"producttypeid":producttype,
	          				"productsales":0
	          		};
	          	   var url = "<%=productid%>"==""? "/rest/product/persist": "/rest/product/update/<%=productid%>";
	   	          	console.log(url);
	          	   $.ajax({
	   	     	          url: url,
	   	     	          type: "POST",
	   	     	          dataType: 'json',
	   	     	          data:JSON.stringify(json_submit),
	   	     	          contentType: "application/json;charset=utf-8",
	   	     	          success: function (savaResult) {
	   	     	        	if(savaResult.success){
	   	     	        		parent.messager.alert('提示',savaResult.errmsg);
	   	     	        		dialog.dialog('destroy');
	   	     	        		grid.datagrid('reload');
	    	     	  			mainMenu.tree('reload');
	   	     	        	}else{
	   	     	        		parent.messager.alert('提示',savaResult.errmsg);
	   	     	        	}
	   	     	        }
	   	          	 });
	          	}else{
	          		alert(dataResult.errmsg);
	          	}
	          }
	      });
	      };
   function setData(type,attrList){
	   var table= document.getElementById(type);
       var tbody=table.getElementsByTagName('tbody')[0];
       var length=attrList.length;
       if(type == "properts"){
    	   for(var i=0;i<length;i++){
    	       var Ntr=document.createElement('tr');
               Ntd=document.createElement('td');
               Ntd.innerHTML="<input class='text' type='text' value='"+ attrList[i].attrKey +"'>";
               Ntr.appendChild(Ntd);
               Ntd=document.createElement('td');
               Ntd.innerHTML="<input class='text' type='text' value='"+ attrList[i].attrValue +"'>";
               Ntr.appendChild(Ntd);
    	       tbody.appendChild(Ntr);
           }
       }else if(type == "kind"){
    	   for(var i=0;i<length;i++){
    	       var Ntr=document.createElement('tr');
               var Ntd=document.createElement('td');
               Ntd.innerHTML="<input class='text' type='text' value='"+ attrList[i].name +"'>";
               Ntr.appendChild(Ntd);
               var Ntd=document.createElement('td');
               Ntd.innerHTML="<input class='text' type='text' value='"+ attrList[i].price +"'>";
               Ntr.appendChild(Ntd);
               var Ntd=document.createElement('td');
               Ntd.innerHTML="<input class='text' type='text' value='"+ attrList[i].inventory +"'>";
               Ntr.appendChild(Ntd);
    	       tbody.appendChild(Ntr);
           }
       }
   }
   function initProduct(product){
	   $("#name").val(product.name);
	   $("#img").attr('src',product.photoUrl);
	   $("#producttype").combobox('select',product.producttype.id);
	   setData('properts',product.productattrs);
	   setData('kind',product.productcategorys);
	   $("#price").val(product.price);
	   $("#productsales").css({
		   display:'block',
	   });
	   $("#productsales").val(product.productsales);
	   var r=document.getElementsByName("r"); 
	   for(var i=0;i<r.length;i++){
   			if(r[i].value == "isHot"){
   				r[i].checked = product.hot;
   			}
   			if(r[i].value == "isNew"){
   				r[i].checked = product.formatisNew;
   			};
		}
	   KindEditor.html('#content', product.description);
	   
   }
   	$(function(){
   		var productid = "<%=productid%>";
   		if(productid != ""){
   			$.ajax({
	     	          url: "/rest/product/getByID/"+productid,
	     	          type: "GET",
	     	          dataType: 'json',
	     	          contentType: "application/json;charset=utf-8",
	     	          success: function (savaResult) {
	     	        	initProduct(savaResult);
	     	        }
	          	 });
   		}
   	});
    </script>
</html>
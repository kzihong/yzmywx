<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String contextPath = request.getContextPath();
    	String productid = request.getParameter("productid")==null?"":request.getParameter("productid");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../jslib/bootstrap-3.3.5-dist/css/bootstrap.css">
<link href="../../jslib/bootstrap-3.3.5-dist/css/bootstrap-switch.css" rel="stylesheet">
<script type="text/javascript" src="../../jslib/jquery-2.0.3.js"></script>
<script type="text/javascript" src="../../jslib/ajax.js"></script>
<script type="text/javascript" src="../../jslib/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<script src="../../jslib/bootstrap-3.3.5-dist/js/bootstrap-switch.js"></script>
<script src="../../kindeditor4/kindeditor.js" type="text/javascript"></script>
<script src="../../kindeditor4/lang/zh_CN.js" type="text/javascript"></script>
<script src="../../kindeditor4/plugins/code/prettify.js" type="text/javascript"></script>

<style>
.img-rounded{
	margin:4px;
	z-index: -1;
}
.file{
	width:100px;
   	height:100px;
   	z-index:999;
	opacity: 0;
	position: absolute;
}
#coverfile{
   	top:289px;
	left:20px;
}
#displayfile{
   	top:459px;
	left:20px;
}
</style>
</head>
<body>
<div class="container-fluid" style="margin:0 auto; width:95%">
	<div class="row">
	  <div class="col-md-12">
	  	<div class="row" style="padding-top:50px;">
	  		<div class="col-md-2">
	  			<ul class="nav nav-pills nav-stacked">
				  <li role="presentation" class="active" onclick="next('0')" id="section1"><a href="javascript:void(0)"><big><strong>基本信息</strong></big></a></li>
				  <li role="presentation" onclick="next('1')" id="section2"><a href="javascript:void(0)"><big><strong>选项参数</strong></big></a></li>
				  <li role="presentation" onclick="next('2')" id="section3"><a href="javascript:void(0)"><big><strong>详细信息</strong></big></a></li>
				</ul>
	  		</div>
	  		<div class="col-md-10" style="background-color: #f8f8f8">
		  		<div id="baseinfo">
		  			<form>
					  <div class="form-group" id="namediv">
					    <h4><strong>商品名：</strong></h4>
					    <input type="text" class="form-control " id="name" placeholder="商品名" >
					  </div>
				      <div class="form-group" id="pricediv">
					    <h4><strong>综合价格：</strong></h4>
					    <input type="text" class="form-control" id="price" placeholder="用于显示在商品列表的价格">
					  </div>
					  <div class="form-group" id="typediv">
					  <h4><strong>产品类别：</strong></h4>
				      <select class="form-control" id="typeselect">
				      	<option value="">请选择</option>
				      </select>
				      </div>
					</form>
					<h4><strong>封面图片</strong></h4>
					<p style="padding-left:80px;"><span class="label label-default">用于显示在商品列表的图片(单张)</span></p>
					<img src="../../img/uploadimg.png"  class="img-rounded" style="width:100px;height:100px" id="coverimg"> 
					<input type="file" id="coverfile" class="file">	
					<h4><strong>展示图片</strong></h4>
					<p style="padding-left:80px;"><span class="label label-default">用于展示在商品详情的图片(最多5张)</span></p>
					<div id="pictureList">
						<img src="../../img/uploadimg.png"  class="img-rounded" style="width:100px;height:100px"> 
					</div>
					<p> </p>
					<input type="file" id="displayfile" multiple="multiple" class="file">
					
					<p></p>
					<div style="padding-left:40%"><button class="btn btn-success btn-lg" type="button" onclick="next('1')">下一步</button></div>
		  			<p> </p>
	  			</div>
	  			<div id="option" style="display: none">
		  			<h4><strong>新品上架：</strong></h4>
				    <input type="checkbox" value="isNew" name="productoption" id="newcheckbox"/>
				 	<h4><strong>店长推荐：</strong></h4>
				    <input type="checkbox" value="isHot" name="productoption" id="hotcheckbox"/>
				    <p> </p>
		  			<p> </p>
		  			<h4><strong>规格项目：</strong></h4>
		  			<p style="padding-left:80px;"><span class="label label-default">如果没有商品属性可以不填直接进入下一步</span></p>
		  			<div style="float:right">
			  			<button class="btn btn-primary" type="button" onclick="addRow()">
							   添加规格项目
						</button>
						<button class="btn btn-danger" type="button" onclick="deleteRow()">
						 	  删除规格项目
						</button>
					<p> </p>
					</div>
		  			<table class="table table-bordered">
		  				<thead id="cagegoryhead">
		  					<tr>
		  						<th>规格名</th>
		  						<th>规格值1</th>
		  						<th width="200" id="thaction">操作</th>
		  					</tr>
		  				</thead>
		  				<tbody id="cagegorybody">
		  					<tr>
		  						<td><input type="text" style="width:90px" class="form-control" id="exampleInputEmail1" placeholder="高度"></td>
		  						<td><input type="text" style="width:90px" class="form-control" id="exampleInputEmail1" placeholder="1cm"></td>
		  						<td><button class="btn btn-primary btn-sm" type="button" onclick="addColumn()">添加规格值</button>
		  							<button class="btn btn-danger btn-sm" type="button" onclick="deleteColumn()">删除规格值</button>
		  						</td>
		  					</tr>
		  				</tbody>
		  			</table>
		  			<p></p>
					<div style="padding-left:40%"><button class="btn btn-success btn-lg" type="button" onclick="next('2')">下一步</button></div>
		  			<p> </p>
		  		</div>
	  			<div id="detailinfo" style="display: none">
					<h4><strong>价格库存：</strong></h4>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>类别</th>
								<th>价格</th>
								<th>库存</th>
								<th>销量</th>
							</tr>
						</thead>
						<tbody id="categoryname">
						</tbody>
					</table>
					<p> </p>
					<p> </p>
					<p style="padding-bottom: 15px"> </p>
					<h4><strong>图文描述：</strong></h4>
					<textarea id="content" style="width:72%;height:350px"></textarea>
					<p style="padding-bottom: 20px"> </p>
					<canvas id="canvas" style="display:none"></canvas>
					<input type="hidden" id="displayPhotos"> <input type="hidden" id="coverpicUrl"> 
					<p style="padding-bottom:20px;"></p>
					<div style="padding-left:20%"></div>
					<p style="padding-bottom:20px;"></p>
				</div>
	  		</div>
	  	</div>
	</div>    
	</div>   
</div>    
<script type="text/javascript">
var photos = [];
$("[name='r']").bootstrapSwitch({},300);
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
var typeList = postAjaxNoData('<%=contextPath%>/rest/product/getProductTypeList');
var str="";
$.each(typeList,function(i,n){
	str += "<option value='"+ n.id +"'>"+ n.name +"</option>";
});
$("#typeselect").append(str);
function validate(section){
	if(section == "0"){
		//商品名验证
		var name = $.trim($("#name").val());
		if(name == ""){
			$("#namediv").attr('class','form-group has-error');
			$("#name").attr('placeholder',"请输入商品名");
			$("#name").focus();
			return false;
		}
		//原价验证
		var price = $.trim($("#price").val());
		var reg = new RegExp("^(0|[1-9][0-9]{0,9})(\.[0-9]{1,2})?$");  
		if(!reg.test(price)){  
			$("#pricediv").attr('class','form-group has-error');
			$("#price").attr('placeholder',"请输入价格");
			$("#price").focus();
			return false;
		}
		//选择框验证
		var type = $("#typeselect").val();
		if(type==""){
			$("#typediv").attr('class','form-group has-error');
			$("#typediv").focus();
			return false;
		}
		//封面图片验证
		var coverPic = $("#coverpicUrl").val();
		if(coverPic == ""){
			alert("请至少上传一张封面图片");
			$("#coverpicUrl").focus();
			return false;
		}
		//展示图片验证
		var displayPic = JSON.parse($("#displayPhotos").val());
		if(displayPic.length == 0 ){
			alert("请至少上传一张图片");
			$("#displayPhotos").focus();
			return false;
		}
		return true;
	}else if(section == "1"){
		//对规格表格的内容进行获取及填充到商品类别表
		var tbody_attr = document.getElementById("cagegorybody");
		var trs_attr = tbody_attr.getElementsByTagName("tr");
		var categories = [];
		//为了获取一个categories;
		for(var i = 0 ; i < trs_attr.length ; i ++ ){
			var category = {
					"name" : [],
					"columns":0
			};
			var tds_attr = trs_attr[i].getElementsByTagName("td");
			//如果每一行的第一列不为空的话
			var attrname = tds_attr[0].getElementsByTagName("input")[0].value;
			//行排重
			for(var p = i+1 ; p < trs_attr.length ; p ++){
				var copyrowname = trs_attr[p].getElementsByTagName("td")[0].getElementsByTagName("input")[0].value;
				if(copyrowname == attrname){
					alert("请不要添加相同规格名");
					return false;
				};
			}
			if(attrname != ""){
				//把这一行的每一列都进行一次空的判断，空的话不加，且空列加一，如果到最后空列=列数，直接return
				//若是不rerutn 得到的是一个category
				var emptycolumn = 0;
				for(var j = 1 ; j < tds_attr.length -1 ; j ++){
					var tdsname = tds_attr[j].getElementsByTagName("input")[0].value;
					//列排重
					for(var p = j+1 ; p < tds_attr.length -1 ; p++){
						var copyname = tds_attr[p].getElementsByTagName("input")[0].value;
						if(tdsname == copyname){
							alert("请不要为规格名'"+ attrname +"'添加相同规格值'"+tdsname+"'");
							return false;
						}
					} 
					if(tdsname == ""){
						emptycolumn++;
					}else{
						category.name.push(attrname+":"+tdsname);
					}
				}
				if(emptycolumn == tds_attr.length - 2){
					alert("请至少添加一个规格值");
					$("#cagegorybody").focus();
					return false;
				}else{
					category.columns = category.name.length;
				}
				categories.push(category);
			}else{
				for(var j = 1 ; j < tds_attr.length -1 ; j ++){
					if(tds_attr[j].getElementsByTagName("input")[0].value != ""){
						alert("第"+ (i+1) +"行未添加规格名！");
						$("#cagegorybody").focus();
						return false;
					}
				}
			}
		}
		//不出意外，通过遍历categories来为下表添加行值
		//先获取最长列表的元素个数
		var max = 0;
		$.each(categories,function(i,n){
			if(n.columns >= max){
				max = n.columns;
			}
		});
		var appendrows = {
			"number" : 1 ,
			"rowsnames" : [{"name" : "","sales":0,"inventory":"","price":"",},],
		};
		var categories_db = [];
		var productid="<%=productid%>";
		if(productid !=""){
			categories_db =getAjaxNoData("/rest/product/getByID/"+productid).productcategorys;
		}
		//优化：大于二的才加进去 i>1
		for(var i = max ; i > 1 ; i --){
			$.each(categories,function(index,n){
				//如果有某一列的元素个数为i时触发
				if(n.columns == i){
					var prenumber = appendrows.number;
					//console.log("prenumber:"+prenumber);
					appendrows.number = appendrows.number*i;
					var rowsnames = [];
					for(var k = 0 ; k < i ; k++){
						for(var l = 0; l < prenumber ; l++){
							var category2append = {
									"name" : "",
									"sales":0,
									"inventory":"",
									"price":"",
							};
							var str = appendrows.rowsnames[l].name+n.name[k]+",";
							category2append.name = str;
							if(productid !=""){
								$.each(categories_db,function(d,b){
									if(str == b.name){
										category2append.price = b.price;
										category2append.inventory = b.inventory;
										category2append.sales = b.sales;
									}
								});
							}
							rowsnames.push(category2append);
						}
					}
					appendrows.rowsnames = rowsnames;
				}
			});
		}
		if(appendrows.number == 1){
			appendrows.rowsnames[0].name="默认";
			$.each(categories_db,function(d,b){
				if(b.name == "默认"){
					appendrows.rowsnames[0].inventory=b.inventory;
					appendrows.rowsnames[0].price = b.price;
					appendrows.rowsnames[0].sales = b.sales;
				}
			});
		}
		var categorttablicbody= document.getElementById("categoryname");
		$("#categoryname").empty();
		$.each(appendrows.rowsnames,function(i,n){
			var Ntr = document.createElement("tr");
			var Ntd = document.createElement("td");
			Ntd.innerHTML = n.name;
			Ntr.appendChild(Ntd);
			var Ntd = document.createElement("td");
			Ntd.innerHTML = '<input type="text" style="width:90px" class="form-control" value="'+ n.price +'">';
			Ntr.appendChild(Ntd);
			var Ntd = document.createElement("td");
			Ntd.innerHTML = '<input type="text" style="width:90px" class="form-control" value="'+ n.inventory +'">';
			Ntr.appendChild(Ntd);
			var Ntd = document.createElement("td");
			Ntd.innerHTML = n.sales;
			Ntr.appendChild(Ntd);
			categorttablicbody.appendChild(Ntr);
		});
		return true;
	}else if(section == "2"){
		//验证商品类别
		var kindBody = document.getElementById("categoryname");
		var kindtrs = kindBody.getElementsByTagName("tr");
		if(kindtrs.length == 0){
			alert("请按要求完成选项参数的填写");
			return false;
		}
		var flag = true;
		$.each(kindtrs,function(i,n){
			var reg = new RegExp("^(0|[1-9][0-9]{0,9})(\.[0-9]{1,2})?$");
			var name = n.getElementsByTagName("td")[0].innerHTML;
			var price = n.getElementsByTagName("td")[1].getElementsByTagName("input")[0].value;
			if(!reg.test(price)){  
				alert("请在"+name+"这一行(第"+ (i+1) +"行)正确输入价格");
				flag = false;
				return false;
			}
			var inventory = n.getElementsByTagName("td")[2].getElementsByTagName("input")[0].value;
			if(!reg.test(inventory)){
				alert("请在"+name+"这一行(第"+ (i+1) +"行)正确输入库存数");
				flag = false;
				return false;
			};
		});
		return flag;
	}else{
		return;
	}
}
function next(section){
	var section1 = document.getElementById("section1");
	var section2 = document.getElementById("section2");
	var section3 = document.getElementById("section3");
	if(section == "0"){
		//菜单的样式变化
		section1.setAttribute("class", "active");
		section2.setAttribute("class", "");
		section3.setAttribute("class", "");
		//body的变化
		$("#baseinfo").show();
		$("#option").hide();
		$("#detailinfo").hide();
	}else if(section == "1"){
		if(validate('0')){
			section1.setAttribute("class", "");
			section2.setAttribute("class", "active");
			section3.setAttribute("class", "");
			//body的变化
			$("#baseinfo").hide();
			$("#option").show();
			$("#detailinfo").hide();
		}
	}else if(section == "2"){
		if(validate('1')){
			section1.setAttribute("class", "");
			section2.setAttribute("class", "");
			section3.setAttribute("class", "active");
			//body的变化
			$("#baseinfo").hide();
			$("#option").hide();
			$("#detailinfo").show();
		}
	}else{
		return;
	}
}
function deletePic(index){
	//修改隐藏表单的值：
	var photos = JSON.parse($("#displayPhotos").val());
	console.log(photos);
	photos.splice(index,1);
	console.log(photos);
	$("#displayPhotos").val(JSON.stringify(photos));
	var asp = document.getElementById("pictureList");
	var as = asp.getElementsByTagName('a');
	asp.removeChild(as[index]);
	$.each(as,function(i,n){
		n.setAttribute("onclick","deletePic("+i+")");
	});
}
var file=document.getElementById("displayfile");
file.onchange=function(){
	if(file.files.length > 5){
		alert("最多只能选取5张照片");
		return;
	}
	$.each(file.files,function(i,n){
		var canvas = document.getElementById("canvas");
	    var context = canvas.getContext("2d");
	    var image = new Image();
	    image.src = window.URL.createObjectURL(n);
    	image.className="img-rounded";
    	var image2show = new Image();
    	image2show.src=window.URL.createObjectURL(n);
    	image2show.setAttribute("style","width:100px;height:100px");
    	var a = document.createElement('a');
    	var as = document.getElementById("pictureList").getElementsByTagName("a");
    	a.href="javascript:void(0)";
    	a.setAttribute("onclick","deletePic("+as.length+")");
    	a.setAttribute("title","点击删除该图片");
    	a.appendChild(image2show);
    	document.getElementById("pictureList").appendChild(a);
    	
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
				photos.push(result.errmsg);
				$("#displayPhotos").val(JSON.stringify(photos));
			}else{
				alert(result.errmsg);
			}
	    };
	});
};
var coverfile = document.getElementById("coverfile");
coverfile.onchange=function(){
	var image = document.getElementById("coverimg");
	var canvas = document.getElementById("canvas");
    var context = canvas.getContext("2d");
	image.className="img-rounded";
    image.src = window.URL.createObjectURL(coverfile.files[0]);
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
			$("#coverpicUrl").val(result.errmsg);
		}else{
			alert(result.errmsg);
		}
    };
};
function deleteRow(){
	var tbody=document.getElementById('cagegorybody');
	var tr = tbody.getElementsByTagName('tr');
	if(tr.length > 1){
		tbody.removeChild(tr[tr.length-1]);
	}else{
		alert("已经是最后一行了");
		return;
	}
}
function deleteColumn(){
	//删除表头
	var thead= document.getElementById('cagegoryhead');
	var tr = thead.getElementsByTagName('tr')[0];
	var ths = tr.getElementsByTagName('th');
	if(ths.length > 2){
		tr.removeChild(ths[ths.length-2]);
	}else{
		alert("已经是最后一列了");
		return;
	}
	//删除表体
	var tbody=document.getElementById('cagegorybody');
	var tbody_tr = tbody.getElementsByTagName('tr');
	for(var i = 0 ; i < tbody_tr.length ; i ++){
		var tds = tbody_tr[i].getElementsByTagName('td');
		tbody_tr[i].removeChild(tds[tds.length - 2]);
	};
}
function addRow(){
	var tbody=document.getElementById('cagegorybody');
	var theadtds = tbody.getElementsByTagName('tr')[0].getElementsByTagName('td');
	var Ntr=document.createElement('tr');
	for(var i = 0 ; i < theadtds.length; i++){
		var Ntd=document.createElement('td');
	 	Ntd.innerHTML='<input type="text" style="width:90px" class="form-control">';
	 	Ntr.appendChild(Ntd);
	}
 	Ntd.innerHTML='<button class="btn btn-primary btn-sm" type="button" onclick="addColumn()">添加规格值</button><button class="btn btn-danger btn-sm" type="button" onclick="deleteColumn()">删除规格值</button>';
 	Ntr.appendChild(Ntd);
 	tbody.appendChild(Ntr);
}
function addColumn(){
	//先加表头：
	var thead= document.getElementById('cagegoryhead');
	var tr = thead.getElementsByTagName('tr')[0];
	var ths = tr.getElementsByTagName('th');
	if(ths.length > 6){
		
		return;
	}
	var th = document.createElement('th');
	th.innerHTML='规格值'+(ths.length-1);
	tr.insertBefore(th,ths[ths.length - 1]);
	//再加表体
	var tbody = document.getElementById('cagegorybody');
	var tbody_tr = tbody.getElementsByTagName('tr');
	for(var i = 0 ; i < tbody_tr.length ; i ++){
		var tds = tbody_tr[i].getElementsByTagName('td');
		var td = document.createElement('td');
		td.innerHTML= '<input type="text" style="width:90px" class="form-control">';
		tbody_tr[i].insertBefore(td,tds[tds.length - 1]);
	};
}
function getData(type){
	if(type=='properts'){
		var returnData = [];
		var propertsBody = document.getElementById("cagegorybody");
		var propertsRows = propertsBody.getElementsByTagName("tr");
		if(propertsRows.length == 1){
			var propertsName = propertsRows[0].getElementsByTagName("td")[0].getElementsByTagName("input")[0].value;
			if(propertsName == ""){
				returnData.push({"attrKey":"无","attrValue":["无"]});
				return returnData;
			}
		}
		$.each(propertsRows,function(i,n){
			var propertsKeyName = n.getElementsByTagName("td")[0].getElementsByTagName("input")[0].value;
			var propertsTD = n.getElementsByTagName("td");
			var valuelist = [];
			for(var i = 1 ;i<propertsTD.length-1 ; i++){
				valuelist.push(propertsTD[i].getElementsByTagName("input")[0].value);
			}
			var json = {
				"attrKey" : propertsKeyName,
				"attrValue" : JSON.stringify(valuelist)
			};
			returnData.push(json);
		});
		return returnData;
	}else if(type == "kind"){
		var returnData = [];
		var kindBody = document.getElementById("categoryname");
		var kindtrs = kindBody.getElementsByTagName("tr");
		$.each(kindtrs,function(i,n){
			var json={
					"name":"",
					"price":0,
					"inventory":0,
					"sales":0
			};
			var name = n.getElementsByTagName("td")[0].innerHTML;
			var price = n.getElementsByTagName("td")[1].getElementsByTagName("input")[0].value;
			var inventory = n.getElementsByTagName("td")[2].getElementsByTagName("input")[0].value;
			var sales = n.getElementsByTagName("td")[3].innerHTML;
			json.name = name;
			json.inventory = inventory;
			json.price = price;
			json.sales = sales;
			returnData.push(json);
		});
		return returnData;
	}else{
		return;
	}
}
function submitForm(dialog, grid, parent, mainMenu){
	if(validate('2')&&validate('0')){
		//验证类别表格
		var isHot = false;
		var isNew = false;
		var r=document.getElementsByName("productoption");
		console.log(r);
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
		var name = $("#name").val();
		var picgroup = $("#displayPhotos").val();
		var photoUrl = $("#coverpicUrl").val();
		var price = $("#price").val();
		var producttype = $("#typeselect").val();
		var json_submit={
					"active" : true,
					"description" : description,
					"hot":isHot,
					"new":isNew,
					"name":name,
					"photoUrl":photoUrl,
					"picgroup":picgroup,
					"price":price,
					"productattrs":getData('properts'),
					"productcategorys":getData('kind'),
					"producttypeid":producttype,
					"productsales":0
			};
		var url = "<%=productid%>"==""? "/rest/product/persist": "/rest/product/update/<%=productid%>";
		var savaResult =  postAjax(url,json_submit);
		if(savaResult.success){
	    		parent.messager.alert('提示',savaResult.errmsg);
	    		dialog.dialog('destroy');
	    		grid.datagrid('reload');
				mainMenu.tree('reload');
	    	}else{
	    		parent.messager.alert('提示',savaResult.errmsg);
	    	}
	}
}
function initProduct(product){
  	  $("#typeselect").val(product.producttype.id);
	  $("#name").val(product.name);
	  $("#coverpicUrl").val(product.photoUrl);
	  $("#displayPhotos").val(product.picgroup);
	  //appendPiclist
	  var piclist = JSON.parse(product.picgroup);
	  $.each(piclist,function(i,n){
		  var image = document.createElement("img");
		  image.src=n;
		  image.setAttribute("style","width:100px;height:100px");
		  var a = document.createElement("a");
		  a.setAttribute("onclick","deletePic("+i+")");
		  a.setAttribute("title","点击删除该图片");
		  a.appendChild(image);
		  document.getElementById("pictureList").appendChild(a);
	  });
	  //setData('properts',product.productattrs);
	  $("#cagegorybody").empty();
	  var attrBody = document.getElementById("cagegorybody");
	  var maxcolumn = 3;
	  $.each(product.productattrs,function(i,n){
		  var valuelist = JSON.parse(n.attrValue);
		  $.each(valuelist,function(j,m){
			  maxcolumn = j+3;
		  });
	  });
	  for(var i = 3 ; i < maxcolumn ; i ++){
		  addColumn();
	  }
	  $.each(product.productattrs,function(i,n){
		  var tr = document.createElement("tr");
		  var td = document.createElement("td");
		  td.innerHTML= '<input type="text" style="width:90px" class="form-control" value="'+ n.attrKey +'">';
		  tr.appendChild(td);
		  var valuelist = JSON.parse(n.attrValue);
		  $.each(valuelist,function(j,m){
			  var td = document.createElement("td");
			  td.innerHTML= '<input type="text" style="width:90px" class="form-control" value="'+ m +'">';
			  tr.appendChild(td);
		  });
		  var td = document.createElement("td");
		  td.innerHTML='<button class="btn btn-primary btn-sm" type="button" onclick="addColumn()">添加规格值</button><button class="btn btn-danger btn-sm" type="button" onclick="deleteColumn()">删除规格值</button>';
		  tr.appendChild(td);
		  attrBody.appendChild(tr);
	  });
	  
	  $("#price").val(product.price);
	  if(product.hot){
		  alert(1);
		  $("#hotcheckbox").bootstrapSwitch({state:true});
	  }
	  if(product.formatisNew){
		  $("#newcheckbox").bootstrapSwitch({state:true});
	  }
	  //$("#productsales").val(product.productsales);
	  /* var r=document.getElementsByName("productoption");
	   for(var i=0;i<r.length;i++){
  			if(r[i].value == "isHot"){
  				r[i].checked = product.hot;
  			}
  			if(r[i].value == "isNew"){
  				r[i].checked = product.formatisNew;
  			};
		} */
   KindEditor.html('#content', product.description);
   $("#coverimg").attr("src",product.photoUrl);
}
$(function(argument) {
    $('[type="checkbox"]').bootstrapSwitch();
    $("#coverpicUrl").val("");
    $("#displayPhotos").val("");
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
</body>
</html>
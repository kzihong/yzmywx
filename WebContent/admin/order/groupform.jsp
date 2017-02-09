<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String action = request.getParameter("action")==null?"":request.getParameter("action");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="../../jslib/bootstrap-3.3.5-dist/css/bootstrap.css">
<link href="../../jslib/bootstrap-3.3.5-dist/css/bootstrap-switch.css" rel="stylesheet">
<script type="text/javascript" src="../../jslib/jquery-2.0.3.js"></script>
<script type="text/javascript" src="../../jslib/ajax.js"></script>
<script type="text/javascript" src="../../jslib/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<script src="../../jslib/bootstrap-3.3.5-dist/js/bootstrap-switch.js"></script>
<script type="text/javascript">
function addRow(){
	var workerGroup = document.getElementById("workerGroup");
	var tr = document.createElement("tr");
	var td = document.createElement("td");
	td.innerHTML='<input type="text" style="width:90%" class="form-control" placeholder="分组名"> <input type="hidden">';
	tr.appendChild(td);
	workerGroup.appendChild(tr);
}
function deleteRow(){
	var workerGroup = document.getElementById("workerGroup");
	var trs = workerGroup.getElementsByTagName("tr");
	var tr_last = trs[trs.length-1];
	if(tr_last.getElementsByTagName("td")[0].getElementsByTagName("input")[1].value == "")
		workerGroup.removeChild(tr_last);
	else{
		alert("不能删除已经保存过的分组，只可修改其分组名");
	}
}
function init(groups){
	$("#workerGroup").empty();
	$.each(groups,function(i,n){
		var workerGroup = document.getElementById("workerGroup");
		var tr = document.createElement("tr");
		var td = document.createElement("td");
		td.innerHTML='<input type="text" value = "'+ n.groupname +'" style="width:90%" class="form-control"><input type="hidden" value="'+ n.id +'">';
		tr.appendChild(td);
		workerGroup.appendChild(tr);
	});
}
$(function(){
	var action = "<%=action%>";
	var groups = postAjaxNoData("/rest/user/getWorkergroup");
	if(action == ""){
		init(groups);
	}else{
		$("#updatediv").hide();
		$("#selectdiv").show();
		var str = "";
		$.each(groups,function(i,n){
			str += '<a class="list-group-item" href="javascript:void(0)" onclick="setActive(this)">'+ n.groupname +'<input type="hidden" value="'+ n.id +'"></a>';
		});
		$("#grouplist").append(str);
	}
});
function setActive(obj){
	var grouplist = document.getElementById("grouplist");
	var grouplist_a = grouplist.getElementsByTagName("a");
	$.each(grouplist_a,function(i,n){
		n.setAttribute("class","list-group-item");
	});
	obj.setAttribute("class","list-group-item active");
}
function submitForm(dialog, grid, parent, mainMenu){
	var workerGroup = document.getElementById("workerGroup");
	var trs = workerGroup.getElementsByTagName("tr");
	var json = [];
	$.each(trs,function(i,n){
		var group = { "id":"","groupname":""};
		var id = n.getElementsByTagName("td")[0].getElementsByTagName("input")[1].value;
		var groupname = n.getElementsByTagName("td")[0].getElementsByTagName("input")[0].value;
		group.id = id;
		group.groupname = groupname;
		json.push(group);
	});
	var result = postAjax("/rest/user/updateGroups",json);
	if(result.success){
		parent.messager.alert('提示',result.msg);
		dialog.dialog('destroy');
		grid.datagrid('reload');
		mainMenu.tree('reload');
	}else{
		parent.messager.alert('提示',result.msg);
	}
};
function submitSelect(dialog, grid, parent, mainMenu){
	var selete_a = document.getElementsByClassName('list-group-item active')[0];
	var groupid = selete_a.getElementsByTagName("input")[0].value;
	var workerid = "<%=action%>";
	var result = postAjaxNoData("/rest/user/moveGroup/"+workerid+"/"+groupid);
	if(result.success){
		parent.messager.alert('提示',result.msg);
		dialog.dialog('destroy');
		grid.datagrid('reload');
		mainMenu.tree('reload');
	}else{
		parent.messager.alert('提示',result.msg);
	}
};
</script>
</head>
<body>
<div class="container-fluid" style="margin:0 auto; width:95%">
	<div class="row" style="padding-top:10px;"> 
		<div class="col-md-12" id="updatediv">
			<h4><strong>维修师傅分组：</strong></h4>
		  			<div style="float:right">
			  			<button class="btn btn-primary" type="button" onclick="addRow()">
							   添加分组
						</button>
						<button class="btn btn-danger" type="button" onclick="deleteRow()">
						 	  删除分组
						</button>
					<p> </p>
					</div>
		  			<table class="table">
		  				<tbody id="workerGroup">
		  					<tr>
		  						<td><input type="text" style="width:90%" class="form-control" id="exampleInputEmail1" placeholder="分组名"></td>
		  					</tr>
		  				</tbody>
		  			</table>
		</div>
		<div id="selectdiv" style="display:none;padding-top:50px;" class="col-md-12">
			<ul class="list-group" id="grouplist">
			</ul>	
		</div>
	</div>
</div>
</body>
</html>
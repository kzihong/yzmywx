<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%> 
<%@ page import="java.text.SimpleDateFormat"%> 
<%@ page import="cn.easycode.yzmywx.bean.vo.SessionInfo"%>
<%@ page import="cn.easycode.yzmywx.utils.ConfigUtil"%>
<%
	String contextPath = request.getContextPath();
	SessionInfo sessionInfo = (SessionInfo) session.getAttribute(ConfigUtil.getSessionInfoName());
	if (sessionInfo == null) {
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}
%>
<script type="text/javascript" charset="utf-8">
	var lockWindowFun = function() {
		$.post(sy.contextPath + '/base/syuser!doNotNeedSessionAndSecurity_logout.sy', function(result) {
			$('#loginDialog').dialog('open');
		}, 'json');
	};
	var logoutFun = function() {
		$.post(sy.contextPath + '/rest/user/logout', function(result) {
			location.replace(sy.contextPath + '/login.jsp');
		}, 'json');
	};
	var showMyInfoFun = function() {
		var dialog = parent.sy.modalDialog({
			title : '我的信息',
			url : sy.contextPath + '/admin/userInfo.jsp'
		});
	};
</script>
<div id="sessionInfoDiv" style="float:left;">
	<%
		out.print("<div sytle='background-color: #81aeab;' style='padding-left:50%'><img src='"+ contextPath +"/img/guangdonggongyedaxue.jpg' style='height:100px;'/></div>");
		out.print("<div style='clear:both;height:0;font-size: 1px;line-height: 0px;'></div>");
		out.print("<div>");
		out.print("<span style='font-size:23px;font-weight:bold;'>EasyCode后台管理系统</span>");
		out.print("<span style='font-size:18px;'>&nbsp;&nbsp;");
		String xq = "";
		String datetime=new SimpleDateFormat("yyyy年MM月dd日 ").format(Calendar.getInstance().getTime());
		Calendar cld = Calendar.getInstance();//取得系统时间星期几
		int a = cld.get(Calendar.DAY_OF_WEEK); //取得系统时间星期几
		if(a==1)xq = "星期日";
		if(a==2)xq = "星期一";
		if(a==3)xq = "星期二";
		if(a==4)xq = "星期三";
		if(a==5)xq = "星期四";
		if(a==6)xq = "星期五";
		if(a==7)xq = "星期六";
		out.println(datetime);
		out.println(xq);
		out.print("欢迎您，" + sessionInfo.getUser().getName());
		out.print("&nbsp;&nbsp;");
		out.print("&nbsp;&nbsp;</span>");
		out.print("</div>");
	%>
</div>
<div style="position: absolute; right: 0px; bottom: 0px;">
	<a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_pfMenu',iconCls:'ext-icon-rainbow'">更换皮肤</a> 
	<a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_kzmbMenu',iconCls:'ext-icon-cog'">控制面板</a> 
	<a href="javascript:void(0);" class="easyui-menubutton" onclick="logoutFun();">退出系统</a>
</div>
<div id="layout_north_pfMenu" style="width: 120px; display: none;">
	<div onclick="sy.changeTheme('default');" title="default">默认(天蓝)</div>
	<div onclick="sy.changeTheme('gray');" title="gray">灰色</div>
	<div onclick="sy.changeTheme('metro');" title="metro">metro</div>
	<div onclick="sy.changeTheme('bootstrap');" title="bootstrap">bootstrap</div>
	<div onclick="sy.changeTheme('black');" title="black">black</div>
	<div class="menu-sep"></div>
	<div onclick="sy.changeTheme('metro-blue');" title="metro-blue">metro-blue</div>
	<div onclick="sy.changeTheme('metro-gray');" title="metro-gray">metro-gray</div>
	<div onclick="sy.changeTheme('metro-green');" title="metro-green">metro-green</div>
	<div onclick="sy.changeTheme('metro-orange');" title="metro-orange">metro-orange</div>
	<div onclick="sy.changeTheme('metro-red');" title="metro-red">metro-red</div>
</div>
<div id="layout_north_kzmbMenu" style="width: 100px; display: none;">
	<div data-options="iconCls:'ext-icon-user_edit'" onclick="$('#passwordDialog').dialog('open');">修改密码</div>
	<!-- <div class="menu-sep"></div>
	<div data-options="iconCls:'ext-icon-user'" onclick="showMyInfoFun();">我的信息</div> -->
</div>
<div id="layout_north_zxMenu" style="width: 100px; display: none;">
	<div data-options="iconCls:'ext-icon-lock'" onclick="lockWindowFun();">锁定窗口</div>
	<div class="menu-sep"></div>
	<div data-options="iconCls:'ext-icon-door_out'" onclick="logoutFun();">退出系统</div>
</div>
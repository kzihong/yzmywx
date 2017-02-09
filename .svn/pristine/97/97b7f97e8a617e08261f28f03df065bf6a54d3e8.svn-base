<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jslib/jquery-1.9.1.js"></script>
<script type="text/javascript" src="jslib/ajax.js"></script>
<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js "></script>

</head>
<body>
<input type="button" onclick="chooseImg()" value="浏览">
<img src="" id="img">
</body>
<script type="text/javascript">
function getNonceStr(len){
	  len = len || 32;
	  var chars = 'abcdefhijkmnprstwxyz2345678';    /****默认去掉了容易混淆的字符oOLl,9gq,Vv,Uu,I1****/
	  var maxPos = chars.length;
	  var pwd = '';
	  for (var i = 0; i <len; i++) {
	    pwd += chars.charAt(Math.floor(Math.random() * maxPos));
	  }
	  return pwd;
}

var timestamp = Date.parse(new Date())/1000;
var nonceStr = getNonceStr(10);
var searchurl = window.location.href.split('#')[0];
var json = {
		"timestap":timestamp,
		"nonceStr":nonceStr,
		"url":searchurl
};
var url="/rest/message/checkJSapi";
var signature = postAjax(url,json).signature;
wx.config({
    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
    appId: 'wx3f5eb0679871ea48', // 必填，公众号的唯一标识
    timestamp: timestamp, // 必填，生成签名的时间戳
    nonceStr: nonceStr, // 必填，生成签名的随机串
    signature: signature,// 必填，签名，见附录1
    jsApiList: ["chooseImage","previewImage","uploadImage","downloadImage","onMenuShareAppMessage"]
});
wx.ready(function(){
	wx.onMenuShareAppMessage({
	    title: 'cap', // 分享标题
	    desc: '呵呵呵大', // 分享描述
	    link: 'www.baidu.com', // 分享链接
	    imgUrl: '', // 分享图标
	    type: '', // 分享类型,music、video或link，不填默认为link
	    dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
	    success: function () { 
	        // 用户确认分享后执行的回调函数
	    },
	    cancel: function () { 
	        // 用户取消分享后执行的回调函数
	    }
	});
	
    // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
});
wx.error(function(res){
	alert(res);
    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。

});
function uploadImg(localIds){
	wx.uploadImage({
        localId: localIds, // 需要上传的图片的本地ID，由chooseImage接口获得
        isShowProgressTips: 1, // 默认为1，显示进度提示
        success: function (res) {
           /*  var serverId = res.serverId;  */// 返回图片的服务器端ID
           var url = "/rest/editor/downloadPic/";
           var result = postAjaxNoData(url+res.serverId);
           if(result.success){
	           $("#photo").val(result.errmsg);
           }else{
        	   alert(result.errmsg);
           }
        }
    });
}
function chooseImg(){
	wx.chooseImage({
	    count: 1, // 默认9
	    sizeType: 'compressed', // 可以指定是原图还是压缩图，默认二者都有
	   /*  sourceType: ['album', 'camera'],  */// 可以指定来源是相册还是相机，默认二者都有
	    success: function (res) {
	        /* var localIds = res.localIds; */ // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
	        $("#img").attr('src',res.localIds[0]);
	        uploadImg(res.localIds[0]);
	        
	    }
	});
}
</script>
</html>
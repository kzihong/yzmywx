window.onload=function() {
    var p=1;
    var wrap=document.getElementsByClassName('wrap_box')[0];
    var content=wrap.getElementsByClassName('contentL')[0];
    var temp=content.cloneNode(true);
    
    
    var json = {
        "rows":10,
        "page":p
    };
    
    $.ajax({
        type:'POST',
        url:'/rest/news/getnews',
        dataType:'json',
        contentType : "application/json; charset=utf-8",
        data:JSON.stringify(json),
        success:function(data){
            p++;
            var len=data.rows.length;
            for(var i=0;i<len;i++){
            	var obj=temp.cloneNode(true);
            	obj.getElementsByClassName('her')[0].href='newDetail.jsp?id='+data.rows[i].id;
            	obj.getElementsByClassName('productPictures')[0].src=data.rows[i].photoUrl;
            	obj.getElementsByClassName('decription')[0].innerHTML=data.rows[i].formatcontent;
            	obj.getElementsByClassName('title')[0].innerHTML=data.rows[i].title;
            	obj.style.display='block';
                wrap.appendChild(obj);
            }
        }
    });
    var flag;
    window.onscroll=function(){
    	var HEGIHT = (document.documentElement.scrollHeight >document.documentElement.clientHeight) ? document.documentElement.scrollHeight : document.documentElement.clientHeight; 
    	var scrollTop=document.documentElement.scrollTop||document.body.scrollTop;
    	flag=(HEGIHT-scrollTop<1000)?true:false;
    	
    }
    setInterval(function(){
    	
    	if(flag){
    		window.onscroll=function(){}
    		flag=false;
    		console.log(flag)
    		
    		$.ajax({
    			type:'post',
    			url:'/rest/news/getnews',
    			dataType:'json',
    			contentType : "application/json; charset=utf-8",
    			data:JSON.stringify({
    				"rows":10,
    		        "page":p
    			}),
    			success:function(data){
    				
    				var len=data.rows.length;
    				for(var i=0;i<len;i++){
    					var obj=temp.cloneNode(true);
    					obj.getElementsByClassName('her')[0].href='newDetail.jsp?id='+data.rows[i].id;
    					obj.getElementsByClassName('productPictures')[0].src=data.rows[i].photoUrl;
    					obj.getElementsByClassName('decription')[0].innerHTML=data.rows[i].formatcontent;
    					obj.getElementsByClassName('title')[0].innerHTML=data.rows[i].title;
    					obj.style.display='block';
    					wrap.appendChild(obj);
    				}
    				
    				p++;
    				
    			}
    		});
    		window.onscroll=function(){
    	    	var HEGIHT = (document.documentElement.scrollHeight >document.documentElement.clientHeight) ? document.documentElement.scrollHeight : document.documentElement.clientHeight; 
    	    	var scrollTop=document.documentElement.scrollTop||document.body.scrollTop;
    	    	flag=(HEGIHT-scrollTop<1000)?true:false;
    	    	
    	    }
    	}
	},1000)
}
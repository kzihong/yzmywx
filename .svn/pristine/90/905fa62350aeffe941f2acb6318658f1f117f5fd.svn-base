/**
 * Created by Administrator on 2016/3/6.
 */
function animation(obj,json,fn){
    clearInterval(obj.timer)
    obj.timer=setInterval(function(){
        var stop=true
        for(var i in json)
        {
            if(i=="opacity"){
                var cur=Math.round(parseFloat(getStyle(obj,i))*100)
            }
            else{
                var cur=parseInt(getStyle(obj,i))
            }

            var speed=(json[i]-cur)/8
            speed=speed>0?Math.ceil(speed):Math.floor(speed)

            if(json[i]!=cur){
                stop=false
            }


            if(stop){
                clearInterval(obj.timer)
                if(fn){
                    fn()
                }
            }
            else{
                cur+=speed
                if(i=="opacity"){
                    obj.style.opacity=cur/100
                    obj.style.filter="alpha(opacity:'+cur+')"
                }
                else{
                    obj.style[i]=cur+"px"
                }
            }
        }
    },30)
}

function getStyle(obj, attr) {
    if (obj.currentStyle) {
        return obj.currentStyle[attr];
    }
    else {
        return getComputedStyle(obj, false)[attr];
    }
}
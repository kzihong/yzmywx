/**
 * Created by Administrator on 2016/3/6.
 */
//window.onload=function(){
    window.onload=function(){myApp = (function () {
        var date = new Date()
        var year = date.getFullYear()
        var month = date.getUTCMonth()+1
        var day = date.getDate()
        var year_box = document.getElementById("year")
        var month_box = document.getElementById("month")
        var day_box = document.getElementById("day")
        return {
            //»ñµÃµ±Ç°Ê±¼ä²¢ÇÐ¸î³ÉÄê ÔÂ ÈÕ

            init: function () {
                //¶¯Ì¬ÉèÖÃ  ÔÂ·Ý
                var month_option = month_box.getElementsByTagName("option")
                month_option[month-1].selected=true;
                //¶¯Ì¬ÉèÖÃÄê·Ý
                var year_option = year_box.getElementsByTagName("option")
                //·ÀÖ¹Ê±¼äÐ¡ÓÚ2016
                var relative_year = year - 2016
                if (relative_year < 0) {
                    relative_year = 0
                }
                year_option[relative_year].selected=true;


                //¶¨Òåµ±ÔÂµÄÌìÊý£»
                var days;

                //µ±ÔÂ·ÝÎª¶þÔÂÊ±£¬¸ù¾ÝÈòÄê»¹ÊÇ·ÇÈòÄêÅÐ¶ÏÌìÊý
                if (month == 2) {
                    days = year % 4 == 0 ? 29 : 28;
                }
                else if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
                    //ÔÂ·ÝÎª£º1,3,5,7,8,10,12 Ê±£¬Îª´óÔÂ.ÔòÌìÊýÎª31£»
                    days = 31;
                }
                else {
                    //ÆäËûÔÂ·Ý£¬ÌìÊýÎª£º30.
                    days = 30;
                }

                for(var i=1;i<days+1;i++){
                    var day_option=document.createElement('option');
                    if(i<10){
                        i="0"+i
                    }
                    day_option.value=i;
                    day_option.innerHTML=i;
                    if(i==day){
                        day_option.selected=true;
                    }
                    day_box.appendChild(day_option);
                }
            },
            yearchange:function(){
                var year = year_box.options[year_box.selectedIndex].value;
                var day_option=day_box.getElementsByTagName('option');
                var month_box = document.getElementById("month");
                var month_option = month_box.getElementsByTagName("option");
                month_option[0].selected=true;
                var month=month_box.options[month_box.selectedIndex].value;
                var days;

                //µ±ÔÂ·ÝÎª¶þÔÂÊ±£¬¸ù¾ÝÈòÄê»¹ÊÇ·ÇÈòÄêÅÐ¶ÏÌìÊý
                if (month == 2) {
                    days = year % 4 == 0 ? 29 : 28;
                }
                else if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
                    //ÔÂ·ÝÎª£º1,3,5,7,8,10,12 Ê±£¬Îª´óÔÂ.ÔòÌìÊýÎª31£»
                    days = 31;
                }
                else {
                    //ÆäËûÔÂ·Ý£¬ÌìÊýÎª£º30.
                    days = 30;
                }
                for(var i= 0,length=day_option.length;i<length;i++){
                    day_box.removeChild(day_option[0]);
                }
                for(var i=1;i<days+1;i++){
                    var day_option=document.createElement('option');
                    if(i<10){
                        i="0"+i
                    }
                    day_option.value=i;
                    day_option.innerHTML=i;
                    if(i==1){
                        day_option.selected=true;
                    }
                    day_box.appendChild(day_option);
                }
                timeChange();
            },
            monthchange:function(){
                var year = year_box.options[year_box.selectedIndex].value;
                var month_box = document.getElementById("month");
                var month=month_box.options[month_box.selectedIndex].value;
                var day_option=day_box.getElementsByTagName('option');
                //¶¨Òåµ±ÔÂµÄÌìÊý£»
                var days;

                //µ±ÔÂ·ÝÎª¶þÔÂÊ±£¬¸ù¾ÝÈòÄê»¹ÊÇ·ÇÈòÄêÅÐ¶ÏÌìÊý
                if (month == 2) {
                    days = year % 4 == 0 ? 29 : 28;
                }
                else if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
                    //ÔÂ·ÝÎª£º1,3,5,7,8,10,12 Ê±£¬Îª´óÔÂ.ÔòÌìÊýÎª31£»
                    days = 31;
                }
                else {
                    //ÆäËûÔÂ·Ý£¬ÌìÊýÎª£º30.
                    days = 30;
                }
                for(var i= 0,length=day_option.length;i<length;i++){
                    day_box.removeChild(day_option[0]);
                }
                for(var i=1;i<days+1;i++){
                    var day_option=document.createElement('option');
                    if(i<10){
                        i="0"+i
                    }
                    day_option.value=i;
                    day_option.innerHTML=i;
                    if(i==1){
                        day_option.selected=true;
                    }
                    day_box.appendChild(day_option);
                }
                timeChange();
            }
        }
    }())
    myApp.init();

    var aDivDisplay = document.getElementsByClassName("div_display");
    var aTime = document.getElementsByClassName('time');


    timeChange = function (){
        for(var i=0;i<aDivDisplay.length;i++){
            for(var j=0;j<aDivDisplay[i].children.length;j++){
                
                if(i==0){
                    if(j==0){
                        NYR = "年";
                    }
                    else if(j==1){
                        NYR = "月";
                    }
                    else if(j==2){
                        NYR = "日";
                    }
                    aDivDisplay[i].children[j].innerHTML=aTime[i].getElementsByTagName("select")[j].value+NYR;
                }
                else if(i==1){
                    aDivDisplay[i].children[j].innerHTML=aTime[i].getElementsByTagName("select")[j].value
                }
            }
        }
    };
    timeChange();


    

    document.getElementsByClassName("submit")[0].onclick=function(){
        var memo = document.getElementById('memo').value;
        var telephone = document.getElementById('telephone').value;
        var contact = document.getElementById('contact').value;
        var address = document.getElementById('address').value;
        var aDate = aTime[0].getElementsByTagName("select");
        var aHour = aTime[1].getElementsByTagName("select");

        var formatbooktimeup = "";
        var formatbooktimedown = "";
        var temp = "";

        for(var i=0;i<aDate.length;i++){
            if(i!==aDate.length-1){
                temp = temp + aDate[i].value + "-";
            }
            else{
                temp = temp + aDate[i].value;
            }
        }

        formatbooktimedown = temp + " " +aHour[0].value;
        formatbooktimeup = temp + " " + aHour[1].value;

        validateForm(contact,telephone,address,memo,formatbooktimedown,formatbooktimeup);
    }

function getStyle(obj,name)
    {
        if(obj.currentStyle)
        {
            return obj.currentStyle[name];
        }
        else
        {
            return getComputedStyle(obj,false)[name];
        }
    }
    }


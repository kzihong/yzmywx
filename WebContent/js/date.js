/**
 * Created by Administrator on 2016/3/6.
 */
//var date = (function () {
//    var date = new Date()
//    var year = date.getFullYear()
//    var month = date.getMonth()+1
//    var day = date.getDate()
//    var year_box = document.getElementById("year")
//    var month_box = document.getElementById("month")
//    alert(month_box)
//    var day_box = document.getElementById("day")
//    return {
//        //��õ�ǰʱ�䲢�и���� �� ��
//
//        init: function () {
//            alert(month_box)
//            //��̬����  �·�
//            var month_option = month_box.getElementsByTagName("option")
//            month_option[month-1].setAttribute("selected", "")
//            //��̬�������
//            var year_option = year_box.getElementsByTagName("option")
//            //��ֹʱ��С��2016
//            var relative_year = year - 2016
//            if (relative_year < 0) {
//                relative_year = 0
//            }
//            year_option[relative_year].setAttribute("selected", "")
//
//
//            //���嵱�µ�������
//            var days;
//
//            //���·�Ϊ����ʱ���������껹�Ƿ������ж�����
//            if (month == 2) {
//                days = year % 4 == 0 ? 29 : 28;
//            }
//            else if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
//                //�·�Ϊ��1,3,5,7,8,10,12 ʱ��Ϊ����.������Ϊ31��
//                days = 31;
//            }
//            else {
//                //�����·ݣ�����Ϊ��30.
//                days = 30;
//            }
//
//            for(var i=1;i<days+1;i++){
//                var day_option=document.createElement('option');
//                day_option.value=i;
//                day_option.innerHTML=i;
//                if(i==day){
//                    day_option.setAttribute("selected","")
//                }
//                day_box.appendChild(day_option);
//            }
//        },
//        yearchange:function(){
//            var month_option = month_box.getElementsByTagName("option");
//            month_option[0].setAttribute("selected","");
//            var day_box = document.getElementById("day");
//            var day_option=day_box.getElementsByTagName("option");
//            day_option[day_option.length-1].setAttribute("selected","");
//        },
//        monthchange:function(){
//            var year = date.getFullYear()
//            var day_box=document.getElementById('day');
//            var month_box = document.getElementById("month");
//            var month=month_box.options[month_box.selectedIndex].value;
//            var day_option=day_box.getElementsByTagName('option');
//            //���嵱�µ�������
//            var days;
//
//            //���·�Ϊ����ʱ���������껹�Ƿ������ж�����
//            if (month == 2) {
//                days = year % 4 == 0 ? 29 : 28;
//            }
//            else if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
//                //�·�Ϊ��1,3,5,7,8,10,12 ʱ��Ϊ����.������Ϊ31��
//                days = 31;
//            }
//            else {
//                //�����·ݣ�����Ϊ��30.
//                days = 30;
//            }
//            alert(days)
//            for(var i= 0,length=day_option.length;i<length;i++){
//                day_box.removeChild(day_option[0]);
//            }
//            for(var i=1;i<days+1;i++){
//                var day_option=document.createElement('option');
//                day_option.value=i;
//                day_option.innerHTML=i;
//                if(i==1){
//                    day_option.setAttribute("selected","")
//                }
//                day_box.appendChild(day_option);
//            }
//        }
//    }
//}())
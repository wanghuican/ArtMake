$(function(){
// IPad/IPhone
  var viewportmeta = document.querySelector && document.querySelector('meta[name="viewport"]'),
  ua = navigator.userAgent,

  gestureStart = function () {viewportmeta.content = "width=device-width, minimum-scale=0.25, maximum-scale=1.6";},

  scaleFix = function () {
    if (viewportmeta && /iPhone|iPad/.test(ua) && !/Opera Mini/.test(ua)) {
      viewportmeta.content = "width=device-width, minimum-scale=1.0, maximum-scale=1.0";
      document.addEventListener("gesturestart", gestureStart, false);
    }
  };
  
  scaleFix();
  // Menu Android
  if(window.orientation!=undefined){
  var regM = /ipod|ipad|iphone/gi,
   result = ua.match(regM)
  if(!result) {
   $('.sf-menu li').each(function(){
    if($(">ul", this)[0]){
     $(">a", this).toggle(
      function(){
       return false;
      },
      function(){
       window.location.href = $(this).attr("href");
      }
     );
    } 
   })
  }
 }
});
var ua=navigator.userAgent.toLocaleLowerCase(),
 regV = /ipod|ipad|iphone/gi,
 result = ua.match(regV),
 userScale="";
if(!result){
 userScale=",user-scalable=0"
}
document.write('<meta name="viewport" content="width=device-width,initial-scale=1.0'+userScale+'">')

var currentYear = (new Date).getFullYear();
  $(document).ready(function() {
  $("#copyright-year").text( (new Date).getFullYear() );
  });

  $(function(){
  $('.sf-menu').superfish({autoArrows: true})
})



// DEVICE.JS AND SMOOTH SCROLLIG

function include(url){document.write('<script type="text/javascript" src="'+url+'"></script>')}
include('js/device.js');
include('js/jquery.mousewheel.js');
include('js/jquery.simplr.smoothscroll.js');

  $(function () { 
    if ($('html').hasClass('desktop')) {
        $.srSmoothscroll();
    }
  });

  function escapeHtml(string) {
	    var entityMap = {
	        "&": "&amp;",
	        "<": "&lt;",
	        ">": "&gt;",
	        '"': '&quot;',
	        "'": '&#39;',
	        "/": '&#x2F;'
	    };
	    return String(string).replace(/[&<>"'\/]/g, function (s) {
	        return entityMap[s];
	    });
	}
	function decodeHtml(string) {
		var str1 = new Array("&amp;","&lt;","&gt;","&quot;","&#39;","&#x2F;");
		var str2 = new Array("&","<",">","\"","'","/");
		for(var i=0;i<6;i++){
			while(string.indexOf(str1[i])>=0)
		    	string = string.replace(str1[i],str2[i]);
		}
		return string;
	}
	

	function getNow(){
		var nowDate = new Date();
		var timeStr = nowDate.getYear()+ "-" + (nowDate.getMonth()+1)+"-" + nowDate.getDate()
		                + "  "+ nowDate.getHours() + ":" + nowDate.getMinutes() + ":" + nowDate.getSeconds();

    	return timeStr.substring(1, timeStr.length);
	}	

	function dealTime(endtime){
		var time = endtime;
		while(time.indexOf(" ")>=0){
			endtime = time;
			time = endtime.replace(" ","");
		}
		var first = endtime.indexOf("-",0);
		var y = endtime.substring(0,first);
		y=changeNum(y);
		var second = endtime.indexOf("-",first+1);
		var m = endtime.substring(first+1,second);
		m=changeNum(m);
		var third = endtime.indexOf(" ",second+1);
		var d = endtime.substring(second+1,third);
		d=changeNum(d);
		var fourth = endtime.indexOf(":",third+1);
		var h = endtime.substring(third+1,fourth);
		h=changeNum(h);
		var fifth = endtime.indexOf(":",fourth+1);
		var mi = endtime.substring(fourth+1,fifth);
		mi=changeNum(mi);
		var s = endtime.substring(fifth+1,endtime.length);
		s=changeNum(s);
		return (y+m+d+h+mi+s).trim();
	}
	
	function changeNum(num){
		if(num.length!=2)
			num = "0" + num;
		else
			num = "" + num;
		return num;
	}
	
	function downTime(time1,time2,message){
		if(time1<=time2){
			return message;
		}else{
			var num = new Array(6);
			for(var i=0;i<6;i++){
				num[i] = time1.substring(i*2,(i+1)*2) - time2.substring(i*2,(i+1)*2);
			}
			
			if(parseInt(num[0]) == 0 && parseInt(num[1]) == 0 && parseInt(num[2]) == 0){
				if(num[5]<0){
					num[5]+=60;
					num[4]--;
				}
				if(num[4]<0){
					num[4]+=60;
					num[3]--;
				}
				return changeNum(num[3]+"") + ":"+ changeNum(num[4]+"") + ":" + changeNum(num[5]+"");
			}else{
				return time1;
			}
		}
	}
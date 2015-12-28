function message()
{
	var a=$.blinkTitle.show();
	setTimeout(function(){$.blinkTitle.clear(a)},8e3);
}
	$(document).ready(
			function(){
				var url2 = "ws://localhost:8080/ArtMakePlat/websocketdouble";
				var webSocket2 = null;
				
				//判断浏览器是否支持
				if ('WebSocket' in window)  
					webSocket2 = new WebSocket(url2); 
				else if ('MozWebSocket' in window)  
					webSocket2 = new MozWebSocket(url2);  
				else  
				    alert("暂不支持IE");

				webSocket2.onerror = function(event) {
				  alert("服务器连接失败！");
				};

				webSocket2.onopen = function(event) {
				  var json1 = "{ 'OPNO': '"+ $("#OPNO").val() +"' }";
				  webSocket2.send(json1);
				};

				webSocket2.onmessage = function(event) {
					var newtext2 = event.data;
					var json2 = eval("(" + newtext2 + ")");
					var length = $("#chat03_content").find(".chat03_name").length;
					alert("有来自"+json2.from+"的新消息");

					for(var t=0;t<length;t++)
					{
						if($("#chat03_content").find(".chat03_name").eq(t).attr("id") == json2.from)
						{
							b1="images/chat/img/head/2016.jpg";
							var e1=new Date,f1="";f1+=e1.getFullYear()+"-",f1+=e1.getMonth()+1+"-",f1+=e1.getDate()+"  ",f1+=e1.getHours()+":",f1+=e1.getMinutes()+":",f1+=e1.getSeconds();
							var i1="<div class='message clearfix'><div class='user-logo'><img src='"+b1+"'/>"+"</div>"+"<div class='wrap-text'>"+"<h5 class='clearfix'>"+$('#chat03_content').find('.chat03_name').eq(t).text()+"</h5>"+"<div>"+json2.content+"</div>"+"</div>";
							var index = t+1;
							$(".chat01_content").scrollTop($(".mes"+index).height());
							$(".mes"+index).append(i1);
						}
					}
				};
			
			function e(){
					function h(){-1!=g.indexOf("*#emo_")&&(g=g.replace("*#","<img src='images/chat/img/").replace("#*",".gif'/>"),h());}
					var e=new Date,f="";f+=e.getFullYear()+"-",f+=e.getMonth()+1+"-",f+=e.getDate()+"  ",f+=e.getHours()+":",f+=e.getMinutes()+":",f+=e.getSeconds();
					var g=$("#textarea").val();
					h();
					var i="<div class='message clearfix'><div class='user-logo'><img src='"+b+"'/>"+"</div>"+"<div class='wrap-text'>"+"<h5 class='clearfix'>"+$('#REALNAME').val()+"</h5>"+"<div>"+g+"</div>"+"</div>";
					null!=g&&""!=g?($(".mes"+a).append(i),$(".chat01_content").scrollTop($(".mes"+a).height()),$("#textarea").val(""),message()):alert("请输入聊天内容")}
					var a=3,b="images/chat/img/head/2016.jpg",c="images/chat/img/head/2015.jpg",d="名字";
					$(".close_btn").click(function(){$(".chatBox").hide(),$("#gochat").show();}),
					$(".chat03_content li").mouseover(function(){$(this).addClass("hover").siblings().removeClass("hover")}).mouseout(
					function(){
						$(this).removeClass("hover").siblings().removeClass("hover")}),$(".chat03_content li").dblclick(
													function(){
														var b=$(this).index()+1;
														a=b,c="images/chat/img/head/20"+(12+a)+".jpg",m=$(this).find(".chat03_name").attr('id'),d=$(this).find(".chat03_name").text(),$(".chat01_content").scrollTop(0),$(this).addClass("choosed").siblings().removeClass("choosed"),$(".talkTo a").text($(this).children(".chat03_name").text()),$(".mes"+b).show().siblings().hide()}),$(".ctb01").mouseover(
																function(){$(".wl_faces_box").show()}).mouseout(
																		function(){$(".wl_faces_box").hide()}),$(".wl_faces_box").mouseover(
																				function(){$(".wl_faces_box").show()}).mouseout(function(){$(".wl_faces_box").hide()}),$(".wl_faces_close").click(
																						function(){$(".wl_faces_box").hide()}),$(".wl_faces_main img").click(
																								function(){
																									var a=$(this).attr("src");
																									$("#textarea").val($("#textarea").val()+"*#"+a.substring(a.indexOf("emo_"),a.indexOf("."))+"#*"),$("#textarea").focusEnd(),$(".wl_faces_box").hide();});
																									$(".chat02_bar img").click(
																											function(){
																												var testJson2 = "{ 'from': '"+ $("#OPNO").val() +"', 'to': '"+m+ "', 'content': '"+ $("#textarea").val() +"' }";
																												webSocket2.send(testJson2);	
																												e();});
																									document.onkeydown=function(a){
																										var b=document.all?window.event:a;return 13==b.keyCode?(e(),!1):void 0},$.fn.setCursorPosition=function(a){return 0==this.lengh?this:$(this).setSelection(a,a)},$.fn.setSelection=function(a,b){if(0==this.lengh)return this;
																									}
																									if(input=this[0],input.createTextRange)
																									{
																										var c=input.createTextRange();
																										c.collapse(!0),
																										c.moveEnd("character",b),
																										c.moveStart("character",a),
																										c.select()
																									}
																									else 
																										input.setSelectionRange&&(input.focus(),input.setSelectionRange(a,b));
																									return this,
																									$.fn.focusEnd=function(){
																													this.setCursorPosition(this.val().length);
																									},
																									function(a){
																										a.extend({blinkTitle:{
																											show:function(){
																												var a=0,b=document.title;
																											
																												if(-1==document.title.indexOf("\u3010"))
																													var c=setInterval(function(){
																														a++,3==a&&(a=1),1==a&&(document.title="新消息！"+b),2==a&&(document.title="新消息！"+b)},500);
																													return[c,b];
																												},
																												clear:function(a){
																													a&&(clearInterval(a[0]),
																													document.title=a[1]);
																												}
																											}});}
																									(jQuery)});
																								
																													
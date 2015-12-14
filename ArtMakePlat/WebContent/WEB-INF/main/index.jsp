<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/common.js"></script> 
<script src="js/superfish.js"></script>
<script src="js/jquery.equalheights.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/tmStickUp.js"></script>
<script src="js/jquery.ui.totop.js"></script>
<script src="js/jquery.shuffle-images.js"></script>

<script>
var auth="<s:property value='#session.auth'/>";
 $(window).load(function(){
	 //alert(auth);
	 if(auth>=10){
		 $("#addInfo").fadeTo(500,0.5);
		 $("#addInfo").mouseover(function(){
			 $("#addInfo").fadeTo(500,1);
		 });
		 $("#addInfo").mouseout(function(){
			 $("#addInfo").fadeTo(500,0.5);
		 });
		 $("#addInfo").click(function(){
			 window.location.href="forward!goInfo";
		 });
	 }
  $().UItoTop({ easingType: 'easeOutQuart' });
  $('#stuck_container').tmStickUp({});  
 }); 

 $(document).ready(function(){
	 var content = "<s:property value='article.content'/>";
     $("#contenthtml").html(decodeHtml(content));
     divobj = document.getElementById('contenthtml');
     if(divobj.offsetWidth  > divobj.scrollHeight)
     {
    	 $("#etc").css("display","block");
     //overflow
     }else{
    	 $("#etc").css("display","none");
     }
     $("#title<s:property value='article.article_id'/>").css("color","red");
     $("#title<s:property value='article.article_id'/>").css("font-weight","600");
       $(".shuffle-me").shuffleImages({
         target: ".images > img"
       });
    });
 
 function goPage(d){
	 var page = parseInt($("#page").html()) + d;
	 var total = <s:property value="#request.pageTotal"/>;
	 if(page == 0){
		 alert('当前是第一页');
	 }else if(page > total){
		 alert('当前是最后一页');
	 }else{
		 $.ajax({
		        type: "post",
		        url: "infoListAjax?goPageInfo",
		        data:{//设置数据源
		        	PAGE:page
		        },
		        dataType: "json",
		        success: function(data){
		        	data = JSON.parse(data); 
		        	page = data.page;
		        	$("#page").html(page);
		        	rows = JSON.parse(data.rows).rows;
		        	$("#titles").html("");
		        	for(var i=0;i<rows.length;i++){
		        		$("#titles").append("<li style='font-size:20px'><span></span><a id='title"+rows[i].article_id +"' href='javascript:changeInfo(" + rows[i].article_id + ")'><div class='fa fa-chevron-right'></div>--"+rows[i].title + "</a></li>");
		        	}
		        	changeInfo(rows[0].article_id);
		        },
		        error: function(XMLHttpRequest, textStatus, errorThrown){
                alert("XMLHttpRequest=" + XMLHttpRequest);
                alert("textStatus=" + textStatus);
                alert("errorThrown=" + errorThrown);
                return false;
          }
		 });	
	 }
 }
 
 function changeInfo(id){
	 $("li>a").each(function(i ,e){
		 $(this).css("color","inherit")
		 $(this).css("font-weight","normal");
	 })
     $.ajax({
	        type: "post",
	        url: "infoAjax?goInfo",
	        data:{//设置数据源
	        	id:id
	        },
	        dataType: "json",
	        success: function(data){
	        	data = JSON.parse(data);
	        	$("#infoimg").attr("src","<s:property value='#request.IMGSRC'/>/"+data.image);
	        	$("#contenthtml").html(decodeHtml(data.content));
	        	 divobj = document.getElementById('contenthtml');
	             if(divobj.offsetWidth  > divobj.scrollHeight)
	             {
	            	 $("#etc").css("display","block");
	             //overflow
	             }else{
	            	 $("#etc").css("display","none");
	             }
	             $("#title" + data.article_id).css("color","red");
	             $("#title" + data.article_id).css("font-weight","600");
	             $("#aid").val(data.article_id);
	        },
	        error: function(XMLHttpRequest, textStatus, errorThrown){
         alert("XMLHttpRequest=" + XMLHttpRequest);
         alert("textStatus=" + textStatus);
         alert("errorThrown=" + errorThrown);
         return false;
   }
});	
}
 function godetail(){
	 var page = parseInt($("#page").html());
	 var aid = $("#aid").val();
	 window.location.href = "article!goDetail?id="+aid + "&PAGE=" +page;
 }
</script>
<!--[if lt IE 8]>
 <div style=' clear: both; text-align:center; position: relative;'>
   <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
     <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
   </a>
</div>
<![endif]-->
<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<link rel="stylesheet" media="screen" href="css/ie.css">
<![endif]-->
</head>

<body class="page1" id="top">
<jsp:include page="top.jsp"/>

<!--=====================
          Content
======================-->
<section id="content"><div class="ic">More Website Templates @ TemplateMonster.com - August11, 2014!</div>
  <div class="container">
    <div class="row">
      <div class="grid_12">
        <h2 class="ta__center">首页</h2>
        <div class="shuffle-group">
          <div class="row">
            <div class="grid_8">
              <div data-si-mousemove-trigger="100"  class="shuffle-me offset__1">
                <a href="gallery.html" class="info" target="_blank"></a>
                <div class="images">
                  <img src="images/information_1.jpg" alt="">
                  <img src="images/information_1-1.jpg" alt="">
                  <img src="images/information_1-2.jpg" alt="">
                </div>
              </div>
            </div>
            <div class="grid_4">
              <div data-si-mousemove-trigger="100" class="shuffle-me">
                <a href="gallery.html" class="info" target="_blank"></a>
                <div class="images">
                  <ul class="list-1">
                   <li><span></span><pre><a href="#"><div class="fa fa-chevron-right"></div>用抽象派画自画像  ￥300</a></pre></li>
                   <li><span></span><pre><a href="#"><div class="fa fa-chevron-right"></div>做一个人头雕塑  ￥300</a></pre></li>
                   <li><span></span><pre><a href="#"><div class="fa fa-chevron-right"></div>写一个金榜题名  ￥300</a></pre></li>
                   <li><span></span><pre><a href="#"><div class="fa fa-chevron-right"></div>设计好看的签名  ￥300</a></pre></li>
                   <li><span></span><pre><a href="#"><div class="fa fa-chevron-right"></div>设计专属印章  ￥300</a></pre></li>
                   <li><span></span><pre><a href="#"><div class="fa fa-chevron-right"></div>手工雕刻全身像  ￥300</a></pre></li>
                 </ul>
                 <div class="grid_8">
                   <a href="#" class="btn">more</a>
                 </div>
                </div>
              </div>
            </div>
            <div class="clear"></div>
            <div class="grid_4">
              <div data-si-mousemove-trigger="100" class="shuffle-me">
                <a href="gallery.html" class="info" target="_blank"></a>
                <div class="images">
                  <img src="images/gall_4.jpg" alt="">
                  <img src="images/gall_4-1.jpg" alt="">
                  <img src="images/gall_4-2.jpg" alt="">
                </div>
              </div>
              <div data-si-mousemove-trigger="100" class="shuffle-me">
                <a href="gallery.html" class="info" target="_blank"></a>
                <div class="images">
                  <img src="images/gall_5.jpg" alt="">
                  <img src="images/gall_5-1.jpg" alt="">
                  <img src="images/gall_5-2.jpg" alt="">
                </div>
              </div>
            </div>
            <div class="grid_8">
              <div data-si-mousemove-trigger="100"  class="shuffle-me">
                <a href="gallery.html" class="info" target="_blank"></a>
                <div class="images">
                  <img src="images/gall_6.jpg" alt="">
                  <img src="images/gall_6-1.jpg" alt="">
                  <img src="images/gall_6-2.jpg" alt="">
                </div>
              </div>
            </div>
            </div>
          </div>
      </div>
    </div>
   </div>
  <div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >企业网站模板</a></div>
  <div class="sep-1"></div>
  <div class="container">
    <div class="row">
      <div class="grid_8">
        <h3>资讯
        <img id="addInfo" alt="添加" style="cursor:pointer;width:4%;height:4%;display:none" src="images/add.png"/></h3>
        <input id="aid" type="hidden" value="<s:property value='article.article_id'/>">
        <div style="width:25%;height:25%">
        <img id="infoimg" src="<s:property value='#request.IMGSRC'/>/<s:property value='article.image'/>" alt="" class="img_inner fleft noresize">
        </div>
        <div class="extra_wrapper">
        <div class="offset__1" style="margin-left:25%;width:50%;height:15em;overflow:hidden" id="contenthtml" >
        
        </div>
        <h1 id="etc" align="right" style="display:none">...............</h1>
        </div>
        <div class="clear"></div>
       [ 查看详情请点击下方按钮 ] <br>
        <a href="javascript:godetail()" class="btn">详情</a> 
      </div>
      <div class="grid_4">
        <h3>资讯录</h3>
        <ul class="list-1" id="titles" style="font-weight:normal">
         <s:iterator value="articleList" id="row">
          <li style="font-size:20px"><span></span>
            <a id="title<s:property value='#row.article_id'/>" href="javascript:changeInfo(<s:property value='#row.article_id'/>)">
            <div class="fa fa-chevron-right"></div>--<s:property value='#row.title'/></a>
          </li>
         </s:iterator>
        </ul>
         <div valign="buttom" style="margin-left:10%;margin-top:20%;font-size:20px;font-weight:600">
         <label style="cursor:pointer" onclick="goPage(-1)"> << &nbsp;  </label>
         <label name="page" id="page"><s:property value="#request.pageNo"/></label>
         <label style="cursor:pointer" onclick="goPage(1)"> &nbsp; >> </label>
         </div>
      </div>
    </div>
  </div>
  <div class="sep-1"></div>
</section>
<jsp:include page="bottom.jsp"></jsp:include>
<a href="#" id="toTop" class="fa fa-chevron-up"></a>
</body>
</html>


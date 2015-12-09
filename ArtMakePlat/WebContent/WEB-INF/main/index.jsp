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
<script src="js/script.js"></script> 
<script src="js/superfish.js"></script>
<script src="js/jquery.equalheights.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/tmStickUp.js"></script>
<script src="js/jquery.ui.totop.js"></script>
<script src="js/jquery.shuffle-images.js"></script>

<script language="javascript">
if("<s:actionmessage/>"!="")
alert("<s:actionmessage/>");
</script>
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
       $(".shuffle-me").shuffleImages({
         target: ".images > img"
       });
    });

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
                  <img src="images/information_2.jpg" alt="">
                  <img src="images/information_2-1.jpg" alt="">
                  <img src="images/information_2-2.jpg" alt="">
                </div>
              </div>
              <div data-si-mousemove-trigger="100" class="shuffle-me offset__1">
                <a href="gallery.html" class="info" target="_blank"></a>
                <div class="images">
                  <img src="images/gall_3.jpg" alt="">
                  <img src="images/gall_3-1.jpg" alt="">
                  <img src="images/gall_3-2.jpg" alt="">
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
        <img src="images/page1_img1.jpg" alt="" class="img_inner fleft noresize">
        <div class="extra_wrapper"><p class="offset__1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;萨尔瓦多•达利(1904-1989)，西班牙超现实主义画家。与毕加索、马蒂斯一起被认为是二十世纪最有代表性的三位画家。他的作品引领整个拉丁美洲的文化进程，将魔幻现实主义刻在西班牙的血液里！现在，这位鬼才艺术家的大批杰作正在魔都上海展出！<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;“疯狂达利艺术大展”展品涵盖达利各个时期各个领域的作品包括雕塑、绘画、设计和黄金制品等300余件艺术珍品。其中经典瑰宝作品更是频现真容，如早已蜚声海内外的雕塑《爱丽丝梦游仙境》、《抽屉人》、《时间的轮廓》以及誉满天下的经典设计《红唇沙发》等，以及首次来华展出的5*11米巨幅达利真迹——油画《意乱神迷》！</p></div>
        <div class="clear"></div>
        <p><a href=" http://blog.templatemonster.com/free-website-templates/" rel="nofollow" class="color1">1&nbsp;&nbsp;技术向 : 如何识别假冒伪劣的古代瓷器>>></a></p>
        <p><a href="http://www.templatemonster.com/properties/topic/design-photography/" rel="nofollow" class="color1">2&nbsp;&nbsp;名师向 : 唐寅反应在仕女画的社会风气景象>>></a></p>
        <p><a href="http://www.templatemonster.com/properties/topic/design-photography/" rel="nofollow" class="color1">3&nbsp;&nbsp;关于徐悲鸿的艺术求学法国之路>>></a></p>
        [ 获取更多资讯请点击下方按钮 ] <br>
        <a href="#" class="btn">more</a> 
      </div>
      <div class="grid_4">
        <h3>热门</h3>
        <ul class="socials">
          <li>
            <a href="#">&nbsp;&nbsp;1&nbsp;&nbsp;这边写点字比较好看</a>
          </li>
          <li>
            <a href="#">&nbsp;&nbsp;2&nbsp;&nbsp;这边写点字比较好看</a>
          </li>
          <li>
            <a href="#">&nbsp;&nbsp;3&nbsp;&nbsp;这边写点字比较好</a>
          </li>
          <li>
            <a href="#">&nbsp;&nbsp;4&nbsp;&nbsp;这边写点字比较好看</a>
          </li>
          <li>
            <a href="#">&nbsp;&nbsp;5&nbsp;&nbsp;这边写点字比较好看</a>
          </li>
          <li>
            <a href="#">&nbsp;&nbsp;6&nbsp;&nbsp;这边写点字比较好看</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <div class="sep-1"></div>
</section>
<jsp:include page="bottom.jsp"></jsp:include>
<a href="#" id="toTop" class="fa fa-chevron-up"></a>
</body>
</html>


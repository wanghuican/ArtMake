<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
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
<title>定制</title>
<script>
 $(window).load(function(){
  $().UItoTop({ easingType: 'easeOutQuart' });
  $('#stuck_container').tmStickUp({});  
 }); 

</script>
</head>

<body class="page_uploadart" id="uploadart">

<jsp:include page="WEB-INF/main/top.jsp" />
<section id="content"><div class="ic">More Website Templates @ TemplateMonster.com - August11, 2014!</div>
  <div class="container">
    <div class="row">    
      <div class="grid_4">
        <h2>热门</h2>
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
      <div class="grid_2">
      </div>
      <div class="grid_4">
      	<h2></h2>
      	<h3>这是一个标题</h3>
        <div class="extra_wrapper"><p class="offset__1">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In mollis erat mattis neque facilisis, sit amet ultricies erat rutrum. Cras facilisis, nulla vel viverra auctor, leo magna sodales felis, quis malesuada nibh odio ut velit. Proin pharetra luctus diam, a scelerisque eros convallis accumsan. Maecenas vehicula egestas  derto venenatis. Duis massa elit, auctor non pellentesque vel, aliquet sit amet erat.</p></div>
        <a href="#" class="btn">more</a> 
      </div>   
    </div>
  </div>
</section>

<section id="content"><div class="ic">More Website Templates @ TemplateMonster.com - August11, 2014!</div>
  <div class="container">
    <div class="row">    
      <div class="grid_4">
        <h2>最新</h2>
        <ul class="list-1">
          <li><span></span><pre><a href="#"><div class="fa fa-chevron-right"></div>模仿Category的效果    ￥300</a></pre></li>
          <li><span></span><pre><a href="#"><div class="fa fa-chevron-right"></div>模仿Category的效果    ￥300</a></pre></li>
          <li><span></span><pre><a href="#"><div class="fa fa-chevron-right"></div>模仿Category的效果    ￥300</a></pre></li>
          <li><span></span><pre><a href="#"><div class="fa fa-chevron-right"></div>模仿Category的效果    ￥300</a></pre></li>
          <li><span></span><pre><a href="#"><div class="fa fa-chevron-right"></div>模仿Category的效果    ￥300</a></pre></li>
          <li><span></span><pre><a href="#"><div class="fa fa-chevron-right"></div>模仿Category的效果    ￥300</a></pre></li>
        </ul>
		<div class="grid_8">
          <a href="#" class="btn">more</a>
        </div>
      </div> 
      <div class="grid_2">
      </div>
      <div class="grid_4">
      	<h2></h2>
      	<h3>这是一个标题</h3>
        <div class="extra_wrapper"><p class="offset__1">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In mollis erat mattis neque facilisis, sit amet ultricies erat rutrum. Cras facilisis, nulla vel viverra auctor, leo magna sodales felis, quis malesuada nibh odio ut velit. Proin pharetra luctus diam, a scelerisque eros convallis accumsan. Maecenas vehicula egestas  derto venenatis. Duis massa elit, auctor non pellentesque vel, aliquet sit amet erat.</p></div>
        <a href="#" class="btn">more</a> 
      </div>   
    </div>
  </div>
</section>

<!--==============================
              footer
=================================-->
<jsp:include page="WEB-INF/main/bottom.jsp" />
<a href="#" id="toTop" class="fa fa-chevron-up"></a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/touchTouch.css">
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
<script src="js/touchTouch.jquery.js"></script>
<title>商城</title>
<script>
 $(window).load(function(){
  $().UItoTop({ easingType: 'easeOutQuart' });
  $('#stuck_container').tmStickUp({}); 
    $('.gallery .gall_item').touchTouch();
 }); 

</script>
</head>

<body class="page_uploadart" id="uploadart">

<jsp:include page="top.jsp" />
<section id="content" class="gallery"><div class="ic">More Website Templates @ TemplateMonster.com - August11, 2014!</div>
  <div class="container">
    <div class="row">
      <div class="grid_12">
        <h2>在线商城</h2>
      </div>
      
      <div class="grid_12" style="background-color:#CCC">
        <div class="navigation" style="float:left">
            <nav>
              <ul class="sf-menu" id="sel_menu">
<<<<<<< HEAD:ArtMakePlat/WebContent/WEB-INF/main/mall.jsp
               <s:iterator value="keyList" id="row">
                <s:if test="#row.key_id != 1">
                 <li id="key<s:property value='#row.key_id'/>" value="<s:property value='#row.key_id'/>"><s:property value='#row.keyname'/></li>
                </s:if>
                 </s:iterator>
=======
               <li><a href="#" style="color:black">玉石</a></li>
               <li><a href="#" style="color:black">国画</a></li>
               <li><a href="#" style="color:black">雕刻</a></li>
               <li><a href="#" style="color:black">定制</a></li>
>>>>>>> origin/develop:ArtMakePlat/WebContent/mall.jsp
              </ul>
            </nav>
            <div class="clear"></div>
        </div>
        <div class="grid_4" style="float:right; padding-top:12px">
          <input type="text" placeholder="搜索..." style="font-size:18px"/>
          <button style="font-size:18px">搜索</button>
        </div>
      </div>
      
      <div class="grid_12" align="center" id="artist">
        <h2>艺术品</h2>
      </div>
      <div class="grid_4" align="center">
        <a href="images/big1.jpg" class="gall_item"><img src="images/page3_img1.jpg" alt=""><span></span></a>
      </div>
      <br>
      <div class="grid_4" align="center">
        <a href="images/big2.jpg" class="gall_item"><img src="images/page3_img2.jpg" alt=""><span></span></a>
      </div>
      <br>
      <div class="grid_4" align="center">
        <a href="images/big3.jpg" class="gall_item"><img src="images/page3_img3.jpg" alt=""><span></span></a>
      </div>
      <div class="grid_12" style="height:20px">
      </div>
      <div class="grid_4" align="center">
        <a href="images/big4.jpg" class="gall_item"><img src="images/page3_img4.jpg" alt=""><span></span></a>
      </div>
      <br>
      <div class="grid_4" align="center">
        <a href="images/big5.jpg" class="gall_item"><img src="images/page3_img5.jpg" alt=""><span></span></a>
      </div>
      <br>
      <div class="grid_4" align="center">
        <a href="images/big6.jpg" class="gall_item"><img src="images/page3_img6.jpg" alt=""><span></span></a>
      </div>
      
    </div>
  </div>
</section>

<!--==============================
              footer
=================================-->
<jsp:include page="bottom.jsp" />
<a href="#" id="toTop" class="fa fa-chevron-up"></a>
</body>
</html>
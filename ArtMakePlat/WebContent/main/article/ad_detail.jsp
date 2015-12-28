<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>个人中心</title>
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
<script>
 $(window).load(function(){
	 var content = "<s:property value='article.content'/>";
     $("#contenthtml").html(decodeHtml(content));
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

<body>
<jsp:include page="../top.jsp" />
<!--=====================
          Content
======================-->
<section id="content"><div class="ic">More Website Templates @ TemplateMonster.com - August11, 2014!</div>
  <div class="container">
    <div class="row">
      <div class="grid_8" style="width:100%" align="center">
        <h2>标题 </h2><div class="text1 color1"><s:property value='article.title'/></div>
        <div class="blog">
          <div style="height:50%;width:50%">
					<img id="infoimg" style="height:100%;width:100%"
						src="<s:property value='#request.IMGSRC'/>/<s:property value='article.image'/>"
						alt="" class="img_inner">
				</div>	
          <div id="contenthtml">
          
          </div>
          <s:if test="article.person.person_id != ''">
          <div align="right"><h2><a href="person!goInfo?id=<s:property value='article.person.person_id'/>">>>>>前往：<s:property value='article.person.realname'/></a></h2></div>
          </s:if>
          <br>
        </div>
        </div>
    </div>
  </div>

</section>
  <jsp:include page="../bottom.jsp" />
</body>
</html>


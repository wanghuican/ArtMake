<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function goAdminLogin()
{
	window.location.href = "forward!goAdminLogin";
}

function goInfo(){
	window.location.href = "person!goInfo"
}

</script>
<title>艺术品定制平台</title>
</head>
<body>
<!--==============================
              header
=================================-->
<header>
<div onclick="goAdminLogin()" style="cursor:pointer;position:absolute;z-index:100;top:1%;left:95%;color:black;width:5%">管理员登陆</div>
  <div class="header_top">
    <div class="container">
      <div class="row">
        <div class="grid_12">
          <h1><a href="#">Art.More <br> embellish life </a></h1>
          your photographer
        </div>
      </div>
    </div>
  </div>
  <section id="stuck_container">
  <!--==============================
              Stuck menu
  =================================-->
    <div class="container">
      <div class="row">
        <div class="grid_12 ">
          <h1 class="logo">
            <a href="index.jsp">
              Art.More
            </a>
          </h1>
          <div class="navigation ">
            <nav>
              <ul class="sf-menu" id="sel_menu">
               <li class="current"><a href="article">首页</a></li>
               <li><a href="about.html">关于</a></li>
               <li><a href="gallery.html">拍卖</a></li>
               <li><a href="blog.html">定制</a></li>
               <li class="current"><s:if test="#session.person==null">      
						<a href="forward!goUser">                             
                                                        登录/注册</a>
                        </s:if> <s:else>
                        <div style="cursor:pointer" onclick="goInfo()">
                        <s:property value="#session.person.role.rolename" />:
                        <s:property value="#session.person.realname" />
                        </div>
						</s:else>
						</li>
             </ul>
            </nav>
            <div class="clear"></div>
          </div>       
         <div class="clear"></div>  
        </div>
     </div> 
    </div> 
  </section>
</header>
</body>
</html>
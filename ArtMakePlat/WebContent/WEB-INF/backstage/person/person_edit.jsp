<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/style.css">

<script type="text/javascript" charset="utf-8"
	src="js/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="js/ueditor.all.min.js">
	
</script>
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
<script type="text/javascript">
	var flag = false;
	$(window).load(function() {
		$('#stuck_container').tmStickUp({});
	});

	$(document).ready(function() {
		$("#personsave").click(function() {
			if($("#account").val() == ""){
				alert("账号不能为空");
				return;
			}
			if($("#password").val() == ""){
				alert("密码不能为空");
				return;
			}
			$("#contact-form").attr("action", "personManage!savePerson");
			$("#contact-form").submit();
		});
		var sex = "<s:property value='person.sex'/>";
		if(sex != "")
			$("#sex").val(sex);
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
	<!--=====================
          Content
======================-->
	<section id="content">
	<div class="ic">More Website Templates @ TemplateMonster.com -
		August11, 2014!</div>
	<div class="container">
		<div class="row">
			<div class="grid_12">
				<h2>编辑</h2>
				<form id="contact-form" method="post">
					<div class="contact-form-loader"></div>
					<fieldset>
						Account: <input id="account" type="text" name="person.account" value="<s:property value='person.account'/>"/> <br><br>
						Password:<input id="password" type="password" name="person.password" value="<s:property value='person.password'/>"/> <br><br>
						Realname: <input id="realname" type="text" name="person.realname" value="<s:property value='person.realname'/>"/> <br><br>
						 QQ: <input id="idcard" type="text" name="person.idcard" value="<s:property value='person.idcard'/>"/> <br><br> 
						Email: <input id="email" type="text" name="person.email" value="<s:property value='person.email'/>"/> <br> <br>
						Tel: <input id="tel" type="text" name="person.tel" value="<s:property value='person.tel'/>"/> <br> <br>
						Address: <input id="address" type="text" name="person.address" value="<s:property value='person.address'/>"/> <br><br>
					    Sex: 
					    <select id="sex" name="person.sex">
					     <option value="">--请选择--</option>
					     <option value="男">男</option>
					     <option value="女">女</option>
					    </select>
					    <br><br>
					    QQ: <input id="qq" type="text" name="person.qq" value="<s:property value='person.qq'/>"/> 
					    <br><br> 
					    <s:if test="role_code == 5">
					         角色:
					    <select id="role_id" name="person.role.role_id">
					       <option value="">--请选择--</option>
					        <s:iterator value="roleList" id="row">
					         <option value="<s:property value='#row.role_id'/>"
                                ><s:property value='#row.rolename'/></option>
					        </s:iterator>
					    </select>
					    </s:if>
					    <s:else>
				    	    <input id="role_id" type="hidden" name="person.role.role_id" value="<s:property value='role.role_id'/>"/>
					    </s:else>
					    <br><br>
					    <input type="button" id="personsave" value="保存"
							style="border-color: #87858a; border-width: thin; background: none; height: 35px; width: 100%; font-family: 'Microsoft YaHei UI'" />
					</fieldset>
				</form>
			</div>
		</div>
	</div>

	</section>
	<!--==============================
              footer
=================================-->
</body>
</html>


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
		$().UItoTop({
			easingType : 'easeOutQuart'
		});
		$('#stuck_container').tmStickUp({});
	});

	$(document)
			.ready(
					function() {
						$("#rolesave").click(
								function() {
									if($("#role_id").val()==""){
										alert("请选择角色");
										return;
									}
									
									$("#contact-form").attr("action",
											"authManage!setAuth");
									$("#contact-form").submit();
								});
					var role_id = "<s:property value='role_id'/>";
					if(role_id != "0")
		    			$("#role_id").val(role_id);
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
				<h2>权限编辑</h2>
				<form id="contact-form" method="post">
				<input type="hidden" name="id" value="<s:property value='auth.auth_id'/>"/>
					<div class="contact-form-loader"></div>
					<fieldset>
                        <select name="role_id" id="role_id"
						style="border-color: #87858a; border-width: thin; background: none; height: 35px; width: 400px; font-family: 'Microsoft YaHei UI'" >
                                <option value=""
                                >--请选择--</option>
                                <s:iterator value="roleList" id="row">
                                <s:if test="#row.role_code != 5">
                                 <option value="<s:property value='#row.role_id'/>"
                                ><s:property value='#row.rolename'/></option>
                                </s:if>
                                </s:iterator>
                         </select>
                         <br><br>
						<br> <input type="button" id="rolesave" value="保存"
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


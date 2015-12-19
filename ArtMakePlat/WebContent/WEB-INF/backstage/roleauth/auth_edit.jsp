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
									if($("#upnum").val() == ""){
										alert("请输入最大上传个数");
										return;
									}
									if($("#lasttime").val() == ""){
										alert("请输入上传最大持续时间");
										return;
									}
									$("#contact-form").attr("action",
											"authManage!saveAuth");
									$("#contact-form").submit();
								})
					var id = "<s:property value='auth.role.role_id'/>";
					if(id != "0")
				    	$("#role").val(id);
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
				<s:if test="auth.auth_id > 0">
				<input type="hidden" name="id" value="<s:property value='auth.auth_id'/>"/>
				</s:if>
				<s:else>
		    	<input type="hidden" name="id" value="0"/>				
				</s:else>
					<div class="contact-form-loader"></div>
					<fieldset>
                        <label class="title">上传最大个数： <input type="text" id="upnum" value="<s:property value='auth.upnum'/>"
							name="auth.upnum" placeholder="上传最大个数:" data-constraints=""
							style="border-color: #87858a; border-width: thin; background: none; height: 35px; width: 400px; font-family: 'Microsoft YaHei UI'" />
						</label> <br> <br>
						<label class="title">上传最大持续时间： <input type="text" id="lasttime" value="<s:property value='auth.lasttime'/>"
							name="auth.lasttime" placeholder="上传最大持续时间:" data-constraints=""
							style="border-color: #87858a; border-width: thin; background: none; height: 35px; width: 400px; font-family: 'Microsoft YaHei UI'" />
						</label> <br> <br>
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


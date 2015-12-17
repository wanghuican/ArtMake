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
						$("#title").val("<s:property value='article.title'/>");
						$("#column_id").val("<s:property value='article.column_id'/>");
						var times = "<s:property value='article.time'/>".split(",");
						for(var i = 1;i<=times.length;i++){
							$("#time"+i).val(times[i-1]);
							$("#time"+i).css("display","block");
						}
						$("#info").click(
								function() {
									if ($("#title").val() == "") {
										alert("标题未填写");
										return;
									}
									if($("#column_id").val() == ""){
										alert("请选择栏位");
										return;
									}
									if(($("#time1").val()=="" && $("#time1").css("display") != "none")
									    ||($("#time2").val()=="" && $("#time2").css("display") != "none")
									    ||($("#time3").val()=="" && $("#time3").css("display") != "none") 
								        ||($("#time4").val()=="" && $("#time4").css("display") != "none")
								        ||($("#time5").val()=="" && $("#time5").css("display") != "none")){
										alert("日期不能为空");
										return;
									}
									$("#contact-form").attr("action",
											"articleCheck!updateAd");
									$("#contact-form").submit();
								})
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
				<h2>广告编辑</h2>
				<form id="contact-form" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id" value="<s:property value='article.article_id'/>"/>;
					<div class="contact-form-loader"></div>
					<fieldset>
						<label class="title">标题： <input type="text" id="title"
							name="title" placeholder="标题:" data-constraints=""
							style="border-color: #87858a; border-width: thin; background: none; height: 35px; width: 400px; font-family: 'Microsoft YaHei UI'" />

						</label> <br> <br> <label class="title">日期：&nbsp; 
					                	<span id="times"> 
					                	<input type="date" id="time1" name="time" placeholder="时间：" value="" data-constraints=""
											style="display:none;border-color: #87858a; border-width: thin; background: none; height: 35px; font-family: 'Microsoft YaHei UI'" />
											<input type="date" id="time2" name="time" placeholder="时间：" value="" data-constraints=""
											style="display:none;border-color: #87858a; border-width: thin; background: none; height: 35px; font-family: 'Microsoft YaHei UI'" />
											<input type="date" id="time3" name="time" placeholder="时间：" value="" data-constraints=""
											style="display:none;border-color: #87858a; border-width: thin; background: none; height: 35px; font-family: 'Microsoft YaHei UI'" />
											<input type="date" id="time4" name="time" placeholder="时间：" value="" data-constraints=""
											style="display:none;border-color: #87858a; border-width: thin; background: none; height: 35px; font-family: 'Microsoft YaHei UI'" />
											<input type="date" id="time5" name="time" placeholder="时间：" value="" data-constraints=""
											style="display:none;border-color: #87858a; border-width: thin; background: none; height: 35px; font-family: 'Microsoft YaHei UI'" />
									</span> &nbsp;
						</label> <br> <br>
						<label class="title">栏位:
						<select name="column_id" id="column_id"
						style="border-color: #87858a; border-width: thin; background: none; height: 35px; width: 400px; font-family: 'Microsoft YaHei UI'" >
                                <option value=""
                                >--请选择--</option>
                                <option value="big">big</option>
                                <option value="small">small</option>
                         </select>
                        </label>
                        <br> <br>
						<br> <input type="button" id="info" value="保存"
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


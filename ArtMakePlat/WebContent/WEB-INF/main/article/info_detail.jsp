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
<script>
$(window).load(function(){
	 var content = "<s:property value='article.content'/>";
    $("#contenthtml").html(decodeHtml(content));
    $("#title<s:property value='article.article_id'/>").css("color","red");
    $("#title<s:property value='article.article_id'/>").css("font-weight","600");
}); 
	$(window).load(function() {
		
		$().UItoTop({
			easingType : 'easeOutQuart'
		});
		$('#stuck_container').tmStickUp({});
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
		            $("#title").html(data.title);
		        	$("#title" + data.article_id).css("color","red");
		            $("#title" + data.article_id).css("font-weight","600");
		        },
		        error: function(XMLHttpRequest, textStatus, errorThrown){
	         alert("XMLHttpRequest=" + XMLHttpRequest);
	         alert("textStatus=" + textStatus);
	         alert("errorThrown=" + errorThrown);
	         return false;
	   }
	});	
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

<body>
	<jsp:include page="../top.jsp" />
	<!--=====================
          Content
======================-->
	<section id="content">
	<div class="ic">More Website Templates @ TemplateMonster.com -
		August11, 2014!</div>
	<div class="container">
		<div class="row">
			<div class="grid_8">
				<h2>标题</h2>
				<div id="title" class="text1 color1">
					<s:property value='article.title' />
				</div>
				<div class="blog">
				<div style="height:50%;width:50%">
					<img id="infoimg" style="height:100%;width:100%"
						src="<s:property value='#request.IMGSRC'/>/<s:property value='article.image'/>"
						alt="" class="img_inner">
				</div>		
					<div id="contenthtml">
					
					</div>
					<br>
				</div>
			</div>

			<div class="grid_4">
				<h3>资讯录</h3>
				<ul class="list-1" id="titles" style="font-weight: normal">
					<s:iterator value="articleList" id="row">
						<li style="font-size: 20px"><span></span> <a
							id="title<s:property value='#row.article_id'/>"
							href="javascript:changeInfo(<s:property value='#row.article_id'/>)">
								<div class="fa fa-chevron-right"></div>--<s:property
									value='#row.title' />
						</a></li>
					</s:iterator>
				</ul>
				<div valign="buttom"
					style="margin-left: 10%; margin-top: 20%; font-size: 20px; font-weight: 600">
					<label style="cursor: pointer" onclick="goPage(-1)"> <<
						&nbsp; </label> <label name="page" id="page"><s:property
							value="#request.pageNo" /></label> <label style="cursor: pointer"
						onclick="goPage(1)"> &nbsp; >> </label>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!--==============================
              footer
=================================-->
	<jsp:include page="../bottom.jsp" />


</body>
</html>
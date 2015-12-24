<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/uploadart.css">
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
<title>top</title>
<script>
 $(window).load(function(){
  $().UItoTop({ easingType: 'easeOutQuart' });
  <s:if test="product.state == 1">
  setInterval(getprice,1000);
  </s:if>
 }); 

 $(document).ready(function(){
       $(".shuffle-me").shuffleImages({
         target: ".images > img"
       });
    });

 function getprice(){
	 $.ajax({
			type : "post",
			url : "getPriceAjax!getPrice",
			data : {//设置数据源
				id:$("#id").val()
			},
			dataType : "json",
			success : function(data) {
				data = JSON.parse(data);
				$("#nowprice").html(parseFloat(data.price));
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("XMLHttpRequest=" + XMLHttpRequest);
				alert("textStatus=" + textStatus);
				alert("errorThrown=" + errorThrown);
				return false;
			}
		});
 }
 
</script>
</head>

<body class="page_uploadart" id="uploadart">

<section id="content">
<form id="infoform" method="post">
	<div class="container">
	<input type="hidden" id="id" name="id" value="<s:property value='product.product_id'/>"/>
		<div class="row">
			<div class="grid_12">
            <h2><b><s:property value="product.productname"/></b></h2>
            <h2><b>
            <s:if test="product.state == 1">  当前价格：<label id="nowprice"><s:property value="product.price"/></label>
			</s:if></b></h2>
			</div>
			<br>
			<br>
            <div class="row">
      		<div class="grid_6 preffix_1">
      		图片：
      		<br>
            
            <div class="grid_12">
            <s:iterator value="product.imageList" id="row">
              <div class="grid_4" style="width:30%">
                <div class="images" style="width:100%;height:100px">
                  <img style="width:100%;height:100%" src="<s:property value='#request.IMGSRC'/>/<s:property value='#row.image'/>" alt="">
                </div>
               </div>
              </s:iterator>
            </div>
            
      			<label style="margin-top: 15px; margin-bottom: 15px;">详细信息</label>
      			<br/>
                <label class="message">
                  <s:property value='product.introduce'/>
                </label>
                <br><br>
      		</div>
			</div>
		</div>
	</div>
</form>
</section>

<!--==============================
              footer
=================================-->
<a href="#" id="toTop" class="fa fa-chevron-up"></a>
</body>
</html>
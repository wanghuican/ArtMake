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
<title>艺术品定制平台</title>
<script>
var flag1 = false;
var flag2 = false;
var flag3 = false;
 $(window).load(function(){
  $().UItoTop({ easingType: 'easeOutQuart' });
  $('#stuck_container').tmStickUp({});  
 }); 

 $(document).ready(function(){
       $(".shuffle-me").shuffleImages({
         target: ".images > img"
       });
    });
	
function checktimer(value){
	flag1 = true;
	if(value.length == 0)
	{
		document.getElementById("timerError").value = "持续时间不可为空";
		return;
	}
    var lasttime = <s:property value="auth.lasttime"/>;
    if(parseInt(value) > parseInt(lasttime)){
    	document.getElementById("timerError").value = "超过最大持续时间";
    	return 
    }
    if(isNaN(value))document.getElementById("timerError").value = "请输入数字";
	else
	{
		if(parseFloat(value)<0)document.getElementById("timerError").value = "持续时间不可为负";
		else document.getElementById("timerError").value = "";
		return
	}
}

function checkStartPrice(value){
	flag2 = true;
	if(value.length == 0)
	{
		document.getElementById("startpriceError").value = "起拍价不可为空";
		return;
	}

    if(isNaN(value))document.getElementById("startpriceError").value = "请输入数字";
	else
	{
		if(parseFloat(value)<0)document.getElementById("startpriceError").value = "起拍价不可为负";
		else document.getElementById("startpriceError").value = "";
	}
}

function checkAddPrice(value){
	flag3 = true;
	if(value.length == 0)
	{
		document.getElementById("addpriceError").value = "加价最小额度不可为空";
		return;
	}

    if(isNaN(value))document.getElementById("addpriceError").value = "请输入数字";
	else
	{
		if(parseFloat(value) < 0)document.getElementById("addpriceError").value = "加价最小额度不可为负";
		else document.getElementById("addpriceError").value = "";
	}

}

function submitit(){
	if((document.getElementById("addpriceError").value!="")
			||(document.getElementById("startpriceError").value!="")
			||(document.getElementById("timerError").value!=""
			|| !flag1 || !flag2 || !flag3)){
	alert("请填写正确信息");
	}else{
		$("#infoform").submit();
	}
}

</script>
</head>

<body class="page_uploadart" id="uploadart">

<jsp:include page="../top.jsp" />
<form id="infoform" action="product!putProduct" method="post">
<section id="content">
	<div class="container">
	<input type="hidden" name="id" value="<s:property value='product.product_id'/>" />
		<div class="row">
			<div class="grid_12">
            <h2><b>上架艺术品</b></h2>
			</div>

            <div class="grid_4">
                <a href="gallery.html" class="info" target="_blank"></a>
                <div class="images">
                  <img src="images/information_1-2.jpg" alt="">
                </div>
            </div>

            <div class="row">
      		<div class="grid_6 preffix_1">
    		<form class="uploadart">
    			<h4>名称</h4>
    			<input type="text" name="artname" readonly value="<s:property value='product.productname'/>" />
    			<br/>
                
      			<label style="margin-top: 15px; margin-bottom: 15px;">竞拍信息</label>
      			<br/>
                <label class="message">
                  <textarea name="proAction.introduce"></textarea>
                </label>
                
                <h4>起拍价</h4>
                <input type="text" id="startprice" name="proAction.startprice" onBlur="checkStartPrice(value)" />
               <br/>
                <input type="text" id="startpriceError" height="0px" value="" style="border:none; color:red;"  readonly />
               <br/>
                
                <h4>加价最小额度</h4>
                <input type="text" id="addprice" name="proAction.addprice" onBlur="checkAddPrice(value)" />
               <br/>
                <input type="text" id="addpriceError" height="0px" value="" style="border:none; color:red;"  readonly />
               <br/>
                
                <h4>持续时间（<=<s:property value="auth.lasttime"/>小时）</h4>
                <input type="text" id="timer" name="proAction.lasttime" onBlur="checktimer(value)" />
               <br/>
                <input type="text" id="timerError" height="0px" value="" style="border:none; color:red;" readonly />
               <br/>
                
                <div class="ta__right">
	                  <a href="javascript:submitit()" class="btn" id="submiter" data-type="submit" style="border-color:#87858a; border-width:thin; background:none;">send</a>
	            </div>
       		  </form>
      		</div>
			</div>

 

		</div>
	</div>
</section>
</form>
<!--==============================
              footer
=================================-->
<jsp:include page="../bottom.jsp" />
<a href="#" id="toTop" class="fa fa-chevron-up"></a>
</body>
</html>
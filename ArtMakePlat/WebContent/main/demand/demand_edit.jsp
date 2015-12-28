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
 $(window).load(function(){
  $().UItoTop({ easingType: 'easeOutQuart' });
 }); 

 $(document).ready(function(){
       $(".shuffle-me").shuffleImages({
         target: ".images > img"
       });
    });
function toSubmit(){
	if($("#price").val() == ""){
		alert("请输入价格");
		return;
	}else if($("#introduce").val() == ""){
		alert("请输入描述");
		return;
	}
    $('#infoform').submit();
}


</script>
</head>

<body class="page_uploadart" id="uploadart">

<jsp:include page="../top.jsp" />
<section id="content">
<form id="infoform" action="demand!uploadDemand" method="post">
	<div class="container">
	<s:if test="demand != null">
	<input type="hidden" id="id" name="id" value="<s:property value='demand.demand_id'/>"/>
	</s:if>
	<s:else>
	<input type="hidden" id="id" name="id" value="0"/>
	</s:else>
		<div class="row">
			<div class="grid_12">
			<s:if test="demand == null">
            <h2><b>上传需求</b></h2>
            </s:if>
            <s:else>
            <h2><b>编辑需求</b></h2>
            </s:else>
			</div>

            <div class="grid_4">
                <a href="gallery.html" class="info" target="_blank"></a>
                <div class="images">
                  <img src="images/information_1-2.jpg" alt="">
                </div>
            </div>

            <div class="row">
      		<div class="grid_6 preffix_1">
      	    	<label style="margin-top: 15px; margin-bottom: 15px;">价格</label>
      	    	<br/>
                <label class="message">
                <input type="text" id="price" name="price" value="<s:property value='demand.price'/>" />
                </label>
    			<br/>
      			<label style="margin-top: 15px; margin-bottom: 15px;">描述</label>
      			
      			<br/>
                <label class="message">
                  <textarea id="introduce" name="introduce" style="border-color:#87858a; border-width:thin; background:none; font-family:'Microsoft YaHei UI'"><s:property value='demand.introduce'/></textarea>
                </label>
                
              <label class="address" id="nkey">
                                     关键字
              <br>
               <select name="keys">
               <s:iterator value="keyList" id="row">
                <s:if test="#row.key_id != 1">
                <option value="<s:property value='#row.key_id'/>"><s:property value='#row.keyname'/></option>
                </s:if>
                 </s:iterator>
                </select>     
              <br>
              <br>
              </label>
                
                <div class="ta__right">
	                  <input type="reset" class="btn" data-type="reset" style="border-color:#87858a; border-width:thin; background:none;cursor:pointer" value="clear" />
	                  <a href="javascript:toSubmit()" class="btn" data-type="submit" style="border-color:#87858a; border-width:thin; background:none;">send</a>
	            </div>
      		</div>
			</div>
		</div>
	</div>
</form>
</section>

<!--==============================
              footer
=================================-->
<jsp:include page="../bottom.jsp" />
<a href="#" id="toTop" class="fa fa-chevron-up"></a>
</body>
</html>
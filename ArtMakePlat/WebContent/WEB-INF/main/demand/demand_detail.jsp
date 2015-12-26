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
	
function toSubmit(id){
	$("#infoform").attr("action","demand!createRecord").submit();
}

</script>
</head>

<body class="page_uploadart" id="uploadart">

<jsp:include page="../top.jsp" />
<form id="infoform" method="post">
<section id="content">
	<div class="container">
	<input type="hidden" name="id" value="<s:property value='demand.demand_id'/>" />
		<div class="row">
		<div class="grid_12">
					<h2>
						<a
							href="person!goInfo?id=<s:property value='demand.person.person_id'/>"><<
							返回</a>
					</h2>
				</div>
			<div class="grid_12">
            <h2><b>委任艺术家</b></h2>
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
    			<h4>价格</h4>
    			<input type="text" name="price" readonly value="<s:property value='demand.price'/>" />
    			<br/>
                
      			<label style="margin-top: 15px; margin-bottom: 15px;">竞拍信息</label>
      			<br/>
                <label class="message">
                  <s:property value="demand.introduce"/>
                </label>
                <br/><br/>
                <s:if test="demand.state == 1">
                <label style="margin-top: 15px; margin-bottom: 15px;">申请服务</label>
						
							<div class="ta__right">
								<input type="text" width="20%" id="message" name="message" />
								<a href="javascript:toSubmit()" class="btn" data-type="submit"
									style="border-color: #87858a; border-width: thin; background: none;">申请</a>
							</div>
						</s:if>		
				<s:else>	
				被委托人：<br>
				      <s:property value="order.person.account"/><br>
				      <s:property value="order.person.realname"/><br>
				      <s:property value="order.person.tel"/><br>
				委托人：<br>
		        	  <s:property value="demand.person.account"/><br>
				      <s:property value="demand.person.realname"/><br>
				      <s:property value="demand.person.tel"/>
				</s:else>
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
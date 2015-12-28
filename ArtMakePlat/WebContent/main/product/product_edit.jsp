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
	if($("#pname").val()==""){
		alert("请输入与商品名");
		return;
	}else if($("#mainfile").val() == ""){
		alert("请选择主图片");
		return;
	}
	if($("#id").val() == "")
    	$('#infoform').submit();
	else{
		$('#infoform').attr("action","product!editProduct").submit();
	}
}
function putProduct(id,price){
	$("#pid").val(id);
	$("#price").val(price);
	$("#infoform").attr("action","order!putproduct").submit();
}
</script>
</head>

<body class="page_uploadart" id="uploadart">

<jsp:include page="../top.jsp" />
<section id="content">
<form id="infoform" action="uploadProduct" method="post" enctype="multipart/form-data">
	<div class="container">
	<input type="hidden" id="id" name="id" value="<s:property value='product.product_id'/>"/>
	<input type="hidden" id="pid" name="pid"/>
	<input type="hidden" id="price" name="price"/>
		<div class="row">
			<div class="grid_12">
			<s:if test="product == null">
            <h2><b>上传艺术品</b></h2>
            </s:if>
            <s:else>
            <h2><b>编辑艺术品</b></h2>
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
    			<h4>名称</h4>
    			<input type="text" id="pname" name="pname" value="<s:property value='product.productname'/>"/>
    			<br/>

                <s:if test="product == null">
                <label class="picture"	style="border-color: #87858a; border-width: thin; background: none; height: 35px; font-family: 'Microsoft YaHei UI'">主图片:
				<br/>
				<input type="file" id="mainfile" name="mainfile"
					accept="image/jpeg,image/png,image/gif"></label> <br> <br>
                <label class="picture"	style="border-color: #87858a; border-width: thin; background: none; height: 35px; font-family: 'Microsoft YaHei UI'">副图片:
				<br/>
				<input type="file" id="file1" name="file1"
					accept="image/jpeg,image/png,image/gif"></label>
				<input type="file" id="file2" name="file2"
					accept="image/jpeg,image/png,image/gif"></label> <br> <br>
			    </s:if>
      			<label style="margin-top: 15px; margin-bottom: 15px;">详细信息</label>
      			
      			<br/>
                <label class="message">
                  <textarea id="introduce" name="introduce" style="border-color:#87858a; border-width:thin; background:none; font-family:'Microsoft YaHei UI'"><s:property value='product.introduce'/></textarea>
                </label>
                
                <div class="ta__right">
	                  <input type="reset" class="btn" data-type="reset" style="border-color:#87858a; border-width:thin; background:none;cursor:pointer" value="clear" />
	                  <a href="javascript:toSubmit()" class="btn" data-type="submit" style="border-color:#87858a; border-width:thin; background:none;">send</a>
	            </div>
      		</div>
      		<s:if test="product.state == 0">
      		<div class="grid_6 preffix_1">
      		<label style="margin-top: 15px; margin-bottom: 15px;">用户列表</label>
						<div class="grid_8">
							<table style="width: 100%;border:1px">
								<s:iterator value="product.recordList" id="row">
									<tr>
										<td><s:property value="#row.person.account" /></td>
										<td><s:property value="#row.person.realname" /></td>
										<td><s:property value="#row.price" /></td>
										<td><s:property value="#row.recordtime" /></td>
										<td><input type="button" style="cursor:pointer" onclick="putProduct('<s:property value="#row.person.person_id" />','<s:property value="#row.price" />')" value="成交"/></td>
									</tr>
								</s:iterator>
							</table>
						</div>
					<br/><br/>
      		</div>
      		</s:if>
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
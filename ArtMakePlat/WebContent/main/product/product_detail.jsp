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
<title>拍卖详情</title>
<script>
	$(window).load(function() {
		var endtime = "<s:property value='proAction.endtime'/>";
		$().UItoTop({
			easingType : 'easeOutQuart'
		});
		$("#endtime").html(endtime.substring(0, endtime.length - 4));
		<s:if test="product.state == 1">
		getDownTime();
		</s:if>
	});
	<s:if test="product.state == 1">
	var dtime = setInterval(getDownTime, 1000);
	var gprice = setInterval(getprice, 1000);
	</s:if>
	$(document).ready(function() {
		$(".shuffle-me").shuffleImages({
			target : ".images > img"
		});
	});

	function getDownTime() {
		var endtime = $("#endtime").html();
		if(endtime == ""){
			clearInterval(dtime);
			clearInterval(gprice);
			return;
		}
		var nowtime = getNow();
		var timeStr = dealTime(nowtime);
		endtime = dealTime(endtime);
		var downtime = downTime(endtime, timeStr, "已结束");
		if (downtime == "已结束") {
			clearInterval(dtime);
			clearInterval(gprice);
		}
		if (downtime == endtime) {
			$("#bendtime").css("display", "block");
		} else {
			$("#bendtime").css("display", "none");
			$("#bdowntime").css("display", "block");
			$("#downtime").html(downtime);
		}
	}

	function getprice() {
		$.ajax({
			type : "post",
			url : "getPriceAjax!getPrice",
			data : {//设置数据源
				id : $("#id").val()
			},
			dataType : "json",
			success : function(data) {
				data = JSON.parse(data);
				$("#nowprice").html(data.price);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("XMLHttpRequest=" + XMLHttpRequest);
				alert("textStatus=" + textStatus);
				alert("errorThrown=" + errorThrown);
				return false;
			}
		});
	}

	
	function toSureSubmit(){
		$("#infoform").attr("action", "product!createSureRecord").submit();
	}
	
	function toSubmit() {
		var endtime = $("#endtime").html();
		var nowtime = getNow();
		var timeStr = dealTime(nowtime);
		endtime = dealTime(endtime);
		var toprice = $("#price").val();
		var nowprice = $("#nowprice").html();
		var addprice = $("#addprice").html();
		if (toprice < parseFloat(addprice) + parseFloat(nowprice)) {
			alert("小于最小增额");
			return;
		} else if (timeStr > endtime) {
			alert("已过截止日期");
			return;
		} else {
			$("#infoform").attr("action", "product!createRecord").submit();
		}
	}
</script>
</head>

<body class="page_uploadart" id="uploadart">

	<jsp:include page="../top.jsp" />
<section id="content">
 <form id="infoform" method="post">
  <div class="ic">More Website Templates @ TemplateMonster.com - August11, 2014!</div>
  <div class="container">
    <input type="hidden" id="id" name="id"
				value="<s:property value='product.product_id'/>" />
    <div class="row">
      <div class="grid_12">
		<h2>
			<a href="person!goInfo?id=<s:property value='product.person.person_id'/>"><<
				返回ta
			</a>
		</h2>
	  </div>
      <div class="grid_6">
        <h2>艺术品详情</h2>
        <div class="blog">
          <div class="grid_6">
            <s:iterator value="product.imageList" id="row">
				<div class="grid_4" style="width: 50%;padding-bottom:20px">
					<div class="images" style="width: 100%; height: 180px">
						<img style="width: 100%; height: 100%"
							src="<s:property value='#request.IMGSRC'/>/<s:property value='#row.image'/>"
							alt="">
					</div>
				</div>
			</s:iterator>
          </div>
          <div class="text1 color1"><a href="#"><strong><s:property value='product.productname' /></strong></a></div>
          <p>
            <s:property value='product.introduce' />
          </p>
        </div>
      </div>
       <div class="grid_6">
          <form id="bidInformation">
          <div class="bidInformationLoader">
            <fieldset>
            <s:if test="product.state != 0">	
              <h2>拍卖信息</h2>
              <div>
                <div class="row">
                <div class="grid_2">
                <label>起拍价：</label>
                <label class="myLabel">                 
                  <s:property value='proAction.startprice' />
                </label>
                </div>
                <div class="grid_2">
                <label> 最小加价：</label>
                <label class="myLabel" id="addprice">
                  <s:property value='proAction.addprice' />
                </label>
                </div>
                </div>
                <br/>
                <div>
                <label>当前价格：</label>
                <label class="myLabel" id="nowprice">
                  <s:property value='product.price' />
                </label>
                </div>
                <br/>
                <div class="myLabel">
                <strong>
					<b style="display: none" id="bdowntime">倒计时:<label id="downtime"></label></b> 
					<b style="display: none" id="bendtime">截止日期:<label id="endtime"></label></b> 
					<b><label style="display: none" id="nowtime"></label></b>
				</strong>
				</div>   
			  </div>	
		    	</s:if>	  
					<s:if test="product.state == 1">
					<div class="grid_6" style="padding-top:10px">
					<hr>
						<label style="margin-top: 15px; margin-bottom: 15px;">竞拍信息</label>
							<table style="width: 100%;border:1px">
								<s:iterator value="proAction.recordList" id="row">
								<s:if test="#row.person.person_id == #session.person.person_id">
									<tr>
										<td><s:property value="#row.person.account" /></td>
										<td><s:property value="#row.person.realname" /></td>
										<td><s:property value="#row.price" /></td>
										<td><s:property value="#row.recordtime" /></td>
									</tr>
								</s:if>	
								</s:iterator>
							</table>
						<br/><br/>
							<div class="ta__right">
								<input type="text" width="20%" id="price" name="price" />元
							    <a href="javascript:toSubmit()" class="btn" data-type="submit"
									style="border-color: #87858a; border-width: thin; background: none;">出价</a>
							</div>
						</div>
						</s:if>
						<s:if test="product.state == 0">	
						<div class="grid_6" style="padding-top:10px">
					    <hr>
						<label style="margin-top: 15px; margin-bottom: 15px;"><h2>定价</h2></label>
						<label style="margin-top: 15px; margin-bottom: 15px;">我的出价信息</label>
							<table style="width: 100%;border:1px">
								<s:iterator value="product.recordList" id="row">
								<s:if test="#row.person.person_id == #session.person.person_id">
									<tr>
										<td><s:property value="#row.person.account" /></td>
										<td><s:property value="#row.person.realname" /></td>
										<td><s:property value="#row.price" /></td>
										<td><s:property value="#row.recordtime" /></td>
									</tr>
								</s:if>	
								</s:iterator>
							</table>
						<br/><br/>
							<div class="ta__right">
								<input type="text" width="20%" id="price" name="price" />
								 <a href="javascript:toSureSubmit()" class="btn" data-type="submit"
									style="border-color: #87858a; border-width: thin; background: none;">出价</a>
							</div>
						</div>
						</s:if>
              </div>
            </fieldset>
          </div>
          </form>
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
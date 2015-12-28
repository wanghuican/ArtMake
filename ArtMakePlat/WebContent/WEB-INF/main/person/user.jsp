<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
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
var flag;
	$(window).load(function() {
		flag = true;
		var content = "<s:property value='article.content'/>";
		$("#contenthtml").html(decodeHtml(content));
		goIngPage(0);
		goOIngPage(0);
		goDOIngPage(0);
		goNotIngPage(0);
		flag = false;
	});
	function goDemand(){
		<s:if test="#session.person.person_id == person.person_id">
	    	window.location.href = "demand!goEditDemand";
		</s:if>
		<s:else>
	    	 alert("您没有上传权限");
		</s:else>
	}
	function goProductDetail(id){
		window.location.href = "product!goEditProduct?id=" + id;
	}

	function goIngPage(d) {
		var pageing =  parseInt($("#pageing").html()) + d;
		var totaling = <s:property value="#request.PAGEINGTotal"/>;
		if (pageing == 0 && !flag) {
			alert('当前是第一页');
		} else if (pageing > totaling) {
			alert('当前是最后一页');
		} else {
			$.ajax({
				type : "post",
				url : "productJoinAjax!toProductJoinList",
				data : {//设置数据源
					PAGEING : pageing,
					id:<s:property value="person.person_id"/>
				},
				dataType : "json",
				success : function(data) {
					data = JSON.parse(data);
					$("#sizeing").val(data.size);
					page = data.page;
					src = data.imagesrc;
					rows = JSON.parse(data.rows).rows;
					for (var i = 0; i < rows.length; i++) {
						$("#editing" + i).attr("href","javascript:goProductDetail(" + rows[i].product_id + ")");
						$("#imageing" + i).attr("src",src + "/" + rows[i].image);
						$("#priceing" + i).html("当前最高价为" + rows[i].price + "元");
						$("#introducting" + i).html(rows[i].introduce);
						$("#pnameing" + i).html(rows[i].productname);
					}
					for(var i=rows.length;i<6;i++){
						$("#imageing" + i).attr("src","images/transparent.png");
						$("#introducting" + i).html("");
						$("#pnameing" + i).html("");
						$("#priceing" + i).html("");
					}
					$("#pageing").html(pageing);
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert("XMLHttpRequest=" + XMLHttpRequest);
					alert("textStatus=" + textStatus);
					alert("errorThrown=" + errorThrown);
					return false;
				}
			});
		}
	}
	
	function delOrder(id){
		var size = $("#sizeoing").val();
		var pageoing = parseInt($("#pageoing").html());
		$.ajax({
			type : "post",
			url : "delOrderAjax!delOrder",
			data : {//设置数据源
				id:id
			},
			dataType : "json",
			success : function(data) {
				flag = true;
				data = JSON.parse(data);
				alert(data.message);
				if(size%6 ==  1){
					if($("#pageoingtotal").val() != 1)
			    		$("#pageoingtotal").val($("#pageoingtotal").val()-1);
					if(pageoing != 1)
			        	goOIngPage(-1);
					else
						goOIngPage(0);
				}else{
					goOIngPage(0);
				}
				flag = false;
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("XMLHttpRequest=" + XMLHttpRequest);
				alert("textStatus=" + textStatus);
				alert("errorThrown=" + errorThrown);
				return false;
			}
		});
	}
	
	function delOrder2(id){
		var size = $("#sizedoing").val();
		var pageoing = parseInt($("#pagedoing").html());
		$.ajax({
			type : "post",
			url : "delOrderAjax!delOrder",
			data : {//设置数据源
				id:id
			},
			dataType : "json",
			success : function(data) {
				flag = true;
				data = JSON.parse(data);
				alert(data.message);
				if(size%6 ==  1){
					if($("#pagedoingtotal").val() != 1)
			    		$("#pagedoingtotal").val($("#pagedoingtotal").val()-1);
					if(pageoing != 1)
			        	goDOIngPage(-1);
					else
						goDOIngPage(0);
				}else{
					goDOIngPage(0);
				}
				flag = false;
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("XMLHttpRequest=" + XMLHttpRequest);
				alert("textStatus=" + textStatus);
				alert("errorThrown=" + errorThrown);
				return false;
			}
		});
	}
	
	function goPutDemand(id){
	    	window.location.href = "demand!goPutDemand?id="+id;
	}
	
	function goDemandDetail(id){
		window.location.href = "demand!goEditDemand?id=" + id;
	}
	
	function delDem(id){
		var size = $("#sizenoting").val();
		var pagenoting = parseInt($("#pagenoting").html());
		$.ajax({
			type : "post",
			url : "demandAjax!delDemand",
			data : {//设置数据源
				id:id
			},
			dataType : "json",
			success : function(data) {
				flag = true;
				data = JSON.parse(data);
				alert(data.message);
				if(size%5 ==  1){
					if($("#pagenotingtotal").val() != 1)
			    		$("#pagenotingtotal").val($("#pagenotingtotal").val()-1);
					if(pagenoting != 1)
			        	goNotIngPage(-1);
					else
						goNotIngPage(0);
				}else{
					goNotIngPage(0);
				}
				flag = false;
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("XMLHttpRequest=" + XMLHttpRequest);
				alert("textStatus=" + textStatus);
				alert("errorThrown=" + errorThrown);
				return false;
			}
		});
	}
	
	function goNotIngPage(d) {
		var pagenoting = parseInt($("#pagenoting").html()) + d;
		var totalnoting = $("#pagenotingtotal").val();
		if (pagenoting == 0 && !flag) {
			alert('当前是第一页');
		} else if (pagenoting > totalnoting) {
			alert('当前是最后一页');
		} else {
			$.ajax({
				type : "post",
				url : "demandAjax!toDemandIngList",
				data : {//设置数据源
					PAGENOTING : pagenoting,
					id:<s:property value="person.person_id"/>
				},
				dataType : "json",
				success : function(data) {
					data = JSON.parse(data);
					$("#sizenoting").val(data.size);
					page = data.page;
					src = data.imagesrc;
					rows = JSON.parse(data.rows).rows;
					for(var i=rows.length;i<5;i++){
						$("#delpro" + i).css("display","none");
						$("#introductning" + i).html("");
						$("#pricening" + i).html("");
						$("#uppro" + i).css("display","none");
						$("#state" + i).css("display","none");
					}
					for (var i = 0; i < rows.length; i++) {
						$("#editning" + i).attr("href","javascript:goDemandDetail(" + rows[i].demand_id + ")")
						$("#introductning" + i).html(rows[i].introduce);
						$("#pricening" + i).html(rows[i].price + "元");
						$("#delpro" + i).css("display","block");
						$("#delpro" + i).attr("href","javascript:delDem(" + rows[i].demand_id + ")");
						if(rows[i].state == 1){
							$("#uppro" + i).css("display","block");
							$("#uppro" + i).attr("href","javascript:goPutDemand("+rows[i].demand_id+")");
						}else{
							$("#uppro" + i).css("display","none");
						}
					}
					;
					$("#pagenoting").html(pagenoting);
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert("XMLHttpRequest=" + XMLHttpRequest);
					alert("textStatus=" + textStatus);
					alert("errorThrown=" + errorThrown);
					return false;
				}
			});
		}
	}
	
	function goOIngPage(d) {
		var pageing =  parseInt($("#pageoing").html()) + d;
		var totaling = $("#pageoingtotal").val();
		if (pageing == 0 && !flag) {
			alert('当前是第一页');
		} else if (pageing > totaling) {
			alert('当前是最后一页');
		} else {
			$.ajax({
				type : "post",
				url : "proorderAjax!toProOrderList",
				data : {//设置数据源
					PAGEOING : pageing,
					id:<s:property value="person.person_id"/>
				},
				dataType : "json",
				success : function(data) {
					data = JSON.parse(data);
					$("#sizeoing").val(data.size);
					page = data.page;
					src = data.imagesrc;
					rows = JSON.parse(data.rows).rows;
					orows = JSON.parse(data.orows).rows;
					for (var i = 0; i < rows.length; i++) {
						$("#imageoing" + i).attr("src",src + "/" + rows[i].image);
						$("#priceoing" + i).html("当前最高价为" + rows[i].price + "元");
						$("#introductoing" + i).html(rows[i].introduce);
						$("#pnameoing" + i).html(rows[i].productname);
						if(orows[i].state == 0){
							$("#deloing" + i).css("display","none");
							$("#payoing" + i).css("display","block");
							$("#payoing" + i).attr("href","order!payOrder?id="+orows[i].order_id);
						}else{
							$("#payoing" + i).css("display","none");
							$("#deloing" + i).css("display","block");
							$("#deloing" + i).attr("href","javascript:delOrder("+ orows[i].order_id +")");
						}
					}
					for(var i=rows.length;i<6;i++){
						$("#imageoing" + i).attr("src","images/transparent.png");
						$("#introductoing" + i).html("");
						$("#pnameoing" + i).html("");
						$("#priceoing" + i).html("");
						$("#payoing" + i).css("display","none");
						$("#deloing" + i).css("display","none");
					}
					$("#pageoing").html(pageing);
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert("XMLHttpRequest=" + XMLHttpRequest);
					alert("textStatus=" + textStatus);
					alert("errorThrown=" + errorThrown);
					return false;
				}
			});
		}
	}
	
	function goDOIngPage(d) {
		var pageing =  parseInt($("#pagedoing").html()) + d;
		var totaling = $("#pagedoingtotal").val();
		if (pageing == 0 && !flag) {
			alert('当前是第一页');
		} else if (pageing > totaling) {
			alert('当前是最后一页');
		} else {
			$.ajax({
				type : "post",
				url : "demandIngAjax!toDemIngOrderList",
				data : {//设置数据源
					PAGEDOING : pageing,
					id:<s:property value="person.person_id"/>
				},
				dataType : "json",
				success : function(data) {
					data = JSON.parse(data);
					$("#sizedoing").val(data.size);
					page = data.page;
					rows = JSON.parse(data.rows).rows;
					orows = JSON.parse(data.orows).rows;
					for (var i = 0; i < rows.length; i++) {
						$("#pricedoing" + i).html("当前价格为：" + rows[i].price + "元");
						$("#introductdoing" + i).html(rows[i].introduce);
						if(orows[i].state == 0){
							$("#editdoing" + i).attr("href","order!goDoingEditDemand?id="+orows[i].order_id);
							$("#deldoing" + i).css("display","none");
							$("#paydoing" + i).css("display","block");
							$("#paydoing" + i).attr("href","order!payOrder?id="+orows[i].order_id);
						}else{
							$("#editdoing" + i).attr("href","order!goDoingEditDemand?id="+orows[i].order_id);
							$("#paydoing" + i).css("display","none");
							$("#deldoing" + i).css("display","block");
							$("#deldoing" + i).attr("href","javascript:delOrder2("+ orows[i].order_id +")");
						}
					}
					for(var i=rows.length;i<6;i++){
						$("#introductdoing" + i).html("");
						$("#pricedoing" + i).html("");
						$("#paydoing" + i).css("display","none");
						$("#deldoing" + i).css("display","none");
					}
					$("#pagedoing").html(pageing);
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert("XMLHttpRequest=" + XMLHttpRequest);
					alert("textStatus=" + textStatus);
					alert("errorThrown=" + errorThrown);
					return false;
				}
			});
		}
	}
	
	function goshow() {
		$
				.ajax({
					type : "post",
					url : "accountAjax?checkAccount",
					data : {//设置数据源
						account : "<s:property value='person.account'/>"
					},
					dataType : "json",
					success : function(data) {
						data = JSON.parse(data);
						if (data.person_id == 0) {
							alert("不存在用户");
						} else {
							alert("信息为:"
									+ "\nrealname:"
									+ (data.realname == "null" ? ""
											: data.realname)
									+ "\nsex:"
									+ (data.sex == "null" ? "无" : data.sex)
									+ "\nemail:"
									+ (data.email == "null" ? "无" : data.email)
									+ "\ntel:"
									+ (data.tel == "null" ? "无" : data.tel)
									+ "\naddress:"
									+ (data.address == "null" ? "无"
											: data.address)
									+ "\nintroduce:"
									+ (data.introduce == "null" ? "无"
											: data.introduce));
						}
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert("XMLHttpRequest=" + XMLHttpRequest);
						alert("textStatus=" + textStatus);
						alert("errorThrown=" + errorThrown);
						return false;
					}
				});
	}
	function toIdentify() {
		$.ajax({
			type : "post",
			url : "changeIdentifyAjax?changeIdentify",
			data : {//设置数据源
				id : <s:property value="person.person_id"/>
			},
			dataType : "json",
			success : function(data) {
				data = eval('(' + data + ')');
				alert(data.message);
				if (data.state == 1) {
					$("#identify").html("Ing...取消认证 >>");
				} else {
					$("#identify").html("身份认证");
				}
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
	<section id="content" class="gallery">
	<input type="hidden" id="sizeing"/>
	<input type="hidden" id="sizeoing"/>
	<input type="hidden" id="sizedoing"/>
	<input type="hidden" id="sizenoting"/>
	<input type="hidden" id="pageoingtotal"  value="<s:property value='#request.PAGEOINGTotal'/>"/>
	<input type="hidden" id="pagedoingtotal"  value="<s:property value='#request.PAGEDOINGTotal'/>"/>
	<input type="hidden" id="pagenotingtotal"  value="<s:property value='#request.PAGENOTINGTotal'/>"/>
	<div class="ic">More Website Templates @ TemplateMonster.com -
		August11, 2014!</div>
	<div class="container">
		<div class="row">
			<div class="grid_12" align="center">
				<h2>个人信息</h2>
			</div>
			<div class="blog">
				<table>
					<tbody>
						<tr>
							<td>
						    	<div class="fa fa-user"></div> <s:if
									test="person.realname == ''">
									<s:property value="person.account" />
								</s:if> <s:else>
									<s:property value="person.realname" />
								</s:else>
							</td>
							<td>
							<s:if test="#session.person.person_id == person.person_id">
							<a href="person!goRepassword">
							<span class="fa fa-calendar"></span> 修改密码>>
							</a>
							</s:if>
							</td>
							<td><s:if
									test="#session.person.person_id == person.person_id">
									<a href="logout"><span class="fa fa-link"></span> Logout >></a>
								</s:if></td>
						</tr>
						<tr>
							<td><div class="fa fa-bookmark"></div> <s:property
									value="person.role.rolename" /></td>
							<td colspan="2"><s:if
									test="#session.person.person_id == person.person_id">
									<s:if test="person.state == 1">
										<a href="javascript:toIdentify()"><div class="fa fa-tag"></div>
											<label  style="cursor:pointer" id="identify">Ing...取消认证 >></label></a>
									</s:if>
									<s:else>
										<a href="javascript:toIdentify()"><div class="fa fa-tag" ></div>
											<label style="cursor:pointer" id="identify">身份认证 >></label></a>
									</s:else>
								</s:if></td>
						</tr>
						<tr>
							<td><div class="fa fa-comments"></div> 信息(5)</td>
							<td colspan="2"><s:if
									test="#session.person.person_id == person.person_id">
									<a href="person!goImprove"><div class="fa fa-eye"></div>
										修改信息 >> </a>
								</s:if> <s:else>
									<a href="javascript:goshow()"><div class="fa fa-eye"></div>
										查看信息 >> </a>
								</s:else>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="grid_12" align="center">
				<h2>参与拍卖</h2>
			</div>
			<div class="grid_4">
				<div class="box">
				<div id="diving0"  style="width:100%;height:200px;">
					<a id="editing0" href="" class="gall_item">			
					<img id="imageing0" style="width:100%;height:100%" src="images/transparent.png" alt="">
					</a>
				</div>	
					<div class="box_bot">
						<div id="pnameing0" class="box_bot_title"></div>
						<p id="introducting0"></p>
						<p id="priceing0"></p>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<div  id="diving1" style="width:100%;height:200px;">
					<a id="editing1" href="" class="gall_item">			
					<img id="imageing1" style="width:100%;height:100%" src="images/transparent.png" alt="">
					</a>
			    	</div>						
			    	<div class="box_bot">
						<div id="pnameing1" class="box_bot_title"></div>
						<p id="introducting1"></p>
						<p id="priceing1"></p>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<div id="diving2"  style="width:100%;height:200px;">
					<a id="editing2" href="" class="gall_item">			
					<img id="imageing2" style="width:100%;height:100%" src="images/transparent.png" alt="">
					</a>
			    	</div>	
					<div class="box_bot">
						<div id="pnameing2" class="box_bot_title"></div>
						<p id="introducting2"></p>
						<p id="priceing2"></p>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<div id="diving3"  style="width:100%;height:200px;">
					<a id="editing3" href="" class="gall_item">			
					<img id="imageing3" style="width:100%;height:100%" src="images/transparent.png" alt="">
					</a>
				</div>	
					<div class="box_bot">
						<div id="pnameing3" class="box_bot_title"></div>
						<p id="introducting3"></p>
						<p id="priceing3"></p>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<div id="diving4"  style="width:100%;height:200px;">
					<a id="editing4" href="" class="gall_item">			
					<img id="imageing4" style="width:100%;height:100%" src="images/transparent.png" alt="">
					</a>
			    	</div>	
					<div class="box_bot">
						<div id="pnameing4" class="box_bot_title"></div>
						<p id="introducting4"></p>
						<p id="priceing4"></p>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<div id="diving5"  style="width:100%;height:200px;">
					<a id="editing5" href="" class="gall_item">			
					<img id="imageing5" style="width:100%;height:100%" src="images/transparent.png" alt="">
					</a>
			    	</div>	
					<div class="box_bot">
						<div id="pnameing5" class="box_bot_title"></div>
						<p id="introducting5"></p>
						<p id="priceing5"></p>
					</div>
				</div>
			</div>
			<div class="grid_12" align="center" style="font-size: 20px">
				<a href="javascript:goIngPage(-1)">&lt;&lt;</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<label id="pageing">
				<s:property value="#request.PAGEING + 1"/></label> &nbsp;&nbsp;&nbsp;&nbsp;<a
					href="javascript:goIngPage(1)">&gt;&gt;</a>
			</div>
			
			<div class="grid_12" align="center">
				<h2>私人定制</h2>
			</div>
			<div class="grid_4">
				<div class="box">
			    	<div  id="" style="width:100%;height:200px;">
					<a style="width:100%;height:100%" href="javascript:goDemand()" class="gall_item"><img
						src="images/transparent.png" alt=""><span></span></a>
					</div>
					<div class="box_bot">
						<div class="box_bot_title">定制艺术品</div>
						<p>一些注意事项</p>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
				<div id="divnoting0"  style="width:100%;height:200px;">
					<a id="editning0" href="" style="width:100%;height:100%" class="gall_item"><img id="imagening0" src="images/transparent.png" alt=""></a>
				</div>
					<div class="box_bot">
						<div id="pricening0" class="box_bot_title"></div>
						<p id="introductning0"></p>
						<s:if test="#session.person.person_id == person.person_id">
						<a id="uppro0" href="#" class="btn" style="display:none">委任</a> 
						<a id="delpro0" href="#" class="btn" style="display:none">删除</a>
						</s:if>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<div id="divnoting1" style="width:100%;height:200px;">
					<a id="editning1" href="" style="width:100%;height:100%" class="gall_item"><img id="imagening1" src="images/transparent.png" alt=""></a>
			    	</div>
					<div class="box_bot">
						<div id="pricening1" class="box_bot_title"></div>
						<p id="introductning1"></p>
						<s:if test="#session.person.person_id == person.person_id">
						<a id="uppro1" href="#" class="btn" style="display:none">委任</a> 
						<a id="delpro1" href="#" class="btn" style="display:none">删除</a>
						</s:if>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<div id="divnoting2" style="width:100%;height:200px;">
					<a id="editning2" href="" style="width:100%;height:100%" class="gall_item"><img id="imagening2" src="images/transparent.png" alt=""></a>
			    	</div>
					<div class="box_bot">
						<div id="pricening2" class="box_bot_title"></div>
						<p id="introductning2"></p>
						<s:if test="#session.person.person_id == person.person_id">
						<a id="uppro2" href="#" class="btn" style="display:none">委任</a> 
						<a id="delpro2" href="#" class="btn" style="display:none">删除</a>
						</s:if>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<div id="divnoting3" style="width:100%;height:200px;">
					<a  id="editning3" href="" style="width:100%;height:100%" class="gall_item"><img id="imagening3" src="images/transparent.png" alt=""></a>
			    	</div>   
					<div class="box_bot">
						<div id="pricening3" class="box_bot_title"></div>
						<p id="introductning3"></p>
						<s:if test="#session.person.person_id == person.person_id">
						<a id="uppro3" href="#" class="btn" style="display:none">委任</a> 
						<a id="delpro3" href="#" class="btn" style="display:none">删除</a>
						</s:if>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<div id="divnoting4" style="width:100%;height:200px;">
					<a id="editning4" href="" style="width:100%;height:100%" class="gall_item"><img id="imagening4" src="images/transparent.png" alt=""></a>
				    </div>
					<div class="box_bot">
						<div id="pricening4" class="box_bot_title"></div>
						<p id="introductning4"></p>
						<s:if test="#session.person.person_id == person.person_id">
						<a id="uppro4" href="" class="btn" style="display:none">委任</a> 
						<a id="delpro4" href="" class="btn" style="display:none">删除</a>
						</s:if>
					</div>
				</div>
			</div>
			<div class="grid_12" align="center" style="font-size: 20px">
				<a href="javascript:goNotIngPage(-1)">&lt;&lt;</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<label id="pagenoting">
				<s:property value="#request.PAGENOTING + 1"/></label>&nbsp;&nbsp;&nbsp;&nbsp; <a
					href="javascript:goNotIngPage(1)">&gt;&gt;</a>
			</div>
			<div class="grid_12" align="center">
				<h2>拍得艺术品</h2>
			</div>
			<div class="grid_4">
				<div class="box">
				<div id="divoing0"  style="width:100%;height:200px;">
					<a id="editoing0" class="gall_item">			
					<img id="imageoing0" style="width:100%;height:100%" src="images/transparent.png" alt="">
					</a>
				</div>	
					<div class="box_bot">
						<div id="pnameoing0" class="box_bot_title"></div>
						<p id="introductoing0"></p>
						<p id="priceoing0"></p>
						<a href="#" id="payoing0" style="display:none" class="btn">支付</a>
						<a href="#" id="deloing0" style="display:none" class="btn">删除</a>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<div  id="divoing1" style="width:100%;height:200px;">
					<a id="editoing1" class="gall_item">			
					<img id="imageoing1" style="width:100%;height:100%" src="images/transparent.png" alt="">
					</a>
			    	</div>						
			    	<div class="box_bot">
						<div id="pnameoing1" class="box_bot_title"></div>
						<p id="introductoing1"></p>
						<p id="priceoing1"></p>
						<a href="#" id="payoing1" style="display:none" class="btn">支付</a>
						<a href="#" id="deloing1" style="display:none" class="btn">删除</a>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<div id="divoing2"  style="width:100%;height:200px;">
					<a id="editoing2" class="gall_item">			
					<img id="imageoing2" style="width:100%;height:100%" src="images/transparent.png" alt="">
					</a>
			    	</div>	
					<div class="box_bot">
						<div id="pnameoing2" class="box_bot_title"></div>
						<p id="introductoing2"></p>
						<p id="priceoing2"></p>
						<a href="#" id="payoing2" style="display:none" class="btn">支付</a>
						<a href="#" id="deloing2" style="display:none" class="btn">删除</a>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<div id="divoing3"  style="width:100%;height:200px;">
					<a id="editoing3" class="gall_item">			
					<img id="imageoing3" style="width:100%;height:100%" src="images/transparent.png" alt="">
					</a>
				</div>	
					<div class="box_bot">
						<div id="pnameoing3" class="box_bot_title"></div>
						<p id="introductoing3"></p>
						<p id="priceoing3"></p>
						<a href="#" id="payoing3" style="display:none" class="btn">支付</a>
						<a href="#" id="deloing3" style="display:none" class="btn">删除</a>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<div id="divoing4"  style="width:100%;height:200px;">
					<a id="editoing4" class="gall_item">			
					<img id="imageoing4" style="width:100%;height:100%" src="images/transparent.png" alt="">
					</a>
			    	</div>	
					<div class="box_bot">
						<div id="pnameoing4" class="box_bot_title"></div>
						<p id="introductoing4"></p>
						<p id="priceoing4"></p>
						<a href="#" id="payoing4" style="display:none" class="btn">支付</a>
						<a href="#" id="deloing4" style="display:none" class="btn">删除</a>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<div id="divoing5"  style="width:100%;height:200px;">
					<a id="editoing5" class="gall_item">			
					<img id="imageoing5" style="width:100%;height:100%" src="images/transparent.png" alt="">
					</a>
			    	</div>	
					<div class="box_bot">
						<div id="pnameoing5" class="box_bot_title"></div>
						<p id="introductoing5"></p>
						<p id="priceoing5"></p>
						<a href="#" id="payoing5" style="display:none" class="btn">支付</a>
						<a href="#" id="deloing5" style="display:none" class="btn">删除</a>
					</div>
				</div>
			</div>
			<div class="grid_12" align="center" style="font-size: 20px">
				<a href="javascript:goOIngPage(-1)">&lt;&lt;</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<label id="pageoing">
				<s:property value="#request.PAGEOING + 1"/></label> &nbsp;&nbsp;&nbsp;&nbsp;<a
					href="javascript:goOIngPage(1)">&gt;&gt;</a>
			</div>
			
			<div class="grid_12" align="center">
				<h2>正在定制</h2>
			</div>
			<div class="grid_4">
				<div class="box">
				<div id="divdoing0"  style="width:100%;height:200px;">
					<a id="editdoing0" class="gall_item">			
					<img id="imagedoing0" style="width:100%;height:100%" src="images/transparent.png" alt="">
					</a>
				</div>	
					<div class="box_bot">
						<div id="pnamedoing0" class="box_bot_title"></div>
						<p id="introductdoing0"></p>
						<p id="pricedoing0"></p>
						<p id="textdoing0"></p>
						<a href="#" id="paydoing0" style="display:none" class="btn">支付</a>
						<a href="#" id="deldoing0" style="display:none" class="btn">删除</a>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<div  id="divdoing1" style="width:100%;height:200px;">
					<a id="editdoing1" class="gall_item">			
					<img id="imagedoing1" style="width:100%;height:100%" src="images/transparent.png" alt="">
					</a>
			    	</div>						
			    	<div class="box_bot">
						<div id="pnamedoing1" class="box_bot_title"></div>
						<p id="introductdoing1"></p>
						<p id="pricedoing1"></p>
						<p id="textdoing1"></p>
						<a href="#" id="paydoing1" style="display:none" class="btn">支付</a>
						<a href="#" id="deldoing1" style="display:none" class="btn">删除</a>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<div id="divdoing2"  style="width:100%;height:200px;">
					<a id="editdoing2" class="gall_item">			
					<img id="imagedoing2" style="width:100%;height:100%" src="images/transparent.png" alt="">
					</a>
			    	</div>	
					<div class="box_bot">
						<div id="pnamedoing2" class="box_bot_title"></div>
						<p id="introductdoing2"></p>
						<p id="pricedoing2"></p>
						<p id="textdoing2"></p>
						<a href="#" id="paydoing2" style="display:none" class="btn">支付</a>
						<a href="#" id="deldoing2" style="display:none" class="btn">删除</a>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<div id="divdoing3"  style="width:100%;height:200px;">
					<a id="editdoing3" class="gall_item">			
					<img id="imagedoing3" style="width:100%;height:100%" src="images/transparent.png" alt="">
					</a>
				</div>	
					<div class="box_bot">
						<div id="pnamedoing3" class="box_bot_title"></div>
						<p id="introductdoing3"></p>
						<p id="pricedoing3"></p>
						<p id="textdoing3"></p>
						<a href="#" id="paydoing3" style="display:none" class="btn">支付</a>
						<a href="#" id="deldoing3" style="display:none" class="btn">删除</a>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<div id="divdoing4"  style="width:100%;height:200px;">
					<a id="editdoing4" class="gall_item">			
					<img id="imagedoing4" style="width:100%;height:100%" src="images/transparent.png" alt="">
					</a>
			    	</div>	
					<div class="box_bot">
						<div id="pnamedoing4" class="box_bot_title"></div>
						<p id="introductdoing4"></p>
						<p id="pricedoing4"></p>
						<p id="textdoing4"></p>
						<a href="#" id="paydoing4" style="display:none" class="btn">支付</a>
						<a href="#" id="deldoing4" style="display:none" class="btn">删除</a>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<div id="divdoing5"  style="width:100%;height:200px;">
					<a id="editdoing5" class="gall_item">			
					<img id="imagedoing5" style="width:100%;height:100%" src="images/transparent.png" alt="">
					</a>
			    	</div>	
					<div class="box_bot">
						<div id="pnamedoing5" class="box_bot_title"></div>
						<p id="introductdoing5"></p>
						<p id="pricedoing5"></p>
						<p id="textdoing5"></p>
						<a href="#" id="paydoing5" style="display:none" class="btn">支付</a>
						<a href="#" id="deldoing5" style="display:none" class="btn">删除</a>
					</div>
				</div>
			</div>
			<div class="grid_12" align="center" style="font-size: 20px">
				<a href="javascript:goDOIngPage(-1)">&lt;&lt;</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<label id="pagedoing">
				<s:property value="#request.PAGEDOING + 1"/></label> &nbsp;&nbsp;&nbsp;&nbsp;<a
					href="javascript:goDOIngPage(1)">&gt;&gt;</a>
			</div>
	</div>
	</section>
	<!--==============================
              footer
=================================-->
	<jsp:include page="../bottom.jsp" />

</body>
</html>
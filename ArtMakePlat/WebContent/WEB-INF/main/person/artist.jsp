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
		goNotIngPage(0);
		flag = false;
		
		 $("#msgbtn").fancybox({
		    	'href' : 'roleManage!goEdit',
		    	'width' : 733,
		        'height' : 530,
		        'type' : 'iframe',
		        'hideOnOverlayClick' : true,
		        'showCloseButton' : true,
		        'onClosed' : function() {	
		        	window.location.reload();
		        }
			<s:if test="#session.person.person_id == person.person_id">
			
			</s:if>
			<s:else>
			
			</s:else>
		 
		    });
		
	});
	
	function goUpProduct(){
		<s:if test="#session.person.person_id == person.person_id">
	    	window.location.href = "product!goEditProduct";
	    </s:if>
	    <s:else>
	      alert("您没有上传权限");
	    </s:else>
	}
	
	function goProductDetail(id){
		window.location.href = "product!goEditProduct?id=" + id;
	}
	
	function delPro(id){
		var size = $("#sizenoting").val();
		var pagenoting = parseInt($("#pagenoting").html());
		$.ajax({
			type : "post",
			url : "delProductAjax!delProduct",
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
				url : "productIngAjax!toProductIngList",
				data : {//设置数据源
					PAGEING : pageing,
					id:<s:property value="person.person_id"/>
				},
				dataType : "json",
				success : function(data) {
					data = JSON.parse(data);
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
				url : "productNotIngAjax!toProductNotIngList",
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
						$("#imagening" + i).attr("src","images/transparent.png");
						$("#introductning" + i).html("");
						$("#pnamening" + i).html("");
						$("#uppro" + i).css("display","none");
						$("#state" + i).css("display","none");
					}
					for (var i = 0; i < rows.length; i++) {
						$("#editning" + i).attr("href","javascript:goProductDetail(" + rows[i].product_id + ")")
						$("#imagening" + i).attr("src",src + "/" + rows[i].image);
						$("#introductning" + i).html(rows[i].introduce);
						$("#pnamening" + i).html(rows[i].productname);
						$("#delpro" + i).css("display","block");
						$("#delpro" + i).attr("href","javascript:delPro(" + rows[i].product_id + ")");
						if(rows[i].state == 0){
							$("#uppro" + i).css("display","block");
							$("#uppro" + i).attr("href","");
							$("#state" + i).css("display","none");
						}else{
							$("#state" + i).css("display","block");
							$("#state" + i).html("已售出："+rows[i].price + "元");
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

	
	function upAuth() {
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
					$("#upbtn").html("取消申请");
				} else {
					$("#upbtn").html("升级申请");
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
	<input type="hidden" id="sizenoting"/>
	<input type="hidden" id="pagenotingtotal" value="<s:property value='#request.PAGENOTINGTotal'/>"/>
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
							<td><div class="fa fa-user"></div> <s:if
									test="person.realname == ''">
									<s:property value="person.account" />
								</s:if> <s:else>
									<s:property value="person.realname" />
								</s:else></td>
							<td><s:if test="#session.person.person_id == person.person_id">
							<a href="person!goRepassword">
							<span class="fa fa-calendar"></span> 修改密码>>
							</a>
							</s:if></td>
							<td><s:if test="#session.person.person_id == person.person_id">
									<a href="logout"><span class="fa fa-link"></span> Logout >></a>
								</s:if></td>
						</tr>
						<tr>
							<td><div class="fa fa-bookmark"></div> <s:iterator
									value="person.keyList" id="row">
									<s:property value="#row.key.keyname" />&nbsp;&nbsp;&nbsp;
              </s:iterator></td>
							<td colspan="2">
								<div class="fa fa-tag"></div> <s:property
									value="person.role.rolename" /> <s:if
									test="#session.person.person_id == person.person_id">
									<s:if test="person.role.frolename != ''">
										<s:if test="person.state == 0">
                 &nbsp;&nbsp;<label style="cursor: pointer" id="upbtn"
												onclick="upAuth()">升级申请</label>
										</s:if>
										<s:else>
                &nbsp;&nbsp;<label style="cursor: pointer" id="upbtn"
												onclick="upAuth()">取消申请</label>
										</s:else>
									</s:if>
								</s:if>
							</td>
						</tr>
						<tr>
							<td><div class="fa fa-comments"></div> 
							<a id="#msgbtn">
							信息(5)
							</a>
							</td>
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
				<h2>正在拍卖</h2>
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
				<h2>私人艺术品</h2>
			</div>
			<div class="grid_4">
				<div class="box">
				<div id="divnoting" style="width:100%;height:200px;">
					<a style="width:100%;height:100%"  href="javascript:goUpProduct()" class="gall_item"><img
						src="images/transparent.png" alt=""><span></span></a>
				</div>		
					<div class="box_bot">
						<div class="box_bot_title">上传艺术品</div>
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
						<div id="pnamening0" class="box_bot_title"></div>
						<p id="introductning0"></p>
						<s:if test="#session.person.person_id == person.person_id">
						<a id="uppro0" href="#" class="btn" style="display:none">上架</a> 
						<a id="delpro0" href="#" class="btn" style="display:none">删除</a>
						</s:if>
						<label id="state0" style="display:none"></label>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<div id="divnoting1" style="width:100%;height:200px;">
					<a id="editning1" href="" style="width:100%;height:100%" class="gall_item"><img id="imagening1" src="images/transparent.png" alt=""></a>
			    	</div>
					<div class="box_bot">
						<div id="pnamening1" class="box_bot_title"></div>
						<p id="introductning1"></p>
						<s:if test="#session.person.person_id == person.person_id">
						<a id="uppro1" href="#" class="btn" style="display:none">上架</a> 
						<a id="delpro1" href="#" class="btn" style="display:none">删除</a>
						</s:if>
						<label id="state1" style="display:none"></label>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<div id="divnoting2" style="width:100%;height:200px;">
					<a id="editning2" href="" style="width:100%;height:100%" class="gall_item"><img id="imagening2" src="images/transparent.png" alt=""></a>
			    	</div>
					<div class="box_bot">
						<div id="pnamening2" class="box_bot_title"></div>
						<p id="introductning2"></p>
						<s:if test="#session.person.person_id == person.person_id">
						<a id="uppro2" href="#" class="btn" style="display:none">上架</a> 
						<a id="delpro2" href="#" class="btn" style="display:none">删除</a>
						</s:if>
						<label id="state2" style="display:none"></label>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<div id="divnoting3" style="width:100%;height:200px;">
					<a  id="editning3" href="" style="width:100%;height:100%" class="gall_item"><img id="imagening3" src="images/transparent.png" alt=""></a>
			    	</div>   
					<div class="box_bot">
						<div id="pnamening3" class="box_bot_title"></div>
						<p id="introductning3"></p>
						<s:if test="#session.person.person_id == person.person_id">
						<a id="uppro3" href="#" class="btn" style="display:none">上架</a> 
						<a id="delpro3" href="#" class="btn" style="display:none">删除</a>
						</s:if>
						<label id="state3" style="display:none"></label>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<div id="divnoting4" style="width:100%;height:200px;">
					<a id="editning4" href="" style="width:100%;height:100%" class="gall_item"><img id="imagening4" src="images/transparent.png" alt=""></a>
				    </div>
					<div class="box_bot">
						<div id="pnamening4" class="box_bot_title"></div>
						<p id="introductning4"></p>
						<s:if test="#session.person.person_id == person.person_id">
						<a id="uppro4" href="" class="btn" style="display:none">上架</a> 
						<a id="delpro4" href="" class="btn" style="display:none">删除</a>
						</s:if>
						<label id="state4" style="display:none"></label>
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
				<h2>定制服务</h2>
			</div>
			<div class="grid_4">
				<div class="box">
					<a href="" class="gall_item"><img
						src="images/transparent.png" alt=""></a>
					<div class="box_bot">
						<div class="box_bot_title">定制艺术品</div>
						<a href="#" class="btn">联系用户</a> <a href="#" class="btn">终止</a>
						<p>一些注意事项</p>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<a href="images/big2.jpg" class="gall_item"><img
						src="images/page3_img2.jpg" alt=""></a>
					<div class="box_bot">
						<div class="box_bot_title">定制艺术品1</div>
						<p>Dorem ipsum dolor sit amet, consectetur adipiscing elit. In
							mollis erat mattis neque facilisis, sit amet ultricies erat
							rutrum. Cras facilisis, nulla vel viverra auctor, leo magna
							sodales felis, quis malesuada nibh odio ut velit</p>
						<a href="#" class="btn">联系用户</a> <a href="#" class="btn">终止</a>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<a href="images/big3.jpg" class="gall_item"><img
						src="images/page3_img3.jpg" alt=""></a>
					<div class="box_bot">
						<div class="box_bot_title">定制艺术品2</div>
						<p>Dorem ipsum dolor sit amet, consectetur adipiscing elit. In
							mollis erat mattis neque facilisis, sit amet ultricies erat
							rutrum. Cras facilisis, nulla vel viverra auctor, leo magna
							sodales felis, quis malesuada nibh odio ut velit</p>
						<a href="#" class="btn">联系用户</a> <a href="#" class="btn">终止</a>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<a href="images/big4.jpg" class="gall_item"><img
						src="images/page3_img4.jpg" alt=""></a>
					<div class="box_bot">
						<div class="box_bot_title">定制艺术品3</div>
						<p>Dorem ipsum dolor sit amet, consectetur adipiscing elit. In
							mollis erat mattis neque facilisis, sit amet ultricies erat
							rutrum. Cras facilisis, nulla vel viverra auctor, leo magna
							sodales felis, quis malesuada nibh odio ut velit</p>
						<a href="#" class="btn">联系用户</a> <a href="#" class="btn">终止</a>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<a href="images/big5.jpg" class="gall_item"><img
						src="images/page3_img5.jpg" alt=""></a>
					<div class="box_bot">
						<div class="box_bot_title">定制艺术品4</div>
						<p>Dorem ipsum dolor sit amet, consectetur adipiscing elit. In
							mollis erat mattis neque facilisis, sit amet ultricies erat
							rutrum. Cras facilisis, nulla vel viverra auctor, leo magna
							sodales felis, quis malesuada nibh odio ut velit</p>
						<a href="#" class="btn">联系用户</a> <a href="#" class="btn">终止</a>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<a href="images/big6.jpg" class="gall_item"><img
						src="images/page3_img6.jpg" alt=""></a>
					<div class="box_bot">
						<div class="box_bot_title">定制艺术品5</div>
						<p>Dorem ipsum dolor sit amet, consectetur adipiscing elit. In
							mollis erat mattis neque facilisis, sit amet ultricies erat
							rutrum. Cras facilisis, nulla vel viverra auctor, leo magna
							sodales felis, quis malesuada nibh odio ut velit</p>
						<a href="#" class="btn">联系用户</a> <a href="#" class="btn">终止</a>
					</div>
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
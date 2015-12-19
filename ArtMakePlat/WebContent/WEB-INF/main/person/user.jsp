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
	$(window).load(function() {
		getDate01();
		var content = "<s:property value='article.content'/>";
		$("#contenthtml").html(decodeHtml(content));
	});
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

	/**获得当前日期**/
	function getDate01() {
		var time = new Date();
		var myYear = time.getFullYear();
		var myMonth = time.getMonth() + 1;
		var myDay = time.getDate();
		if (myMonth < 10) {
			myMonth = "0" + myMonth;
		}
		document.getElementById("day_day").innerHTML = myYear + "." + myMonth
				+ "." + myDay;
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
							<td><span class="fa fa-calendar"></span> <span id="day_day"></span>
							</td>
							<td><div class="fa fa-user"></div> <s:if
									test="person.realname == ''">
									<s:property value="person.account" />
								</s:if> <s:else>
									<s:property value="person.realname" />
								</s:else></td>
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
					<a href="images/big1.jpg" class="gall_item"><img
						src="images/page3_img1.jpg" alt=""></a>
					<div class="box_bot">
						<div class="box_bot_title">拍卖艺术品1</div>
						<p>Dorem ipsum dolor sit amet, consectetur adipiscing elit. In
							mollis erat mattis neque facilisis, sit amet ultricies erat
							rutrum. Cras facilisis, nulla vel viverra auctor, leo magna
							sodales felis, quis malesuada nibh odio ut velit</p>
						<a href="#" class="btn">加价</a>
						<p>当前竞拍最高价为:1000元</p>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<a href="images/big2.jpg" class="gall_item"><img
						src="images/page3_img2.jpg" alt=""></a>
					<div class="box_bot">
						<div class="box_bot_title">拍卖艺术品2</div>
						<p>Dorem ipsum dolor sit amet, consectetur adipiscing elit. In
							mollis erat mattis neque facilisis, sit amet ultricies erat
							rutrum. Cras facilisis, nulla vel viverra auctor, leo magna
							sodales felis, quis malesuada nibh odio ut velit</p>
						<a href="#" class="btn">加价</a>
						<p>当前竞拍最高价为:1000元</p>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<a href="images/big3.jpg" class="gall_item"><img
						src="images/page3_img3.jpg" alt=""></a>
					<div class="box_bot">
						<div class="box_bot_title">拍卖艺术品3</div>
						<p>Dorem ipsum dolor sit amet, consectetur adipiscing elit. In
							mollis erat mattis neque facilisis, sit amet ultricies erat
							rutrum. Cras facilisis, nulla vel viverra auctor, leo magna
							sodales felis, quis malesuada nibh odio ut velit</p>
						<a href="#" class="btn">加价</a>
						<p>当前竞拍最高价为:1000元</p>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<a href="images/big4.jpg" class="gall_item"><img
						src="images/page3_img4.jpg" alt=""></a>
					<div class="box_bot">
						<div class="box_bot_title">拍卖艺术品4</div>
						<p>Dorem ipsum dolor sit amet, consectetur adipiscing elit. In
							mollis erat mattis neque facilisis, sit amet ultricies erat
							rutrum. Cras facilisis, nulla vel viverra auctor, leo magna
							sodales felis, quis malesuada nibh odio ut velit</p>
						<a href="#" class="btn">加价</a>
						<p>当前竞拍最高价为:1000元</p>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<a href="images/big5.jpg" class="gall_item"><img
						src="images/page3_img5.jpg" alt=""></a>
					<div class="box_bot">
						<div class="box_bot_title">拍卖艺术品5</div>
						<p>Dorem ipsum dolor sit amet, consectetur adipiscing elit. In
							mollis erat mattis neque facilisis, sit amet ultricies erat
							rutrum. Cras facilisis, nulla vel viverra auctor, leo magna
							sodales felis, quis malesuada nibh odio ut velit</p>
						<a href="#" class="btn">加价</a>
						<p>当前竞拍最高价为:1000元</p>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<a href="images/big6.jpg" class="gall_item"><img
						src="images/page3_img6.jpg" alt=""></a>
					<div class="box_bot">
						<div class="box_bot_title">拍卖艺术品6</div>
						<p>Dorem ipsum dolor sit amet, consectetur adipiscing elit. In
							mollis erat mattis neque facilisis, sit amet ultricies erat
							rutrum. Cras facilisis, nulla vel viverra auctor, leo magna
							sodales felis, quis malesuada nibh odio ut velit</p>
						<a href="#" class="btn">加价</a>
						<p>当前竞拍最高价为:1000元</p>
					</div>
				</div>
			</div>
			<div align="center" style="font-size: 20px">
				&lt;&lt;&nbsp;&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt;</div>

			<div class="grid_12" align="center">
				<h2>私人定制</h2>
			</div>
			<div class="grid_4">
				<div class="box">
					<a href="定制.html" class="gall_item"><img
						src="images/transparent.png" alt=""><span></span></a>
					<div class="box_bot">
						<div class="box_bot_title">定制艺术品</div>
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
						<a href="#" class="btn">修改</a> <a href="#" class="btn">删除</a>
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
						<a href="#" class="btn">修改</a> <a href="#" class="btn">删除</a>
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
						<a href="#" class="btn">修改</a> <a href="#" class="btn">删除</a>
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
						<a href="#" class="btn">修改</a> <a href="#" class="btn">删除</a>
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
						<a href="#" class="btn">修改</a> <a href="#" class="btn">删除</a>
					</div>
				</div>
			</div>
			<div align="center" style="font-size: 20px">
				&lt;&lt;&nbsp;&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt;</div>

			<div class="grid_12" align="center">
				<h2>拍得艺术品</h2>
			</div>
			<div class="grid_4">
				<div class="box">
					<a href="images/big1.jpg" class="gall_item"><img
						src="images/page3_img1.jpg" alt=""></a>
					<div class="box_bot">
						<div class="box_bot_title">艺术品1</div>
						<p>Dorem ipsum dolor sit amet, consectetur adipiscing elit. In
							mollis erat mattis neque facilisis, sit amet ultricies erat
							rutrum. Cras facilisis, nulla vel viverra auctor, leo magna
							sodales felis, quis malesuada nibh odio ut velit</p>
						<a href="#" class="btn">支付</a>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<a href="images/big2.jpg" class="gall_item"><img
						src="images/page3_img2.jpg" alt=""></a>
					<div class="box_bot">
						<div class="box_bot_title">艺术品2</div>
						<p>Dorem ipsum dolor sit amet, consectetur adipiscing elit. In
							mollis erat mattis neque facilisis, sit amet ultricies erat
							rutrum. Cras facilisis, nulla vel viverra auctor, leo magna
							sodales felis, quis malesuada nibh odio ut velit</p>
						<a href="#" class="btn">支付</a>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<a href="images/big3.jpg" class="gall_item"><img
						src="images/page3_img3.jpg" alt=""></a>
					<div class="box_bot">
						<div class="box_bot_title">艺术品3</div>
						<p>Dorem ipsum dolor sit amet, consectetur adipiscing elit. In
							mollis erat mattis neque facilisis, sit amet ultricies erat
							rutrum. Cras facilisis, nulla vel viverra auctor, leo magna
							sodales felis, quis malesuada nibh odio ut velit</p>
						<a href="#" class="btn">支付</a>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<a href="images/big4.jpg" class="gall_item"><img
						src="images/page3_img4.jpg" alt=""></a>
					<div class="box_bot">
						<div class="box_bot_title">艺术品4</div>
						<p>Dorem ipsum dolor sit amet, consectetur adipiscing elit. In
							mollis erat mattis neque facilisis, sit amet ultricies erat
							rutrum. Cras facilisis, nulla vel viverra auctor, leo magna
							sodales felis, quis malesuada nibh odio ut velit</p>
						<a href="#" class="btn">支付</a>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<a href="images/big5.jpg" class="gall_item"><img
						src="images/page3_img5.jpg" alt=""></a>
					<div class="box_bot">
						<div class="box_bot_title">艺术品5</div>
						<p>Dorem ipsum dolor sit amet, consectetur adipiscing elit. In
							mollis erat mattis neque facilisis, sit amet ultricies erat
							rutrum. Cras facilisis, nulla vel viverra auctor, leo magna
							sodales felis, quis malesuada nibh odio ut velit</p>
						<a href="#" class="btn">支付</a>
					</div>
				</div>
			</div>
			<div class="grid_4">
				<div class="box">
					<a href="images/big6.jpg" class="gall_item"><img
						src="images/page3_img6.jpg" alt=""></a>
					<div class="box_bot">
						<div class="box_bot_title">艺术品6</div>
						<p>Dorem ipsum dolor sit amet, consectetur adipiscing elit. In
							mollis erat mattis neque facilisis, sit amet ultricies erat
							rutrum. Cras facilisis, nulla vel viverra auctor, leo magna
							sodales felis, quis malesuada nibh odio ut velit</p>
						<a href="#" class="btn">支付</a>
					</div>
				</div>
			</div>
			<div align="center" style="font-size: 20px">
				&lt;&lt;&nbsp;&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt;</div>

			<div class="grid_12" align="center">
				<h2>正在定制</h2>
			</div>
			<div class="grid_4">
				<div class="box">
					<a href="images/big1.jpg" class="gall_item"><img
						src="images/page3_img1.jpg" alt=""></a>
					<div class="box_bot">
						<div class="box_bot_title">定制艺术品</div>
						<a href="#" class="btn">联系艺术家</a> <a href="#" class="btn">终止</a>
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
						<a href="#" class="btn">联系艺术家</a> <a href="#" class="btn">终止</a>
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
						<a href="#" class="btn">联系艺术家</a> <a href="#" class="btn">终止</a>
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
						<a href="#" class="btn">联系艺术家</a> <a href="#" class="btn">终止</a>
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
						<a href="#" class="btn">联系艺术家</a> <a href="#" class="btn">终止</a>
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
						<a href="#" class="btn">联系艺术家</a> <a href="#" class="btn">终止</a>
					</div>
				</div>
			</div>
			<div align="center" style="font-size: 20px">
				&lt;&lt;&nbsp;&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt;</div>
		</div>
	</div>
	</section>
	<!--==============================
              footer
=================================-->
	<jsp:include page="../bottom.jsp" />

</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/style.css">

<script type="text/javascript" charset="utf-8"
	src="js/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="js/ueditor.all.min.js">
	
</script>
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
<script language="javascript">
	if ("<s:actionmessage/>" != "")
		alert("<s:actionmessage/>");
</script>
<script type="text/javascript">
	var num = 1;
	var flag = false;
	$(window).load(function() {
		$().UItoTop({
			easingType : 'easeOutQuart'
		});
		$('#stuck_container').tmStickUp({});
	});

	$(document)
			.ready(
					function() {
						$(".shuffle-me").shuffleImages({
							target : ".images > img"
						});
						$("#check").click(function(){
							$.ajax({
						        type: "post",
						        url: "accountAjax?checkAccount",
						        data:{//设置数据源
						        	account:$("#account").val()
						        },
						        dataType: "json",
						        success: function(data){
						        	data = JSON.parse(data);
						        	if(data.person_id == 0){
						        		alert("不存在用户");
						        	}else{
						        		if(confirm("检测完毕，用户存在，信息为:" +
						        				"\nrealname:"+ data.realname+
						        				"\nsex:" + data.sex +
						        				"\nemail:" + data.email + 
						        				"\ntel:" + data.tel + 
						        				"\naddress:" + data.address +
						        				"\n请确认是否正确？")){
						        			$("#account").attr("readonly","true");
						        		    flag = true;	
						        		}
						        	}
						        },
						        error: function(XMLHttpRequest, textStatus, errorThrown){
				                alert("XMLHttpRequest=" + XMLHttpRequest);
				                alert("textStatus=" + textStatus);
				                alert("errorThrown=" + errorThrown);
				                return false;
				          }
						 });	
						});
						$("#addInfo")
								.click(
										function() {
											$("#delInfo").css("display",
													"block");
											num++;
											$("#times")
													.append(
															"<input type='date' id='time" + num + "' name='time' placeholder='时间：' value='' data-constraints='' style='border-color: #87858a; border-width: thin; background: none; height: 35px; font-family: 'Microsoft YaHei UI'' /> ");
											if (num == 5)
												$("#addInfo").css("display",
														"none");
										})
						$("#delInfo").click(function() {
							$("#addInfo").css("display", "block");
							var node = document.getElementById("time" + num);
							document.getElementById("times").removeChild(node);
							num--;
							if (num == 1)
								$("#delInfo").css("display", "none");
						})

						$("#info").click(
								function() {
									if(!flag && $("#column_id").val() == "small"){
										alert("小栏位的申请人未验证或验证未通过");
										return;
									}
									if ($("#title").val() == "") {
										alert("标题未填写");
										return;
									}
									$("#content2")
											.val(
													UE.getEditor('editor')
															.getContent());
									if ($("#content2").val() == "") {
										alert("内容未填写");
										return;
									}
									if ($("#file").val() == "") {
										alert("请选择文件");
										return;
									}
									if ($("#time1").val() == "") {
										alert("请选择时间");
										return;
									}
									if($("#column_id").val() == ""){
										alert("请选择栏位");
									}
									
									$("#contact-form").attr("action",
											"uploadArticle!executeAd");
									$("#contact-form").submit();
								})
					});
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

<body class="page1" id="top">
	<jsp:include page="../top.jsp" />
	<!--=====================
          Content
======================-->
	<section id="content">
	<div class="ic">More Website Templates @ TemplateMonster.com -
		August11, 2014!</div>
	<div class="container">
		<div class="row">
			<div class="grid_12">
				<h2>广告编辑</h2>
				<form id="contact-form" method="post" enctype="multipart/form-data">
					<div class="contact-form-loader"></div>
					<fieldset>
						<label class="title">标题： <input type="text" id="title"
							name="title" placeholder="标题:" value="" data-constraints=""
							style="border-color: #87858a; border-width: thin; background: none; height: 35px; width: 400px; font-family: 'Microsoft YaHei UI'" />

						</label> <br> <br> <label class="title">
							<table>
								<tr>
									<td>日期：</td>
									<td><img id="delInfo" alt="减少"
										style="cursor: pointer; height: 10%; display: none"
										src="images/add.png" /></td>
									<td>&nbsp; <span id="times"> <input type="date"
											id="time1" name="time" placeholder="时间：" value=""
											data-constraints=""
											style="border-color: #87858a; border-width: thin; background: none; height: 35px; font-family: 'Microsoft YaHei UI'" />
									</span> &nbsp;
									</td>
									<td><img id="addInfo" alt="添加"
										style="cursor: pointer; height: 10%;" src="images/add.png" />
									</td>
								</tr>
							</table>
						</label> <br> <br> <label class="picture"
							style="border-color: #87858a; border-width: thin; background: none; height: 35px; font-family: 'Microsoft YaHei UI'">图片:
						 <input type="file" id="file" name="file"
							accept="image/jpeg,image/png,image/gif"></label> <br> <br>
						<label class="title">栏位:
						<select name="column_id" id="column_id" 
						style="border-color: #87858a; border-width: thin; background: none; height: 35px; width: 400px; font-family: 'Microsoft YaHei UI'" >
                                <option value=""
                                >--请选择--</option>
                                <option value="big">big</option>
                                <option value="small">small</option>
                         </select>
                        </label>
                        <br> <br>
                        <label class="title">申请人： <input type="text" id="account"
							name="account" placeholder="申请人:" value="" data-constraints=""
							style="border-color: #87858a; border-width: thin; background: none; height: 35px; width: 400px; font-family: 'Microsoft YaHei UI'" />
                         <input type="button" id="check" value="检测"
							style="border-color: #87858a; border-width: thin; background: none; height: 35px; width: 3%; font-family: 'Microsoft YaHei UI'" />
                         </label>
                         <br> <br>
						<div>
							<script id="editor" type="text/plain"
								style="width:1024px;height:500px;"></script>
							<input type="hidden" id="content2" name="content" />
							<!-- UE.getEditor('editor').getContent() -->
						</div>
						<br> <input type="button" id="info" value="提交"
							style="border-color: #87858a; border-width: thin; background: none; height: 35px; width: 100%; font-family: 'Microsoft YaHei UI'" />
						<div id="btns">
							<div>
								<button onclick="getAllHtml()" style="display: none">获得整个html的内容</button>
								<button onclick="getContent()" style="display: none">获得内容</button>
								<button onclick="setContent()" style="display: none">写入内容</button>
								<button onclick="setContent(true)" style="display: none">追加内容</button>
								<button onclick="getContentTxt()" style="display: none">获得纯文本</button>
								<button onclick="getPlainTxt()" style="display: none">获得带格式的纯文本</button>
								<button onclick="hasContent()" style="display: none">判断是否有内容</button>
								<button onclick="setFocus()" style="display: none">使编辑器获得焦点</button>
								<button onmousedown="isFocus(event)" style="display: none">编辑器是否获得焦点</button>
								<button onmousedown="setblur(event)" style="display: none">编辑器失去焦点</button>

							</div>
							<div>
								<button onclick="getText()" style="display: none">获得当前选中的文本</button>
								<button onclick="insertHtml()" style="display: none">插入给定的内容</button>
								<button id="enable" onclick="setEnabled()" style="display: none">可以编辑</button>
								<button onclick="setDisabled()" style="display: none">不可编辑</button>
								<button onclick=" UE.getEditor('editor').setHide()"
									style="display: none">隐藏编辑器</button>
								<button onclick=" UE.getEditor('editor').setShow()"
									style="display: none">显示编辑器</button>
								<button onclick=" UE.getEditor('editor').setHeight(300)"
									style="display: none">设置高度为300默认关闭了自动长高</button>
							</div>

							<div>
								<button onclick="getLocalData()" style="display: none">获取草稿箱内容</button>
								<button onclick="clearLocalData()" style="display: none">清空草稿箱</button>
							</div>

						</div>
						<div>
							<button onclick="createEditor()" style="display: none">
								创建编辑器</button>
							<button onclick="deleteEditor()" style="display: none">
								删除编辑器</button>
						</div>

						<script type="text/javascript">
							//实例化编辑器
							//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
							var ue = UE.getEditor('editor');

							function isFocus(e) {
								alert(UE.getEditor('editor').isFocus());
								UE.dom.domUtils.preventDefault(e)
							}
							function setblur(e) {
								UE.getEditor('editor').blur();
								UE.dom.domUtils.preventDefault(e)
							}
							function insertHtml() {
								var value = prompt('插入html代码', '');
								UE.getEditor('editor').execCommand(
										'insertHtml', value)
							}
							function createEditor() {
								enableBtn();
								UE.getEditor('editor');
							}
							function getAllHtml() {
								alert(UE.getEditor('editor').getAllHtml())
							}
							function getContent() {
								var arr = [];
								arr.push("使用editor.getContent()方法可以获得编辑器的内容");
								arr.push("内容为：");
								arr.push(UE.getEditor('editor').getContent());
								alert(arr.join("\n"));
							}
							function getPlainTxt() {
								var arr = [];
								arr
										.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
								arr.push("内容为：");
								arr.push(UE.getEditor('editor').getPlainTxt());
								alert(arr.join('\n'))
							}
							function setContent(isAppendTo) {
								var arr = [];
								arr
										.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
								UE.getEditor('editor').setContent(
										'欢迎使用ueditor', isAppendTo);
								alert(arr.join("\n"));
							}
							function setDisabled() {
								UE.getEditor('editor')
										.setDisabled('fullscreen');
								disableBtn("enable");
							}

							function setEnabled() {
								UE.getEditor('editor').setEnabled();
								enableBtn();
							}

							function getText() {
								//当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
								var range = UE.getEditor('editor').selection
										.getRange();
								range.select();
								var txt = UE.getEditor('editor').selection
										.getText();
								alert(txt)
							}

							function getContentTxt() {
								var arr = [];
								arr
										.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
								arr.push("编辑器的纯文本内容为：");
								arr
										.push(UE.getEditor('editor')
												.getContentTxt());
								alert(arr.join("\n"));
							}
							function hasContent() {
								var arr = [];
								arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
								arr.push("判断结果为：");
								arr.push(UE.getEditor('editor').hasContents());
								alert(arr.join("\n"));
							}
							function setFocus() {
								UE.getEditor('editor').focus();
							}
							function deleteEditor() {
								disableBtn();
								UE.getEditor('editor').destroy();
							}
							function disableBtn(str) {
								var div = document.getElementById('btns');
								var btns = UE.dom.domUtils
										.getElementsByTagName(div, "button");
								for (var i = 0, btn; btn = btns[i++];) {
									if (btn.id == str) {
										UE.dom.domUtils.removeAttributes(btn,
												[ "disabled" ]);
									} else {
										btn.setAttribute("disabled", "true");
									}
								}
							}
							function enableBtn() {
								var div = document.getElementById('btns');
								var btns = UE.dom.domUtils
										.getElementsByTagName(div, "button");
								for (var i = 0, btn; btn = btns[i++];) {
									UE.dom.domUtils.removeAttributes(btn,
											[ "disabled" ]);
								}
							}

							function getLocalData() {
								alert(UE.getEditor('editor').execCommand(
										"getlocaldata"));
							}

							function clearLocalData() {
								UE.getEditor('editor').execCommand(
										"clearlocaldata");
								alert("已清空草稿箱")
							}
						</script>
					</fieldset>
				</form>

			</div>
		</div>
	</div>

	</section>
	<!--==============================
              footer
=================================-->
	<jsp:include page="../bottom.jsp" />
	<a href="#" id="toTop" class="fa fa-chevron-up"></a>
</body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/touchTouch.css">
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
<title>商城</title>
<script>
 $(window).load(function(){
  $().UItoTop({ easingType: 'easeOutQuart' });
  $('#stuck_container').tmStickUp({}); 
    getProduct();
 }); 

	function goProductDetail(id){
		window.location.href = "product!goEditProduct?id=" + id;
	}
	
	function goPerson(id){
		window.location.href = "person!goInfo?id=" + id;
	}
	
 function changeKey(id){
	 $("#selectkey").val(id);
	 $("#keyname").html($("#key"+id).html());
	 getProduct();
 }
 
 function changeState(state){
	 $("#selectstate").val(state);
	 if(state == 2){
		 $("#statename").val("全部")
	 }else if(state == 1){
		 $("#statename").val("拍卖中")
	 }else{
		 $("#statename").val("展示中")
	 }
	 getProduct();
 }
 
 function getProduct(){
	 $.ajax({
			type : "post",
			url : "mallAjax!toMallList",
			data : {//设置数据源
				kid:$("#selectkey").val(),
				pname:$("#selectname").val(),
				state:$("#selectstate").val()
			},
			dataType : "json",
			success : function(data) {
				data = JSON.parse(data);
				src = data.imagesrc;
			    rows = JSON.parse(data.rows).rows;
				$("#contentproduct").html("");
				var str = "";
				for (var i = 0; i < rows.length; i++) {
					var state = "";
					if(rows[i].state == 0){
						state = "（展示中）";
					}else{
						state = "（拍卖中）";
					}
					str+="<div  class='grid_4' style='padding-bottom:20px'>";
					str+="<div class='box' style='z-index:0'>";
					str+="<div style='width:100%;height:200px;'>";
					str+="<a href='javascript:goProductDetail(" + rows[i].product_id + ")' class='gall_item'>";
					str+="<img style='width:100%;height:100%' src='"+ src + "/" + rows[i].image +"'></a></div>";
					str+="<div class='box_bot'>";
					str+="<div class='box_bot_title'>"+ rows[i].productname + state +"</div>";
					str+="<p>介绍："+ rows[i].introduce +"</p>";
					str+="<p>"+ rows[i].personname +"<label style='cursor:pointer' onclick='goPerson("+ rows[i].person_id +")'>&nbsp;&nbsp;>>前往</label></p>";
					str+="</div></div></div>";
				}
				$("#contentproduct").html(str);
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

<jsp:include page="top.jsp" />
<section id="content" class="gallery"><div class="ic">More Website Templates @ TemplateMonster.com - August11, 2014!</div>
  <div class="container">
    <div class="row">
      <div class="grid_12">
        <h2>在线商城</h2>
        <h3 id="keyname">全部</h3>
        <h3 id="statename">全部</h3>
      </div>
      <form method="post" style="position:fixed;top:10%;z-index:1">
      <div class="grid_12" style="background-color:#CCC">
        <div class="navigation" style="float:left">
            <nav>
              <ul class="sf-menu" id="sel_menu">
                <li style="cursor:pointer" onclick="changeKey('')" id="key"><a>全部</a></li>
               <s:iterator value="keyList" id="row">
                <s:if test="#row.key_id != 1">
                 <li style="cursor:pointer" onclick="changeKey('<s:property value='#row.key_id'/>')" id="key<s:property value='#row.key_id'/>"><a><s:property value='#row.keyname'/></a></li>
                </s:if>
               </s:iterator>
              </ul>
            </nav>
            <nav style="padding-top:10px">
               <ul class="sf-menu" id="sel_menu">
                <li style="cursor:pointer" onclick="changeState(2)"><a>全部</a></li>
               <li style="cursor:pointer" onclick="changeState(1)"><a>拍卖中</a></li>
               <li style="cursor:pointer" onclick="changeState(0)"><a>展示中</a></li>
                </ul>
            </nav>
            <div class="clear">
            </div>
        </div>
        <input type="hidden" id="selectkey" name="kid"/>
        <input type="hidden" id="selectstate" name="state"/>
        <div class="grid_4" style="float:right; padding-top:12px">
          <input id="selectname" name="pname" type="text" placeholder="搜索..." style="font-size:18px"/>
          <button type="button" onclick="getProduct()" style="cursor:pointer;font-size:18px">搜索</button>
        </div>
      </div>
      </form>
      <div class="grid_12" align="center" id="artist">
        <h2>艺术品</h2>
      </div>
      <div id="contentproduct">
     
	   </div>
      <br>
    </div>
  </div>
</section>

<!--==============================
              footer
=================================-->
<jsp:include page="bottom.jsp" />
<a href="#" id="toTop" class="fa fa-chevron-up"></a>
</body>
</html>
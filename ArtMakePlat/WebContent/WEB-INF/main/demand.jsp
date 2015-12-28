<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
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
<title>定制</title>
<script>
 $(window).load(function(){
  $().UItoTop({ easingType: 'easeOutQuart' });
  $('#stuck_container').tmStickUp({});  
  getDemand();
 }); 
 
	function goDemandDetail(id){
		window.location.href = "demand!goEditDemand?id=" + id;
	}
	
	function goPerson(id){
		window.location.href = "person!goInfo?id=" + id;
	}
 
 function changeKey(id){
	 $("#selectkey").val(id);
	 $("#keyname").html(id);
	 getDemand();
 }
 
 function getDemand(){
	 $.ajax({
			type : "post",
			url : "demandListAjax!toDemandList",
			data : {//设置数据源
				keyname:$("#selectkey").val(),
				note:$("#selectname").val()
			},
			dataType : "json",
			success : function(data) {
				data = JSON.parse(data);
				src = data.imagesrc;
			    rows = JSON.parse(data.rows).rows;
				$("#contentproduct").html("");
				var str = "<ul class='list-1'>";
				for (var i = 0; i < rows.length; i++) {
					var intro = rows[i].introduce;
					if(intro.length >=20){
						intro = intro.substring(0,20);
						intro+="..."
					}
					str+= "<li><span></span><pre><a><div class='fa fa-chevron-right'></div>";
					str+="<label style='cursor:pointer' onclick='goPerson("+ rows[i].person_id +")'>";
					str+= rows[i].personname + "</label>&nbsp;&nbsp;||&nbsp;&nbsp;"
					str+= rows[i].price + "元&nbsp;&nbsp;||&nbsp;&nbsp;";
					str+= "<label>" + intro + "</label>&nbsp;&nbsp;||&nbsp;&nbsp;"
					str+= "--><label style='cursor:pointer' onclick='goDemandDetail(" + rows[i].demand_id + ")'>前往</label>"
					str+= "</a></pre></li>";
				}
				str+= "</ul>"
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
<section id="content"><div class="ic">More Website Templates @ TemplateMonster.com - August11, 2014!</div>
  <div class="container">
    <div class="row">
      <div class="grid_12">
        <h2>定制</h2>
        <h3 id="keyname">全部</h3>
      </div>
     <form method="post" style="position:fixed;top:10%;z-index:1">
      <div class="grid_12" style="background-color:#CCC">
        <div class="navigation" style="float:left">
            <nav>
              <ul class="sf-menu" id="sel_menu">
                <li style="cursor:pointer" onclick="changeKey('')" id="key"><a>全部</a></li>
               <s:iterator value="keyList" id="row">
                <s:if test="#row.key_id != 1">
                 <li style="cursor:pointer" onclick="changeKey('<s:property value='#row.keyname'/>')" id="key<s:property value='#row.key_id'/>"><a><s:property value='#row.keyname'/></a></li>
                </s:if>
               </s:iterator>
              </ul>
            </nav>
            <div class="clear">
            </div>
        </div>
        <input type="hidden" id="selectkey" name="kid"/>
        <div class="grid_4" style="float:right; padding-top:12px">
          <input id="selectname" name="pname" type="text" placeholder="搜索..." style="font-size:18px"/>
          <button type="button" onclick="getDemand()" style="cursor:pointer;font-size:18px">搜索</button>
        </div>
      </div>
      </form>
    <div class="row" style="padding-left:20px">    
      <div class="grid_12">
        <div style="height:70px"></div>
        <div id="contentproduct">
        </div>
      </div> 
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
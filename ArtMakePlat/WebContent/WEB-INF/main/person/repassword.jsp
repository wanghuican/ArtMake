<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/east.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/common.js"></script> 
<script src="js/superfish.js"></script>
<script src="js/jquery.equalheights.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/tmStickUp.js"></script>
<script src="js/jquery.ui.totop.js"></script>
<script src="js/modal.js"></script>
<script>
function checkPassword(value){
	if(value.length<6 || value.length>30){document.getElementById("passwordError").value="请输入有效的密码";}
	else document.getElementById("passwordError").value="";
}

function checkPasswordAgain(value){
	var password = document.getElementById("password").value;
	if(value != password){document.getElementById("passwordagainError").value="两次密码不相同";}
	else document.getElementById("passwordagainError").value="";
}
function checkOldPassword(){
	var old = "<s:property value='person.password'/>";
	var password = document.getElementById("oldpassword").value;
	if(old != password)
		document.getElementById("oldpasswordError").value = "原密码错误";
	else
		document.getElementById("oldpasswordError").value = "";
	
}
function repassword(){
	$("#userinfo-form").attr("action","person!repassword").submit();
}
 $(window).load(function(){
  $().UItoTop({ easingType: 'easeOutQuart' });
  $('#stuck_container').tmStickUp({});  
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
<body>
<jsp:include page="../top.jsp" />
<!--=====================
          Content
======================-->
<section id="content"><div class="ic">More Website Templates @ TemplateMonster.com - August11, 2014!</div>
  <div class="container">
    <div class="row">
      <!--<div class="grid_12">
        <h2>Contacts</h2>
        <div class="map">
          <figure class="">
            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d24214.807650104907!2d-73.94846048422478!3d40.65521573400813!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sus!4v1395650655094" style="border:0"></iframe>
          </figure>
        </div>
      </div>-->
      <!--<div class="grid_5">
        <h2>Contact Info</h2>
        <div class="text1 tx__1">Lorem ipsum dolor sit amet, consecteturpiscinger elit um dolor sit amet, consecteturpiscing. 
</div>
        <p>All <a href="http://www.templatemonster.com/ " rel="nofollow" class="color1"><strong>premium website themes</strong></a> go with 24/7 support.</p>
        <p>If you have any questions regarding customization of <a href="http://blog.templatemonster.com/free-website-templates/" rel="nofollow" class="color1"><strong>freebies</strong></a>, ask guys from <a href="http://www.templatetuning.com/" rel="nofollow" class="color1"><strong>TemplateTuning</strong></a> to help you.</p>
        The Company Name Inc. <br>
        9870 St Vincent Place,<br>
        Glasgow, DC 45 Fr 45.<br>
        Telephone: +1 800 603 6035<br>
        FAX: +1 800 889 9898<br>
        E-mail: <a href="#">mail@demolink.org</a>
      </div>-->
      <div class="grid_6">
        <h2>修改信息</h2>
           <form id="userinfo-form">
            <div class="userinfo-form-loader"></div>
            <fieldset>
            <input type="hidden" name="id" value="<s:property value='person.person_id'/>"/>
              <label class="oldpassword">
                <input type="text" id="oldpassword" name="oldpassword" placeholder="原密码：" onBlur="checkOldPassword(value)"/>
                <input type="text" class="errorinfo" id="oldpasswordError" readonly height="0px" style="background-color:transparent;border:none;color:red;"/>
              </label>
             
              <label class="password">
                <input type="text" id="password" name="person.password" placeholder="修改密码:" onBlur="checkPassword(value)"/>
                <input type="text" class="errorinfo" id="passwordError" readonly height="0px" style="background-color:transparent;border:none;color:red;"/>
              </label>
              
              <label class="passwordagain">
                <input type="text" id="passwordagain" name="passwordagain" placeholder="确认密码:" onBlur="checkPasswordAgain(value)"/>
                <input type="text" class="errorinfo" id="passwordagainError" readonly height="0px" style="background-color:transparent;border:none;color:red;"/>
              </label>
              
              <label align="right">
                <a href="javascript:repassword()" class="btn" data-type="submit">确认修改</a>
              </label>
            </fieldset>
            <div class="modal fade response-message">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" onclick="" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Modal title</h4>
                  </div>
                  <div class="modal-body">
                    You message has been sent! We will be in touch soon.
                  </div>      
                </div>
              </div>
            </div>
          </form>   
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
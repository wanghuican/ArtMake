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
 $(window).load(function(){
	 var content = "<s:property value='article.content'/>";
     $("#contenthtml").html(decodeHtml(content));
 }); 
 
 function toSubmit(){
	 $("#userinfo-form").attr("action","upInfo!saveInfo").submit();
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
<!--=====================
          Content
======================-->
<section id="content"><div class="ic">More Website Templates @ TemplateMonster.com - August11, 2014!</div>
  <div class="container">
    <div class="row">
      <div class="grid_6">
        <h2>完善用户信息</h2>
           <form id="userinfo-form" method="post">
           <input type="hidden"  name="id" value="<s:property value='person.person_id'/>" />
            <div class="userinfo-form-loader"></div>
            <fieldset>
              <label class="realname">
                <input type="text" name="person.realname" placeholder="真实姓名:" data-constraints=""
                value="<s:property value='person.realname'/>" />
                <span class="empty-message">*This field is required.</span>
                <span class="error-message">*This is not a valid realname.</span>
              </label>
             
              <label class="email">
                <input type="text" name="person.email" placeholder="电子邮箱:"  data-constraints="@Email"
                 value="<s:property value='person.email'/>" />
                <span class="empty-message">*This field is required.</span>
                <span class="error-message">*This is not a valid email.</span>
              </label>
              
              <label class="phone">
                <input type="text" name="person.tel" placeholder="电话号码:" data-constraints="@JustNumbers" 
                value="<s:property value='person.tel'/>" />
                <span class="empty-message">*This field is required.</span>
                <span class="error-message">*This is not a valid phone.</span>
              </label>
              
              <label class="address">
                <input type="text" name="person.address" placeholder="地址:" data-constraints="" 
                 value="<s:property value='person.address'/>"/>
                <span class="empty-message">*This field is required.</span>
                <span class="error-message">*This is not a valid address.</span>
              </label>
              
              <label class="sex" >
                <select name="person.sex">
                <option value="男">男</option>
                <option value="女">女</option>
                </select>
              </label>
              
              <label class="qq">
                <input type="text" name="person.qq" placeholder="QQ:" data-constraints="@JustNumbers"
                value="<s:property value='person.qq'/>" />
                <span class="empty-message">*This field is required.</span>
                <span class="error-message">*This is not a valid QQ.</span>
              </label>
              
              <label class="ID">
                <input type="text" name="person.idcard" placeholder="身份证号:" data-constraints="@JustNumbers" 
                 value="<s:property value='person.idcard'/>"/>
                <span class="empty-message">*This field is required.</span>
                <span class="error-message">*This is not a valid ID.</span>
              </label>
             
              <label class="introduce">
                <textarea name="person.introduce" placeholder="个人介绍:" data-constraints='@Length(min=20,max=999999)'>
                <s:property value='person.introduce'/>
                </textarea>
                <span class="empty-message">*This field is required.</span>
                <span class="error-message">*The message is too short.</span>
              </label>
              
              <label align="right">
                <input style="cursor:pointer" type="reset" class="btn" data-type="reset" value="清除">
                <a href="javascript:toSubmit()" class="btn" data-type="submit">确认</a>                
              </label>
            </fieldset>
            <div class="modal fade response-message">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
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

</body>
</html>
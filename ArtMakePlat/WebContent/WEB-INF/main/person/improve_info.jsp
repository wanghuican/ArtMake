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
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/common.js"></script> 
<script src="js/superfish.js"></script>
<script>
var num = 0;
$(document).ready(function(){
	 <s:iterator value="person.keyList" id="row">
	 <s:if test="#row.key.key_id != 1">
	 $("#key<s:property value='#row.key.key_id'/>").css("background-color","rgb(0,0,0)");
	 $("#key<s:property value='#row.key.key_id'/>").val("-<s:property value='#row.key.keyname'/>");
	 num++;
	 </s:if>
	 </s:iterator>
});

function addKey(id,name){
	if($("#key" + id).val().indexOf("-")>=0){
		$("#key" + id).css("background-color","rgba(0,0,0,0)");
		$("#key" + id).val("+"+name);
		num--;
	}else if(num<3){
		$("#key" + id).css("background-color","rgb(0,0,0)");
		$("#key" + id).val("-"+name);
		num++;
	}else{
		alert("关键词不能超过三个");
	}
}

 function toSubmit(){
	 var keys = "";
	 <s:if test="person.role.role_code == 5">
	 <s:iterator value="keyList" id="row">
	 <s:if test="#row.key_id != 1">
       if($("#key<s:property value='#row.key_id'/>").val().indexOf("-")>=0){
		 keys += "<s:property value='#row.key_id'/>,";
	   }
     </s:if>
	 </s:iterator>
	 keys = keys.substring(0,keys.lastIndexOf(","));
	 </s:if>
	 $("#userinfo-form").attr("action","person!improvePerson?keys="+keys).submit();
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
                <input type="text" name="person.realname" placeholder="真实姓名:" data-constraints="@Length(min=2,max=999999)"
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
              
              <br>
              <br>
              <s:if test="person.role.role_code == 5">
              <label class="address" id="nkey">
                                 关键字：
              <br>
              <br>
              	
              <s:iterator value="keyList" id="row">
              <s:if test="#row.key_id != 1">
              <input type="button" id="key<s:property value='#row.key_id'/>" style="cursor:pointer" value="+<s:property value='#row.keyname'/>" onclick="addKey('<s:property value='#row.key_id'/>','<s:property value='#row.keyname'/>')"/>
              </s:if>
              </s:iterator>
              
              <br>
              <br>
              </label>
              </s:if>
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
                 <a href="#" class="btn" data-type="reset">清除</a>
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
<jsp:include page="../bottom.jsp" />
</body>
</html>
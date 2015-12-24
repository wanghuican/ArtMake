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

var chEm = false;
var chTe = false;
var chID = false;

function checkEmail(str){
	chEm = false;
	var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 
	if (!reg.test(str)){
		document.getElementById("emailError").value = "请输入有效的邮箱地址";
		chEm = false;
	}else{
		document.getElementById("emailError").value = "";
		chEm = true;
	}
}

function checkTell(str){
	chTe = false;
    if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(str))){ 
    	document.getElementById("tellError").value = "请输入有效的电话号码";
    	chTe = false;
    } else{
    	document.getElementById("tellError").value = "";
    	chTe = true;
    }
}

var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",
		21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",
		34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",
		43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",
		52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",
		64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"};

function checkIDCard(sId){
	chID = true;
	document.getElementById("IDCardError").value = "";
	var iSum=0 ;
	 var info="" ;
	 if(!/^\d{17}(\d|x)$/i.test(sId)){
		 document.getElementById("IDCardError").value = "输入的身份证长度或格式错误";
		 chID = false;
	 }
	 sId=sId.replace(/x$/i,"a");
	 if(aCity[parseInt(sId.substr(0,2))]==null){
		 document.getElementById("IDCardError").value = "身份证地区非法";
		 chID = false;
	 }
	 sBirthday=sId.substr(6,4)+"-"+Number(sId.substr(10,2))+"-"+Number(sId.substr(12,2));
	 var d=new Date(sBirthday.replace(/-/g,"/")) ;
	 if(sBirthday!=(d.getFullYear()+"-"+ (d.getMonth()+1) + "-" + d.getDate())){
		 document.getElementById("IDCardError").value = "身份证上的出生日期非法";
		 chID = false;
	 }
	 for(var i = 17;i>=0;i --) iSum += (Math.pow(2,i) % 11) * parseInt(sId.charAt(17 - i),11) ;
	 if(iSum%11!=1){
		 document.getElementById("IDCardError").value = "输入的身份证号非法";
		 chID = false;
	 }
	 //aCity[parseInt(sId.substr(0,2))]+","+sBirthday+","+(sId.substr(16,1)%2?"男":"女");
	 //此次还可以判断出输入的身份证号的人性别
}

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
	 if (chEm && chTe && chID){
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
	}else{
		alert("请输入有效信息");
	}

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
              </label>
             
              <label class="email">
                <input type="text" name="person.email" placeholder="电子邮箱:"  data-constraints="@Email"
                 value="<s:property value='person.email'/>" onBlur="checkEmail(value)" />
                <input type="text" class="errorinfo" id="emailError" readonly height="0px" 
                style="background-color:transparent;border:none;color:red;"/>
              </label>
              
              <label class="phone">
                <input type="text" name="person.tel" placeholder="电话号码:" data-constraints="@JustNumbers"
                value="<s:property value='person.tel'/>" onBlur="checkTell(value)"/>
                <input type="text" class="errorinfo" id="tellError" readonly height="0px" 
                style="background-color:transparent;border:none;color:red;"/>
              </label>
              
              <label class="address">
                <input type="text" name="person.address" placeholder="地址:" data-constraints="" 
                 value="<s:property value='person.address'/>"/>
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
              </label>
              
              <label class="ID">
                <input type="text" name="person.idcard" placeholder="身份证号:" data-constraints="@JustNumbers" 
                 value="<s:property value='person.idcard'/>" onBlur="checkIDCard(value)"/>
                 <input type="text" class="errorinfo" id="IDCardError" readonly height="0px" 
                style="background-color:transparent;border:none;color:red;"/>
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
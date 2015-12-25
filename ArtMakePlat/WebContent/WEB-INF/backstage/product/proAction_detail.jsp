<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/uploadart.css">
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
<title>top</title>
<script>
 $(window).load(function(){
  $().UItoTop({ easingType: 'easeOutQuart' });
  <s:if test="product.state == 1">
  setInterval(getprice,1000);
  </s:if>
 }); 

 $(document).ready(function(){
       $(".shuffle-me").shuffleImages({
         target: ".images > img"
       });
    });

</script>
</head>

<body class="page_uploadart" id="uploadart">

<section id="content">
<form id="infoform" method="post">
	<div class="container">
	<input type="hidden" id="id" name="id" value="<s:property value='product.product_id'/>"/>
		<div class="row">
		 <h2><b><s:property value="recordList[0].action.product.productname"/></b></h2>
			<div class="grid_12" align="center">
			<table>
             <s:iterator value="recordList" id="row">
             <tr>
             <td>
              <s:property value="#row.person.account"/>
               </td>
               <td>
              <s:property value="#row.person.realname"/>
              </td>
              <td>
               <s:property value="#row.price"/>
               </td>
               <td>
                <s:property value="#row.recordtime"/>
               </td>
              </tr>
              </s:iterator>
              </table>
            </div>

		</div>
	</div>
</form>
</section>

<!--==============================
              footer
=================================-->
<a href="#" id="toTop" class="fa fa-chevron-up"></a>
</body>
</html>
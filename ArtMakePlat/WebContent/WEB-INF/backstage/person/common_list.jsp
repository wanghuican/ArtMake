<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/backstage/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="js/backstage/jquery-1.8.2.js"></script>
<link href="css/backstage/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="css/backstage/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/backstage/authority/commonAll.js"></script>
<script type="text/javascript" src="js/backstage/fancybox/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript" src="js/backstage/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="css/backstage/authority/jquery.fancybox-1.3.4.css" media="screen"></link>
<script type="text/javascript" src="js/backstage/artDialog/artDialog.js?skin=default"></script>
<title>咨询列表</title>
<script type="text/javascript">
	$(document).ready(function(){
	    
	    var pro = new Array();
	    pro[0] = "<s:property value='selectpro[0]'/>";
	    pro[1] = "<s:property value='selectpro[1]'/>";
	    for(var i=0;i<pro.length;i++){
	    	while(pro[i].indexOf("%")>=0)
	        	pro[i] = pro[i].replace("%","");
	    }
	    $("#selectstate").val(pro[0]);
	    $("#selectaccount").val(pro[1]);
	    
	    $("#newbtn").fancybox({
			'href':'personManage!goEdit?role_code='+$("#role_code").val(),
			'width' : 733,
	        'height' : 530,
			'autoScale':false,
			'transitionIn':'none',
			'transitionOut':'none',
			'type':'iframe',
			 'onClosed' : function() { 
		        window.location.reload();	
		    }
		});
	});

	/** 模糊查询  **/
	function search(){
		$("#submitForm").attr("action", "personManage").submit();
	}

	 
	
	/** 删除 **/
	function del(id){
		if(confirm("您确定要删除吗？")){
			$("#submitForm").attr("action", "personManage!deletePerson?id=" + id).submit();			
		}
	}
	
	/** 批量删除 **/
	function batchDel(){
		if($("input[name='IDCheck']:checked").size()<=0){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'至少选择一条', ok:true,});
			return;
		}
		// 1）取出用户选中的checkbox放入字符串传给后台,form提交
		var allIDCheck = "";
		$("input[name='IDCheck']:checked").each(function(index, domEle){
			
			allIDCheck += $(domEle).val() + ",";
		});
		//alert(allIDCheck)
		if(confirm("您确定要删除吗？")){
	    	$("#submitForm").attr("action", "personManage!ndelPerson?nid="+allIDCheck).submit();
	    }
	}
	
	
	function toBid(id){
		if(confirm("您确定要禁用此人员吗？")){
			$.ajax({
		        type: "post",
		        url: "changeBidAjax?changeBid",
		        data:{//设置数据源
		        	id:id
		        },
		        dataType: "json",
		        success: function(data){
		        	data = eval('(' + data + ')');
		        	alert(data.message);
		        	if(data.state == -1){
		            	$("#bidbtn"+data.id).html("解禁");
		            	$("#bid" + data.id).html("禁用中")
		        	}
		        	else{
		        		$("#bidbtn"+data.id).html("禁用");
		        		$("#bid" + data.id).html("正常")
		        	}
		        	$("passbtn" + data.id).html("");
		        },
		        error: function(XMLHttpRequest, textStatus, errorThrown){
                    alert("XMLHttpRequest=" + XMLHttpRequest);
                    alert("textStatus=" + textStatus);
                    alert("errorThrown=" + errorThrown);
                    return false;
                }
		   });	
		}
	}
	
	function toRenew(id){
		if(confirm("您确定重置此人员密码吗？")){
			$.ajax({
		        type: "post",
		        url: "changePasswordAjax?changePassword",
		        data:{//设置数据源
		        	id:id
		        },
		        dataType: "json",
		        success: function(data){
		        	data = eval('(' + data + ')');
		        	alert(data.message);
		        },
		        error: function(XMLHttpRequest, textStatus, errorThrown){
                    alert("XMLHttpRequest=" + XMLHttpRequest);
                    alert("textStatus=" + textStatus);
                    alert("errorThrown=" + errorThrown);
                    return false;
                }
		   });	
		}
	}
	
	function jumpNormalPage(page,key){
		if(jumpPage(page,key)){
			$("#submitForm").attr("action", "personManage?PAGE="+ page).submit();
		}
	}

</script>
<style>
	.alt td{ background:black !important;}
</style>
</head>
<body>
	<form id="submitForm" name="submitForm" action="" method="post">
	    <input type="hidden" id="role_code" name="role_code" value="<s:property value='role_code'/>">
		<input type="hidden" name="allIDCheck" value="" id="allIDCheck"/>
		<div id="container">
			<div class="ui_content">
				<div class="ui_text_indent">
					<div id="box_border">
						<div id="box_top">搜索</div>
						<div id="box_center">
						状态<select name="selectpro" id="selectstate" class="ui_select01">
                                <option value=""
                                >--请选择--</option>
                                <option value="0">正常</option>
                                <option value="-1">禁用</option>
                            </select>	
						   账号<input type="text" id="selectaccount" name="selectpro" class="ui_input_txt02" />
						   <input type="hidden" id="selectrolename" name="selectpro" value="<s:property value='role.rolename'/>" />
						   <input type="hidden" id="selectrolename" name="selectpro" value="<s:property value='role.rolename'/>" />
						</div>
						<div id="box_bottom">
				    		<input type="button" value="查询" class="ui_input_btn01" onclick="search();" /> 
							<input id="newbtn" type="button" value="新建" class="ui_input_btn01" /> 
							<s:if test="#session.auth == 100">
							<input type="button" value="删除" class="ui_input_btn01" onclick="batchDel();" /> 
						    </s:if>
						</div>
					</div>
				</div>
			</div>
			<div class="ui_content">
				<div class="ui_tb">
					<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
						<tr>
							<th width="5%"><input type="checkbox" id="all" onclick="selectOrClearAllCheckbox(this);" />
							</th>
							<th width="7%">账号</th>
							<th width="7%">真实姓名</th>
							<th width="5%">性别</th>
							<th width="10%">邮箱</th>
							<th width="10%">联系方式</th>
							<th width="15%">所在地址</th>
							<th width="7%">qq</th>
							<th width="8%">身份证</th>
							<th width="6%">状态</th>
							<th width="25%">操作</th>
						</tr>
						<s:iterator value="personList" id="row">
							<tr>
								<td><input type="checkbox" name="IDCheck" value="<s:property value='#row.person_id'/>" class="acb" /></td>
								<td><s:property value="#row.account"/></td>
								<td><s:property value="#row.realname"/></td>
								<td><s:property value="#row.sex"/></td>
								<td><s:property value="#row.email"/></td>
								<td><s:property value="#row.tel"/></td>
								<td><s:property value="#row.address"/></td>
								<td><s:property value="#row.qq"/></td>
								<td><s:property value="#row.idcard"/></td>
								<td id="bid<s:property value='#row.person_id'/>">
								<s:if test="#row.state == -1">
								禁用
								</s:if>
								<s:else>
								正常
								</s:else>
								</td>
								<td>
								<label style="cursor:pointer" id="bidbtn<s:property value='#row.person_id'/>" onclick="toBid(<s:property value='#row.person_id'/>)">
								   <s:if test="#row.state != -1">  
								          禁用
								    </s:if>
								    <s:else>
								         解禁
								    </s:else>
								    </label>
									<s:if test="#session.auth == 100">
									 <label style="cursor:pointer"  onclick="toRenew(<s:property value='#row.person_id'/>)">重置</label>
						    		<label style="cursor:pointer" onclick="del(<s:property value='#row.person_id'/>)">删除</label>
								    </s:if>
								</td>
							</tr>
						</s:iterator>
					</table>
				</div>
				<jsp:include page="../page.jsp"></jsp:include>
				
			</div>
		</div>
	</form>
</body>
</html>

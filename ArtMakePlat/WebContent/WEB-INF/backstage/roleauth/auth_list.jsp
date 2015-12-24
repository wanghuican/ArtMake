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
	    pro[2] = "<s:property value='selectpro[2]'/>";
	    pro[3] = "<s:property value='selectpro[3]'/>";
	    pro[4] = "<s:property value='selectpro[4]'/>";
	    pro[5] = "<s:property value='selectpro[5]'/>";
	    var min = "<s:property value='#request.min'/>";
	    var max = "<s:property value='#request.max'/>";
	    $("#selectnummin").val(pro[0] == min ? "" : pro[0]);
	    $("#selectnummax").val(pro[1] == max ? "" : pro[1]);
	    $("#selecttotalmin").val(pro[2] == min ? "" : pro[2]);
	    $("#selecttotalmax").val(pro[3] == max ? "" : pro[3]);
	    $("#selecttimemin").val(pro[4] == min ? "" : pro[4]);
	    $("#selecttimemax").val(pro[5] == max ? "" : pro[5]);
	    
	    <s:iterator value="authList" id="row">
	    $("#update<s:property value='#row.auth_id'/>").fancybox({
	    	'href' : 'authManage!goEdit?id=<s:property value='#row.auth_id'/>',
	    	'width' : 733,
	        'height' : 530,
	        'type' : 'iframe',
	        'hideOnOverlayClick' : true,
	        'showCloseButton' : true,
	        'onClosed' : function() {	
	        	window.location.reload();
	        }
	    });
	    
	    $("#set<s:property value='#row.auth_id'/>").fancybox({
	    	'href' : 'authManage!goSet?id=<s:property value='#row.auth_id'/>',
	    	'width' : 733,
	        'height' : 530,
	        'type' : 'iframe',
	        'hideOnOverlayClick' : true,
	        'showCloseButton' : true,
	        'onClosed' : function() {	
	        	window.location.reload();
	        }
	    });
	    </s:iterator>
	    
	    $("#addbtn").fancybox({
	    	'href' : 'authManage!goEdit',
	    	'width' : 733,
	        'height' : 530,
	        'type' : 'iframe',
	        'hideOnOverlayClick' : true,
	        'showCloseButton' : true,
	        'onClosed' : function() {	
	        	window.location.reload();
	        }
	    });
	});

	/** 模糊查询  **/
	function search(){
		$("#submitForm").attr("action", "authManage").submit();
	}

	 
	
	/** 删除 **/
	function del(id){
		if(confirm("您确定要删除吗？")){
			$("#submitForm").attr("action", "authManage!delAuth?id=" + id).submit();			
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
    		$("#submitForm").attr("action", "authManage!ndelAuth?nid="+allIDCheck).submit();
		}
	}
	
	function jumpNormalPage(page,key){
		if(jumpPage(page,key)){
			$("#submitForm").attr("action", "authManage?PAGE="+ page).submit();
		}
	}

</script>
<style>
	.alt td{ background:black !important;}
</style>
</head>
<body>
	<form id="submitForm" name="submitForm" action="" method="post">
		<input type="hidden" name="allIDCheck" value="" id="allIDCheck"/>
		<div id="container">
			<div class="ui_content">
				<div class="ui_text_indent">
					<div id="box_border">
						<div id="box_top">搜索</div>
						<div id="box_center">
							上架个数
							<input type="text" id="selectnummin" name="selectpro" class="ui_input_txt02" style="width:10%"/>~			
						   <input type="text" id="selectnummax" name="selectpro" class="ui_input_txt02" style="width:10%"/>	 
						      上传个数
							<input type="text" id="selecttotalmin" name="selectpro" class="ui_input_txt02" style="width:10%"/>~			
						   <input type="text" id="selecttotalmax" name="selectpro" class="ui_input_txt02" style="width:10%"/>	         
						       拍卖时间<input type="text" id="selecttimemin" name="selectpro" class="ui_input_txt02" style="width:10%"/>~
						       <input type="text" id="selecttimemax" name="selectpro" class="ui_input_txt02" style="width:10%"/>
						</div>
						<div id="box_bottom">
				    		<input type="button" value="查询" class="ui_input_btn01" onclick="search();" /> 
				    		<input type="button" id="addbtn" value="新增" class="ui_input_btn01" onclick="add();" /> 
							<input type="button" value="删除" class="ui_input_btn01" onclick="batchDel();" /> 
						</div>
					</div>
				</div>
			</div>
			<div class="ui_content">
				<div class="ui_tb">
					<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
						<tr>
							<th width="10%"><input type="checkbox" id="all" onclick="selectOrClearAllCheckbox(this);" />
							</th>
							<th width="20%">角色名</th>
							<th width="8%">上架最大个数</th>
							<th width="8%">上传最大个数</th>
							<th width="9%">上传最大持续时间(h)</th>
							<th width="20%">下一级</th>
							<th width="25%">操作</th>
						</tr>
						<s:iterator value="authList" id="row">
							<tr>
								<td><input type="checkbox" name="IDCheck" value="<s:property value='#row.auth_id'/>" class="acb" /></td>
								<td><s:property value="#row.role.rolename"/></td>
								<td><s:property value="#row.upnum"/></td>
								<td><s:property value="#row.totalnum"/></td>
								<td><s:property value="#row.lasttime"/></td>
								<td><s:property value="#row.role.frolename"/></td>
								<td>
									<s:if test="#session.auth == 100">
							    		<label style="cursor:pointer" id="update<s:property value='#row.auth_id'/>">修改</label>
						    			<label style="cursor:pointer" onclick="del(<s:property value='#row.auth_id'/>)">删除</label>
							    	    <label style="cursor:pointer" id="set<s:property value='#row.auth_id'/>">设置</label>
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

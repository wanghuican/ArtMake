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
	    $("#selectpname").val(pro[0]);
	    $("#selectname").val(pro[1]);
	    
	    <s:iterator value="proActionList" id="row">
	    $("#showbtn<s:property value='#row.action_id'/>").fancybox({
	    	'href' : 'proActionManage!goDetail?id=<s:property value='#row.action_id'/>',
	    	'width' : 733,
	        'height' : 530,
	        'type' : 'iframe',
	        'hideOnOverlayClick' : true,
	        'showCloseButton' : true,
	        'onClosed' : function() {	
	        }
	    });
	    </s:iterator>
	    
	});

	/** 模糊查询  **/
	function search(){
		$("#submitForm").attr("action", "proActionManage").submit();
	}

	 
	
	/** 删除 **/
	function del(id){
		if(confirm("您确定要删除吗？")){
			$("#submitForm").attr("action", "proActionManage!delProAction?id=" + id).submit();			
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
    		$("#submitForm").attr("action", "proActionManage!ndelProAction?nid="+allIDCheck).submit();
		}
	}
	
	
	function complete(id){
		$.ajax({
	        type: "post",
	        url: "completeAjax!complete",
	        data:{//设置数据源
	        	id:id
	        },
	        dataType: "json",
	        success: function(data){
	        	data = eval('(' + data + ')');
	        	alert(data.message + " " + data.error);
	        	if(data.state == 1)
	            	$("#complete"+data.id).html("已完成");
	        	else
	        		$("#complete"+data.id).html("未完成");
	        	if(data.error == "")
	               $("#completbtn"+data.id).html("");
	        },
	        error: function(XMLHttpRequest, textStatus, errorThrown){
                alert("XMLHttpRequest=" + XMLHttpRequest);
                alert("textStatus=" + textStatus);
                alert("errorThrown=" + errorThrown);
                return false;
            }
	   });	
	}

	function jumpNormalPage(page,key){
		if(jumpPage(page,key)){
			$("#submitForm").attr("action", "proActionManage?PAGE="+ page).submit();
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
						         艺术品名称<input type="text" id="selectpname" name="selectpro" class="ui_input_txt02" />     
						         发起人名称<input type="text" id="selectname" name="selectpro" class="ui_input_txt02" />
						</div>
						<div id="box_bottom">
				    		<input type="button" value="查询" class="ui_input_btn01" onclick="search();" /> 
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
							<th width="10%">艺术品名</th>
							<th width="10%">艺术家名</th>
							<th width="5%">开始价格</th>
							<th width="5%">最低增额</th>
							<th width="5%">持续时间</th>
							<th width="10%">是否结束</th>
							<th width="10%">是否已经生成订单</th>
							<th width="15%">上传时间</th>
							<th width="25%">操作</th>
						</tr>
						<s:iterator value="proActionList" id="row">
							<tr>
								<td><input type="checkbox" name="IDCheck" value="<s:property value='#row.action_id'/>" class="acb" /></td>
								<td><s:property value="#row.product.productname"/></td>
								<td><s:property value="#row.product.person.realname"/></td>
								<td><s:property value="#row.startprice"/></td>
								<td><s:property value="#row.addprice"/></td>
								<td><s:property value="#row.lasttime"/></td>
								<td>
								<s:if test="nowDate > #row.endtime">
								已结束
								</s:if>
								<s:else>
								未结束
								</s:else>
								</td>
								<td id="complete<s:property value='#row.action_id'/>">
								<s:if test="#row.state == 0">
								未生成
								</s:if>
								<s:else>
								已生成
								</s:else>
								</td>
								<td><s:property value="#row.recordtime"/></td>
								<td>
								    <label style="cursor:pointer" id="showbtn<s:property value='#row.action_id'/>">详情</label>
									<s:if test="#session.auth == 100">
									<s:if test="nowDate > #row.endtime && #row.state == 0">
									<label style="cursor:pointer" id="completbtn<s:property value='#row.action_id'/>" onclick="complete(<s:property value='#row.action_id'/>)">
							    	  生成订单
								    </label>
								    </s:if>
								    <s:if test="#row.state == 1">
						    			<label style="cursor:pointer" onclick="del(<s:property value='#row.action_id'/>)">删除</label>
								    </s:if>
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

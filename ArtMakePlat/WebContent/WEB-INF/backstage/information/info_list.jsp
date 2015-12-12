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
	
	    /**编辑   **/
	    <s:iterator value="articleList" id="row">
	    $("#showbtn<s:property value='#row.article_id'/>").fancybox({
	    	'href' : 'articleCheck!goShow?id=<s:property value='#row.article_id'/>',
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
		$("#submitForm").attr("action", "forward!goInfolist?page=" + 1).submit();
	}

	 
	
	/** 删除 **/
	function del(id){
		if(confirm("您确定要删除吗？")){
			$("#submitForm").attr("action", "articleCheck!deleteInfo?id=" + id).submit();			
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
			bjText = $(domEle).parent("td").parent("tr").last().children("td").last().prev().text();
// 			alert(bjText);
			// 用户选择的checkbox, 过滤掉“已审核”的，记住哦
			if($.trim(bjText)=="已审核"){
// 				$(domEle).removeAttr("checked");
				$(domEle).parent("td").parent("tr").css({color:"red"});
				$("#resultInfo").html("已审核的是不允许您删除的，请联系管理员删除！！！");
// 				return;
			}else{
				allIDCheck += $(domEle).val() + ",";
			}
		});
		// 截掉最后一个","
		if(allIDCheck.length>0) {
			allIDCheck = allIDCheck.substring(0, allIDCheck.length-1);
			// 赋给隐藏域
			$("#allIDCheck").val(allIDCheck);
			if(confirm("您确定要批量删除这些记录吗？")){
				// 提交form
				$("#submitForm").attr("action", "/xngzf/archives/batchDelFangyuan.action").submit();
			}
		}
	}
	
	function changePass(id){
		 $.ajax({
		        type: "post",
		        url: "articleCheckAjax?changePass",
		        data:{//设置数据源
		        	id:id
		        },
		        dataType: "json",
		        success: function(data){
		        	data = eval('(' + data + ')'); ;
		        	alert(data.message);
		        	if(data.pass == 1)
		            	$("#passbtn"+data.id).html("取消");
		        	else
		        		$("#passbtn"+data.id).html("通过");
		        	$("#pass"+data.id).html(data.pass);
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
			window.location.href = "articleCheck?PAGE="+ page;
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
							状态
							<select name="selectpass" id="selectpass" class="ui_select01">
                                <option value=""
                                >--请选择--</option>
                                <option value="1">通过</option>
                                <option value="0">未通过</option>
                            </select>					
							申请时间
							<input type="date" name="selecttime" id="selecttime" class="ui_input_txt02"/>

							申请人<input type="text" id="selectperson" name="selectperson" class="ui_input_txt02" />
						         关键字<input type="text" id="selectkey" name="selectkey" class="ui_input_txt02" />
						</div>
						<div id="box_bottom">
							<input type="button" value="查询" class="ui_input_btn01" onclick="search();" /> 
							<input type="button" value="通过" class="ui_input_btn01" onclick="pass();" /> 
							<input type="button" value="删除" class="ui_input_btn01" onclick="batchDel();" /> 
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
							<th width="20%">题目</th>
							<th width="5%">图片</th>
							<th width="15%">上传日期</th>
							<th width="25%">申请时间</th>
							<th width="5%">是否通过</th>
							<th width="10%">申请人</th>
							<th width="25%">操作</th>
						</tr>
						<s:iterator value="articleList" id="row">
							<tr>
								<td><input type="checkbox" name="IDCheck" value="<s:property value='#row.article_id'/>" class="acb" /></td>
								<td><s:property value="#row.title"/></td>
								<td><div style="width:50%;height:50%"><img style="left:30%;width:100%;height:100%" src="<s:property value='#request.IMGSRC'/>/<s:property value='#row.image'/>" /></div></td>
								<td><s:property value="#row.uptime"/></td>
								<td><s:property value="#row.time"/></td>
								<td id="pass<s:property value='#row.article_id'/>"><s:property value="#row.pass"/></td>
								<td><s:property value="#row.person.account"/></td>
								<td>
								    <label style="cursor:pointer" id="showbtn<s:property value='#row.article_id'/>">预览</label>
								    <label style="cursor:pointer" id="passbtn<s:property value='#row.article_id'/>" onclick="changePass(<s:property value='#row.article_id'/>)">
								    <s:if test="#row.pass == 0">
							    	   通过  
								    </s:if>
								    <s:else>
							    	     取消
								    </s:else>
								    </label>
									<label style="cursor:pointer" onclick="del(<s:property value='#row.article_id'/>)">删除</label>
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

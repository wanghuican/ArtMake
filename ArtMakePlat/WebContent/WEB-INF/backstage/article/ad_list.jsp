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
<title>广告列表</title>
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
	    $("#updatebtn<s:property value='#row.article_id'/>").fancybox({
	    	'href' : 'articleCheck!goUpdate?id=<s:property value='#row.article_id'/>',
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
	    var pro = new Array();
	    pro[0] = "<s:property value='selectpro[0]'/>";
	    pro[1] = "<s:property value='selectpro[1]'/>";
	    pro[2] = "<s:property value='selectpro[2]'/>";
	    pro[3] = "<s:property value='selectpro[3]'/>";
	    for(var i=0;i<pro.length;i++){
	    	while(pro[i].indexOf("%")>=0)
	        	pro[i] = pro[i].replace("%","");
	    }
	    $("#selectpass").val(pro[0]);
	    $("#selectstate").val(pro[1]);
	    $("#selecttime").val(pro[2]);
	    $("#selectkey").val(pro[3]);
	    
	    checkCount();
	});

	/** 模糊查询  **/
	function search(){
		$("#submitForm").attr("action", "articleCheck!goAd").submit();
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
			
			allIDCheck += $(domEle).val() + ",";
		});
		//alert(allIDCheck)
		if(confirm("您确定要删除吗？")){
    		$("#submitForm").attr("action", "articleCheck!ndelInfo?nid="+allIDCheck).submit();
		}
	}
	
	function batchPass(){
		// 1）取出用户选中的checkbox放入字符串传给后台,form提交
		var allIDCheck = "";
		$("input[name='IDCheck']:checked").each(function(index, domEle){
			if($("#pass"+$(domEle).val()).html() != 1)
		    	allIDCheck += $(domEle).val() + ",";
		});
		if($("input[name='IDCheck']:checked").size()<=0 || allIDCheck == ""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'至少选择一条未通过', ok:true,});
			return;
		}
		 $.ajax({
		        type: "post",
		        url: "nchangePassAjax?nchangePass",
		        data:{//设置数据源
		        	nid:allIDCheck
		        },
		        dataType: "json",
		        success: function(data){
		        	data = eval('(' + data + ')');
		        	alert(data.message);
		        	var counts = data.counts;
		        	$("#tdbig").html("big(" + counts[0] + ")");
		        	$("#tdsmall").html("small(" + counts[1] + ")");
		        	$("#tmbig").html("big(" + counts[2] + ")");
		        	$("#tmsmall").html("small(" + counts[3] + ")");
		        	checkCount();
		        	
		        	aids = data.aids;
		        	for(var i=0;i<aids.length;i++){
		        		$("#passbtn"+aids[i]).html("");
		        	}
		        },
		        error: function(XMLHttpRequest, textStatus, errorThrown){
                 alert("XMLHttpRequest=" + XMLHttpRequest);
                 alert("textStatus=" + textStatus);
                 alert("errorThrown=" + errorThrown);
                 return false;
             }
		   });	
	}
	
	function changePass(id){
		 $.ajax({
		        type: "post",
		        url: "changePassAjax?changePass",
		        data:{//设置数据源
		        	id:id
		        },
		        dataType: "json",
		        success: function(data){
		        	data = eval('(' + data + ')');
		        	alert(data.message);
		        	var counts = data.counts;
		        	$("#tdbig").html("big(" + counts[0] + ")");
		        	$("#tdsmall").html("small(" + counts[1] + ")");
		        	$("#tmbig").html("big(" + counts[2] + ")");
		        	$("#tmsmall").html("small(" + counts[3] + ")");
		        	checkCount();
		        	
		        	if(data.pass == 1)
		            	$("#passbtn"+data.id).html("");
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
			$("#submitForm").attr("action", "articleCheck!goAd?PAGE="+ page).submit();
		}
	}

	function checkCount(){
		<s:if test="countList[0]>4">
 		$("#tdbig").css("color","red");
		</s:if>
		<s:else>
		$("#tdbig").css("color","black");
		</s:else>
		<s:if test="countList[1]>6">
 		$("#tdsmall").css("color","red");
		</s:if>
		<s:else>
		$("#tdsmall").css("color","black");
		</s:else>
		<s:if test="countList[2]>4">
 		$("#tmbig").css("color","red");
		</s:if>
		<s:else>
		$("#tmbig").css("color","black");
		</s:else>
		<s:if test="countList[3]>6">
 		$("#tmsmall").css("color","red");
		</s:if>
		<s:else>
		$("#tmsmall").css("color","black");
		</s:else>
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
						          栏位
							<select name="selectpro" id="selectpass" class="ui_select01">
                                <option value=""
                                >--请选择--</option>
                                <option value="big">大栏位</option>
                                <option value="small">小栏位</option>
                            </select>
							状态
							<select name="selectpro" id="selectstate" class="ui_select01">
                                <option value=""
                                >--请选择--</option>
                                <option value="1">通过</option>
                                <option value="0">未通过</option>
                            </select>					
							申请时间
							<input type="date" name="selectpro" id="selecttime" class="ui_input_txt02"/>

						         关键字<input type="text" id="selectkey" name="selectpro" class="ui_input_txt02" />
						</div>
						<div id="box_bottom">
						<table  width="100%">
						<tr>
						<td width="70%">
						<div style="font-size:16px;font-weight:600" align="left">
						<em>Today:</em>
						<label id="tdbig">big(<s:property value="countList[0]"/>)</label>,
						<label id="tdsmall">small(<s:property value="countList[1]"/>)</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<em>Tomorrow:</em>
						<label id="tmbig">big(<s:property value="countList[2]"/>)</label>,
						<label id="tmsmall">small(<s:property value="countList[3]"/>)</label>
						</div>
						</td>
						<td width="30%">
							<input type="button" value="查询" class="ui_input_btn01" onclick="search();" /> 
							<input type="button" value="通过" class="ui_input_btn01" onclick="batchPass();" /> 
							<input type="button" value="删除" class="ui_input_btn01" onclick="batchDel();" /> 
						</td>
						</table>
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
							<th width="5">栏位</th>
							<th width="20%">操作</th>
						</tr>
						<s:iterator value="articleList" id="row">
							<tr>
								<td><input type="checkbox" name="IDCheck" value="<s:property value='#row.article_id'/>" class="acb" /></td>
								<td><s:property value="#row.title"/></td>
								<s:if test="#row.column_id != 'demand'">
								<td><div style="width:50%;height:50%"><img style="left:30%;width:100%;height:100%" src="<s:property value='#request.IMGSRC'/>/<s:property value='#row.image'/>" /></div></td>
								</s:if>
								<s:else>
								<td></td>
								</s:else>
								<td><s:property value="#row.uptime"/></td>
								<td><s:property value="#row.time"/></td>
								<td id="pass<s:property value='#row.article_id'/>"><s:property value="#row.pass"/></td>
								<td><s:property value="#row.person.account"/></td>
								<td><s:property value="#row.column_id"/></td>
								<td>
							    	<label style="cursor:pointer" id="updatebtn<s:property value='#row.article_id'/>">修改</label>
								    <label style="cursor:pointer" id="showbtn<s:property value='#row.article_id'/>">预览</label>
								    <label style="cursor:pointer" id="passbtn<s:property value='#row.article_id'/>" onclick="changePass(<s:property value='#row.article_id'/>)">
								    <s:if test="#row.pass == 0">
							    	   通过  
								    </s:if>
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

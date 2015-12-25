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
    for(var i=0;i<pro.length;i++){
    	while(pro[i].indexOf("%")>=0)
        	pro[i] = pro[i].replace("%","");
    }
    $("#selectstate").val(pro[0]);
    $("#selectaccount").val(pro[1]);
    $("#selectkey").val(pro[2]);
});

	/** 模糊查询  **/
	function search(){
		$("#submitForm").attr("action", "orderManage!goDem").submit();
	}
	
	/** 删除 **/
	function del(id){
		if(confirm("您确定要删除吗？")){
			$("#submitForm").attr("action", "orderManage!deleteInfo?id=" + id).submit();			
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
	    	$("#submitForm").attr("action", "orderManage!ndelInfo?nid="+allIDCheck).submit();
		}
	}
	
	function jumpNormalPage(page,key){
		if(jumpPage(page,key)){
			$("#submitForm").attr("action", "orderManage!goDem?PAGE="+ page).submit();
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
							<select name="selectpro" id="selectstate" class="ui_select01">
                                <option value=""
                                >--请选择--</option>
                                <option value="1">已完成</option>
                                <option value="0">未完成</option>
                            </select>					
							申请人姓名<input type="text" id="selectaccount" name="selectpro" class="ui_input_txt02" />
					  	          简介关键词<input type="text" id="selectkey" name="selectpro" class="ui_input_txt02" />
						</div>
						<div id="box_bottom">
							<input type="button" value="查询" class="ui_input_btn01" onclick="search();" /> 		
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
							<th width="10%">艺术家姓名</th>
							<th width="20%">定制服务描述</th>
							<th width="5%">价格</th>
							<th width="15%">购买日期</th>
							<th width="15%">用户地址</th>
							<th width="10%">用户联系方式</th>
							<th width="10%">是否完成</th>
							<th width="10%">操作</th>
						</tr>
						<s:iterator value="orderList" id="row">
							<tr>
								<td><input type="checkbox" name="IDCheck" value="<s:property value='#row.order_id'/>" class="acb" /></td>
							    <td><s:property value="#row.person.realname"/></td>
								<td><s:property value="#row.demand.introduce"/></td>
								<td><s:property value="#row.demand.price"/></td>
								<td><s:property value="#row.buytime"/></td>
								<td><s:property value="#row.person.address"/></td>
								<td><s:property value="#row.person.tel"/></td>
								<td>
								<s:if test="#row.state == 0">
								未完成
								</s:if>
								<s:else>
								已完成
								</s:else>
								</td>
								<td>
								<s:if test="#row.state == 1">
									<label style="cursor:pointer" onclick="del(<s:property value='#row.order_id'/>)">删除</label>
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

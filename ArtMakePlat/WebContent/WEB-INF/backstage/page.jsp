<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	/** 跳转 **/
	function jumpPage(page,key){
		var total = parseInt(<s:property value="#request.pageTotal"/>);
		
		if(page == "" && key == "INPUT"){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'输入页数为空', ok:true,});		
		    return false;
		}
		var pageNo = parseInt(page);
		// 如果“跳转页数”不为空
		if(key == 'ONE'){
	    	if(pageNo == 0){
	    		art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'当前为第一页', ok:true,});		
	    		return false;
	    	}else if(pageNo == total + 1){
	    		art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'当前最后一页', ok:true,});		
	    		return false;
	    	}
	    }else if(key == "INPUT"){
	   		if(pageNo < 1 || pageNo > total){
	   			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'输入页数有误', ok:true,});		
	   			return false;
	   		} 	
	   	}
		return true;
	}
</script>

</head>
<body>
<div class="ui_tb_h30">
					<div class="ui_flt" style="height: 30px; line-height: 30px;">
						共有
						<span class="ui_txt_bold04"><s:property value="#request.count"/></span>
						条记录，当前第
						<span class="ui_txt_bold04"><s:property value="#request.pageNo"/>
						/
						<s:property value="#request.pageTotal"/></span>
						页
					</div>
					<div class="ui_frt">
						<!--    如果是第一页，则只显示下一页、尾页 -->
						
							<input type="button" value="首页" class="ui_input_btn01"
						    	onclick="jumpNormalPage(1,'INPUT')" />
							<input type="button" value="上一页" class="ui_input_btn01" 
						    	onclick="jumpNormalPage(parseInt(<s:property value='#request.pageNo'/>)-1,'ONE')"/>
							<input type="button" value="下一页" class="ui_input_btn01"
								onclick="jumpNormalPage(parseInt(<s:property value='#request.pageNo'/>)+1,'ONE')" />
							<input type="button" value="尾页" class="ui_input_btn01"
								onclick="jumpNormalPage(<s:property value='#request.pageTotal'/>,'INPUT')" />
						
						
						
						<!--     如果是最后一页，则只显示首页、上一页 -->
						
						转到第<input type="text" id="jumpNumTxt" class="ui_input_txt01" />页
							 <input type="button" class="ui_input_btn01" value="跳转" onclick="jumpNormalPage($('#jumpNumTxt').val(),'INPUT');" />
					</div>
				</div>
</body>
</html>
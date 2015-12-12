/**
 * @Title: WebTool.java
 * @Package cn.edu.xmu.util
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月10日 下午9:04:12
 * @version V1.0
 */

package cn.edu.xmu.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

/**
 * @ClassName: WebTool
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月10日 下午9:04:12
 */

public class WebTool {

	public static final void upFile(String path,String filename,File file) throws IOException{
		InputStream is = new FileInputStream(file);
		File fl = new File(path,filename);
		OutputStream os = new FileOutputStream(fl);
		byte[] buffer = new byte[1024];
		int length = 0;
		while((length = is.read(buffer))>0){
			os.write(buffer,0,length);
		}
		is.close();
		os.close();
	}
	
	public static final void deleteFile(String path,File file){
		file.delete();
	}
	
	public static final void alertMessage(String message,String action) throws IOException{
		HttpServletResponse response = WebTool.getResponse();
        PrintWriter out = response.getWriter();
        out.print("<script>alert('" + message + "')</script>");
        out.print("<script>window.location.href= '" + action + "'</script>");
        out.flush();
        out.close();
	}
	
	public static final void confirmMessage(String message,String actionYes,String actionNo) throws IOException{
		HttpServletResponse response = WebTool.getResponse();
        PrintWriter out = response.getWriter();
        out.print("<script>if(confirm('" + message + "')){");
        out.print("window.location.href= '" + actionYes + "'}");
        out.print("else{window.location.href= '" + actionNo + "'}</script>");
        out.flush();
        out.close();
	}
	
	public static final int dealPage(int count,int page){
		HttpServletRequest request = WebTool.getRequest();
		String pageNo = request.getParameter("PAGE");
		if(!WebTool.StringisNullOrEmpty(pageNo)){
			page = Integer.parseInt(pageNo);
		}
		int pageTotal = (int)(count-1)/Common.BACKSTAGE_PAGESIZE + 1;
		if(page > pageTotal)
			page = 1;
		request.setAttribute("pageNo", page);
		request.setAttribute("count", count);
		request.setAttribute("pageTotal", pageTotal);
		return page;
	}
	
	public static final boolean StringisNullOrEmpty(String str){
		return (str == null || str.equals(""));
	}
	
	public static final HttpServletResponse getResponse(){
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
        return response;
	}
	
	public static final HttpServletRequest getRequest(){
		HttpServletRequest request = ServletActionContext.getRequest();

        return request;
	}
	
}

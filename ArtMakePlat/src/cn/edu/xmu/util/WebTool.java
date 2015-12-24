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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

import cn.edu.xmu.entity.JsonEntity;
import cn.edu.xmu.entity.Person;

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
	
	public static final void deleteFile(File file){
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
	
	public static final int dealPage(int count,int page,int pagesize){
		HttpServletRequest request = WebTool.getRequest();
		String pageNo = request.getParameter("PAGE");
		if(!WebTool.StringisNullOrEmpty(pageNo)){
			page = Integer.parseInt(pageNo);
		}
		int pageTotal = (int)(count-1)/pagesize + 1;
		if(page > pageTotal)
			page = 1;
		request.setAttribute("pageNo", page);
		request.setAttribute("count", count);
		request.setAttribute("pageTotal", pageTotal);
		return page;
	}
	
	public static final int dealPage(int count,int page,int pagesize,String pageName){
		HttpServletRequest request = WebTool.getRequest();
		String pageNo = request.getParameter(pageName);
		if(!WebTool.StringisNullOrEmpty(pageNo)){
			page = Integer.parseInt(pageNo);
		}
		int pageTotal = (int)(count-1)/pagesize + 1;
		if(page > pageTotal)
			page = 1;
		request.setAttribute(pageName, page);
		request.setAttribute(pageName+"count", count);
		request.setAttribute(pageName+"Total", pageTotal);
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
	
	public static final String[] getNids(){
		String nid = WebTool.getRequest().getParameter("nid");
		nid = nid.substring(0,nid.lastIndexOf(","));
		return nid.split(",");
	}

	public static final List<String> dealStrProList(List<String> list){
		List<String> strList = list;
		for(int i=0;i<strList.size();i++){
			strList.set(i,"%" + strList.get(i) + "%");
		}
		return strList;
	}
	
	public static final List<Integer> dealIntProList(List<Integer> list){
		List<Integer> strList = list;
		for(int i=0;i<strList.size();i++){
			if(strList.get(i) == null){
				if(i%2 == 0){
					strList.set(i, Common.MIN);
				}else{
					strList.set(i, Common.MAX);
				}
			}
		}	
		WebTool.getRequest().setAttribute("min",Common.MIN);
		WebTool.getRequest().setAttribute("max",Common.MAX);	
		return strList;
	}
	
	public static final void printOb(Object ob){
		System.out.println("it is:" + ob);
	}
	
	public static final void printObs(Object[] obs){
		for(int i=0;i<obs.length;i++){
	    	System.out.println(i +" is:" + obs[i]);
		}
	}
	
	
	public static final void printList(List list){
		for(int i=0;i<list.size();i++){
	    	System.out.println("the list("+ i +") is:" + list.get(i));
		}
	}

	public static final String listToJsonStr(List list){
		StringBuilder json = new StringBuilder();
		String rows[] = new String[list.size()];
		json.append("{\"rows\":[");
		for(int i=0;i<list.size();i++){
			rows[i] = ((JsonEntity) list.get(i)).toJsonString();
			json.append(rows[i]);
			if(i != list.size()-1){
				json.append(",");
			}
		}
		json.append("]}");
		return json.toString();
	}
	
    /**
     * 用于将字符串中的特殊字符转换成Web页中可以安全显示的字符串
     * 可对表单数据据进行处理对一些页面特殊字符进行处理如'<','>','"',''','&'
     * @param strSrc 要进行替换操作的字符串
     * @return 替换特殊字符后的字符串
     * @since  1.0
     */

    public static final String htmlEncode(String strSrc) {
        if (strSrc == null)
            return "";

        char[] arr_cSrc = strSrc.toCharArray();
        StringBuffer buf = new StringBuffer(arr_cSrc.length);
        char ch;

        for (int i = 0; i < arr_cSrc.length; i++) {
            ch = arr_cSrc[i];

            if (ch == '<')
                buf.append("&lt;");
            else if (ch == '>')
                buf.append("&gt;");
            else if (ch == '"')
                buf.append("&quot;");
            else if (ch == '\'')
                buf.append("&#039;");
            else if (ch == '&')
                buf.append("&amp;");
            else
                buf.append(ch);
        }
        return buf.toString();
    }
    
    public static final void getArticleSrc(){
    	WebTool.getRequest().setAttribute("IMGSRC", Common.ARTICLE_SRC);
    }
    
    public static final void getProductSrc(){
    	WebTool.getRequest().setAttribute("IMGSRC", Common.PRODUCT_SRC);
    }
    
    public static final Person getSessionPerson(){
		return (Person) ActionContext.getContext().getSession().get("person");
    }
}

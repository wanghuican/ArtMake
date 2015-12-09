package cn.edu.xmu.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.edu.xmu.entity.Article;
import cn.edu.xmu.entity.Person;
import cn.edu.xmu.entity.Role;
import cn.edu.xmu.service.ArticleService;
import cn.edu.xmu.util.Common;
import cn.edu.xmu.util.DateUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UploadArticleAction extends ActionSupport{

	/**
	 * @Fields articleService : 业务逻辑组件
	 */
	@Resource(name = "articleService")
	ArticleService articleService;
	
	private File file;
	private String fileFileName;
	private String fileContentType;
	private String title;
	private String content;
	
	
	/**
	 * getter method
	 * @return the file
	 */
	
	public File getFile() {
		return file;
	}



	/**
	 * setter method
	 * @param file the file to set
	 */
	
	public void setFile(File file) {
		this.file = file;
	}



	/**
	 * getter method
	 * @return the fileFileName
	 */
	
	public String getFileFileName() {
		return fileFileName;
	}



	/**
	 * setter method
	 * @param fileFileName the fileFileName to set
	 */
	
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}



	/**
	 * getter method
	 * @return the fileContentType
	 */
	
	public String getFileContentType() {
		return fileContentType;
	}



	/**
	 * setter method
	 * @param fileContentType the fileContentType to set
	 */
	
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}



	/**
	 * getter method
	 * @return the title
	 */
	
	public String getTitle() {
		return title;
	}



	/**
	 * setter method
	 * @param title the title to set
	 */
	
	public void setTitle(String title) {
		this.title = title;
	}



	/**
	 * getter method
	 * @return the content
	 */
	
	public String getContent() {
		return content;
	}



	/**
	 * setter method
	 * @param content the content to set
	 */
	
	public void setContent(String content) {
		this.content = content;
	}



	@Override
    public String execute() throws Exception {
		
		System.out.println(this.getContent());
		System.out.println(this.getFile());
		System.out.println(this.getFileContentType());
		System.out.println(this.getFileFileName());
		System.out.println(this.getTitle());
		
		String path = Common.PLAT_SRC + Common.INFO_SRC;
		String suffix = getFileFileName().substring(getFileFileName().indexOf("."),getFileFileName().length());
		String filename = System.currentTimeMillis() + suffix;
		InputStream is = new FileInputStream(getFile());
		File fl = new File(path,filename);
		OutputStream os = new FileOutputStream(fl);
		byte[] buffer = new byte[1024];
		int length = 0;
		while((length = is.read(buffer))>0){
			os.write(buffer,0,length);
		}
		is.close();
		os.close();
		
		Article article = new Article();
		article.setContent(getContent());
		article.setImage(filename);
		Person p = new Person();
		p = (Person)ActionContext.getContext().getSession().get("person");
		//System.out.println(p.getAccount());
		article.setPerson(p);
		article.setTitle(getTitle());
		article.setUptime(new Date());
		article.setType(0);
		article.setPass(0);
		articleService.saveArticle(article);
		
        return SUCCESS;
	}
	
}

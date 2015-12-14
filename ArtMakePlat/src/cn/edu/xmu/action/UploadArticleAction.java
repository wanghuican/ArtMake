package cn.edu.xmu.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.entity.Article;
import cn.edu.xmu.entity.Person;
import cn.edu.xmu.service.ArticleService;
import cn.edu.xmu.service.PersonService;
import cn.edu.xmu.util.Common;
import cn.edu.xmu.util.WebTool;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UploadArticleAction extends ActionSupport {

	/**
	 * @Fields articleService : 业务逻辑组件
	 */
	@Resource(name = "articleService")
	ArticleService articleService;
	
	@Resource(name = "personService")
	PersonService personService;
	
	private File file;
	private String fileFileName;
	private String fileContentType;
	private String title;
	private String content;
	private List<String> time;
	
	private String account;
	private String column_id;
	/**
	 * getter method
	 * 
	 * @return the file
	 */

	public File getFile() {
		return file;
	}

	/**
	 * setter method
	 * 
	 * @param file
	 *            the file to set
	 */

	public void setFile(File file) {
		this.file = file;
	}

	/**
	 * getter method
	 * 
	 * @return the fileFileName
	 */

	public String getFileFileName() {
		return fileFileName;
	}

	/**
	 * setter method
	 * 
	 * @param fileFileName
	 *            the fileFileName to set
	 */

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	/**
	 * getter method
	 * 
	 * @return the fileContentType
	 */

	public String getFileContentType() {
		return fileContentType;
	}

	/**
	 * setter method
	 * 
	 * @param fileContentType
	 *            the fileContentType to set
	 */

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	/**
	 * getter method
	 * 
	 * @return the title
	 */

	public String getTitle() {
		return title;
	}

	/**
	 * setter method
	 * 
	 * @param title
	 *            the title to set
	 */

	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * getter method
	 * 
	 * @return the content
	 */

	public String getContent() {
		return content;
	}

	/**
	 * setter method
	 * 
	 * @param content
	 *            the content to set
	 */

	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * getter method
	 * 
	 * @return the articleService
	 */

	public ArticleService getArticleService() {
		return articleService;
	}

	/**
	 * setter method
	 * 
	 * @param articleService
	 *            the articleService to set
	 */

	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}

	/**
	 * getter method
	 * 
	 * @return the time
	 */

	public List<String> getTime() {
		return time;
	}

	/**
	 * setter method
	 * 
	 * @param time
	 *            the time to set
	 */

	public void setTime(List<String> time) {
		this.time = time;
	}

	
	
	/**
	 * getter method
	 * @return the account
	 */
	
	public String getAccount() {
		return account;
	}

	/**
	 * setter method
	 * @param account the account to set
	 */
	
	public void setAccount(String account) {
		this.account = account;
	}

	/**
	 * getter method
	 * @return the column_id
	 */
	
	public String getColumn_id() {
		return column_id;
	}

	/**
	 * setter method
	 * @param column_id the column_id to set
	 */
	
	public void setColumn_id(String column_id) {
		this.column_id = column_id;
	}

	@Override
	public String execute() throws Exception {
		upInfo();
		WebTool.confirmMessage("继续添加资讯？", "forward!goInfo",
				"uploadArticle!backIndex");
		return null;
	}

	public String backIndex() throws Exception {
		return SUCCESS;
	}

	public String backstageUp() throws Exception {
		upInfo();
		return "backUpSuccess";
	}

	public void upInfo() throws IOException{
		StringBuilder times = new StringBuilder();
		for (int i = 0; i < this.getTime().size(); i++) {
			times.append(this.getTime().get(i));
			if (i != this.getTime().size() - 1) {
				times.append(",");
			}
		}

		// System.out.println(times.toString());

		String path = Common.PLAT_SRC + Common.ARTICLE_SRC;
		String suffix = getFileFileName().substring(
				getFileFileName().indexOf("."), getFileFileName().length());
		String filename = System.currentTimeMillis() + suffix;
		File file = getFile();
		Article article = new Article();
		article.setContent(getContent());
		article.setImage(filename);
		Person p = new Person();
		p = (Person) ActionContext.getContext().getSession().get("person");
		// System.out.println(p.getAccount());
		article.setPerson(p);
		article.setTitle(getTitle());
		article.setUptime(new Date());
		article.setType(0);
		article.setPass(0);
		article.setTime(times.toString());
		articleService.saveArticle(article);
		WebTool.upFile(path, filename, file);
	}
	
	public String executeAd() throws IOException{
		upAd();
		WebTool.confirmMessage("继续添加广告？", "forward!goAd",
				"uploadArticle!backIndex");
		return null;
	}
	
	public String backstageUpAd() throws IOException{
		upAd();
		return "backUpadSuccess";
	}
	
	public void upAd() throws IOException{
		StringBuilder times = new StringBuilder();
		for (int i = 0; i < this.getTime().size(); i++) {
			times.append(this.getTime().get(i));
			if (i != this.getTime().size() - 1) {
				times.append(",");
			}
		}

		// System.out.println(times.toString());

		String path = Common.PLAT_SRC + Common.ARTICLE_SRC;
		String suffix = getFileFileName().substring(
				getFileFileName().indexOf("."), getFileFileName().length());
		String filename = System.currentTimeMillis() + suffix;
		File file = getFile();
		Article article = new Article();
		article.setContent(getContent());
		article.setImage(filename);
		Person p = new Person();
		p = personService.checkAccount(getAccount());
		// System.out.println(p.getAccount());
		if(p != null)
	    	article.setPerson(p);
		article.setTitle(getTitle());
		article.setUptime(new Date());
		article.setType(1);
		article.setPass(0);
		article.setTime(times.toString());
		article.setColumn_id(getColumn_id());
		articleService.saveArticle(article);
		WebTool.upFile(path, filename, file);
	}
}

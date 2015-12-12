package cn.edu.xmu.action;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.entity.Article;
import cn.edu.xmu.entity.Person;
import cn.edu.xmu.service.ArticleService;
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

	private File file;
	private String fileFileName;
	private String fileContentType;
	private String title;
	private String content;
	private List<String> time;

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

	@Override
	public String execute() throws Exception {
		StringBuilder times = new StringBuilder();
		for (int i = 0; i < this.getTime().size(); i++) {
			times.append(this.getTime().get(i));
			if (i != this.getTime().size() - 1) {
				times.append(",");
			}
		}

		// System.out.println(times.toString());

		String path = Common.PLAT_SRC + Common.INFO_SRC;
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
		WebTool.confirmMessage("继续添加资讯？", "forward!goInfo",
				"uploadinfo!backIndex");
		return null;
	}

	public String backIndex() throws Exception {
		return SUCCESS;
	}

	public String backstageUp() throws Exception {
		StringBuilder times = new StringBuilder();
		for (int i = 0; i < this.getTime().size(); i++) {
			times.append(this.getTime().get(i));
			if (i != this.getTime().size() - 1) {
				times.append(",");
			}
		}

		// System.out.println(times.toString());

		String path = Common.PLAT_SRC + Common.INFO_SRC;
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
		return "backUpSuccess";
	}

}

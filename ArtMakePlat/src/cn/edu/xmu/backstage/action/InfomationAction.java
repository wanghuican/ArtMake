/**
 * @Title: InfomationAction.java
 * @Package cn.edu.xmu.backstage.action
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月8日 下午7:23:49
 * @version V1.0
 */

package cn.edu.xmu.backstage.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.edu.xmu.entity.Article;
import cn.edu.xmu.entity.Person;
import cn.edu.xmu.service.ArticleService;
import cn.edu.xmu.service.LoginService;
import cn.edu.xmu.util.CTool;
import cn.edu.xmu.util.Common;
import cn.edu.xmu.util.WebTool;

/**
 * @ClassName: InfomationAction
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月8日 下午7:23:49
 */

public class InfomationAction extends ActionSupport{

	/**
	 * @Fields articleService : 业务逻辑组件
	 */
	@Resource(name = "articleService")
	ArticleService articleService;

	private List<Article> articleList;
	
	private int id;
	
	private Article article;

	private String result;
	
	/**
	 * getter method
	 * @return the articleService
	 */
	public ArticleService getArticleService() {
		return articleService;
	}

	/**
	 * setter method
	 * @param articleService the articleService to set
	 */
	
	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}
	
	/**
	 * getter method
	 * @return the articleList
	 */
	
	public List<Article> getArticleList() {
		return articleList;
	}

	/**
	 * setter method
	 * @param articleList the articleList to set
	 */
	
	public void setArticleList(List<Article> articleList) {
		this.articleList = articleList;
	}

	
	
	/**
	 * getter method
	 * @return the id
	 */
	
	public int getId() {
		return id;
	}

	/**
	 * setter method
	 * @param id the id to set
	 */
	
	public void setId(int id) {
		this.id = id;
	}

	
	
	/**
	 * getter method
	 * @return the article
	 */
	
	public Article getArticle() {
		return article;
	}

	/**
	 * setter method
	 * @param article the article to set
	 */
	
	public void setArticle(Article article) {
		this.article = article;
	}

	
	
	/**
	 * getter method
	 * @return the result
	 */
	
	public String getResult() {
		return result;
	}

	/**
	 * setter method
	 * @param result the result to set
	 */
	
	public void setResult(String result) {
		this.result = result;
	}

	/*
	  * Title: execute
	  * Description:
	  * @return
	  * @throws Exception
	  * @see com.opensymphony.xwork2.ActionSupport#execute()
	  */
	@Override
	public String execute() throws Exception {
		// 登录前清空所有session
		List pro = new ArrayList<>();
		int page = 1;
		int count = articleService.getInfoCount(pro);
		page = WebTool.dealPage(count,page);
		setArticleList(articleService.getInfoList(pro,page,Common.BACKSTAGE_PAGESIZE));
		WebTool.getRequest().setAttribute("IMGSRC", Common.INFO_SRC);
		return INPUT;
	}
	
	public String goShow(){
		Article article = articleService.getArticleById(getId());
		setArticle(article);
		WebTool.getRequest().setAttribute("IMGSRC", Common.INFO_SRC);
		return "show";
	}
	
	public void deleteInfo() throws IOException{
		articleService.deleteArticleById(getId());
		WebTool.alertMessage("删除资讯成功", "articleCheck");
	}
	
	public String changePass() throws IOException{
		Article article = articleService.getArticleById(getId());
		articleService.changePass(article);
		String[] message = new String[2];
		message[0] = "取消通过成功";
		message[1] = "通过成功";
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("message", message[article.getPass()]);
		map.put("pass", article.getPass());
		map.put("id", getId());
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		return SUCCESS;
	}
}

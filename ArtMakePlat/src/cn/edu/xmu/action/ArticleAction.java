/**
 * @Title: IndexAction.java
 * @Package cn.edu.xmu.action
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月13日 上午2:32:11
 * @version V1.0
 */

package cn.edu.xmu.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import cn.edu.xmu.entity.Article;
import cn.edu.xmu.entity.JsonEntity;
import cn.edu.xmu.service.ArticleService;
import cn.edu.xmu.util.Common;
import cn.edu.xmu.util.DateHandler;
import cn.edu.xmu.util.JSONUtils;
import cn.edu.xmu.util.WebTool;

import com.opensymphony.xwork2.ActionSupport;


/**
 * @ClassName: IndexAction
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月13日 上午2:32:11
 */

public class ArticleAction extends ActionSupport {
	
	/**
	 * @Fields articleService : 业务逻辑组件
	 */
	@Resource(name = "articleService")
	ArticleService articleService;
	
	private List<Article> articleList;
	
	private Article article;
	
	private int id;
	
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



	/*
	  * Title: execute
	  * Description:
	  * @return
	  * @throws Exception
	  * @see com.opensymphony.xwork2.ActionSupport#execute()
	  */
	@Override
	public String execute() throws Exception {
		int page = 1;
		List<Article> articleList = articleService.getInfoListToday(page,Common.PAGESIZE);
		int count = articleService.getTodayInfoCount();
		page = WebTool.dealPage(count, page,Common.PAGESIZE);
		setArticleList(articleList);
		if(articleList.size() != 0)
	    	setArticle(articleList.get(0));
		WebTool.goInfoSrc();
		return SUCCESS;
	}
	
	public String goPageInfo(){
		int count = articleService.getTodayInfoCount();
		int page = 0;
		page = WebTool.dealPage(count, page,Common.PAGESIZE);
		List<Article> articleList = articleService.getInfoListToday(page,Common.PAGESIZE);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page", page);
		map.put("rows", WebTool.listToJsonStr(articleList));
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		//WebTool.printOb(result);
		return SUCCESS;
	}
	
	public String goInfo(){
		int id = getId();
		Article article = articleService.getArticleById(id);	
		result = article.toJsonString();
		//WebTool.printOb(result);
		return SUCCESS;
	}
	
	public String goDetail(){
		int count = articleService.getTodayInfoCount();
		int page = 0;
		page = WebTool.dealPage(count, page,Common.PAGESIZE);
		int id = getId();
		Article article = articleService.getArticleById(id);
		setArticle(article);
		List<Article> articleList = articleService.getInfoListToday(page,Common.PAGESIZE);
		setArticleList(articleList);
		WebTool.goInfoSrc();
		return "detail";
	}
}

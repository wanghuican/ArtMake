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

import java.util.List;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.edu.xmu.entity.Article;
import cn.edu.xmu.entity.Person;
import cn.edu.xmu.service.ArticleService;
import cn.edu.xmu.service.LoginService;

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
		String[] str = null;
		setArticleList(articleService.getArticleList(str));
		return INPUT;
	}
}

/**
 * @Title: AdvertisementAction.java
 * @Package cn.edu.xmu.backstage.action
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月14日 上午11:30:29
 * @version V1.0
 */

package cn.edu.xmu.backstage.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.entity.Article;
import cn.edu.xmu.service.ArticleService;
import cn.edu.xmu.util.Common;
import cn.edu.xmu.util.WebTool;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @ClassName: AdvertisementAction
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月14日 上午11:30:29
 */

public class AdvertisementAction extends ActionSupport{

	/**
	 * @Fields articleService : 业务逻辑组件
	 */
	@Resource(name = "articleService")
	ArticleService articleService;
	
	private List<Article> articleList;
	
	private List<String> selectpro;
	
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
	 * @return the selectpro
	 */
	
	public List<String> getSelectpro() {
		return selectpro;
	}

	/**
	 * setter method
	 * @param selectpro the selectpro to set
	 */
	
	public void setSelectpro(List<String> selectpro) {
		this.selectpro = selectpro;
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
		
		if(getSelectpro() != null){
			selectpro = WebTool.dealProList(selectpro);
			//WebTool.printList(selectpro);
		}else{
			selectpro = new ArrayList<String>();
		}
		int page = 1;
		int count = articleService.getInfoCount(selectpro);
		page = WebTool.dealPage(count,page,Common.BACKSTAGE_PAGESIZE);
		setArticleList(articleService.getInfoList(selectpro,page,Common.BACKSTAGE_PAGESIZE));
		WebTool.goInfoSrc();
		return INPUT;
	}
	
}

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

import java.io.File;
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

public class ArticleAction extends ActionSupport{

	/**
	 * @Fields articleService : 业务逻辑组件
	 */
	@Resource(name = "articleService")
	ArticleService articleService;

	private List<Article> articleList;
	
	private int id;
	
	private Article article;

	private String result;

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
			setSelectpro(getSelectpro());
			selectpro = WebTool.dealProList(selectpro);
			//WebTool.printList(selectpro);
		}else{
			selectpro = new ArrayList<String>();
		}
		int page = 1;
		int count = articleService.getInfoCount(selectpro);
		page = WebTool.dealPage(count,page,Common.BACKSTAGE_PAGESIZE);
		setArticleList(articleService.getInfoList(selectpro,page,Common.BACKSTAGE_PAGESIZE));
		WebTool.getArticleSrc();
		return INPUT;
	}
	
	public String goShow(){
		Article article = articleService.getArticleById(getId());
		setArticle(article);
		WebTool.getArticleSrc();
		return "show";
	}
	
	public void deleteInfo() throws IOException{
		String imagepath = Common.PLAT_SRC + Common.ARTICLE_SRC +"/" + articleService.getArticleById(getId()).getImage();
		Article article = articleService.getArticleById(getId());
		int type = article.getType();
		articleService.deleteArticleById(getId());
		File imgfile = new File(imagepath);
		WebTool.deleteFile(imgfile);
		if(type == 0)
	    	WebTool.alertMessage("删除资讯成功", "articleCheck");
		else
			WebTool.alertMessage("删除资讯成功", "articleCheck!goAd");
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
	
	public void ndelInfo() throws IOException{
		String[] aids = WebTool.getNids();
		Article article = articleService.getArticleById(Integer.parseInt(aids[0]));
		int type = article.getType();
		for(String aid:aids){
			articleService.deleteArticleById(Integer.parseInt(aid));
	    	System.out.print(aid);	
		}
		if(type == 0)
	    	WebTool.alertMessage("删除资讯成功", "articleCheck");
		else
			WebTool.alertMessage("删除资讯成功", "articleCheck!goAd");
	}
	
	public String nchangePass(){
		String[] aids = WebTool.getNids();
		for(String aid:aids){
			Article article = articleService.getArticleById(Integer.parseInt(aid));
			articleService.changePass(article);
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("message", "通过成功");
		map.put("aids", aids);
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		//System.out.println(result);
		return SUCCESS;
	}
	
	public String goAd(){
		if(getSelectpro() != null){
			setSelectpro(getSelectpro());
			selectpro = WebTool.dealProList(selectpro);
			//WebTool.printList(selectpro);
		}else{
			selectpro = new ArrayList<String>();
		}
		int page = 1;
		int count = articleService.getAdCount(selectpro);
		page = WebTool.dealPage(count,page,Common.BACKSTAGE_PAGESIZE);
		setArticleList(articleService.getAdList(selectpro,page,Common.BACKSTAGE_PAGESIZE));
		WebTool.getArticleSrc();
		return "ad";
	}	
}

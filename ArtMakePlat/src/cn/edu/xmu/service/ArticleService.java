/**
 * @Title: ArticleService.java
 * @Package cn.edu.xmu.service
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月8日 下午7:14:00
 * @version V1.0
 */

package cn.edu.xmu.service;

import java.util.List;

import cn.edu.xmu.entity.Article;

/**
 * @ClassName: ArticleService
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月8日 下午7:14:00
 */

public interface ArticleService {
	
	public List<Article> getArticleList(String pro[]);
	
	public void saveArticle(Article article);
}

/**
 * @Title: ArticleDao.java
 * @Package cn.edu.xmu.dao
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月8日 下午7:06:34
 * @version V1.0
 */

package cn.edu.xmu.dao;

import java.util.List;

import cn.edu.xmu.entity.Article;

/**
 * @ClassName: ArticleDao
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月8日 下午7:06:34
 */

public interface ArticleDao {
	
	public List<Article> getArticleListToday(int type);
	
	public List<Article> getArticleListToday(int type,int pageNo, int pageSize);
	
	public List<Article> getArticleList(int type,List<String> pro);
	
	public List<Article> getArticleList(int type,List<String> pro, int pageNo, int pageSize);
	
	public int countColumn(List<String> pro);
	
	public int countArticle(int type,List<String> pro);
	
	public int countTodayArticle(int type);
	
	public void saveArticle(Article article);
	
	public Article getArticleById(int id);
	
	public void deleteArticleById(int id);
}

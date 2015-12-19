/**
 * @Title: ArticleDaoImpl.java
 * @Package cn.edu.xmu.daoImpl
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月8日 下午7:08:52
 * @version V1.0
 */

package cn.edu.xmu.daoImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.dao.ArticleDao;
import cn.edu.xmu.dao.BaseDao;
import cn.edu.xmu.entity.Article;
import cn.edu.xmu.util.Common;
import cn.edu.xmu.util.DateHandler;
import cn.edu.xmu.util.WebTool;

/**
 * @ClassName: ArticleDaoImpl
 * @Description: TODO team: 3-10打屁屁小队
 * @date 2015年12月8日 下午7:08:52
 */

public class ArticleDaoImpl implements ArticleDao {

	/**
	 * @Fields dao : dao组件
	 */
	@Resource(name = "DAOProxy")
	BaseDao dao;

	public List<Article> getArticleListToday(int type) {
		// TODO Auto-generated method stub	
				List<Article> articleList  = new ArrayList<Article>();
				List<String> pro = new ArrayList<String>();
				pro.add(DateHandler.getToday());
				WebTool.dealStrProList(pro);
				pro.add("1");
				pro.add(type+"");
			    articleList = dao.query(Common.HQL_ARTICLELIST_TODAY,pro);
			    pro.remove(pro.size()-1);
				return articleList;
	}
	
	/*
	  * Title: getArticleListToday
	  * Description:
	  * @param type
	  * @param pro
	  * @param pageNo
	  * @param pageSize
	  * @return
	  * @see cn.edu.xmu.dao.ArticleDao#getArticleListToday(int, java.util.List, int, int)
	  */
	public List<Article> getArticleListToday(int type,int pageNo, int pageSize) {
		// TODO Auto-generated method stub	
				List<Article> articleList  = new ArrayList<Article>();
				List<String> pro = new ArrayList<String>();
				pro.add(DateHandler.getToday());
				WebTool.dealStrProList(pro);
				pro.add("1");
				pro.add(type+"");
			    articleList = dao.query(Common.HQL_ARTICLELIST_TODAY,pro,pageNo, pageSize);
			    pro.remove(pro.size()-1);
				return articleList;
	}

	/*
	 * Title: getArticleList Description:
	 * 
	 * @return
	 * 
	 * @see cn.edu.xmu.dao.ArticleDao#getArticleList()
	 */

	@Override
	public List<Article> getArticleList(int type, List<String> pro) {
		// TODO Auto-generated method stub
		List<Article> articleList = new ArrayList<Article>();
		if (pro.size() == 0) {
			pro.add(type + "");
			articleList = dao.query(Common.HQL_ARTICLELIST, pro);
			pro.remove(pro.size() - 1);
		} else {
			pro.add(type + "");
			if(type == 0)
		    	articleList = dao.query(Common.HQL_INFOLIST_SELECT, pro);
			else
				articleList = dao.query(Common.HQL_ADLIST_SELECT, pro);
			pro.remove(pro.size() - 1);
		}
		return articleList;
	}

	/*
	 * Title: getArticleList Description:
	 * 
	 * @param type
	 * 
	 * @param pageNo
	 * 
	 * @param pageSize
	 * 
	 * @return
	 * 
	 * @see cn.edu.xmu.dao.ArticleDao#getArticleList(int, int, int)
	 */
	@Override
	public List<Article> getArticleList(int type,List<String> pro, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		List<Article> articleList = new ArrayList<Article>();
		if (pro.size() == 0) {
			pro.add(type + "");
			articleList = dao.query(Common.HQL_ARTICLELIST, pro, pageNo,
					pageSize);
			pro.remove(pro.size() - 1);
		} else {
			pro.add(type + "");
			if(type == 0)
	     		articleList = dao.query(Common.HQL_INFOLIST_SELECT, pro, pageNo,
		    			pageSize);
			else
				articleList = dao.query(Common.HQL_ADLIST_SELECT, pro, pageNo,
		    			pageSize);
			pro.remove(pro.size() - 1);
		}
		return articleList;
	}


	public int countColumn(List<String> pro){
		int count = dao.countQuery(Common.HQL_ADCOUNT, pro);
		return count;
	}
	
	/*
	 * Title: countArticle Description:
	 * 
	 * @param type
	 * 
	 * @return
	 * 
	 * @see cn.edu.xmu.dao.ArticleDao#countArticle(int)
	 */
	@Override
	public int countArticle(int type, List<String> pro) {
		// TODO Auto-generated method stub
		int count = getArticleList(type, pro).size();
		return count;
	}
	
	public int countTodayArticle(int type){
		int count = this.getArticleListToday(type).size();
		return count;
	}

	/*
	 * Title: saveArticle Description:
	 * 
	 * @param article
	 * 
	 * @see cn.edu.xmu.dao.ArticleDao#saveArticle(cn.edu.xmu.entity.Article)
	 */
	public void saveArticle(Article article) {
		dao.saveOrUpdate(article);
	}

	@Override
	public Article getArticleById(int id) {
		// TODO Auto-generated method stub
		return (Article) dao.loadById(Article.class, id);
	}

	@Override
	public void deleteArticleById(int id) {
		// TODO Auto-generated method stub
		dao.delById(Article.class, id);
	}

}

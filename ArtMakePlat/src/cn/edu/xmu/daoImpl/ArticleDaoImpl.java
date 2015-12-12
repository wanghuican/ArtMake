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

/**
 * @ClassName: ArticleDaoImpl
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月8日 下午7:08:52
 */

public class ArticleDaoImpl implements ArticleDao {

	/**
     * @Fields dao : dao组件
     */
   @Resource(name="DAOProxy")
    BaseDao dao ;
   
	
	/*
	 * Title: getArticleList
	 * Description:
	 * @return
	 * @see cn.edu.xmu.dao.ArticleDao#getArticleList()
	 */

	@Override
	public List<Article> getArticleList(int type) {
		// TODO Auto-generated method stub	
		List<Integer> pro = new ArrayList<Integer>();
		pro.add(type);
		List<Article> articleList = dao.query(Common.HQL_ARTICLELIST,pro);
		return articleList;
	}



	/*
	  * Title: getArticleList
	  * Description:
	  * @param type
	  * @param pageNo
	  * @param pageSize
	  * @return
	  * @see cn.edu.xmu.dao.ArticleDao#getArticleList(int, int, int)
	  */
	@Override
	public List<Article> getArticleList(int type, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		List<Integer> pro = new ArrayList<Integer>();
		pro.add(type);
		List<Article> articleList = dao.query(Common.HQL_ARTICLELIST,pro,pageNo,pageSize);
		return articleList;
	}

	/*
	  * Title: countArticle
	  * Description:
	  * @param type
	  * @return
	  * @see cn.edu.xmu.dao.ArticleDao#countArticle(int)
	  */
	@Override
	public int countArticle(int type) {
		// TODO Auto-generated method stub
		List<Integer> pro = new ArrayList<Integer>();
		pro.add(type);
		int count = dao.countQuery(Common.HQL_COUNT_ARTICLE,pro);
		return count;
	}
	
	/*
	  * Title: saveArticle
	  * Description:
	  * @param article
	  * @see cn.edu.xmu.dao.ArticleDao#saveArticle(cn.edu.xmu.entity.Article)
	  */
	public void saveArticle(Article article){
		dao.saveOrUpdate(article);
	}



	@Override
	public Article getArticleById(int id) {
		// TODO Auto-generated method stub
		return (Article)dao.loadById(Article.class, id);
	}



	@Override
	public void deleteArticleById(int id) {
		// TODO Auto-generated method stub
		dao.delById(Article.class, id);
	}

}

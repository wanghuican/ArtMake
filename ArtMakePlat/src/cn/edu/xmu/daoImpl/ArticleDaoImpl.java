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
   @Resource(name="dao")
    BaseDao dao ;
   
	
	/*
	 * Title: getArticleList
	 * Description:
	 * @return
	 * @see cn.edu.xmu.dao.ArticleDao#getArticleList()
	 */

	@Override
	public List<Article> getArticleList() {
		// TODO Auto-generated method stub		
		List<Article> articleList = dao.listAll(Common.TABLE_ARTICLE);
		return articleList;
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
}

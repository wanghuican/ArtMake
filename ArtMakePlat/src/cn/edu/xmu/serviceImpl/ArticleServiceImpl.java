/**
 * @Title: ArticleServiceImpl.java
 * @Package cn.edu.xmu.serviceImpl
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月8日 下午7:17:09
 * @version V1.0
 */

package cn.edu.xmu.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.dao.ArticleDao;
import cn.edu.xmu.entity.Article;
import cn.edu.xmu.service.ArticleService;

/**
 * @ClassName: ArticleServiceImpl
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月8日 下午7:17:09
 */

public class ArticleServiceImpl implements ArticleService {

	/**
     * @Fields dao : dao组件
     */
   @Resource(name="articledao")
    ArticleDao dao ;
	
	/*
	 * Title: getArticleList
	 * Description:
	 * @return
	 * @see cn.edu.xmu.service.ArticleService#getArticleList()
	 */

	@Override
	public List<Article> getArticleList(String pro[]) {
		// TODO Auto-generated method stub
		List<Article> articleList = new ArrayList<Article>();
		if(pro == null){
			articleList = dao.getArticleList();
		}
		return articleList;
	}

	@Override
	public void saveArticle(Article article) {
		// TODO Auto-generated method stub
		dao.saveArticle(article);
	}

}

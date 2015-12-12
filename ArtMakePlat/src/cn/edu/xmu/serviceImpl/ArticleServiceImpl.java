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
	public List<Article> getInfoList(List pro,int pageNo,int pageSize) {
		// TODO Auto-generated method stub
		List<Article> articleList = new ArrayList<Article>();
		if(pro.size() == 0){
			articleList = dao.getArticleList(0,pageNo,pageSize);
		}
		return articleList;
	}
	
	@Override
	public int getInfoCount(List pro) {
		// TODO Auto-generated method stub
		int count = 0;
		if(pro.size() == 0){
			count = dao.countArticle(0);
		}
		return count;
	}

	@Override
	public void saveArticle(Article article) {
		// TODO Auto-generated method stub
		dao.saveArticle(article);
	}

	@Override
	public Article getArticleById(int id) {
		// TODO Auto-generated method stub
		return dao.getArticleById(id);
	}

	@Override
	public void deleteArticleById(int id) {
		// TODO Auto-generated method stub
		dao.deleteArticleById(id);
	}

	@Override
	public void changePass(Article article) {
		// TODO Auto-generated method stub
		if(article.getPass() == 0){
			article.setPass(1);
		}else{
			article.setPass(0);
		}
		dao.saveArticle(article);
	}
	
}

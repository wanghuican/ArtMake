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
import cn.edu.xmu.util.DateHandler;
import cn.edu.xmu.util.DateUtil;
import cn.edu.xmu.util.WebTool;

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
	  * Title: getInfoListToday
	  * Description:
	  * @return
	  * @see cn.edu.xmu.service.ArticleService#getInfoListToday()
	  */
	@Override
	public List<Article> getInfoListToday(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		List<Article> articleList = new ArrayList<Article>();
		articleList = dao.getArticleListToday(0,pageNo,pageSize);
		return articleList;
	}
	

	/*
	  * Title: getBigAdListToday
	  * Description:
	  * @param pro
	  * @param articleList1
	  * @param ListArticle2
	  * @see cn.edu.xmu.service.ArticleService#getBigAdListToday(java.util.List, java.util.List, java.util.List)
	  */
	@Override
	public void getAdListToday(List<Article> bigarticleList,List<Article> smallarticleList){
		// TODO Auto-generated method stub
		List<Article> articleList = dao.getArticleListToday(1);
		for(int i=0;i<articleList.size();i++)
			if(articleList.get(i).getColumn_id().equals("big")){
				bigarticleList.add(articleList.get(i));
			}else{
				smallarticleList.add(articleList.get(i));
			}
	}


	@Override
	public List<Article> getInfoList(List<String> pro,int pageNo,int pageSize) {
		// TODO Auto-generated method stub
		List<Article> articleList = new ArrayList<Article>();
		articleList = dao.getArticleList(0,pro,pageNo,pageSize);
		return articleList;
	}
	
	/*
	  * Title: getAdList
	  * Description:
	  * @param pro
	  * @param pageNo
	  * @param pageSize
	  * @return
	  * @see cn.edu.xmu.service.ArticleService#getAdList(java.util.List, int, int)
	  */
	public List<Article> getAdList(List<String> pro,int pageNo,int pageSize) {
		List<Article> articleList = new ArrayList<Article>();
		articleList = dao.getArticleList(1,pro,pageNo,pageSize);
		return articleList;
	}
		
	@Override
	public int getInfoCount(List<String> pro) {
		// TODO Auto-generated method stub
		int count = 0;
		count = dao.countArticle(0,pro);
		return count;
	}
	
	@Override
	public int getAdCount(List<String> pro) {
		// TODO Auto-generated method stub
		int count = 0;
		count = dao.countArticle(1,pro);
		return count;
	}
	
	@Override
	public int getTodayInfoCount() {
		// TODO Auto-generated method stub
		int count = 0;
		count = dao.countTodayArticle(0);
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
	
	@Override
	public int getTodayAdCount(String column){
		List<String> pro = new ArrayList<String>();
		pro.add(column);
		pro.add(DateHandler.getToday());
		pro.add("1");
		WebTool.dealProList(pro);
		int count = dao.countColumn(pro);
		return count;
	}
	@Override
	public int getTomorrowAdCount(String column){
		List<String> pro = new ArrayList<String>();
		pro.add(column);
		pro.add(DateHandler.getTomorrow());
		pro.add("1");
		WebTool.dealProList(pro);
		int count = dao.countColumn(pro);
		return count;
	}
}

package cn.edu.xmu.dao;

import java.util.List;

import cn.edu.xmu.entity.Article;
import cn.edu.xmu.entity.Auth;
import cn.edu.xmu.entity.Role;


/**
  * @ClassName: AuthDao
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月18日 下午5:40:54
  */
public interface AuthDao {
	
	public List<Auth> getAllAuth(List<Integer> pro);
	
	public List<Auth> getAllAuth(List<Integer> pro,int pageNo,int pageSize);
	
	public int countAuth(List<Integer> pro);
	
	public void saveAuth(Auth auth);
	
	public void deleteAuthById(int id);
	
	public Auth getAuthById(int id);
}

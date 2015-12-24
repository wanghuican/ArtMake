package cn.edu.xmu.dao;

import java.util.List;

import cn.edu.xmu.entity.Key;
import cn.edu.xmu.entity.Perkey;

/**
  * @ClassName: KeyDao
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月19日 下午1:29:40
  */
public interface KeyDao {
	
	public List<Key> getAllKey(List<Integer> pro);
	
	public List<Key> getAllKey(List<Integer> pro,int pageNo,int pageSize);
	
	public int countKey(List<Integer> pro);
	
	public void saveKey(Key Key);
	
	public void deleteKeyById(int id);
	
	public Key getKeyById(int id);
	
	public void deletePerkeyById(int id);
}

package cn.edu.xmu.service;

import java.util.List;

import cn.edu.xmu.entity.Key;
import cn.edu.xmu.entity.Perkey;


/**
  * @ClassName: KeyService
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月19日 下午1:49:23
  */
public interface KeyService {
	public List<Key> getAllKey(List<Integer> pro);
	
	public List<Key> getAllKey(List<Integer> pro,int pageNo,int pageSize);
	
	public int countKey(List<Integer> pro);
	
	public void deleteKeyById(int id);
	
	public void saveKey(Key Key);
	
	public Key getKeyById(int id);
	
	public void deletePerkeyById(int id);
}

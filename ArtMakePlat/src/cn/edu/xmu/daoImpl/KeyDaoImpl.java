/**
 * @Title: KeyDaoImpl.java
 * @Package cn.edu.xmu.daoImpl
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月19日 下午1:32:54
 * @version V1.0
 */

package cn.edu.xmu.daoImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.dao.BaseDao;
import cn.edu.xmu.dao.KeyDao;
import cn.edu.xmu.entity.Key;
import cn.edu.xmu.entity.Perkey;
import cn.edu.xmu.util.Common;

/**
 * @ClassName: KeyDaoImpl
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月19日 下午1:32:54
 */

public class KeyDaoImpl implements KeyDao {

	/**
	 * @Fields dao : dao组件
	 */
	@Resource(name = "DAOProxy")
	BaseDao dao;
	
	/*
	 * Title: getAllKey
	 * Description:
	 * @param pro
	 * @return
	 * @see cn.edu.xmu.dao.KeyDao#getAllKey(java.util.List)
	 */

	@Override
	public List<Key> getAllKey(List<Integer> pro) {
		// TODO Auto-generated method stub
		List<Key> keyList = new ArrayList<Key>();
		if(pro.size() == 0){
			keyList = dao.query(Common.HQL_KEYLIST);
		}else{
			keyList = dao.query(Common.HQL_KEYLIST_SELECT,pro);
		}
		return keyList;
	}

	/*
	 * Title: getAllKey
	 * Description:
	 * @param pro
	 * @param pageNo
	 * @param pageSize
	 * @return
	 * @see cn.edu.xmu.dao.KeyDao#getAllKey(java.util.List, int, int)
	 */

	@Override
	public List<Key> getAllKey(List<Integer> pro, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		List<Key> keyList = new ArrayList<Key>();
		if(pro.size() == 0){
			keyList = dao.query(Common.HQL_KEYLIST,pageNo,pageSize);
		}else{
			keyList = dao.query(Common.HQL_KEYLIST_SELECT,pro,pageNo,pageSize);
		}
		return keyList;
	}

	/*
	 * Title: countKey
	 * Description:
	 * @param pro
	 * @return
	 * @see cn.edu.xmu.dao.KeyDao#countKey(java.util.List)
	 */

	@Override
	public int countKey(List<Integer> pro) {
		// TODO Auto-generated method stub
		int count = this.getAllKey(pro).size();
		return count;
	}

	/*
	 * Title: saveKey
	 * Description:
	 * @param Key
	 * @see cn.edu.xmu.dao.KeyDao#saveKey(cn.edu.xmu.entity.Key)
	 */

	@Override
	public void saveKey(Key Key) {
		// TODO Auto-generated method stub
		dao.saveOrUpdate(Key);
	}

	/*
	 * Title: deleteKeyById
	 * Description:
	 * @param id
	 * @see cn.edu.xmu.dao.KeyDao#deleteKeyById(int)
	 */

	@Override
	public void deleteKeyById(int id) {
		// TODO Auto-generated method stub
		dao.delById(Key.class, id);
	}

	/*
	 * Title: getKeyById
	 * Description:
	 * @param id
	 * @return
	 * @see cn.edu.xmu.dao.KeyDao#getKeyById(int)
	 */

	@Override
	public Key getKeyById(int id) {
		// TODO Auto-generated method stub
		return (Key)dao.loadById(Key.class, id);
	}
	
	@Override
	public void deletePerkeyById(int id){
		dao.delById(Perkey.class, id);
	}
}

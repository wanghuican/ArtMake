/**
 * @Title: KeyServiceImpl.java
 * @Package cn.edu.xmu.serviceImpl
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月19日 下午1:49:52
 * @version V1.0
 */

package cn.edu.xmu.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.dao.AuthDao;
import cn.edu.xmu.dao.KeyDao;
import cn.edu.xmu.entity.Key;
import cn.edu.xmu.service.KeyService;

/**
 * @ClassName: KeyServiceImpl
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月19日 下午1:49:52
 */

public class KeyServiceImpl implements KeyService {

	/**
     * @Fields dao : dao组件
     */
   @Resource(name="keydao")
    KeyDao dao ;
	
	/*
	 * Title: getAllKey
	 * Description:
	 * @param pro
	 * @return
	 * @see cn.edu.xmu.service.KeyService#getAllKey(java.util.List)
	 */

	@Override
	public List<Key> getAllKey(List<Integer> pro) {
		// TODO Auto-generated method stub
		return dao.getAllKey(pro);
	}

	/*
	 * Title: getAllKey
	 * Description:
	 * @param pro
	 * @param pageNo
	 * @param pageSize
	 * @return
	 * @see cn.edu.xmu.service.KeyService#getAllKey(java.util.List, int, int)
	 */

	@Override
	public List<Key> getAllKey(List<Integer> pro, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return dao.getAllKey(pro, pageNo, pageSize);
	}

	/*
	 * Title: countKey
	 * Description:
	 * @param pro
	 * @return
	 * @see cn.edu.xmu.service.KeyService#countKey(java.util.List)
	 */

	@Override
	public int countKey(List<Integer> pro) {
		// TODO Auto-generated method stub
		return dao.countKey(pro);
	}

	/*
	 * Title: deleteKeyById
	 * Description:
	 * @param id
	 * @see cn.edu.xmu.service.KeyService#deleteKeyById(int)
	 */

	@Override
	public void deleteKeyById(int id) {
		// TODO Auto-generated method stub
		dao.deleteKeyById(id);
	}

	/*
	 * Title: saveKey
	 * Description:
	 * @param Key
	 * @see cn.edu.xmu.service.KeyService#saveKey(cn.edu.xmu.entity.Key)
	 */

	@Override
	public void saveKey(Key Key) {
		// TODO Auto-generated method stub
		dao.saveKey(Key);
	}

	/*
	 * Title: getKeyById
	 * Description:
	 * @param id
	 * @return
	 * @see cn.edu.xmu.service.KeyService#getKeyById(int)
	 */

	@Override
	public Key getKeyById(int id) {
		// TODO Auto-generated method stub
		return dao.getKeyById(id);
	}

}

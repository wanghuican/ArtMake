/**
 * @Title: AuthDaoImpl.java
 * @Package cn.edu.xmu.daoImpl
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月18日 下午5:42:31
 * @version V1.0
 */

package cn.edu.xmu.daoImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.dao.AuthDao;
import cn.edu.xmu.dao.BaseDao;
import cn.edu.xmu.entity.Auth;
import cn.edu.xmu.entity.Role;
import cn.edu.xmu.util.Common;

/**
 * @ClassName: AuthDaoImpl
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月18日 下午5:42:31
 */

public class AuthDaoImpl implements AuthDao {

	/**
	 * @Fields dao : dao组件
	 */
	@Resource(name = "DAOProxy")
	BaseDao dao;
	
	/*
	 * Title: getAllAuth
	 * Description:
	 * @param pro
	 * @return
	 * @see cn.edu.xmu.dao.AuthDao#getAllAuth(java.util.List)
	 */

	@Override
	public List<Auth> getAllAuth(List<Integer> pro) {
		// TODO Auto-generated method stub
		List<Auth> authList = new ArrayList<Auth>();
		if(pro.size() == 0){
			authList = dao.query(Common.HQL_AUTHLIST);
		}else{
			authList = dao.query(Common.HQL_AUTHLIST_SELECT,pro);
		}
		return authList;
	}

	/*
	 * Title: getAllAuth
	 * Description:
	 * @param pro
	 * @param pageNo
	 * @param pageSize
	 * @return
	 * @see cn.edu.xmu.dao.AuthDao#getAllAuth(java.util.List, int, int)
	 */

	@Override
	public List<Auth> getAllAuth(List<Integer> pro, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		List<Auth> authList = new ArrayList<Auth>();
		if(pro.size() == 0){
			authList = dao.query(Common.HQL_AUTHLIST,pageNo,pageSize);
		}else{
			authList = dao.query(Common.HQL_AUTHLIST_SELECT,pro,pageNo,pageSize);
		}
		return authList;
	}

	/*
	 * Title: countAuth
	 * Description:
	 * @param pro
	 * @return
	 * @see cn.edu.xmu.dao.AuthDao#countAuth(java.util.List)
	 */

	@Override
	public int countAuth(List<Integer> pro) {
		// TODO Auto-generated method stub.
		int count = this.getAllAuth(pro).size();
		return count;
	}

	/*
	 * Title: saveAuth
	 * Description:
	 * @param role
	 * @see cn.edu.xmu.dao.AuthDao#saveAuth(cn.edu.xmu.entity.Role)
	 */

	@Override
	public void saveAuth(Auth auth) {
		// TODO Auto-generated method stub
		dao.saveOrUpdate(auth);
	}

	/*
	 * Title: deleteAuthById
	 * Description:
	 * @param id
	 * @see cn.edu.xmu.dao.AuthDao#deleteAuthById(int)
	 */

	@Override
	public void deleteAuthById(int id) {
		// TODO Auto-generated method stub
		dao.delById(Auth.class, id);
	}

	/*
	 * Title: getAuthById
	 * Description:
	 * @param id
	 * @return
	 * @see cn.edu.xmu.dao.AuthDao#getAuthById(int)
	 */

	@Override
	public Auth getAuthById(int id) {
		// TODO Auto-generated method stub
		return (Auth) dao.loadById(Auth.class, id);
	}

	@Override
	public Auth getAuthByRole_id(List<Integer> pro) {
		// TODO Auto-generated method stub
		return (Auth) dao.query(Common.HQL_AUTH,pro).get(0);
	}

}

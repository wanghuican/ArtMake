/**
 * @Title: RoleDaoImpl.java
 * @Package cn.edu.xmu.daoImpl
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月16日 上午12:21:57
 * @version V1.0
 */

package cn.edu.xmu.daoImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.dao.BaseDao;
import cn.edu.xmu.dao.RoleDao;
import cn.edu.xmu.entity.Article;
import cn.edu.xmu.entity.Role;
import cn.edu.xmu.util.Common;

/**
 * @ClassName: RoleDaoImpl
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月16日 上午12:21:57
 */

public class RoleDaoImpl implements RoleDao {

	/**
	 * @Fields dao : dao组件
	 */
	@Resource(name = "DAOProxy")
	BaseDao dao;

	/*
	  * Title: getAllRole
	  * Description:
	  * @param pro
	  * @return
	  * @see cn.edu.xmu.dao.RoleDao#getAllRole(java.util.List)
	  */
	@Override
	public List<Role> getAllRole(List<String> pro) {
		// TODO Auto-generated method stub
		List<Role> roleList = new ArrayList<Role>();
		if(pro.size() == 0){
			roleList = dao.query(Common.HQL_ROLELIST);
		}else{
			roleList = dao.query(Common.HQL_ROLELIST_SELECT,pro);
		}
		return roleList;
	}

	/*
	  * Title: getAllRole
	  * Description:
	  * @param pro
	  * @param pageNo
	  * @param pageSize
	  * @return
	  * @see cn.edu.xmu.dao.RoleDao#getAllRole(java.util.List, int, int)
	  */
	@Override
	public List<Role> getAllRole(List<String> pro, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		List<Role> roleList = new ArrayList<Role>();
		if(pro.size() == 0){
			roleList = dao.query(Common.HQL_ROLELIST,pageNo,pageSize);
		}else{
			roleList = dao.query(Common.HQL_ROLELIST_SELECT,pro,pageNo,pageSize);
		}
		return roleList;
	}

	/*
	  * Title: countRole
	  * Description:
	  * @param pro
	  * @return
	  * @see cn.edu.xmu.dao.RoleDao#countRole(java.util.List)
	  */
	@Override
	public int countRole(List<String> pro) {
		// TODO Auto-generated method stub
		int count = this.getAllRole(pro).size();
		return count;
	}

	/*
	  * Title: saveRole
	  * Description:
	  * @param role
	  * @see cn.edu.xmu.dao.RoleDao#saveRole(cn.edu.xmu.entity.Role)
	  */
	@Override
	public void saveRole(Role role) {
		// TODO Auto-generated method stub
		dao.saveOrUpdate(role);
	}

	/*
	  * Title: deleteRoleById
	  * Description:
	  * @param id
	  * @see cn.edu.xmu.dao.RoleDao#deleteRoleById(int)
	  */
	@Override
	public void deleteRoleById(int id) {
		// TODO Auto-generated method stub
		dao.delById(Role.class, id);
	}

	/*
	  * Title: getRoleById
	  * Description:
	  * @param id
	  * @return
	  * @see cn.edu.xmu.dao.RoleDao#getRoleById(int)
	  */
	@Override
	public Role getRoleById(int id) {
		// TODO Auto-generated method stub
		return (Role) dao.loadById(Role.class, id);
	}

	@Override
	public List<Role> getRoleByCode(List<Integer> pro) {
		// TODO Auto-generated method stub
		
		return dao.query(Common.HQL_ROLELIST_CODE,pro);
	}

	@Override
	public Role getRoleByRoleName(List<String> pro) {
		// TODO Auto-generated method stub
		List<Role> roleList = dao.query(Common.HQL_ROLELIST_ROLENAME,pro);
		if(roleList.size() != 0)
	    	return roleList.get(0);
		return null;
	}

}

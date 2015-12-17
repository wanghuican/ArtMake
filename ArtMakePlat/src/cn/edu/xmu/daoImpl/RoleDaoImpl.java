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

import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.dao.BaseDao;
import cn.edu.xmu.dao.RoleDao;
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
	 * @return
	 * @see cn.edu.xmu.dao.RoleDao#getAllRole()
	 */

	@Override
	public List<Role> getAllRole() {
		// TODO Auto-generated method stub
		return dao.listAll(Common.TABLE_ROLE);
	}

}

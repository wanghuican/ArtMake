/**
 * @Title: RoleServiceImpl.java
 * @Package cn.edu.xmu.serviceImpl
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月16日 上午12:29:50
 * @version V1.0
 */

package cn.edu.xmu.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.dao.ArticleDao;
import cn.edu.xmu.dao.RoleDao;
import cn.edu.xmu.entity.Role;
import cn.edu.xmu.service.RoleService;

/**
 * @ClassName: RoleServiceImpl
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月16日 上午12:29:50
 */

public class RoleServiceImpl implements RoleService {

	
	/**
     * @Fields dao : dao组件
     */
   @Resource(name="roledao")
    RoleDao dao ;

	
	/*
	 * Title: getAllRole
	 * Description:
	 * @return
	 * @see cn.edu.xmu.service.RoleService#getAllRole()
	 */

	@Override
	public List<Role> getAllRole() {
		// TODO Auto-generated method stub
		return dao.getAllRole();
	}

}

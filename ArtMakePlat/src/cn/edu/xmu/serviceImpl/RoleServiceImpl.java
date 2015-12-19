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

import java.util.ArrayList;
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
	public List<Role> getAllRole(List<String> pro) {
		// TODO Auto-generated method stub
		return dao.getAllRole(pro);
	}
	
	/*
	  * Title: getAllRole
	  * Description:
	  * @param pro
	  * @param pageNo
	  * @param pageSize
	  * @return
	  * @see cn.edu.xmu.service.RoleService#getAllRole(java.util.List, int, int)
	  */
	@Override
	public List<Role> getAllRole(List<String> pro,int pageNo,int pageSize){
		return dao.getAllRole(pro, pageNo, pageSize);
	}

	@Override
	public int countRole(List<String> pro) {
		// TODO Auto-generated method stub
		return dao.countRole(pro);
	}

	@Override
	public void deleteRoleById(int id) {
		// TODO Auto-generated method stub
		dao.deleteRoleById(id);
	}

	@Override
	public void saveRole(Role role) {
		// TODO Auto-generated method stub
		dao.saveRole(role);
	}
	
	@Override
	public Role getRoleById(int id){
		return dao.getRoleById(id);
	}
	
	@Override
	public List<Role> getRoleByCode(int code){
		List<Integer> pro = new ArrayList<Integer>();
		pro.add(code);
		return dao.getRoleByCode(pro);
	}

	@Override
	public Role getRoleByRoleName(String rolename) {
		// TODO Auto-generated method stub
		List<String> pro = new ArrayList<String>();
		pro.add(rolename);
		return dao.getRoleByRoleName(pro);
	}
	
}

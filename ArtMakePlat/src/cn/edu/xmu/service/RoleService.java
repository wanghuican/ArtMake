/**
 * @Title: RoleService.java
 * @Package cn.edu.xmu.service
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月16日 上午12:25:31
 * @version V1.0
 */

package cn.edu.xmu.service;

import java.util.List;

import cn.edu.xmu.entity.Role;

/**
 * @ClassName: RoleService
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月16日 上午12:25:31
 */

public interface RoleService {
	public List<Role> getAllRole(List<String> pro);
	
	public List<Role> getAllRole(List<String> pro,int pageNo,int pageSize);
	
	public int countRole(List<String> pro);
	
	public void deleteRoleById(int id);
	
	public void saveRole(Role role);
	
	public Role getRoleById(int id);
	
	public List<Role> getRoleByCode(int code);
	
	public Role getRoleByRoleName(String rolename);
}

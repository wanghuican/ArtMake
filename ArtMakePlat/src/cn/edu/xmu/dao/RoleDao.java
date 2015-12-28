package cn.edu.xmu.dao;

import java.util.List;

import cn.edu.xmu.entity.Article;
import cn.edu.xmu.entity.Role;

/**
  * @ClassName: RoleDao
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月16日 上午12:20:49
  */
public interface RoleDao {
	
	public List<Role> getAllRole(List<String> pro);
	
	public List<Role> getAllRole(List<String> pro,int pageNo,int pageSize);
	
	public int countRole(List<String> pro);
	
	public void saveRole(Role role);
	
	public void deleteRoleById(int id);
	
	public Role getRoleById(int id);
	
	public List<Role> getRoleByCode(List<Integer> pro);
	
	public Role getRoleByRoleName(List<String> pro);
}

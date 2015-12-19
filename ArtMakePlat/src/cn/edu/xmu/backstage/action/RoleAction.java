package cn.edu.xmu.backstage.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.entity.Article;
import cn.edu.xmu.entity.Person;
import cn.edu.xmu.entity.Role;
import cn.edu.xmu.service.LoginService;
import cn.edu.xmu.service.PersonService;
import cn.edu.xmu.service.RoleService;
import cn.edu.xmu.util.Common;
import cn.edu.xmu.util.WebTool;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class RoleAction extends ActionSupport {

	/**
	 * @Fields personService
	 */
	@Resource(name = "roleService")
	RoleService roleService;
	private List<Role> roleList;
	
	private List<String> selectpro;
	
	private Role role;
	
	private int id;
	
	/**
	 * getter method
	 * @return the roleService
	 */
	
	public RoleService getRoleService() {
		return roleService;
	}

	/**
	 * setter method
	 * @param roleService the roleService to set
	 */
	
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	/**
	 * getter method
	 * @return the roleList
	 */
	
	public List<Role> getRoleList() {
		return roleList;
	}

	/**
	 * setter method
	 * @param roleList the roleList to set
	 */
	
	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	
	
	/**
	 * getter method
	 * @return the selectpro
	 */
	
	public List<String> getSelectpro() {
		return selectpro;
	}

	/**
	 * setter method
	 * @param selectpro the selectpro to set
	 */
	
	public void setSelectpro(List<String> selectpro) {
		this.selectpro = selectpro;
	}
	

	/**
	 * getter method
	 * @return the id
	 */
	
	public int getId() {
		return id;
	}

	/**
	 * setter method
	 * @param id the id to set
	 */
	
	public void setId(int id) {
		this.id = id;
	}
	
	

	/**
	 * getter method
	 * @return the role
	 */
	
	public Role getRole() {
		return role;
	}

	/**
	 * setter method
	 * @param role the role to set
	 */
	
	public void setRole(Role role) {
		this.role = role;
	}

	public String execute() throws Exception {
		if(getSelectpro() != null){
			setSelectpro(getSelectpro());
			selectpro = WebTool.dealStrProList(selectpro);
			//WebTool.printList(selectpro);
		}else{
			selectpro = new ArrayList<String>();
		}
		int page = 1;
		int count = roleService.countRole(selectpro);
		page = WebTool.dealPage(count,page,Common.BACKSTAGE_PAGESIZE);
		setRoleList(roleService.getAllRole(selectpro, page, Common.BACKSTAGE_PAGESIZE));
	    return INPUT;
	}
	
	public void delRole() throws IOException{
		roleService.deleteRoleById(getId());
	    WebTool.alertMessage("删除角色成功", "roleManage");
	}
	
	public void ndelRole()throws IOException{
		String[] rids = WebTool.getNids();
		for(String rid:rids){
			roleService.deleteRoleById(Integer.parseInt(rid));
		}
		WebTool.alertMessage("删除角色成功", "roleManage");
	}
	
	public String goEdit(){
		if(getId() != 0){
			setRole(roleService.getRoleById(getId()));
		}
		setRoleList(roleService.getAllRole(new ArrayList<String>()));
		return "edit";
	}
	
	public String saveRole() throws IOException{
		//System.out.print(getId());
		if(getId() != 0){
			Role newrole = roleService.getRoleById(getId());
			newrole.setRole_code(getRole().getRole_code());
			newrole.setRolename(getRole().getRolename());
			newrole.setFrolename(getRole().getFrolename());
			setRole(newrole);
			//System.out.print(getRole().getRolename());
		}
		roleService.saveRole(getRole());
		WebTool.alertMessage("保存成功","roleManage!goEdit?id=" + getId());
		return null;
	}
	
}

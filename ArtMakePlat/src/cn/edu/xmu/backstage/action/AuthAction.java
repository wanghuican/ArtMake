package cn.edu.xmu.backstage.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.entity.Article;
import cn.edu.xmu.entity.Person;
import cn.edu.xmu.entity.Auth;
import cn.edu.xmu.entity.Role;
import cn.edu.xmu.service.LoginService;
import cn.edu.xmu.service.PersonService;
import cn.edu.xmu.service.AuthService;
import cn.edu.xmu.service.RoleService;
import cn.edu.xmu.util.Common;
import cn.edu.xmu.util.WebTool;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AuthAction extends ActionSupport {

	/**
	 * @Fields authService
	 */
	@Resource(name = "authService")	
	AuthService authService;
	
	/**
	 * @Fields roleService
	 */
	@Resource(name = "roleService")
	RoleService roleService;
	
	private List<Auth> authList;
	
	private List<Role> roleList;
	
	private List<Integer> selectpro;
	
	private Auth auth;
	
	private int id;
	
	private int role_id;
	/**
	 * getter method
	 * @return the AuthService
	 */
	
	public AuthService getAuthService() {
		return authService;
	}

	/**
	 * setter method
	 * @param AuthService the AuthService to set
	 */
	
	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}

	/**
	 * getter method
	 * @return the AuthList
	 */
	
	public List<Auth> getAuthList() {
		return authList;
	}

	/**
	 * setter method
	 * @param AuthList the AuthList to set
	 */
	
	public void setAuthList(List<Auth> authList) {
		this.authList = authList;
	}

	
	
	/**
	 * getter method
	 * @return the selectpro
	 */
	
	public List<Integer> getSelectpro() {
		return selectpro;
	}

	/**
	 * setter method
	 * @param selectpro the selectpro to set
	 */
	
	public void setSelectpro(List<Integer> selectpro) {
		this.selectpro = selectpro;
	}
	

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
	 * @return the Auth
	 */
	
	public Auth getAuth() {
		return auth;
	}

	/**
	 * setter method
	 * @param Auth the Auth to set
	 */
	
	public void setAuth(Auth auth) {
		this.auth = auth;
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
	 * @return the role_id
	 */
	
	public int getRole_id() {
		return role_id;
	}

	/**
	 * setter method
	 * @param role_id the role_id to set
	 */
	
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}

	public String execute() throws Exception {
		if(getSelectpro() != null){
			
			setSelectpro(getSelectpro());
			selectpro = WebTool.dealIntProList(selectpro);
			//WebTool.printList(selectpro);
		}else{
			selectpro = new ArrayList<Integer>();
		}
		int page = 1;
		int count = authService.countAuth(selectpro);
		page = WebTool.dealPage(count,page,Common.BACKSTAGE_PAGESIZE);
		setAuthList(authService.getAllAuth(selectpro, page, Common.BACKSTAGE_PAGESIZE));
	    return INPUT;
	}
	
	public void delAuth() throws IOException{
		authService.deleteAuthById(getId());
	    WebTool.alertMessage("删除权限成功", "authManage");
	}
	
	public void ndelAuth()throws IOException{
		String[] aids = WebTool.getNids();
		for(String aid:aids){
			authService.deleteAuthById(Integer.parseInt(aid));
		}
		WebTool.alertMessage("删除权限成功", "authManage");
	}
	
	public String goEdit(){
		System.out.print(getId());
		if(getId() != 0){
			setAuth(authService.getAuthById(getId()));
		}
		return "edit";
	}
	
	public String goSet(){
		
		if(getId() != 0){
			setAuth(authService.getAuthById(getId()));
		}
		setRoleList(roleService.getAllRole(new ArrayList<String>()));
		return "set";
	}
	
	public String saveAuth() throws IOException{
		if(getId() != 0){
			getAuth().setAuth_id(id);
		}
		authService.saveAuth(auth);
		WebTool.alertMessage("保存成功","authManage!goEdit?id=" + getId());
		return null;
	}
	
	public String setAuth() throws IOException{
		Auth auth = authService.getAuthById(getId());
		Role role = roleService.getRoleById(getRole_id());
		auth.setRole(role);
		role.setRole_code(Common.CODE_ARTIST);
		authService.saveAuth(auth);
		roleService.saveRole(role);
		WebTool.alertMessage("保存成功","authManage!goSet?id=" + getId());
		return null;
	}
	
}

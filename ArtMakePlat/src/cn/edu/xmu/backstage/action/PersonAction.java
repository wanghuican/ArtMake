package cn.edu.xmu.backstage.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;
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

public class PersonAction extends ActionSupport {

	/**
	 * @Fields personService
	 */
	@Resource(name = "personService")
	PersonService personService;
	
	/**
	  * @Fields roleService : TODO（用一句话描述这个变量表示什么）
	  */
	@Resource(name = "roleService")
	RoleService roleService;
	
	List<Person> personList;
	
	List<Role> roleList;
	
	List<String> selectpro;
	
	private int role_code;
	
	private Person person;
	
	private Role role;
	
	private int id;
	
	private String result;
	/**
	 * getter method
	 * @return the personService
	 */
	
	public PersonService getPersonService() {
		return personService;
	}

	/**
	 * setter method
	 * @param personService the personService to set
	 */
	
	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}

	/**
	 * getter method
	 * @return the personList
	 */
	
	public List<Person> getPersonList() {
		return personList;
	}

	/**
	 * setter method
	 * @param personList the personList to set
	 */
	
	public void setPersonList(List<Person> personList) {
		this.personList = personList;
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
	 * @return the role_code
	 */
	
	public int getRole_code() {
		return role_code;
	}

	/**
	 * setter method
	 * @param role_code the role_code to set
	 */
	
	public void setRole_code(int role_code) {
		this.role_code = role_code;
	}

	
	/**
	 * getter method
	 * @return the person
	 */
	
	public Person getPerson() {
		return person;
	}

	/**
	 * setter method
	 * @param person the person to set
	 */
	
	public void setPerson(Person person) {
		this.person = person;
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
	 * @return the result
	 */
	
	public String getResult() {
		return result;
	}

	/**
	 * setter method
	 * @param result the result to set
	 */
	
	public void setResult(String result) {
		this.result = result;
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
		setRole_code(getRole_code());
		int count = personService.getPersonCount(getRole_code(),selectpro);
		page = WebTool.dealPage(count,page,Common.BACKSTAGE_PAGESIZE);
		setPersonList(personService.getPersonList(getRole_code(),selectpro, page, Common.BACKSTAGE_PAGESIZE));
		if(getRole_code() == 5){
	    	setRoleList(roleService.getRoleByCode(getRole_code()));
		}else{
			setRole(roleService.getRoleByCode(getRole_code()).get(0));
		}
		switch(getRole_code()){
	    	case 0: 
	    		return "user";
	    	case 5:
	    		return "artist";
	    	default:
	    		return "common";
	   	}
	}
	
	public void deletePerson() throws IOException{
		personService.deletePersonById(getId());
		WebTool.alertMessage("删除人员成功", "personManage?role_code=" + getRole_code());
	}
	
	public void ndelPerson() throws Exception{
		String[] pids = WebTool.getNids();
		for(String pid:pids){
			personService.deletePersonById(Integer.parseInt(pid));
	    	System.out.print(pid);	
		}
	    WebTool.alertMessage("删除人员成功", "personManage?role_code=" + getRole_code());
	}
	
	public String goEdit(){
		setRole_code(getRole_code());
		if(getRole_code() == 5){
	    	setRoleList(roleService.getRoleByCode(getRole_code()));
		}else{
			setRole(roleService.getRoleByCode(getRole_code()).get(0));
		}
		return "edit";
	}
	
	public String savePerson() throws IOException{
		Role role = roleService.getRoleById(getPerson().getRole().getRole_id());
		personService.savePerson(getPerson());
		WebTool.alertMessage("新建"+ role.getRolename() +"成功！", 
				"personManage!goEdit?role_code=" + role.getRole_code());
		return null;	
	}
	
	public String toPass() throws IOException{
		Person person = personService.getPersonById(getId());
		Role role = roleService.getRoleByRoleName(person.getRole().getFrolename());
		person.setRole(role);
		person.setState(0);
		personService.savePerson(person);
		WebTool.alertMessage("通过审核成功,此人员成为" + role.getRolename(),
				"personManage?role_code=" + getRole_code());
		return null;
	}
	
	public String toNpass() throws IOException{
		String[] pids = WebTool.getNids();
		for(String pid:pids){
			Person person = personService.getPersonById(Integer.parseInt(pid));
			Role role = roleService.getRoleByRoleName(person.getRole().getFrolename());
			person.setRole(role);
			person.setState(0);
			personService.savePerson(person);
		}
		WebTool.alertMessage("批量通过审核成功","personManage?role_code=" + getRole_code());
		return null;
	}
	
	public String changeBid(){
		Person person = personService.getPersonById(getId());
		personService.changeBid(person);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("message",person.getState() == -1?"禁用成功":"取消禁用成功");
		map.put("state", person.getState());
		map.put("id", getId());
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		return SUCCESS;
	}
	
	public String changePassword(){
		Person person = personService.getPersonById(getId());
		person.setPassword(Common.DEFAULT_PASSWORD);
		personService.savePerson(person);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("message","重置密码成功,充值后密码为" + Common.DEFAULT_PASSWORD);
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		return SUCCESS;
	}
	
	
}

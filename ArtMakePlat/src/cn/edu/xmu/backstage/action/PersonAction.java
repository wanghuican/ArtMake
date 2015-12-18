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
	List<Person> personList;
	
	List<String> selectpro;
	
	private int role_code;
	
	private Person person;
	
	private int id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

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
	
	

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
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

	public String execute() throws Exception {
		if(getSelectpro() != null){
			setSelectpro(getSelectpro());
			selectpro = WebTool.dealProList(selectpro);
			//WebTool.printList(selectpro);
		}else{
			selectpro = new ArrayList<String>();
		}
		int page = 1;
		setRole_code(getRole_code());
		int count = personService.getPersonCount(getRole_code(),selectpro);
		page = WebTool.dealPage(count,page,Common.BACKSTAGE_PAGESIZE);
		setPersonList(personService.getPersonList(getRole_code(),selectpro, page, Common.BACKSTAGE_PAGESIZE));
		switch(getRole_code()){
	    	case 0: 
	    		return "user";
	    	case 5:
	    		return "artist";
	    	case 10:
	    		return "editer";
	    	case 20:
	     		return "mainediter";
	     	case 50:
	    		return "admin";
	    	default:
	    		break;
	   	}
	    	return null;
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
	
	public String createAdmin() throws Exception{
		//person.setRole(new Role(1, 0, "用户"));
		person.setRole(new Role(9, 50, "管理员"));
		personService.savePerson(person);
		WebTool.alertMessage("新建管理员成功！", "personManage!goCreateAdmin");
		return "createAdminSuccess";
	}
	
	public String goCreateAdmin(){
		return "gocreateadmin";
	}
	
	public String createMainEditor() throws Exception{
		person.setRole(new Role(8, 20, "主编人员"));
		personService.savePerson(person);
		WebTool.alertMessage("新建主编人员成功!", "personManage!goCreateMainEditor");
		return "createMainEditorSuccess";
	}
	
	public String goCreateMainEditor(){
		return "gocreatemaineditor";
	}
	
	public String createEditor() throws Exception{
		person.setRole(new Role(7, 10, "采编人员"));
		personService.savePerson(person);
		WebTool.alertMessage("新建采编人员成功！", "personManage!goCreateEditor");
		return "createEditorSuccess";
	}
	
	public String goCreateEditor(){
		return "gocreateeditor";
	}
	
	public String createArtist() throws Exception{
		person.setRole(new Role(2, 5, "低级艺术家"));
		personService.savePerson(person);
		WebTool.alertMessage("新建低级艺术家成功！", "personManage!goCreateArtist");
		return "createArtistSuccess";
	}
	
	public String goCreateArtist(){
		return "gocreateartist";
	}
	
	public String createUser() throws Exception{
		person.setRole(new Role(1, 0, "用户"));
		personService.savePerson(person);
		WebTool.alertMessage("新建用户成功！", "personManage!goCreateUser");
		return "createUserSuccess";
	}
	
	public String goCreateUser(){
		return "gocreateuser";
	}
}

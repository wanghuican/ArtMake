package cn.edu.xmu.backstage.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.entity.Person;
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
	
}

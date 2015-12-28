package cn.edu.xmu.backstage.action;

import java.io.IOException;

import javax.annotation.Resource;

import cn.edu.xmu.entity.Person;
import cn.edu.xmu.service.PersonService;
import cn.edu.xmu.util.WebTool;

import com.opensymphony.xwork2.ActionSupport;

public class UpdateInfoAction extends ActionSupport {
	/**
	 * @Fields loginService : 登录业务逻辑组件
	 */
	@Resource(name = "personService")
	PersonService personService;

	private Person person;
	
	private int id;
	
	
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

	public String execute() throws Exception {
		Person person = WebTool.getSessionPerson();
    	setId(person.getPerson_id());
    	setPerson(personService.getPersonById(getId()));
		return SUCCESS;
	}
	
	public String saveInfo() throws IOException{
		Person newperson = personService.getPersonById(getId());
		newperson.setAddress(getPerson().getAddress());
		newperson.setEmail(getPerson().getEmail());
		newperson.setRealname(getPerson().getRealname());
		newperson.setTel(getPerson().getTel());
		newperson.setSex(getPerson().getSex());
		newperson.setQq(getPerson().getQq());
		newperson.setIdcard(getPerson().getIdcard());
		newperson.setIntroduce(getPerson().getIntroduce().trim());
		setPerson(newperson);
		personService.savePerson(getPerson());
		WebTool.alertMessage("完善信息成功！", "upInfo");
		return null;
	}
	
	public String goRepassword(){
		setPerson(WebTool.getSessionPerson());
		return "repassword";
	}
	
	public String repassword() throws IOException {
		Person person = personService.getPersonById(getId());
		person.setPassword(getPerson().getPassword());
		personService.savePerson(person);
		WebTool.alertMessage("修改密码成功！", "upInfo!goRepassword");
		return null;
	}
	
}

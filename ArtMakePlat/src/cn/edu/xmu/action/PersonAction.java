/**
 * @Title: PersonAction.java
 * @Package cn.edu.xmu.action
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月14日 下午10:06:51
 * @version V1.0
 */

package cn.edu.xmu.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;
import cn.edu.xmu.entity.Person;
import cn.edu.xmu.entity.Role;
import cn.edu.xmu.service.LoginService;
import cn.edu.xmu.service.PersonService;
import cn.edu.xmu.util.Common;
import cn.edu.xmu.util.WebTool;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @ClassName: PersonAction
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月14日 下午10:06:51
 */

public class PersonAction extends ActionSupport{
	/**
	 * @Fields loginService : 登录业务逻辑组件
	 */
	@Resource(name = "personService")
	PersonService personService;
	
	private Person person;
	
	private String result;
	
	private int id;

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
	 * @return the personService
	 */
	
	public PersonService getPersonService() {
		return personService;
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
	 * setter method
	 * @param personService the personService to set
	 */
	
	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}


	public String checkAccount(){
		String account = WebTool.getRequest().getParameter("account");
		Person person = personService.checkAccount(account);
		if(person == null){
			person = new Person();
		}
		result = person.toJsonString();
		//WebTool.printOb(result);
		return SUCCESS;
	}

	public String goInfo(){
		if(getId() == 0){
	    	Person person = WebTool.getSessionPerson();
	    	setId(person.getPerson_id());
		}
		setPerson(personService.getPersonById(getId()));
		if(person.getRole().getRole_code() == Common.CODE_USER)	
			return "userinfo";
		else
			return "artistinfo";
	}
	
	public String goImprove(){
		Person person = WebTool.getSessionPerson();
		setPerson(personService.getPersonById(person.getPerson_id()));
		return "improve";
	}
	
	public String changeIdentify(){
		Person person = personService.getPersonById(getId());
		personService.changeIdentify(person);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("message",person.getState() == 1?"进行申请成功":"取消申请成功");
		map.put("state", person.getState());
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		return SUCCESS;
	}
	
	
	public String improvePerson() throws IOException{
		Person newperson = personService.getPersonById(getId());
		newperson.setAddress(getPerson().getAddress());
		newperson.setEmail(getPerson().getEmail());
		newperson.setRealname(getPerson().getRealname());
		newperson.setTel(getPerson().getTel());
		newperson.setSex(getPerson().getSex());
		newperson.setQq(getPerson().getQq());
		newperson.setIdcard(getPerson().getIdcard());
		newperson.setIntroduce(getPerson().getIntroduce());
		setPerson(newperson);
		personService.savePerson(getPerson());
		WebTool.alertMessage("完善信息成功！", "person!goInfo");
		return null;	
	}
	
}

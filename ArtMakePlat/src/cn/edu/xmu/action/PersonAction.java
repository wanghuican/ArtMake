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

import javax.annotation.Resource;

import cn.edu.xmu.entity.Person;
import cn.edu.xmu.service.LoginService;
import cn.edu.xmu.service.PersonService;
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
	
	private String result;
	
	

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

}

/**
 * @Title: ProductAction.java
 * @Package cn.edu.xmu.action
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月14日 下午10:06:51
 * @version V1.0
 */

package cn.edu.xmu.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;
import cn.edu.xmu.entity.Auth;
import cn.edu.xmu.entity.Key;
import cn.edu.xmu.entity.Message;
import cn.edu.xmu.entity.Person;
import cn.edu.xmu.entity.ProAction;
import cn.edu.xmu.entity.Product;
import cn.edu.xmu.entity.ProRecord;
import cn.edu.xmu.entity.Role;
import cn.edu.xmu.service.AuthService;
import cn.edu.xmu.service.KeyService;
import cn.edu.xmu.service.LoginService;
import cn.edu.xmu.service.MessageService;
import cn.edu.xmu.service.PersonService;
import cn.edu.xmu.service.ProActionService;
import cn.edu.xmu.service.ProductService;
import cn.edu.xmu.util.Common;
import cn.edu.xmu.util.WebTool;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @ClassName: MallAction
 * @Description: TODO team: 3-10打屁屁小队
 * @date 2015年12月27日 下午9:12:35
 */
public class MessageAction extends ActionSupport {

	@Resource(name = "messageService")
	MessageService messageService;

	@Resource(name = "personService")
	PersonService personService;

	private Person person;

	private Person fromperson;

	private int from_pid;

	private int to_pid;

	private int id;

	private List<Person> personList;

	private List<Message> messageList;

	private String result;

	/**
	 * getter method
	 * 
	 * @return twhe messageService
	 */

	public MessageService getMessageService() {
		return messageService;
	}

	/**
	 * getter method
	 * 
	 * @return the fromperson
	 */

	public Person getFromperson() {
		return fromperson;
	}

	/**
	 * setter method
	 * 
	 * @param fromperson
	 *            the fromperson to set
	 */

	public void setFromperson(Person fromperson) {
		this.fromperson = fromperson;
	}

	/**
	 * setter method
	 * 
	 * @param messageService
	 *            the messageService to set
	 */

	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	/**
	 * getter method
	 * 
	 * @return the id
	 */

	public int getId() {
		return id;
	}

	/**
	 * setter method
	 * 
	 * @param id
	 *            the id to set
	 */

	public void setId(int id) {
		this.id = id;
	}

	/**
	 * getter method
	 * 
	 * @return the personService
	 */

	public PersonService getPersonService() {
		return personService;
	}

	/**
	 * setter method
	 * 
	 * @param personService
	 *            the personService to set
	 */

	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}

	/**
	 * getter method
	 * 
	 * @return the person
	 */

	public Person getPerson() {
		return person;
	}

	/**
	 * setter method
	 * 
	 * @param person
	 *            the person to set
	 */

	public void setPerson(Person person) {
		this.person = person;
	}

	/**
	 * getter method
	 * 
	 * @return the personList
	 */

	public List<Person> getPersonList() {
		return personList;
	}

	/**
	 * setter method
	 * 
	 * @param personList
	 *            the personList to set
	 */

	public void setPersonList(List<Person> personList) {
		this.personList = personList;
	}

	/**
	 * getter method
	 * 
	 * @return the result
	 */

	public String getResult() {
		return result;
	}

	/**
	 * setter method
	 * 
	 * @param result
	 *            the result to set
	 */

	public void setResult(String result) {
		this.result = result;
	}

	/**
	 * getter method
	 * 
	 * @return the from_pid
	 */

	public int getFrom_pid() {
		return from_pid;
	}

	/**
	 * setter method
	 * 
	 * @param from_pid
	 *            the from_pid to set
	 */

	public void setFrom_pid(int from_pid) {
		this.from_pid = from_pid;
	}

	/**
	 * getter method
	 * 
	 * @return the to_pid
	 */

	public int getTo_pid() {
		return to_pid;
	}

	/**
	 * setter method
	 * 
	 * @param to_pid
	 *            the to_pid to set
	 */

	public void setTo_pid(int to_pid) {
		this.to_pid = to_pid;
	}

	/**
	 * getter method
	 * 
	 * @return the messageList
	 */

	public List<Message> getMessageList() {
		return messageList;
	}

	/**
	 * setter method
	 * 
	 * @param messageList
	 *            the messageList to set
	 */

	public void setMessageList(List<Message> messageList) {
		this.messageList = messageList;
	}

	/*
	 * Title: execute Description:
	 * 
	 * @return
	 * 
	 * @throws Exception
	 * 
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		setPerson(personService.getPersonById(getId()));
		if (getId() == WebTool.getSessionPerson().getPerson_id()) {
			setPersonList(messageService.getToPerson());
		}
		setFromperson(WebTool.getSessionPerson());
		return SUCCESS;
	}

	public String toMessageList() {
		List<Message> messageList = messageService.getOTOMessage(getTo_pid());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", WebTool.listToJsonStr(messageList));
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		return SUCCESS;
	}

	public String toSaveMessage() {
		if (getId() == getFrom_pid()) {
			Person fperson = personService.getPersonById(getFrom_pid());
			Person tperson = personService.getPersonById(getTo_pid());
			Message message = new Message();
			message.setFromperson(fperson);
			message.setToperson(tperson);
			message.setMessagetime(new Date());
			message.setContent(WebTool.getRequest().getParameter("content"));
			messageService.saveMessage(message);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("message", "发送成功");
		map.put("from_pid", getFrom_pid());
		map.put("to_pid", getTo_pid());
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		return SUCCESS;
	}
	
	public String toDelMessage(){
		messageService.deleteMessageById(getId());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("message", "删除成功");
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		return SUCCESS;
	}

}

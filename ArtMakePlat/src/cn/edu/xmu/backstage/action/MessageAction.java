package cn.edu.xmu.backstage.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.entity.Article;
import cn.edu.xmu.entity.Person;
import cn.edu.xmu.entity.Message;
import cn.edu.xmu.entity.Role;
import cn.edu.xmu.service.LoginService;
import cn.edu.xmu.service.PersonService;
import cn.edu.xmu.service.MessageService;
import cn.edu.xmu.service.RoleService;
import cn.edu.xmu.util.Common;
import cn.edu.xmu.util.WebTool;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class MessageAction extends ActionSupport {

	/**
	 * @Fields messageService
	 */
	@Resource(name = "messageService")	
	MessageService messageService;
	
	
	private List<Message> messageList;
	
	private List<String> selectpro;
	
	private Message message;
	
	private int id;
	
	/**
	 * getter method
	 * @return the MessageService
	 */
	
	public MessageService getMessageService() {
		return messageService;
	}

	/**
	 * setter method
	 * @param MessageService the MessageService to set
	 */
	
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	/**
	 * getter method
	 * @return the MessageList
	 */
	
	public List<Message> getMessageList() {
		return messageList;
	}

	/**
	 * setter method
	 * @param MessageList the MessageList to set
	 */
	
	public void setMessageList(List<Message> messageList) {
		this.messageList = messageList;
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
	 * @return the Message
	 */
	
	public Message getMessage() {
		return message;
	}

	/**
	 * setter method
	 * @param Message the Message to set
	 */
	
	public void setMessage(Message message) {
		this.message = message;
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
		int count = messageService.countMessage(selectpro);
		page = WebTool.dealPage(count,page,Common.BACKSTAGE_PAGESIZE);
		setMessageList(messageService.getAllMessage(selectpro, page, Common.BACKSTAGE_PAGESIZE));
	    return INPUT;
	}
	
	public void delMessage() throws IOException{
		messageService.deleteMessageById(getId());
	    WebTool.alertMessage("删除消息成功", "messageManage");
	}
	
	public void ndelMessage()throws IOException{
		String[] aids = WebTool.getNids();
		for(String aid:aids){
			messageService.deleteMessageById(Integer.parseInt(aid));
		}
		WebTool.alertMessage("删除消息成功", "messageManage");
	}
	
	
}

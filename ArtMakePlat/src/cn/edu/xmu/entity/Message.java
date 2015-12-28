
package cn.edu.xmu.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import cn.edu.xmu.util.WebTool;

/**
 * @ClassName: Message
 * @Description: 关键词实体
 * team: 3-10打屁屁小队
 * @date 2015年11月25日 下午8:40:58
 */

public class Message extends JsonEntity{

	private int message_id;
	
	private Person fromperson;
	
	private Person toperson;
	
	private String content;
	
	private Date messagetime;

	
	
	/**
	  * 创建一个新的实例 Message. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  */
	
	public Message() {
		super();
	}

	/**
	  * 创建一个新的实例 Message. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  * @param message_id
	  * @param fromperson
	  * @param toperson
	  * @param content
	  * @param messagetime
	  */
	
	public Message(int message_id, Person fromperson, Person toperson,
			String content, Date messagetime) {
		super();
		this.message_id = message_id;
		this.fromperson = fromperson;
		this.toperson = toperson;
		this.content = content;
		this.messagetime = messagetime;
	}

	/**
	 * getter method
	 * @return the message_id
	 */
	
	public int getMessage_id() {
		return message_id;
	}

	/**
	 * setter method
	 * @param message_id the message_id to set
	 */
	
	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}

	/**
	 * getter method
	 * @return the fromperson
	 */
	
	public Person getFromperson() {
		return fromperson;
	}

	/**
	 * setter method
	 * @param fromperson the fromperson to set
	 */
	
	public void setFromperson(Person fromperson) {
		this.fromperson = fromperson;
	}

	/**
	 * getter method
	 * @return the toperson
	 */
	
	public Person getToperson() {
		return toperson;
	}

	/**
	 * setter method
	 * @param toperson the toperson to set
	 */
	
	public void setToperson(Person toperson) {
		this.toperson = toperson;
	}

	/**
	 * getter method
	 * @return the content
	 */
	
	public String getContent() {
		return content;
	}

	/**
	 * setter method
	 * @param content the content to set
	 */
	
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * getter method
	 * @return the messagetime
	 */
	
	public Date getMessagetime() {
		return messagetime;
	}

	/**
	 * setter method
	 * @param messagetime the messagetime to set
	 */
	
	public void setMessagetime(Date messagetime) {
		this.messagetime = messagetime;
	}

	/*
	  * Title: toJsonString
	  * Description:
	  * @return
	  * @see cn.edu.xmu.entity.JsonEntity#toJsonString()
	  */
	@Override
	public String toJsonString() {
		boolean isSelf = false;
		if(WebTool.getSessionPerson().getPerson_id() == fromperson.getPerson_id()){
			isSelf = true;
		}
		
		return "{\"message_id\":\"" + message_id + "\",\"fromperson\":\""
				+ fromperson  + "\",\"nickname\":\""
						+ fromperson.getRealname() + "\",\"from_pid\":\""
						+ fromperson.getPerson_id() + "\",\"isSelf\":\""
								+ isSelf + "\",\"toperson\":\"" + toperson
						+ "\",\"to_pid\":\"" + toperson.getPerson_id()
				+ "\",\"content\":\"" + content + "\",\"date\":\""
				+ messagetime + "\"}  ";
	}	
	
}

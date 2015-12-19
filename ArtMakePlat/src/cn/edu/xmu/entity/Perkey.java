package cn.edu.xmu.entity;

import java.io.Serializable;

/**
  * @ClassName: Perkey
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月20日 上午4:09:00
  */
public class Perkey extends JsonEntity{

	/**
	  * @Fields record_id 
	  */
	private int record_id;
	
	/**
	  * @Fields person 
	  */
	private Person person;
	
	/**
	  * @Fields key 
	  */
	private Key key;

	
	
	/**
	  * 创建一个新的实例 Perkey. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  */
	
	public Perkey() {
		super();
	}

	/**
	  * 创建一个新的实例 Perkey. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  * @param record_id
	  * @param person
	  * @param key
	  */
	
	public Perkey(int record_id, Person person, Key key) {
		super();
		this.record_id = record_id;
		this.person = person;
		this.key = key;
	}

	/**
	 * getter method
	 * @return the record_id
	 */
	
	public int getRecord_id() {
		return record_id;
	}

	/**
	 * setter method
	 * @param record_id the record_id to set
	 */
	
	public void setRecord_id(int record_id) {
		this.record_id = record_id;
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
	 * @return the key
	 */
	
	public Key getKey() {
		return key;
	}

	/**
	 * setter method
	 * @param key the key to set
	 */
	
	public void setKey(Key key) {
		this.key = key;
	}

	
	/*
	  * Title: toJsonString
	  * Description:
	  * @return
	  * @see cn.edu.xmu.entity.JsonEntity#toJsonString()
	  */
	@Override
	public String toJsonString() {
		return "{\"record_id\":\"" + record_id + "\",\"person\":\"" + person
				+ "\",\"key\":\"" + key + "\"}  ";
	}

}

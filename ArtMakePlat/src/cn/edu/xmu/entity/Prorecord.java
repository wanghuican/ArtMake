
package cn.edu.xmu.entity;

import java.util.Date;


/**
  * @ClassName: Prorecord
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月14日 下午5:14:44
  */
public class Prorecord extends JsonEntity{
	
	/**
	  * @Fields record_id
	  */
	private int record_id;
	
	/**
	  * @Fields action
	  */
	private ProAction action;
	
	/**
	  * @Fields person
	  */
	private Person person;
	
	/**
	  * @Fields price
	  */
	private double price;
	
	/**
	  * @Fields recordtime
	  */
	private Date recordtime;

	/**
	  * 创建一个新的实例 Prorecord. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  */
	
	public Prorecord() {
		super();
	}

	/**
	  * 创建一个新的实例 Prorecord. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  * @param record_id
	  * @param action
	  * @param person
	  * @param price
	  * @param recordtime
	  */
	
	public Prorecord(int record_id, ProAction action, Person person,
			double price, Date recordtime) {
		super();
		this.record_id = record_id;
		this.action = action;
		this.person = person;
		this.price = price;
		this.recordtime = recordtime;
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
	 * @return the action
	 */
	
	public ProAction getAction() {
		return action;
	}

	/**
	 * setter method
	 * @param action the action to set
	 */
	
	public void setAction(ProAction action) {
		this.action = action;
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
	 * @return the price
	 */
	
	public double getPrice() {
		return price;
	}

	/**
	 * setter method
	 * @param price the price to set
	 */
	
	public void setPrice(double price) {
		this.price = price;
	}

	/**
	 * getter method
	 * @return the recordtime
	 */
	
	public Date getRecordtime() {
		return recordtime;
	}

	/**
	 * setter method
	 * @param recordtime the recordtime to set
	 */
	
	public void setRecordtime(Date recordtime) {
		this.recordtime = recordtime;
	}


	/*
	  * Title: toJsonString
	  * Description:
	  * @return
	  * @see cn.edu.xmu.entity.JsonEntity#toJsonString()
	  */
	@Override
	public String toJsonString() {
		return "{\"record_id\":\"" + record_id + "\",\"action\":\"" + action
				+ "\",\"person\":\"" + person + "\",\"price\":\"" + price
				+ "\",\"recordtime\":\"" + recordtime + "\"}  ";
	}
	
	
	
}
